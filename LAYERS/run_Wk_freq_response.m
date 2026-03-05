function results = run_Wk_freq_response(varargin)
% run_Wk_freq_response  Run detailed per-case frequency-response sweeps.
%
% Usage:
%   results = run_Wk_freq_response()
%   results = run_Wk_freq_response('Wk_list.csv')
%   results = run_Wk_freq_response('Wk_list.csv', 'Detailed', false)
%   results = run_Wk_freq_response('Detailed', true)
%
% Name-value options:
%   csvFile           - CSV with Wk rows (default: 'CST_Wk_list.csv')
%   OutDir            - output directory   (default: 'WkFreqResults')
%   Detailed          - produce per-case frequency response (default: true)
%   FreqMin/FreqMax   - frequency range in GHz (defaults: 18 / 22)
%   F0                - nominal frequency in GHz (default: 20)
%   NumSamples        - number of frequency points (default: 41)
%   DetailedPerCaseCSV- save per-case CSV files (default: true)
%
% Returns:
%   results.detailedFiles       - cell array of saved per-case CSV filenames
%   results.detailedSummaryFile - path to detailed_summary.csv

% ---------------------------------------------------------
% Parse inputs (support both positional csvFile and name-value)
% ---------------------------------------------------------
p = inputParser;
% allow first positional or omit
addOptional(p,'csvFile','CST_Wk_list.csv',@(s)ischar(s)||isstring(s));
addParameter(p,'OutDir','WkFreqResults',@(s)ischar(s)||isstring(s));
addParameter(p,'Detailed',true,@islogical);
addParameter(p,'FreqMin',18,@isnumeric);      % Default set to 18
addParameter(p,'FreqMax',22,@isnumeric);      % Default set to 22
addParameter(p,'F0',20,@isnumeric);           % Default set to 20
addParameter(p,'NumSamples',41,@(x)isnumeric(x)&&isscalar(x)&&x>1);
addParameter(p,'DetailedPerCaseCSV',true,@islogical);
parse(p,varargin{:});
opt = p.Results;

csvFile = char(opt.csvFile);
outDir = char(opt.OutDir);

if ~isfolder(outDir)
    mkdir(outDir);
end

if ~isfile(csvFile)
    error('CSV file not found: %s', csvFile);
end

% Read Wk matrix from CSV (handles header automatically)
T = readtable(csvFile);
WkMatrix = T{:,:};  % numeric matrix

% Instantiate app
app = layers_App_exported;
% Headless mode: hide the UI to avoid rendering and interactive callbacks
try
    app.figure1.Visible = 'off';
    app.figure1.HandleVisibility = 'off';
catch
    % If the app structure differs, continue without failing
end
% Ensure compute path is active while running the sweep
if isprop(app,'computeCheckBox')
    app.computeCheckBox.Value = true;
end

% Attempt to prepare baseline.
% Many run scripts call prepareBaselineForWkSweep(templateDat)
% If available use it; otherwise user should ensure baseline is prepared
try
    if ismethod(app,'prepareBaselineForWkSweep')
        % try common template first; this call is tolerant
        try
            if exist('jcross5.dat','file')
                app.prepareBaselineForWkSweep(which('jcross5.dat'));
            else
                % some variants accept no args
                app.prepareBaselineForWkSweep();
            end
        catch
            warning('prepareBaselineForWkSweep failed; ensure baseline readDataFile has been run in the app.');
        end
    else
        warning('No prepareBaselineForWkSweep method detected. Ensure baseline is prepared (app.readDataFile or UI) before running.');
    end
catch ME
    warning('Preparing baseline failed: %s', ME.message);
end

% Acquire handles snapshot from app's main figure
handles = [];
try
    handles = guidata(app.figure1);
catch
    try handles = app.baselineHandlesForWk; catch, end
    if isempty(handles)
        warning('Could not obtain app handles; some methods may fail. Ensure the app UI has been initialized.');
    end
end

results = struct();

