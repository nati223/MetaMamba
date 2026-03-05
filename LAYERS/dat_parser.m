function dat_parser
    % 1) Launch the app
    myApp = layers_App;

    % 2) Pick folder
    folderPath = uigetdir(pwd, 'Select folder with .dat files');
    if isequal(folderPath, 0), return; end

    % 3) Collect all *.dat
    files = dir(fullfile(folderPath, '*.dat'));
    numFiles = numel(files);
    if numFiles == 0
        disp('No .dat files found.');
        return
    end

    fprintf('Found %d .dat files in "%s".\n', numFiles, folderPath);

    % 4) Prepare results structure
    allResults = struct('filename', {}, 'T_square', {}, 'T_pha', {});

    % 5) Loop over files
    % We'll track the next percentage at which to print
    nextPctToPrint = 1;  % we want to print at 10%, 20%, etc.
    stepPct = 1;         % step size for increments

    for k = 1:numFiles
        thisFile = fullfile(files(k).folder, files(k).name);

        % Use your no-dialog method
        myApp.loadDatFileWithoutDialog(thisFile);

        % read tau/phase from label text
        T_square   = str2double(myApp.targetOptimEfficiency1Text.Text);
        T_pha = str2double(myApp.tauPhaseText.Text);

        % store
        allResults(k).filename = files(k).name;
        allResults(k).T_square   = T_square;
        allResults(k).T_pha = T_pha;

        % Check if we've hit or passed the next percentage threshold
        pctComplete = (k / numFiles) * 100;
        if pctComplete >= nextPctToPrint
            fprintf('Completed %d%% (%d of %d files)\n', ...
                round(pctComplete), k, numFiles);

            % Update the next threshold
            nextPctToPrint = nextPctToPrint + stepPct;
        end
    end

    % 6) Write out to CSV
    T = struct2table(allResults);
    writetable(T, 'Results.csv');
    fprintf('Wrote Results.csv with %d entries.\n', numFiles);
end
