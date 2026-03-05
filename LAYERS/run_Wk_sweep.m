function results = run_Wk_sweep(varargin)
% run_Wk_sweep  Run a batch Wk parameter sweep.
%
% Usage:
%   results = run_Wk_sweep()
%   results = run_Wk_sweep('Wk_list.csv')
%
% Parameters:
%   csvFile     - path to CSV file with one Wk row per case (default: 'Wk_list.csv')
%   templateDat - baseline .dat file (hardcoded: 'jcross5_new.dat')
%
% Returns:
%   results - table of batch sweep outputs from batchFromWkMatrix

    p = inputParser;
    addOptional(p, 'csvFile', 'Wk_list.csv', @(s)ischar(s)||isstring(s));
    parse(p, varargin{:});

    csvFile     = char(p.Results.csvFile);
    templateDat = 'jcross5_new.dat';

    if ~isfile(csvFile)
        error('CSV file not found: %s', csvFile);
    end
    if ~isfile(templateDat)
        error('Template dat file not found: %s', templateDat);
    end

    T = readtable(csvFile);
    WkMatrix = T{:,:};

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
    currentFreqGHz = app.freqGHzEdit.Value;
    fprintf('Working at frequency: %.3f GHz\n', currentFreqGHz);

    % Prepare baseline (robust): try the helper, fall back to direct load
    try
        app.prepareBaselineForWkSweep(which(templateDat)); % uses full path
    catch ME
        fprintf('Warning: prepareBaselineForWkSweep raised: %s\n', ME.message);
    end
    H_base = [];
    if isprop(app,'baselineHandlesForWk') && ~isempty(app.baselineHandlesForWk)
        H_base = app.baselineHandlesForWk;
    else
        % Fallback: try direct loadDatFileWithoutDialog with full path
        try
            fp = which(templateDat);
            if isempty(fp)
                error('Template dat not found by which(): %s', templateDat);
            end
            fprintf('Fallback: loading template dat directly: %s\n', fp);
            app.loadDatFileWithoutDialog(fp);
            H_base = guidata(app.figure1);
            app.baselineHandlesForWk = H_base;
        catch ME2
            fprintf('Fallback load failed: %s\n', ME2.message);
        end
    end
    if isempty(H_base)
        error('Baseline preparation failed: app.baselineHandlesForWk is empty after attempts.');
    end
    wireInd = find(H_base.isWire==1);
    fprintf('Total layers = %d, wire layers = %d\n', H_base.numMedia-1, numel(wireInd));
    disp('Baseline Wk (wire indices & values):');
    disp([wireInd(:), H_base.Wk(wireInd).']);

    % Run sweep
    results = app.batchFromWkMatrix(WkMatrix, ...
            'ChunkSize', 1000, ...
            'TimingEvery', 100, ...
            'OutFile', 'Results_WkSweep.csv', ...
            'Resume', true, ...
            'IncludeWk', true, ...
            'ReturnAll', false, ...
            'Verbose', true);
end