% Detailed per-case frequency response using EffVsFreq
detailedFiles = {};
if opt.Detailed
    fprintf('Running detailed per-case frequency responses (EffVsFreq)...\n');
    % Determine nominal f0
    f0 = opt.F0;
    if isempty(f0)
        try
            if isprop(app,'lossFreqEdit')
                f0 = str2double(app.lossFreqEdit.Value);
            end
        catch
            f0 = [];
        end
    end

    % Setup frequency bounds
    if isempty(opt.FreqMin) || isempty(opt.FreqMax)
        if ~isempty(f0)
            fmin = f0*0.9;
            fmax = f0*1.1;
        else
            fmin = 0.9;
            fmax = 1.1;
        end
    else
        fmin = opt.FreqMin;
        fmax = opt.FreqMax;
    end

    freqVec = linspace(fmin, fmax, opt.NumSamples);

    % Set app-wide sample vector used by EffVsFreq
    app.MEOfreqReduced = freqVec;
    app.MEOangDeg = 0;

    nCases = size(WkMatrix,1);
    summaryRows = NaN(nCases,2);
    indWire = []; % will fill on first iteration when handles available
    for k = 1:nCases
        try
            % refresh handles / baseline
            handles = guidata(app.figure1);

            % determine wire indices once
            if isempty(indWire)
                indWire = find(handles.isWire==1);
            end

            % Apply Wk for this case into handles AND update app baseline stored copy
            handles.Wk(indWire) = WkMatrix(k,:);
            app.WkAtWL1 = handles.Wk;      % CRITICAL: update app baseline so changeFreq doesn't overwrite our Wk
            guidata(app.figure1, handles);

            % Now call frequencyResponse to set freq controls and compute plotting/results.
            % isMultipleCases=false, phsLUTFields empty, CST file empty, EffRef=0.7 (tunable)
            EffRef = 0.7;
            CSTfile = '';
            upperDistOverLambda0 = 0;
            lowerDistOverLambda0 = 0;
            resultNumber = 1;
            isMeanEffOptim = false;
            MeanEffOptimWeight = 0;

            % Call frequencyResponse which sets the normalized frequency window etc
            [meanEffCST, meanEffSummary, EffCSTf0, phsCSTf0, EffCSTf0Ref, phsCSTf0Ref,magML, phsML, meanEffCalc] = ...
                app.frequencyResponse(handles, false, f0, fmin, fmax, opt.NumSamples, ...
                    [], [], EffRef, CSTfile, upperDistOverLambda0, lowerDistOverLambda0, ...
                    resultNumber, isMeanEffOptim, MeanEffOptimWeight, 'suppressPlots', true);

            % Save detailed CSV for this run (freqVec computed earlier as in script)
            if opt.DetailedPerCaseCSV
                outCSV = fullfile(outDir, sprintf('detailed_case_%04d.csv', k));
                T = table(freqVec(:), magML(:), phsML(:), 'VariableNames', {'freqGHz','efficiency','phaseDeg'});
                writetable(T, outCSV);
                detailedFiles{end+1,1} = outCSV; %#ok<AGROW>
            else
                detailedFiles{end+1,1} = []; %#ok<AGROW>
            end

            % Record a small summary (meanEff from EffVsFreq and phase at nominal f0)
            phaseAtF0 = NaN;
            if ~isempty(f0)
                [~, indMin] = min(abs(freqVec - f0));
                phaseAtF0 = phsML(indMin);
            end
            summaryRows(k,:) = [meanEffCalc, phaseAtF0];

            fprintf('Case %d/%d done: meanEff=%.4f phaseAtF0=%.2f deg\n', k, nCases, meanEffCalc, phaseAtF0);

        catch ME
            warning('Case %d failed: %s', k, ME.message);
            detailedFiles{end+1,1} = []; %#ok<AGROW>
            summaryRows(k,:) = [NaN NaN];
        end
    end

    summaryTbl = array2table(summaryRows, 'VariableNames', {'meanEff','phaseAtF0deg'});
    summaryFile = fullfile(outDir,'detailed_summary.csv');
    writetable(summaryTbl, summaryFile);
    fprintf('Detailed summary saved to %s\n', summaryFile);

    results.detailedFiles = detailedFiles;
    results.detailedSummaryFile = summaryFile;
end

fprintf('run_Wk_freq_response finished. Outputs in %s\n', outDir);
end