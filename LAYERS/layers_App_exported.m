classdef layers_App_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        figure1                        matlab.ui.Figure
        Untitled_1                     matlab.ui.container.Menu
        fileMenuReadDataFileItem       matlab.ui.container.Menu
        fileMenuWriteDataFileItem      matlab.ui.container.Menu
        fileMenuReadGamaFileItem       matlab.ui.container.Menu
        fileMenuReadOptFileItem        matlab.ui.container.Menu
        ReadoptfileHMSMenu             matlab.ui.container.Menu
        ReadXMTfileMenu                matlab.ui.container.Menu
        WriteXMTfileMenu               matlab.ui.container.Menu
        ChooseRavitxtfileMenu          matlab.ui.container.Menu
        Untitled                       matlab.ui.container.Menu
        EditMenuCopyGraphToFigureItem  matlab.ui.container.Menu
        EditMenuOpenbffileItem         matlab.ui.container.Menu
        multipleOptimPushButton        matlab.ui.control.Button
        WkSymCheckBox                  matlab.ui.control.CheckBox
        periodEditField                matlab.ui.control.NumericEditField
        periodEditFieldLabel           matlab.ui.control.Label
        incWave7EditPhase              matlab.ui.control.NumericEditField
        incWave6EditPhase              matlab.ui.control.NumericEditField
        incWave5EditPhase              matlab.ui.control.NumericEditField
        incWave4EditPhase              matlab.ui.control.NumericEditField
        incWave3EditPhase              matlab.ui.control.NumericEditField
        incWave2EditPhase              matlab.ui.control.NumericEditField
        incWave1EditPhase              matlab.ui.control.NumericEditField
        Label_7                        matlab.ui.control.Label
        Label_6                        matlab.ui.control.Label
        Label_5                        matlab.ui.control.Label
        Label_4                        matlab.ui.control.Label
        Label_3                        matlab.ui.control.Label
        Label_2                        matlab.ui.control.Label
        Label_1                        matlab.ui.control.Label
        incWave7EditNumeric            matlab.ui.control.NumericEditField
        incWaveSlider7                 matlab.ui.control.Slider
        incWave6EditNumeric            matlab.ui.control.NumericEditField
        incWaveSlider6                 matlab.ui.control.Slider
        incWave5EditNumeric            matlab.ui.control.NumericEditField
        incWaveSlider5                 matlab.ui.control.Slider
        incWave4EditNumeric            matlab.ui.control.NumericEditField
        incWaveSlider4                 matlab.ui.control.Slider
        incWave3EditNumeric            matlab.ui.control.NumericEditField
        incWaveSlider3                 matlab.ui.control.Slider
        incWave2EditNumeric            matlab.ui.control.NumericEditField
        incWaveSlider2                 matlab.ui.control.Slider
        incWave1EditNumeric            matlab.ui.control.NumericEditField
        incWaveSlider1                 matlab.ui.control.Slider
        targetOptimModeSpinner         matlab.ui.control.Spinner
        uibuttongroup13                matlab.ui.container.ButtonGroup
        text151                        matlab.ui.control.Label
        KcorrEdit                      matlab.ui.control.EditField
        text150                        matlab.ui.control.Label
        freqGHzForDesignEdit           matlab.ui.control.EditField
        designFilePushButton           matlab.ui.control.Button
        isBeamsplitCheckBox            matlab.ui.control.CheckBox
        optimizeReflectionCheckBox     matlab.ui.control.CheckBox
        CSTfilePushButton              matlab.ui.control.Button
        BargraphButton                 matlab.ui.control.Button
        workingText                    matlab.ui.control.Label
        uncoupleButton                 matlab.ui.control.Button
        NoFloqmdsSpinner               matlab.ui.control.Spinner
        NoFloqmdsSpinnerLabel          matlab.ui.control.Label
        currentFloqmdSpinner           matlab.ui.control.Spinner
        currentFloqmdSpinnerLabel      matlab.ui.control.Label
        AutoCouplingButton             matlab.ui.control.Button
        MediumnoSpinner                matlab.ui.control.Spinner
        MediumnoSpinnerLabel           matlab.ui.control.Label
        NoofmediaSpinner               matlab.ui.control.Spinner
        NoofmediaSpinnerLabel          matlab.ui.control.Label
        text159                        matlab.ui.control.Label
        metagratingCheckBox            matlab.ui.control.CheckBox
        FloquetCheckBox                matlab.ui.control.CheckBox
        polarizationButtonGroup        matlab.ui.container.ButtonGroup
        TERadioButton                  matlab.ui.control.RadioButton
        TMRadioButton                  matlab.ui.control.RadioButton
        computeCheckBox                matlab.ui.control.CheckBox
        optimEfficiencyText            matlab.ui.control.Label
        text101                        matlab.ui.control.Label
        FloquestModeToOptimizeButtonGroup  matlab.ui.container.ButtonGroup
        m1FloqModeToOptimize           matlab.ui.control.RadioButton
        zeroFloqModeToOptimize         matlab.ui.control.RadioButton
        p1FloqModeToOptimize           matlab.ui.control.RadioButton
        multibeamsButtonGroup          matlab.ui.container.ButtonGroup
        text114                        matlab.ui.control.Label
        multibeamConfig2RadioButton    matlab.ui.control.RadioButton
        multibeamConfig1RadioButton    matlab.ui.control.RadioButton
        addBeamPushButton              matlab.ui.control.Button
        text128                        matlab.ui.control.Label
        conductorLossText              matlab.ui.control.Label
        text122                        matlab.ui.control.Label
        text121                        matlab.ui.control.Label
        FloqAngleText                  matlab.ui.control.Label
        insertBelowPushButton          matlab.ui.control.Button
        insertAbovePushButton          matlab.ui.control.Button
        removeLayerPushButton          matlab.ui.control.Button
        uibuttongroup7                 matlab.ui.container.ButtonGroup
        text112                        matlab.ui.control.Label
        bruteForceMinTotalEdit         matlab.ui.control.EditField
        bruteForceCancelCheckbox       matlab.ui.control.CheckBox
        bruteForceNumSolsFoundText     matlab.ui.control.Label
        text109                        matlab.ui.control.Label
        text108                        matlab.ui.control.Label
        bruteForceEtaThresholdEdit     matlab.ui.control.EditField
        bruteForcePushButton           matlab.ui.control.Button
        bruteForceDelEdit              matlab.ui.control.EditField
        bruteForceMaxSingleEdit        matlab.ui.control.EditField
        bruteForceMaxTotalEdit         matlab.ui.control.EditField
        text105                        matlab.ui.control.Label
        text106                        matlab.ui.control.Label
        text107                        matlab.ui.control.Label
        gamFileNameText                matlab.ui.control.Label
        methodButtonGroup              matlab.ui.container.ButtonGroup
        method3RadioButton             matlab.ui.control.RadioButton
        method1RadioButton             matlab.ui.control.RadioButton
        method2RadioButton             matlab.ui.control.RadioButton
        solvePushButton                matlab.ui.control.Button
        text86                         matlab.ui.control.Label
        text89                         matlab.ui.control.Label
        tauPhaseDelEdit                matlab.ui.control.EditField
        tauCurText                     matlab.ui.control.Label
        text87                         matlab.ui.control.Label
        text85                         matlab.ui.control.Label
        text84                         matlab.ui.control.Label
        text83                         matlab.ui.control.Label
        tauPhaseFinEdit                matlab.ui.control.EditField
        tauPhaseIniEdit                matlab.ui.control.EditField
        tauMagEdit                     matlab.ui.control.EditField
        text82                         matlab.ui.control.Label
        plotLayersPushButton           matlab.ui.control.Button
        dataFileText                   matlab.ui.control.Label
        chooseFiguresPushButton        matlab.ui.control.Button
        freezeAxisCheckBox             matlab.ui.control.CheckBox
        coupleMedium2Edit              matlab.ui.control.EditField
        uibuttongroup3                 matlab.ui.container.ButtonGroup
        text144_8                      matlab.ui.control.Label
        phaseT0Edit                    matlab.ui.control.NumericEditField
        text144_7                      matlab.ui.control.Label
        magT0Edit                      matlab.ui.control.NumericEditField
        LUTCheckBox                    matlab.ui.control.CheckBox
        WkCheckBox                     matlab.ui.control.CheckBox
        text144_6                      matlab.ui.control.Label
        TCoefFileEdit                  matlab.ui.control.EditField
        RaviCheckBox                   matlab.ui.control.CheckBox
        text144_5                      matlab.ui.control.Label
        ImagZEdit                      matlab.ui.control.NumericEditField
        text144_4                      matlab.ui.control.Label
        realZEdit                      matlab.ui.control.NumericEditField
        text144_3                      matlab.ui.control.Label
        ImagT0Edit                     matlab.ui.control.NumericEditField
        text144_2                      matlab.ui.control.Label
        realT0Edit                     matlab.ui.control.NumericEditField
        numTimesLabel                  matlab.ui.control.Label
        text145                        matlab.ui.control.Label
        maxEffEdit                     matlab.ui.control.EditField
        text144                        matlab.ui.control.Label
        minEffEdit                     matlab.ui.control.EditField
        multipleTimesCheckBox          matlab.ui.control.CheckBox
        stopOptimLoopCheckBox          matlab.ui.control.CheckBox
        uibuttongroup14                matlab.ui.container.ButtonGroup
        airWidthRadioButton            matlab.ui.control.RadioButton
        offsetRadioButton              matlab.ui.control.RadioButton
        texttt                         matlab.ui.control.Label
        MonteCarloCurrentSampleText    matlab.ui.control.Label
        MonteCarloCancelCheckBox       matlab.ui.control.CheckBox
        startMonteCarloPushButton      matlab.ui.control.Button
        NsamplesEdit                   matlab.ui.control.EditField
        text156                        matlab.ui.control.Label
        stdDevEdit                     matlab.ui.control.EditField
        text155                        matlab.ui.control.Label
        text153                        matlab.ui.control.Label
        avgLocDif                      matlab.ui.control.Label
        compareLocCheckBox             matlab.ui.control.CheckBox
        quitOptimCheckBox              matlab.ui.control.CheckBox
        lsqnonlin2PushButton           matlab.ui.control.Button
        targetModeOptimizationButtonGroup  matlab.ui.container.ButtonGroup
        WtEditField                    matlab.ui.control.NumericEditField
        WtEditFieldLabel               matlab.ui.control.Label
        NoincrSpinner                  matlab.ui.control.Spinner
        NoincrSpinnerLabel             matlab.ui.control.Label
        incrementdisplayCheckBox       matlab.ui.control.CheckBox
        undefinePushButton             matlab.ui.control.Button
        mode6EffiencyLabel             matlab.ui.control.Label
        mode5EffiencyLabel             matlab.ui.control.Label
        mode4EffiencyLabel             matlab.ui.control.Label
        mode3EffiencyLabel             matlab.ui.control.Label
        mode2EffiencyLabel             matlab.ui.control.Label
        undefinedLabel                 matlab.ui.control.Label
        savePushButton                 matlab.ui.control.Button
        NomodesSpinner                 matlab.ui.control.Spinner
        NomodesSpinnerLabel            matlab.ui.control.Label
        modenoSpinner                  matlab.ui.control.Spinner
        modenoSpinnerLabel             matlab.ui.control.Label
        mode2EfficiencyText            matlab.ui.control.Label
        text135                        matlab.ui.control.Label
        text134                        matlab.ui.control.Label
        text133                        matlab.ui.control.Label
        targetOptimEfficiency1Text     matlab.ui.control.Label
        targetOptimAngle1text          matlab.ui.control.Label
        distributeRandomlyPushButton   matlab.ui.control.Button
        uibuttongroup10                matlab.ui.container.ButtonGroup
        dmilnumEdit                    matlab.ui.control.NumericEditField
        ExhaustiveButton               matlab.ui.control.Button
        WkLabel                        matlab.ui.control.Label
        EditFieldubWk                  matlab.ui.control.NumericEditField
        EditFieldlbWk                  matlab.ui.control.NumericEditField
        target0Label                   matlab.ui.control.Label
        transmittedPowerLabel          matlab.ui.control.Label
        reflectedPowerLabel            matlab.ui.control.Label
        NotransmissionCheckBox         matlab.ui.control.CheckBox
        NoreflectionCheckBox           matlab.ui.control.CheckBox
        EditFieldubWireReactance       matlab.ui.control.NumericEditField
        EditFieldlbWireReactance       matlab.ui.control.NumericEditField
        EditFieldubWireOffset          matlab.ui.control.NumericEditField
        EditFieldlbWireOffset          matlab.ui.control.NumericEditField
        EditFieldubLayerThickness      matlab.ui.control.NumericEditField
        EditFieldlbLayerThickness      matlab.ui.control.NumericEditField
        constraint1CheckBox            matlab.ui.control.CheckBox
        constantThicknessCheckBox      matlab.ui.control.CheckBox
        symmetricCheckBox              matlab.ui.control.CheckBox
        groupingCheckBox               matlab.ui.control.CheckBox
        text142                        matlab.ui.control.Label
        text141                        matlab.ui.control.Label
        wireReactanceCheckBox          matlab.ui.control.CheckBox
        wireOffsetCheckBox             matlab.ui.control.CheckBox
        layerThicknessCheckBox         matlab.ui.control.CheckBox
        text79                         matlab.ui.control.Label
        waveDirectionEdit              matlab.ui.control.EditField
        resultsButtonGroup             matlab.ui.container.ButtonGroup
        powerConsText                  matlab.ui.control.Label
        text72                         matlab.ui.control.Label
        currentNumberText              matlab.ui.control.Label
        text70                         matlab.ui.control.Label
        numPlotPointsEdit              matlab.ui.control.EditField
        text69                         matlab.ui.control.Label
        maxPlotValueEdit               matlab.ui.control.EditField
        tauRadioButton                 matlab.ui.control.RadioButton
        sigmaBRadioButton              matlab.ui.control.RadioButton
        sigmaARadioButton              matlab.ui.control.RadioButton
        rhoRadioButton                 matlab.ui.control.RadioButton
        pltVshPushButton               matlab.ui.control.Button
        tauAngleText                   matlab.ui.control.Label
        tauPhaseText                   matlab.ui.control.Label
        tauAbsText                     matlab.ui.control.Label
        sigBAngleText                  matlab.ui.control.Label
        sigBPhaseText                  matlab.ui.control.Label
        sigBAbsText                    matlab.ui.control.Label
        sigAAngleText                  matlab.ui.control.Label
        sigAPhaseText                  matlab.ui.control.Label
        sigAAbsText                    matlab.ui.control.Label
        rhoAngleText                   matlab.ui.control.Label
        rhoPhaseText                   matlab.ui.control.Label
        rhoAbsText                     matlab.ui.control.Label
        text55                         matlab.ui.control.Label
        text54                         matlab.ui.control.Label
        text53                         matlab.ui.control.Label
        text52                         matlab.ui.control.Label
        text51                         matlab.ui.control.Label
        text50                         matlab.ui.control.Label
        text49                         matlab.ui.control.Label
        uipanel6                       matlab.ui.container.ButtonGroup
        FloqincwavesCheckBox           matlab.ui.control.CheckBox
        NoperiodsSpinner               matlab.ui.control.Spinner
        NoperiodsSpinnerLabel          matlab.ui.control.Label
        propagationDirectionsCheckBox  matlab.ui.control.CheckBox
        powerCouplingEff               matlab.ui.control.CheckBox
        poyntingVectorsCheckBox        matlab.ui.control.CheckBox
        arrowsCheckBox                 matlab.ui.control.CheckBox
        waveImagePanel                 matlab.ui.container.ButtonGroup
        ImageCheckBox                  matlab.ui.control.CheckBox
        text113                        matlab.ui.control.Label
        timephaseEdit                  matlab.ui.control.EditField
        withoutIncidentWaveCheckBox    matlab.ui.control.CheckBox
        redrawPushButton               matlab.ui.control.Button
        rotationUpDownSlider           matlab.ui.control.Slider
        text78                         matlab.ui.control.Label
        rotationEdit                   matlab.ui.control.EditField
        incidentWaveOnlyCheckBox       matlab.ui.control.CheckBox
        makeMoviePushButton            matlab.ui.control.Button
        singleWaveButtonGroup          matlab.ui.container.ButtonGroup
        bothRadioButton                matlab.ui.control.RadioButton
        downwardRadioButton            matlab.ui.control.RadioButton
        upwardRadioButton              matlab.ui.control.RadioButton
        singleWaveDisplayCheckBox      matlab.ui.control.CheckBox
        displayBoundaryCheckBox        matlab.ui.control.CheckBox
        allWavesRadioButton            matlab.ui.control.RadioButton
        evanescentWavesRadioButton     matlab.ui.control.RadioButton
        propagatingWavesRadioButton    matlab.ui.control.RadioButton
        animationSpeedUpDownSlider     matlab.ui.control.Slider
        nPtsPerWLUpDownSlider          matlab.ui.control.Slider
        text37                         matlab.ui.control.Label
        nPtsPerWLEdit                  matlab.ui.control.EditField
        animateWaveCheckBox            matlab.ui.control.CheckBox
        DisplayWaveImageCheckBox       matlab.ui.control.CheckBox
        paramsToControlListbox         matlab.ui.control.ListBox
        tiltAnglePanel                 matlab.ui.container.Panel
        sliderStepDownPushButton       matlab.ui.control.Button
        sliderStepUpPushButton         matlab.ui.control.Button
        tiltAngleEditNumeric           matlab.ui.control.NumericEditField
        Slider                         matlab.ui.control.Slider
        mediumPanel                    matlab.ui.container.ButtonGroup
        optimTotalThicknessText        matlab.ui.control.Label
        text100                        matlab.ui.control.Label
        mediumTypeButtonGroup          matlab.ui.container.ButtonGroup
        cloneAllPushButton             matlab.ui.control.Button
        virtualTypeRadioButton         matlab.ui.control.RadioButton
        airGapTypeRadioButton          matlab.ui.control.RadioButton
        dielectricTypeRadioButton      matlab.ui.control.RadioButton
        wireTypeRadioButton            matlab.ui.control.RadioButton
        wiresButtonGroup               matlab.ui.container.ButtonGroup
        realZLabel                     matlab.ui.control.Label
        wireWkmilEdit                  matlab.ui.control.EditField
        text115_2                      matlab.ui.control.Label
        wire2CombineEdit               matlab.ui.control.NumericEditField
        wire1CombineEdit               matlab.ui.control.NumericEditField
        combineButton                  matlab.ui.control.Button
        aluminumWireRadioButton        matlab.ui.control.RadioButton
        text147                        matlab.ui.control.Label
        wireWidthMilEdit               matlab.ui.control.EditField
        text146                        matlab.ui.control.Label
        text130                        matlab.ui.control.Label
        lossFreqEdit                   matlab.ui.control.EditField
        text129                        matlab.ui.control.Label
        PECWiresRadioButton            matlab.ui.control.RadioButton
        copperWireRadioButton          matlab.ui.control.RadioButton
        reciprocalPushButton           matlab.ui.control.Button
        normalizeLocPushButton         matlab.ui.control.Button
        mirrorWiresPushButton          matlab.ui.control.Button
        wireStripWidthEdit             matlab.ui.control.EditField
        text117                        matlab.ui.control.Label
        wireHorizOffsetEdit            matlab.ui.control.EditField
        text116                        matlab.ui.control.Label
        wireDistImpedEdit              matlab.ui.control.EditField
        text115                        matlab.ui.control.Label
        isWireCheckBox                 matlab.ui.control.CheckBox
        includeInOptimizationCheckBox  matlab.ui.control.CheckBox
        conductivityEdit               matlab.ui.control.EditField
        text77                         matlab.ui.control.Label
        thickEdit                      matlab.ui.control.EditField
        text73                         matlab.ui.control.Label
        otherRadioButton               matlab.ui.control.RadioButton
        muEqual1RadioButton            matlab.ui.control.RadioButton
        epsEqualMuRadioButton          matlab.ui.control.RadioButton
        epsText                        matlab.ui.control.Label
        epsEdit                        matlab.ui.control.EditField
        isBotAirCheckBox               matlab.ui.control.CheckBox
        nText                          matlab.ui.control.EditField
        text18                         matlab.ui.control.Label
        text6                          matlab.ui.control.Label
        frequencyButtonGroup           matlab.ui.container.ButtonGroup
        thzRadioButton                 matlab.ui.control.RadioButton
        ghzRadioButton                 matlab.ui.control.RadioButton
        waveLengthUnitsText            matlab.ui.control.Label
        waveLengthText                 matlab.ui.control.Label
        text10                         matlab.ui.control.Label
        freqGHzEdit                    matlab.ui.control.EditField
        prismAxes                      matlab.ui.control.UIAxes
    end

    properties (Access = public)
        baselineHandlesForWk = [];
    end
    
    properties (Access = public)
        TGMpropModeNumber % "Target" mode number (e.g. -1,1,0; not 1, 2, 3).
        %This is almost the same as handles.modesForOptimization. The
        %difference is that this is defined only for optimization, while
        %the handles.modesForOptimization is defined immediately upon
        %changing the value in the edit box.
        TGMwireHorizOffset % Horiz. offset for (TGmodeNumber,layer number)
        TGMwireDistImped % Distributed impedance for (TGmodeNumber,layer number)
        TGMhOverWL % hOverWL for (TGmodeNumber,layer number) 
        TGMnCoupledTo %nCoupledTo for (TGmodeNumber,layer number)
        TGMdistCoupledTo %distCoupledTo for (TGmodeNumber,layer number)
        TGMincludeInOptim %includeInOptim for (TGmodeNumber,layer number).
        % For wires, refers only to offset, not to impedance, when 
        % TGMincludeWireOffsetInOptim is true. If
        % TGMincludeWireOffsetInOptim is not true, then it can refer to the
        % dist imped.
        TGMisPossibleCoupling %isPossibleCoupling for (TGmodeNumber);
        TGMdefined=0 %True when a configuration has been defined for (TGmodeNumber)
        TGMincludeLayerThicknessInOptim %true when layer thicknesses are included in (TGmodeNumber)
        TGMincludeWireOffsetInOptim %true when wire offsets are included in (TGmodeNumber)
        TGMincludeWireReactanceInOptim %true when wire reactances are included in (TGmodeNumber)
        TGMmodeIndex %The index of this mode in the handles.modeNumberPropagating vector.        
        TGMefficiency % The efficiency of this mode.
        ndielectrics  %The number of dielectric layers in the stack.
        indWireImpedSymA   %The indices of the independent wires for impedance.
        indWireImpedSymB   %The indices of the wires symmetrical with those above.
        indWireOffsetSymA  %The indices of the independent wires for offset.
        indWireOffsetSymB  %The indices of the wires symmetrical with those above.
        indWireOffsetSymCenter %Two rows corresponding to the above.
        NindWireImpedSym
        NindWireOffsetSym
        seqModeNumber % Description
        currentFloqMode % Description
        sliderStep % Description
        TGMweight % The weight given to this mode in the optimization
        caseEdge % A case expression used in switch case in Wk2Z.
        caseInternal  % A case expression used in switch case in Wk2Z.
        % LUT stuff
        LUTmaxtimes %For tries using the multiple-times checkbox.
        LUTminEff   %The minimum efficiency to be recorded.
        NLUTangles  %The number of angles for which LUT will be created.
        LUTang1     %The first phase angle of trans coeff T.
        LUTang2     %The last phase angle of trans coeff T.
        LUTtargetTMagnitude   %The target magnitude of trans. coeff. T.
        NLUTmags;
        LUTtargetTMagnitude2;
        LUTappRef   %The LUT window.
        childImages %The images that appear when the display checkbox is clicked.
        isJCross
        dAtWL1
        hOverWLAtWL1
        wireStripWidthAtWL1
        wireDistImpedAtWL1
        WkAtWL1
        isMeanEfficiencyOptim
        MEOfreqReduced
        MEOangDeg
        MeanEfficiencyOptimWeight
    end

    methods (Static, Access = private)
        function s = formatDuration(sec)
            % Convert seconds (double) to a compact h:mm:ss.s string
            if isempty(sec) || ~isfinite(sec)
                s = 'n/a';
                return
            end
            if sec < 0
                sec = 0;
            end
            h = floor(sec/3600);
            m = floor((sec - 3600*h)/60);
            sRem = sec - 3600*h - 60*m;
            if h > 0
                s = sprintf('%02dh:%02dm:%05.2fs', h, m, sRem);
            elseif m > 0
                s = sprintf('%02dm:%05.2fs', m, sRem);
            else
                s = sprintf('%.2fs', sRem);
            end
        end
    end
    
    methods (Access = public)
        function prepareBaselineForWkSweep(app, templateDatFile)
            if ~isfile(templateDatFile)
                error('Template .dat file not found: %s', templateDatFile);
            end
            % Ensure Wk mode is active
            if isprop(app,'WkCheckBox')
                app.WkCheckBox.Value = true;
            end
            % Use existing no-dialog loader
            app.loadDatFileWithoutDialog(templateDatFile);

            handles = guidata(app.figure1);
            if isempty(handles)
                error('Baseline preparation failed: handles empty after loading %s.', templateDatFile);
            end
            if ~isfield(handles,'Wk') || isempty(handles.Wk)
                warning('Baseline has empty handles.Wk; Wk sweep will still run but may not change physics.');
            end
            app.baselineHandlesForWk = handles;
        end

        % filepath: c:\Users\Dell\Desktop\frequency_response\layers_App_exported.m
        function results = batchFromWkMatrix(app, WkMatrix, varargin)
            % Extended with HK column support.
            p = inputParser;
            addParameter(p,'ChunkSize',1000,@(x)isnumeric(x)&&isscalar(x)&&x>0);
            addParameter(p,'OutFile','Results_WkSweep.csv',@(s)ischar(s)||isstring(s));
            addParameter(p,'IncludeWk',true,@islogical);
            addParameter(p,'Resume',false,@islogical);
            addParameter(p,'ReturnAll',false,@islogical);
            addParameter(p,'Verbose',true,@islogical);
            addParameter(p,'TimingEvery',50,@(x)isnumeric(x)&&isscalar(x)&&x>0);
            parse(p,varargin{:});
            opt = p.Results;

            nTotal  = size(WkMatrix,1);
            nWkCols = size(WkMatrix,2);

            fileExists = isfile(opt.OutFile);
            startRow = 1;
            if opt.Resume && fileExists
                % Count existing data rows
                fid = fopen(opt.OutFile,'r');
                nLines = 0;
                while true
                    tline = fgetl(fid);
                    if ~ischar(tline); break; end
                    nLines = nLines + 1;
                end
                fclose(fid);
                if nLines > 1
                    completed = nLines - 1;
                    if completed >= nTotal
                        if opt.Verbose
                            fprintf('[batchFromWkMatrix] Resume: all rows already done.\n');
                        end
                        if opt.ReturnAll
                            results = readtable(opt.OutFile); 
                        else
                            results = table();
                        end
                        return
                    end
                    startRow = completed + 1;
                    if opt.Verbose
                        fprintf('[batchFromWkMatrix] Resuming at row %d.\n', startRow);
                    end
                end
            else
                if fileExists
                    delete(opt.OutFile);
                end
            end

            % Header creation
            if ~fileExists || (opt.Resume && startRow==1)
                if opt.IncludeWk
                    wkNames = arrayfun(@(k)sprintf('Wk%d',k), 1:nWkCols, 'UniformOutput',false);
                    varNames = [wkNames, {'efficiency','phaseDeg'}];
                else
                    varNames = {'efficiency','phaseDeg'};
                end

                fid = fopen(opt.OutFile,'w');
                fprintf(fid, '%s\n', strjoin(varNames,','));
                fclose(fid);
            end

            % Timing storage
            tAllStart = tic;
            caseTimes = NaN(nTotal,1);
            timingEvery = opt.TimingEvery;
            lastFlushRow = startRow - 1;

            % One-time warning flags
            warnedMissingSigma = false;

            % Suppress drawing during batch runs to avoid graphics-object leak
            try
                setappdata(app.figure1,'BatchSuppressDraw',true);
            catch
            end

            % Clear existing axes children (remove leftover graphics before batch)
            try
                h0 = guidata(app.figure1);
                if isstruct(h0) && isfield(h0,'prismAxes') && isgraphics(h0.prismAxes)
                    try
                        delete(allchild(h0.prismAxes));
                    catch
                    end
                end
            catch
            end

            % (Optional full collection if ReturnAll)
            if opt.ReturnAll
                effAll   = NaN(nTotal,1);
                phaseAll = NaN(nTotal,1);
                if opt.IncludeWk
                    wkAll = NaN(nTotal,nWkCols);
                end
            end

            try
            for row = startRow:nTotal
                tCaseStart = tic;
                handles = guidata(app.figure1);

                % Apply Wk
                handles = emulateReadDataFilePostParse(app, handles, WkMatrix(row,:));
                % guidata(app.figure1, handles);

                % Prepare for calculation (apply coupling logic)
                handles = prepareForCalculation(app, handles);
                
                % Run physics
                handles = runMain(app, handles);
                % guidata(app.figure1, handles);

                effVal   = str2double(app.targetOptimEfficiency1Text.Text);
                phaseVal = str2double(app.tauPhaseText.Text);

                if opt.ReturnAll
                    effAll(row)   = effVal;
                    phaseAll(row) = phaseVal;
                    if opt.IncludeWk; wkAll(row,:) = WkMatrix(row,:); end
                end

                % Initialize new chunk if needed
                if row == lastFlushRow + 1
                    cap = min(opt.ChunkSize, nTotal - lastFlushRow);
                    chunk_runIndex = NaN(cap,1);
                    chunk_eff      = NaN(cap,1);
                    chunk_phase    = NaN(cap,1);
                    if opt.IncludeWk
                        chunk_wk = NaN(cap,nWkCols);
                    end
                    % rho/tau per-row storage
                    chunk_rhoAbs   = NaN(cap,1);
                    chunk_rhoPhase = NaN(cap,1);
                    chunk_tauAbs   = NaN(cap,1);
                    chunk_tauPhase = NaN(cap,1);
                    chunkPos = 0;
                end

                chunkPos = chunkPos + 1;
                chunk_runIndex(chunkPos) = row;
                chunk_eff(chunkPos)      = effVal;
                chunk_phase(chunkPos)    = phaseVal;
                if opt.IncludeWk
                    chunk_wk(chunkPos,:) = WkMatrix(row,:);
                end

                % --- collect rho/tau and per-layer sigma into chunk arrays ---
                % safe rho/tau extraction
                if isfield(handles,'rho')
                    rVal = handles.rho;
                else
                    rVal = NaN;
                end
                if isfield(handles,'tau')
                    tVal = handles.tau;
                else
                    tVal = NaN;
                end
                chunk_rhoAbs(chunkPos)  = abs(rVal);
                chunk_rhoPhase(chunkPos) = angle(rVal) * 180/pi;
                chunk_tauAbs(chunkPos)  = abs(tVal);
                chunk_tauPhase(chunkPos) = angle(tVal) * 180/pi;

                % Timing
                thisCaseTime = toc(tCaseStart);
                caseTimes(row) = thisCaseTime;

                isChunkFull = (chunkPos == numel(chunk_runIndex));
                isLastRow   = (row == nTotal);

                doPrint = opt.Verbose && (isLastRow || isChunkFull || row==startRow || mod(row-startRow+1, timingEvery)==0);
                if doPrint
                    elapsed = toc(tAllStart);
                    avgCase = mean(caseTimes(startRow:row),'omitnan');
                    medCase = median(caseTimes(startRow:row),'omitnan');
                    remaining = nTotal - row;
                    etaSec = remaining * avgCase;
                    fprintf('[batchFromWkMatrix] row %d/%d (%.1f%%) last=%.3fs avg=%.3fs med=%.3fs ETA=%s elapsed=%s\n', ...
                        row, nTotal, 100*row/nTotal, thisCaseTime, avgCase, medCase, ...
                        layers_App_exported.formatDuration(etaSec), layers_App_exported.formatDuration(elapsed));
                end

                if isChunkFull || isLastRow
                    if chunkPos < numel(chunk_runIndex)
                        chunk_runIndex = chunk_runIndex(1:chunkPos);
                        chunk_eff      = chunk_eff(1:chunkPos);
                        chunk_phase    = chunk_phase(1:chunkPos);
                        if opt.IncludeWk; chunk_wk = chunk_wk(1:chunkPos,:); end
                    end

                    % Build table with Wk columns first, then efficiency, then phase
                    if opt.IncludeWk
                        wkNames = arrayfun(@(k)sprintf('Wk%d',k), 1:nWkCols, 'UniformOutput',false);
                        Tchunk = [array2table(chunk_wk,'VariableNames',wkNames), ...
                                  table(chunk_eff, chunk_phase, 'VariableNames', {'efficiency','phaseDeg'})];
                    else
                        Tchunk = table(chunk_eff, chunk_phase, 'VariableNames', {'efficiency','phaseDeg'});
                    end

                    % Append to file using fprintf for consistent formatting
                    fid = fopen(opt.OutFile,'a');
                    % Build format dynamically: Wk columns first, then efficiency, then phase
                    if opt.IncludeWk
                        baseFmt = [repmat('%.15g,',1,nWkCols) '%.15g,%.15g'];
                    else
                        baseFmt = '%.15g,%.15g';
                    end
                    baseFmt = [baseFmt '\n'];
                    for rr=1:height(Tchunk)
                        fprintf(fid, baseFmt, Tchunk{rr,1:end});
                    end
                    fclose(fid);
                    lastFlushRow = row;
                    if opt.Verbose
                        fprintf('[batchFromWkMatrix] Flushed rows up to %d\n', row);
                    end
                end
            end
            catch ME
                % Restore drawing flag on error
                try
                    if isappdata(app.figure1,'BatchSuppressDraw')
                        rmappdata(app.figure1,'BatchSuppressDraw');
                    end
                catch
                end
                rethrow(ME);
            end

            % Restore drawing flag after batch
            try
                if isappdata(app.figure1,'BatchSuppressDraw')
                    rmappdata(app.figure1,'BatchSuppressDraw');
                end
            catch
            end

            totalElapsed = toc(tAllStart);
            newRows = startRow:nTotal;
            avgNew = mean(caseTimes(newRows),'omitnan');
            medNew = median(caseTimes(newRows),'omitnan');
            throughput = numel(newRows)/totalElapsed;
            if opt.Verbose
                fprintf('[batchFromWkMatrix] DONE rows %d..%d totalElapsed=%s avg=%.4fs med=%.4fs %.2f cases/s\n', ...
                    startRow, nTotal, layers_App_exported.formatDuration(totalElapsed), avgNew, medNew, throughput);
            end

            if opt.ReturnAll
                runIdx = newRows(:);
                effOut = effAll(runIdx);
                phaseOut = phaseAll(runIdx);
                if opt.IncludeWk
                    wkNames = arrayfun(@(k)sprintf('Wk%d',k), 1:nWkCols, 'UniformOutput',false);
                    results = [array2table(wkAll(runIdx,:),'VariableNames',wkNames), ...
                               table(effOut, phaseOut, 'VariableNames', {'efficiency','phaseDeg'})];
                else
                    results = table(effOut, phaseOut, 'VariableNames', {'efficiency','phaseDeg'});
                end
            else
                results = table(); % Data persisted on disk
            end
        end


        function handles = emulateReadDataFilePostParse(app, handles, newWkVec, varargin)
            % Emulate ONLY the Wk-dependent tail of readDataFile for isWk==1
            % newWkVec can be:
            %   (a) full-length (numMedia-1) OR
            %   (b) wire-only (sum(isWire==1))
            % Optional name-value:
            %   'Verbose', true/false  (default false)

            p = inputParser;
            addParameter(p,'Verbose',false,@islogical);
            parse(p,varargin{:});
            verbose = p.Results.Verbose;

            if ~isfield(handles,'isWire') || ~isfield(handles,'numMedia')
                error('emulateReadDataFilePostParse:MissingBaseline',...
                    'Baseline readDataFile must be executed first.');
            end

            totalLayers = handles.numMedia - 1;
            wireInd     = find(handles.isWire==1);
            nWires      = numel(wireInd);

            inLen = numel(newWkVec);

            if inLen == totalLayers
                % Full vector provided
                fullWk = newWkVec(:).';
            elseif inLen == nWires
                % Wire-only vector provided: map onto baseline
                if ~isfield(handles,'Wk') || numel(handles.Wk) ~= totalLayers
                    error('Baseline handles.Wk missing or wrong size (%d).', numel(handles.Wk));
                end
                fullWk = handles.Wk;          % start with existing (baseline) full vector
                fullWk(wireInd) = newWkVec(:).';
            else
                error(['Wk length mismatch: provided %d, expected either %d (full) or %d (wire-only).'], ...
                    inLen, totalLayers, nWires);
            end

            if verbose
                fprintf('[emulate] totalLayers=%d nWires=%d inLen=%d (mode=%s)\n', ...
                    totalLayers, nWires, inLen, ternary(inLen==totalLayers,'full','wire-only'));
            end

            % Rebuild switch-case expressions (needed before Wk2Z calls)
            switchCaseExpressions(app, handles.isWire);

            % Assign full Wk
            handles.Wk = fullWk;

            % Zero impedance arrays (exactly as in readDataFile)
            handles.wireDistImped = zeros(1, totalLayers);
            handles.realZ         = zeros(1, totalLayers);

            % Recompute impedance only for wire layers
            for ii = 1:totalLayers
                if handles.isWire(ii)==1
                    Z = Wk2Z(app, ii, handles.Wk(ii));
                    handles.wireDistImped(ii) = imag(Z);
                    handles.realZ(ii)         = real(Z);
                    if verbose
                        fprintf('[emulate] layer %2d (wire) Wk=%g  Z=%g%+gj\n', ...
                            ii, handles.Wk(ii), real(Z), imag(Z));
                    end
                else
                    if verbose
                        fprintf('[emulate] layer %2d (dielectric) Wk(ignored)=%g\n', ...
                            ii, handles.Wk(ii));
                    end
                end
            end

            % Recompute HankelSum (safe & keeps parity)
            handles.HankelSum = sumHankel(app, handles.d, handles.ThetInDeg, handles.eps(1), handles.WL);

            % Re-init GAMMA containers
            nTermsFQ = app.NoFloqmdsSpinner.Value;
            handles.GAMMAMGReflect  = NaN(nTermsFQ, nTermsFQ, totalLayers);
            handles.GAMMAMGTransmit = NaN(nTermsFQ, nTermsFQ, totalLayers);
            handles.inductDiff      = zeros(totalLayers,1);
            handles.distImpedFac    = 1;

            % mgGAMMA per layer with scalar realZtilde (order critical)
            eta = 376.730313668;
            for ii = 1:totalLayers
                if handles.isWire(ii)==1
                    handles.realZtilde = handles.realZ(ii)*eta/handles.WL;
                    handles = mgGAMMA(app, handles, ii);
                else
                    % Ensure non-wire layers do not reuse previous wire's realZtilde:
                    handles.realZtilde = 0;
                end
            end
        end

        function out = ternary(cond,a,b)
            if cond, out=a; else, out=b; end
        end
    
        function avgLocDif = LocDiff(app, isWirePrev, wireHorizOffsetPrev, isWireCur, wireHorizOffsetCur)
                %LocDiff determines the average absolute difference in location of wires between the
            %previous configuration and the current configuration. This will only be
            %done if the dimensions of the two sets are the same. That is, the number
            %of wires is the same and the wires correspond to the same medium numbers.
            %If these conditions do not hold, 0 is returned.
            avgLocDif=0;
            %isWire should be the same for the previous and current
            if length(isWirePrev)~=length(isWireCur)
                return
            end
            isAnyNotEqual=find(isWirePrev~=isWireCur);
            if ~isempty(isAnyNotEqual)
                %At least one element of isWire is not equal
                return
            end
            xLocPrev=wireHorizOffsetPrev(isWirePrev==1);
            xLocCur=wireHorizOffsetCur(isWirePrev==1);
            absDif=abs(xLocPrev-xLocCur);
            absDifAdj=absDif;
            absDifAdj(absDif>0.5)=1-absDifAdj(absDif>0.5);
            avgLocDif=mean(absDifAdj);
        end

        function pltVsh(app,handles)
            %The case in which the variable that is being varied is the
            %frequency (nParamToControl=8) has been removed from here, and 
            % may be found in function pltVsFreq.
            %specialPlot(handles);
            %specialPlot4(handles);
            %return
            %For standard use, comment out the above two lines.
            %Get limits of variable.
            %isMultipleCases,EffRef are only for the case when the
            %frequency is being changed. 
            %isMultipleCases is 1 when many phases are being run to obtain
            %the bandwidth (and possibly other info) as a function of those
            %phases. Effref is the reference efficiency [0 1] at which the
            %bandwidth is determined. EffMinMaxNomFreq is a triple representing
            % the efficiencies at the nominal, minimum and maximum
            % frequencies.  PhsNomMinMaxFreq is a triple representing
            % the phases at the nominal, minimum and maximum
            % frequencies. CSTresultsfilename is only used when
            % isMultipleCases=0.
            nParamToControl=handles.nParamToControl;
            xIni=handles.valParamToControl(nParamToControl);
            xFin=str2double(get(handles.maxPlotValueEdit,'String'));
            if xFin<=xIni
                xFin=handles.maxParamToControl(nParamToControl);
            end
            varname=handles.nameParamToControl(nParamToControl,:);
            varname=deblank(varname);
            if nParamToControl>1 && nParamToControl<8
                %The parameter is one that depends on the current medium number
                varname=[varname '(' num2str(handles.mediumNumber) ')'];
            end
            
            nPoints=str2double(get(handles.numPlotPointsEdit,'String'));
            x=linspace(xIni,xFin,nPoints);
            y=zeros(1,nPoints);
            yPhaseDeg=zeros(1,nPoints);
            
            %dvEstring=['y(ii)=abs(handles.' handles.plotDependentVariable '(' num2str(handles.singleWaveDisplay) '));'];
            %dvEstringPhaseDeg=['yPhaseDeg(ii)=(180/pi)*angle(handles.' handles.plotDependentVariable '(' num2str(handles.singleWaveDisplay) '));'];
            dvEstring=['y(ii)=abs(handles.' handles.plotDependentVariable ');'];
            dvEstringPhaseDeg=['yPhaseDeg(ii)=(180/pi)*angle(handles.' handles.plotDependentVariable ');'];
            estring=['handles.' varname '=val;'];
            %In case we are varying the frequency which would require changing the
            %wavelength and hOverWL, save the hOverWL. It is assumed that hOverWL was
            %found for WL=1 (i.e. 0.2997925 GHz).
            %h=handles.hOverWL*handles.WL;
            for ii=1:nPoints
                val=x(ii);
                %estring=['handles.' varname '=' num2str(val) ';'];
                eval(estring)
                if nParamToControl==2
                    %n is being plotted.  So change eps
                    handles.eps(handles.mediumNumber)=val*val;
                end
                if nParamToControl>=5 && nParamToControl<=7
                    handles=mgGAMMA(app, handles,handles.mediumNumber);
                end

                if strcmp(varname,'ThetInDeg') 
                    %It is assumed ThetInDeg is being varied. Then also
                    %vary incAngDeg so it equals ThetInDeg, and also vary
                    %ThetOutDeg so that handles.d is unchanged, which is
                    %tantamount to handles.DELsin being unchanged.
                    handles.incAngDeg=handles.ThetInDeg;
                    set(handles.waveDirectionEdit,'String',num2str(handles.incAngDeg))
                    %
                    %abs(sinThetOut-sinThetIn)=1/handles.d;
                    %2 possibilities
                    %1
                    %sinThetOut-sinThetIn=1/handles.d;
                    %2
                    %sinThetOut-sinThetIn=-1/handles.d;
                    sinThetIn=sind(handles.ThetInDeg);
                    sinThetOutPrev=sind(handles.ThetOutDeg);
                    if sinThetOutPrev>sinThetIn
                       sinThetOut=1/handles.d+sinThetIn;
                    else
                       sinThetOut=-1/handles.d+sinThetIn;
                    end
                    handles.ThetOutDeg=asind(sinThetOut);
                    %
                    % sinThetOut=sind(handles.ThetOutDeg);
                    % handles.DELsin=abs(sinThetOut-sinThetIn);
                    % %handles.d=handles.WL/handles.DELsin;
                    % %In this version, the period will not be affected by wavelength
                    % %so that we can compute frequency response.
                    % handles.d=1/handles.DELsin;
                    % set(handles.periodText,'String',num2str(handles.d))
                    handles.HankelSum=sumHankel(app,handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
                    for jj=1:handles.numMedia-1
                        handles=mgGAMMA(app,handles,jj);
                    end
                end   

                if strcmp(varname,'ThetOutDeg')
                    sinThetIn=sind(handles.ThetInDeg);
                    handles.incAngDeg=handles.ThetInDeg;
                    set(handles.waveDirectionEdit,'String',num2str(handles.incAngDeg))
                    sinThetOut=sind(handles.ThetOutDeg);
                    handles.DELsin=abs(sinThetOut-sinThetIn);
                    %handles.d=handles.WL/handles.DELsin;
                    %In this version, the period will not be affected by wavelength
                    %so that we can compute frequency response.
                    handles.d=1/handles.DELsin;
                    %set(handles.periodText,'String',num2str(handles.d))
                    app.periodEditField.Value=handles.d;
                    handles.HankelSum=sumHankel(app,handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
                    for ii=1:handles.numMedia-1
                        handles=mgGAMMA(app,handles,ii);
                    end
                end   
                
                if nParamToControl==11
                    for jj=1:handles.numMedia-1
                        handles=mgGAMMA(app, handles,jj);
                    end
                end
                handles=drawMedia(app, handles);
                %guidata(hObject,handles)
            
                eval(dvEstring)
                eval(dvEstringPhaseDeg)
            
                set(handles.currentNumberText,'String',num2str(ii))
                drawnow
            end
            %Since there is no call to guidata, the handles structure will exit with
            %their values on entry.
            %gcfTemp=gcf;
            
            figure
            plot(x,y)
            xlabel(varname)
            ylabel(handles.plotDependentVariable)
            grid on
            
            figure
            plot(x,yPhaseDeg)
            xlabel(varname)
            ylabel(['phase(' handles.plotDependentVariable ')'])
            grid on
        end

        function [bandwidth,meanEff,EffNomMinMaxFreq,PhsNomMinMaxFreq,magML,phsML]=...
                pltVsFreq(app,handles,isMultipleCases,EffRef,CSTresultsfilename,...
                upperDistOverLambda0,lowerDistOverLambda0,...
                isCST,isMultiCST,nFreqsCST,resultNumber,varargin)
            %This is an expansion of the function pltVsh when the variable
            %that is being varied is the frequency.
            %isMultipleCases,EffRef are only for the case when the
            %frequency is being changed. 
            %isMultipleCases is 1 (true) when many phases are being run to obtain
            %the bandwidth (and possibly other info) as a function of those
            %phases. Effref is the reference efficiency [0 1] at which the
            %bandwidth is determined. EffMinMaxNomFreq is a triple representing
            % the efficiencies at the nominal, minimum and maximum
            % frequencies.  PhsNomMinMaxFreq is a triple representing
            % the phases at the nominal, minimum and maximum
            % frequencies. CSTresultsfilename is only used when
            % isMultipleCases=0.
            %nParamToControl=handles.nParamToControl;
            %xIni=handles.valParamToControl(nParamToControl);
            p = inputParser;
            addParameter(p,'SuppressPlots',false,@islogical);
            args = varargin;
            parse(p, args{:});
            suppressPlots = p.Results.SuppressPlots;

            xIni=app.tiltAngleEditNumeric.Value;
            xFin=str2double(get(handles.maxPlotValueEdit,'String'));
            if xFin<=xIni
                %xFin=handles.maxParamToControl(nParamToControl);
                xFin=handles.maxParamToControl(8);
            end
            % varname=handles.nameParamToControl(nParamToControl,:);
            % varname=deblank(varname);
            % if nParamToControl>1 && nParamToControl<8
            %     %The parameter is one that depends on the current medium number
            %     varname=[varname '(' num2str(handles.mediumNumber) ')'];
            % end
            
            nPoints=str2double(get(handles.numPlotPointsEdit,'String'));
            if nPoints==1
                %If only a single point is indicated, this means that we
                %wish to put the system into a configuration compatible
                %with the frequency indicated in xIni. While using this new
                %configuration, the old configuration can be obtained by
                %either reloading the current data file, or by operating
                %with the LUT file on this file (without having closed it 
                % in the interim). (This fact hasn't been checked yet.)
                handles.freqGHz=xIni;
                handles=changeFreq(app,handles,xIni);
                guidata(handles.figure1,handles)
                return
            end
            modeNumber=app.currentFloqmdSpinner.Value;
            modeStr=num2str(modeNumber);
            angText=app.FloqAngleText.Text;
            %Remove the degrees sign attached to the end
            angText=angText(1:end-1);
            angDeg=str2double(angText);
            freq0=str2double(app.lossFreqEdit.Value);
            freqReduced=linspace(xIni,xFin,nPoints);
            %Define for the EffVsFreq function. MEO means mean efficiency
            %optimization. We want to be able to define the parameters for
            %this function only on the basis of app.
            app.MEOfreqReduced=freqReduced;
            app.MEOangDeg=angDeg;
            [magML,phsML,meanEff]=EffVsFreq(app,handles);

            %Since there is no call to guidata, the handles structure will exit with
            freq=freqReduced*freq0/0.2997925;
            %Find frequency extent for which efficiency is above effRef.
            %Get index of freq0.
            %EffRef=0.7;
            if EffRef==0
                EffRef=0.7;
            end
            [bandwidth,indfreq0,freqBWmin,freqBWmax]...
                =getBandwidth(app,freq,freq0,magML,EffRef);
            EffNomMinMaxFreq=[magML(1) magML(indfreq0) magML(end)];
            PhsNomMinMaxFreq=[phsML(1) phsML(indfreq0) phsML(end)];
            %
            if ~isMultipleCases && ~suppressPlots
                %Only provide plots if it is a single case, not for
                %multiple cases.
                %
                f0=str2double(app.lossFreqEdit.Value);
                if isCST
                    %There are CST results. So plot both CST and Matlab
                    %results.
                    freqML=freq;
                    CSTMatlabFreqResp(app,f0,freqML,magML,phsML,modeStr,...
                            CSTresultsfilename,upperDistOverLambda0,lowerDistOverLambda0,...
                            isMultiCST,nFreqsCST,resultNumber)
                else
                    %There are no CST results. So plot only Matlab
                    %rsults.
                    % Magnitude
                    figure
                    plot(freq,magML*100,'b','LineWidth',2)
                    % if bandwidth>0
                    %     %line([freq(maxIndFreq) freq(minIndFreq)],100*[EffRef EffRef],'color','b','Linestyle','--')
                    %     line([freqBWmin freqBWmax],100*[EffRef EffRef],'color','b','Linestyle','--')
                    % end
                    %Instead of plotting the bandwidth, plot the mean
                    %efficiency and also indicate the nominal frequency f0.
                    ylim=get(gca,'YLim');
                    line([f0 f0],ylim,'color','k','Linestyle','--')
                    line([freq(1) freq(end)],[meanEff meanEff]*100,'color','k','Linestyle','--')
                    xlabel('frequency (GHz)')
                    ylabel(['\eta_{' modeStr '} (%)'])
                    legend(['Mode ' modeStr ' Analytical'])
                    grid
                    title('Transmission Coupling Efficiency Magnitude',...
                        ['bandwidth=' num2str(bandwidth) ' GHz, mean(efficiency)=' num2str(meanEff*100) ' %'])
                    %The above is in the form of a title and sub-title
                    %
                    % Phase
                    figure
                    plot(freq,phsML,'LineWidth',2)
                    ylim=get(gca,'YLim');
                    line([f0 f0],ylim,'color','k','Linestyle','--')
                    xlabel('frequency (GHz)')
                    ylabel(['Phase(\eta_{' modeStr '})'])
                    legend(['Mode ' modeStr ' Analytical'])
                    title('Transmission Coupling Efficiency Phase')
                    grid
                    %
                    %Phase and magnitude
                    phsMagCmplx(app,freq,magML,phsML,f0)
                end  %isCST
            end   %~isMultipleCases
        end

        function [magML,phsML,meanEff]=EffVsFreq(app,handles)
            freqReduced=app.MEOfreqReduced;
            angDeg=app.MEOangDeg;
            nPoints=length(freqReduced);
            y=zeros(1,nPoints);
            phsML=zeros(1,nPoints);
            for ii=1:nPoints
                handles.freqGHz=freqReduced(ii);
                %
                newFreq=handles.freqGHz;
                handles=changeFreq(app,handles,newFreq);
                %
                handles=runMain(app,handles);
                y(ii)=abs(handles.tau);
                phsML(ii)=(180/pi)*angle(handles.tau);
            
                set(handles.currentNumberText,'String',num2str(ii))
                drawnow
            end
            magML=y.*y*cosd(angDeg);
            meanEff=mean(magML);
        end


        function [bandwidth,indfreq0,freqBWmin,freqBWmax]...
                =getBandwidth(app,freq,freq0,magML,EffRef)
            %getBandwidth finds the bandwidth for efficiency EffRef, when
            %when magML is the efficiency magnitude as a function of
            %frequency freq. The reference frequency is freq0. getBandwidth
            %also finds indfreq0 which is the index number of freq0 in the
            %freq array. It also returns the min and max frequencies 
            % freqBWmin,freqBWmax used for the bandwidth. 
            % All efficiencies are fraction efficiencies between 0 and 1.
            bandwidth=0;
            freqBWmin=freq0;
            freqBWmax=freq0;
            indfreq0a=find(freq>=freq0);
            if ~isempty(indfreq0a)
                indfreq0=indfreq0a(1);
                if magML(indfreq0)>EffRef
                    %The efficiency at the reference frequency is greater 
                    %than the reference efficiency. Consider the frequencies 
                    %below and find the nearest frequency at which the
                    %efficiency goes below the reference efficiency.
                    indFreqBelowEffRef=find(magML(1:indfreq0)<EffRef);
                    if isempty(indFreqBelowEffRef)
                        minIndFreq=1;
                    else
                        minIndFreq=indFreqBelowEffRef(end);
                    end
                    %Now the frequencies above
                    indFreqAboveEffRef=find(magML(indfreq0:end)<EffRef);
                    if isempty(indFreqAboveEffRef)
                        maxIndFreq=length(magML);
                    else
                        maxIndFreq=indfreq0-1+indFreqAboveEffRef(1);
                    end
                    freqBWmin=freq(minIndFreq);
                    freqBWmax=freq(maxIndFreq);
                    %bandwidth=freq(maxIndFreq)-freq(minIndFreq);
                    bandwidth=freqBWmax-freqBWmin;
                end
            end
        end


        function CSTMatlabFreqResp(app,f0,freqML,magML,phsML,modeStr,...
                FileName,upperDistOverLambda0,lowerDistOverLambda0,...
                isMultiCST,nFreqsCST,resultNumber)
            if isMultiCST
                %There is frequency response data for each of the phases.
                %Choose the data for the phase corresponding to resultNumber.
                %https://www.mathworks.com/matlabcentral/answers/40680-loading-text-file-with-multiple-sections-of-headers
                %https://www.mathworks.com/matlabcentral/answers/101050-how-do-i-specify-the-number-of-header-lines-using-textscan-to-read-a-file-that-has-multiple-blocks-o
                %This latter url explains why the number of headerlines is
                %different between the first and the other calls to
                %textscan. In brief, there are only 3 headerlines. But
                %after the first set, the "cursor" is just before the
                %carriage return of the first line, and the index
                %represents the number of carriage returns (or line feeds).
                fid=fopen(FileName);
                CSTDataCell=textscan(fid,'%f %f %f',nFreqsCST,'Headerlines',3,'CollectOutput',1);
                if resultNumber>1
                    for ii=2:resultNumber
                        CSTDataCell=textscan(fid,'%f %f %f',nFreqsCST,'Headerlines',4,'CollectOutput',1);
                    end
                end
                CSTData=cell2mat(CSTDataCell);
                fclose(fid);
            else
                CSTPolarData=importdata(FileName);
                try
                    CSTData=CSTPolarData.data;
                    %This is necessary for a file that came from CST since
                    %there is a header of a few lines.
                catch
                    %This is the format when we create the file instead of
                    %CST, since here there is no header.
                    CSTData=CSTPolarData;
                end
            end
            %3 columns: frequency (GHz), Magnitude, Phase
            freqCST=CSTData(:,1);
                    %Find the indeces of freqCST that correspond to freqmin
                    %and freqmax. That is, we want the bounds of freqs for
                    %CST to be the same as the bounds for Matlab.
                    freqmin=freqML(1);
                    freqmax=freqML(end);
                    [c,indfreqmin] = min(abs(freqCST-freqmin));
                    [c,indfreqmax] = min(abs(freqCST-freqmax));
                    freqCST=freqCST(indfreqmin:indfreqmax);
            %Find the freqs for which freq is a whole number.
            freq1=freqCST(1);
            freqEnd=freqCST(end);
            freqFix1=fix(freq1)+1;
            freqFixEnd=fix(freqEnd);
            %nWholeNumbers=freqFixEnd-freqFix1+1;
            freqFixes=[];
            if freqFixEnd>=freqFix1
                freqFixes=[freq1 freqFix1:freqFixEnd freqEnd];
            else
                freqFixes=[freq1 freqEnd];
            end
            %
            %Forget about the above. Just indicate the nominal frequency.
            freqFixes=f0;
            %Get the indices of points closest to freqFixes
            lenFreqFixes=length(freqFixes);
            indFix=zeros(1,lenFreqFixes);
            for ii=1:lenFreqFixes
                indd=find(freqCST>=freqFixes(ii));
                indFix(ii)=indd(1);
            end

            magCST=CSTData(:,2);
            phsCST=-CSTData(:,3);
            %NOTE NOTE NOTE The negative sign is because this is a CST
            %file which is based on exp(jwt), while we are using
            %exp(-iwt);
                    magCST=magCST(indfreqmin:indfreqmax);
                    phsCST=phsCST(indfreqmin:indfreqmax);
            %
            %The CST phase is not what we're looking for. That is because
            %it evidently provides the difference in phase from the highest
            %point to the lowest point. For our runs, the highest point is
            %at a distance 3*lambda0 above the metasurface, where lambda0
            %is the wavelength at a reference frequency f0. The lowest
            %point is 3*lambda0 below the metasurface. In between, the
            %metasurface itself is .13864*lambda0 thick. The phase of the
            %wave itself with frequency f changes over a distance delz by 
            %k*delz=2*pi*delz/lambda radians or 360*delz/lambda deg.
            %delphase=360*(3*lambda0+3*lambda0+.13864*lambda0)/lambda
            %delphase=360*(3+3+.13864)*lambda0/lambda
            %delphase=360*(3+3+.13864)*(f/f0)
            %upperDistOverLambda0=3;
            %lowerDistOverLambda0=3;
            %msThicknessOverLambda0=.13864;
            %msThicknessOverLambda0=0;
            %f0=14;
            delphase=360*(upperDistOverLambda0+lowerDistOverLambda0)*freqCST/f0;
            phsCST=phsCST-delphase;
            %This will probably not be within [-180 180].
            %So after getting im and re parts, get angle.
            %
            magCST=magCST.*magCST;
            reCST=magCST.*cosd(phsCST);
            imCST=magCST.*sind(phsCST);
            phsCST=angle(reCST+1i*imCST)*180/pi;
            %Get axis to plot on.
            figure
            % currentAxis=gca;
            % axes(currentAxis);  %Make this axis current 
            % hold on
            hCST=plot(reCST,imCST,'.');
            %hold off
            hCST.MarkerSize=12;
            hCST.Color='r';
            grid
            axis('equal')
            hold on
            hCSTFix=plot(reCST(indFix),imCST(indFix),'o');
            %hold off
            hCSTFix.MarkerSize=8;
            hCSTFix.Color='b';
            hCSTFix.MarkerFaceColor='b';
            %Text for freqs.
            for ii=1:lenFreqFixes
                text(reCST(indFix(ii))+.05,imCST(indFix(ii)),num2str(freqFixes(ii)))
            end
            %Reference circles
            h1=fplot(@(t) sin(t), @(t) cos(t));
            h1.Color='r';
            r=0.5:0.1:0.9;
            for ii=1:length(r)
                hr(ii)=fplot(@(t) r(ii)*sin(t), @(t) r(ii)*cos(t));
                hr(ii).Color='b';
            end
            %Plot radials to indicate segments of 30 deg.
            ang=-180:30:150;
            for ii=1:length(ang)
                hang(ii)=line([0 sind(ang(ii))],[0,cosd(ang(ii))]);
                hang(ii).LineStyle='--';
                hang(ii).Color='k';
            end
            %
            %Now the Matlab results
            reML=magML.*cosd(phsML);
            imML=magML.*sind(phsML);
            hML=plot(reML,imML,'.');
            hML.MarkerSize=12;
            hML.Color='b';
            %
            hold off
            xlabel('Re(T_0)')
            ylabel('Im(T_0)')
            title('Transmission Efficiency')
            %
            %
            %Also plot on Cartesian axis. Include reflection
            %I have an idea.  Require the file with the reflected wave
            %to have the same name as FileName, but with TT replaced by
            %RR.
            FileNameRR=replace(FileName,'TT','RR');
            if isMultiCST
                %There is frequency response data for each of the phases.
                %Choose the data for the phase corresponding to resultNumber.
                fid=fopen(FileNameRR);
                CSTDataCell=textscan(fid,'%f %f %f',nFreqsCST,'Headerlines',3,'CollectOutput',1);
                if resultNumber>1
                    for ii=2:resultNumber
                        CSTDataCell=textscan(fid,'%f %f %f',nFreqsCST,'Headerlines',4,'CollectOutput',1);
                    end
                end
                RMagData=cell2mat(CSTDataCell);
                fclose(fid);
            else
                RMag=importdata(FileNameRR);
                try
                    RMagData=RMag.data;
                catch
                    RMagData=RMag;
                end
            end
            RR=RMagData(:,2);
                    RR=RR(indfreqmin:indfreqmax);
            RREff=RR.*RR;
            Absorbed=1-magCST-RREff;
            %
            figure
            ha=plot(freqCST,magCST*100,'r',...
                freqCST,RREff*100,'g',...
                freqCST,Absorbed*100,'m');
            set(ha(1),'linewidth',2)
            %Now Matlab
            hold on
            plot(freqML,magML*100,'b','linewidth',2)
            hold off
            %
            meanCSTpct=mean(magCST)*100;
            line([freqCST(1) freqCST(end)],[meanCSTpct meanCSTpct],'color','r','LineStyle','--')
            meanMLpct=mean(magML)*100;
            line([freqML(1) freqML(end)],[meanMLpct meanMLpct],'color','b','LineStyle','--')
            ylim=get(gca,'YLim');
            line([f0 f0],ylim,'LineStyle','--','Color','k')
            xlabel('Frequency (GHz)')
            ylabel('|\eta| (%)')
            legend('CST transmission','CST reflection','CST absorption',...
                'Matlab transmission','CST mean efficiency','Matlab mean efficiency',...
                'nominal frequency')
            title('Frequency Response (Coupling Efficiency Magnitude)')
            grid
            %
            figure
            plot(freqCST,phsCST,'r','linewidth',2)
            %Now Matlab
            hold on
            plot(freqML,phsML,'b','linewidth',2)
            hold off
            xlabel('Frequency (GHz)')
            ylabel('phase (deg)')
            legend('CST','Matlab')
            grid
            ylim=get(gca,'YLim');
            line([f0 f0],ylim,'LineStyle','--','Color','k')
        end


        function MonteCarlo(app, handles)
            %When the offset radio button is on,
            %for the current wire distribution, MonteCarlo determines the the eta when
            %running runMain with values of horizontal offset that vary according to a
            %normal distribution.
            %When the air width radio button is on,
            %for the current wire distribution, MonteCarlo determines the the eta when
            %running runMain with values of air width that vary according to a
            %normal distribution. This assumes there are air layers
            isWire=handles.isWire;
            NSamples=str2double(get(handles.NsamplesEdit,'String'));
            stdDev=str2double(get(handles.stdDevEdit,'String'));
            if app.offsetRadioButton.Value
                %Get the current locations of the wires and their location in the matrix.
                wireMedia=find(isWire==1);
                NWires=length(wireMedia);
                wireHorizOffset=handles.wireHorizOffset(wireMedia);
            elseif app.airWidthRadioButton.Value
                airMedia=find(isWire==3);
                NAirMedia=length(airMedia);
                airThickness=handles.hOverWL(airMedia);
                meanairThickness=mean(airThickness);
            end
            eta=zeros(NSamples,1);
            for ii=1:NSamples
                if app.offsetRadioButton.Value
                    newOffset=stdDev*randn(NWires,1)+wireHorizOffset';
                    %Make sure that each entry is between 0 and 1.
                    newOffset(newOffset<0)=newOffset(newOffset<0)+1;
                    newOffset(newOffset>1)=newOffset(newOffset>1)-1;
                    handles.wireHorizOffset(wireMedia)=newOffset;
                    for jj=1:handles.numMedia-1
                        handles=mgGAMMA(app, handles,jj);
                    end
                elseif app.airWidthRadioButton.Value
                    newAirThickness=stdDev*randn(NAirMedia,1)*meanairThickness+airThickness;
                    %Make sure that each entry is between 0 and 1.
                    newAirThickness(newAirThickness<0)=0;
                    %newAirThickness(newAirThickness>1)=newAirThickness(newAirThickness>1)-1;
                    handles.hOverWL(airMedia)=newAirThickness;
                    %A call to mgGAMMA is not necessary since that routine
                    %does not change anything when the air thickness
                    %changes.
                end
                %handles=drawMedia(handles);
                %When drawMedia is not called, coupling (which is contained 
                % in drawMedia, must be considered anyway.
                handles=coupling(app,handles);
                handles=runMain(app, handles);
                set(handles.MonteCarloCurrentSampleText,'String',num2str(ii))
                drawnow
                eta(ii)=str2double(get(handles.targetOptimEfficiency1Text,'String'));
                if get(handles.MonteCarloCancelCheckBox,'Value')
                    eta=eta(1:ii);
                    break
                end
            end
            %Put everything back the way it was
            if app.offsetRadioButton.Value
                handles.wireHorizOffset(wireMedia)=wireHorizOffset;
                for ii=1:handles.numMedia-1
                    handles=mgGAMMA(app, handles,ii);
                end
            elseif app.airWidthRadioButton.Value
                handles.hOverWL(airMedia)=airThickness;
            end
            handles=drawMedia(app, handles);
            %
            %create histogram.
            modeString=num2str(app.targetOptimModeSpinner.Value);
            figure
            histogram(eta*100)
            xlabel('efficiency (%)')
            ititle=['Mode ' modeString ', Std dev = ' num2str(stdDev) ', ' num2str(length(eta)) ' samples'];
            title(ititle)
            grid
            set(gca,'xlim',[0 100])
        end
        
        function [SxAvg, SyAvg] = Poynting(app, Ez, Hx, Hy, k0, mu)
            HxConj=conj(Hx);
            HyConj=conj(Hy);
            %Cross produce between E and Hconj:
            Sx=-Ez*HyConj;
            Sy=Ez*HxConj;
            SxAvg=real(Sx)/(2*k0*mu);
            SyAvg=real(Sy)/(2*k0*mu);
        end
        
        function handles = PropagationDirections(app, handles)
            %Draw incidence arrow
            global haxis111 ColorOrder
            %handles=drawWaves(handles);
            %We want it to be at the proper angle.
            %Set its length as the fraction of the minimum of ylim and xlim.
            ylim=get(handles.prismAxes,'YLim');
            yLength=ylim(2)-ylim(1);
            xlim=get(handles.prismAxes,'XLim');
            xLength=xlim(2)-xlim(1);
            fac=0.3;
            h=str2double(get(handles.optimTotalThicknessText,'String'));
            arrowLength=fac*min(xLength,yLength);
            %For incident wave, the arrow will point downward.
            %To get the source of the arrow, the y-component will be positive.
            %The x-component of a positive angle is positive,
            %and for a negative angle negative.  However, since we want the
            %SOURCE POINT of the arrow, it will be the opposite.
            %Therefore, put a minus sign before the x-component.
            
            jj=0;
            nTermsFQ=app.NoFloqmdsSpinner.Value;
            for ii=1:nTermsFQ
                %Now consider the reflected components.
                if imag(handles.betaFloq(1,ii))==0
                    %This component is propagating.
                    ang=atan(handles.alfaFloq(ii)/handles.betaFloq(1,ii));
                    mag=1;
                    xArrow=mag*arrowLength*sin(ang);
                    yArrow=mag*arrowLength*cos(ang);
                    jj=jj+1;
                    p1(jj,:)=[0 0];
                    p2(jj,:)=[xArrow yArrow];
                    aColor(jj)='m';
            %         jj=jj+1;
            %         p1(jj,:)=[0 -h];
            %         p2(jj,:)=[xArrow -h+yArrow];
            %         aColor(jj)='c';
                    yArrow=-mag*arrowLength*cos(ang);
                    jj=jj+1;
                    p1(jj,:)=[0 -h];
                    p2(jj,:)=[xArrow -h+yArrow];
                    aColor(jj)='c';
                end
                %
            %     %Medium 3
            %     %if imag(handles.beta3(ii))==0
            %     realBeta3=real(handles.beta3(ii));
            %     if realBeta3~=0
            %         %This mode in region 3 is propagating
            %         imagBeta3=imag(handles.beta3(ii));
            %         ang=atan(handles.alfa3(ii)/realBeta3);
            %         mag=1;
            %         %if mag>1.e-2
            %             xArrow=mag*arrowLength*sin(ang);
            %             yArrow=-mag*arrowLength*cos(ang);
            %             if nSingle==0 || nSingle==ii
            %                 jj=jj+1;
            %                 p1(jj,:)=[0 -handles.h];
            %                 p2(jj,:)=[xArrow -handles.h+yArrow];
            %                 aColor(jj)='c';
            %             end
            %         %end
            %     end
            end
            if ishandle(handles.hPropDirec)
                delete(handles.hPropDirec(:))  % Delete all handles in array
            end
            %
            if jj==0
                return
            end
            ColorOrder=aColor;
            %
            %if get(handles.arrowsCheckBox,'Value')
                haxis111=handles.prismAxes;
                hold(haxis111,'on')
                haxis111.ColorOrderIndex = 1;
                %The above is necessary for matlab versions later than 2014a.
                %After a hold, it tells matlab to start plotting using the current
                %colororder.  Otherwise, it would continue plots from the plot of the
                %last color used in the order.
                handles.hPropDirec=arrow3(p1,p2,'o');
                hold(haxis111,'off')
        end
        
        %function C = WriteData(app, handles)
        function C = WriteData(app, handles)
            isWk=app.WkCheckBox.Value; %Added Dec. 2024
            A=[handles.incAngDeg handles.n(1:handles.numMedia-1)'];
            AA=[handles.ThetInDeg handles.conductivity(1:handles.numMedia-1)'];
            if isWk
                B=[handles.d handles.hOverWL(1:handles.numMedia-1)'];
            else
                B=[handles.ThetOutDeg handles.hOverWL(1:handles.numMedia-1)'];
            end    
            nfloq=app.NoFloqmdsSpinner.Value;
            DA=[nfloq handles.isWire(1:handles.numMedia-1)];
            if isWk
                DB=[1 handles.Wk(1:handles.numMedia-1)];
            else
                DB=[0 handles.wireDistImped(1:handles.numMedia-1)];
            end
            DC=[app.isJCross handles.wireHorizOffset(1:handles.numMedia-1)];
            DD=[0 handles.wireStripWidth(1:handles.numMedia-1)];
            C=[A;AA;B;DA;DB;DC;DD];
        end
        
        function axisClickCallback(app, hObject, eventdata, handles)
            %The handle structure above is the original one.
            %Get the updated one.
            %handles=guidata(hObject);
            p = get(handles.prismAxes,'currentPoint');
            x = p(1,1);
            y = p(1,2);
            newMedium=0;
            if handles.numMedia>1
                %h=-cumsum(handles.hOverWL(1:handles.numMedia));
                h=-cumsum(handles.hOverWL(1:handles.numMedia-1));
                h=[0;h];
                ih=find(h>y);
                if ~isempty(ih)
                    newMedium=ih(end);
                end
            end
            %Note: if numMedia=1, then newMedium can't change anyway.
            %if newMedium~=0
            if newMedium>0 && newMedium<handles.numMedia
                handles.mediumNumber=newMedium;
                %set(handles.mediumNumberEdit,'String',num2str(newMedium))
                app.MediumnoSpinner.Value=newMedium;
                handles=setNewMedium(app, handles);
            end
            guidata(hObject,handles);
        end
        
        function [handles, efficiency,totalReflectedPower,...
                totalTransmittedPower,T0Ravi,R0Ravi] = ...
                callToModel(app, handles, isAfterOpt, optFac, modeIndex)
            %callToModel controls whether the full model (drawMedia) will be called,
            %or the partial model (runMain) will be called. The full model will be
            %called after the optimization (isAfterOpt=true), while the partial model
            %(w/o graphics) will be called during optimization.
            %
            %All the physical parameters that correspond to modeIndex have
            %already been calculated. However, if Floq inc waves are used,
            %these must correspond to modeIndex.
            handles.EincComplexFull=handles.EincComplexDim(:,modeIndex);
            if isAfterOpt
                handles=drawMedia(app, handles);
            else
                %When drawMedia is not called, coupling (which is contained 
                % in drawMedia, must be considered anyway.
                handles=coupling(app,handles);
                handles=runMain(app, handles);
            end
            %
            rhoFloqPropagating=abs(handles.rhoFloq(handles.nPropagating));
            totalReflectedPower=sum(rhoFloqPropagating.*rhoFloqPropagating.*optFac);
            tauFloqPropagating=abs(handles.tauFloq(handles.nPropagating));
            totalTransmittedPower=sum(tauFloqPropagating.*tauFloqPropagating.*optFac);
            %For the Ravi case, handles.nPropagating will have only one
            %component.
            %T0Ravi=handles.tauFloq(handles.nPropagating(handles.nCurMd));
            %R0Ravi=handles.rhoFloq(handles.nPropagating(handles.nCurMd));
            T0Ravi=handles.tauFloq(handles.nCurMd);
            R0Ravi=handles.rhoFloq(handles.nCurMd);

            %
            %It was insufficient to use the text box results because of their relative
            %poor precision.
            if handles.isRefraction && ~get(handles.optimizeReflectionCheckBox,'Value')
                taurhoFloqPropagating=handles.tauFloq(handles.nPropagating);
            else
                taurhoFloqPropagating=handles.rhoFloq(handles.nPropagating);
            end
            %Get the target index for sequential mode modeIndex.
            mtarseq=app.TGMmodeIndex(modeIndex);
            tauAbs=abs(taurhoFloqPropagating(mtarseq));
            efficiency=optFac(mtarseq)*tauAbs*tauAbs;
        end
        
        function conductorLosses(app, handles)
            %This function computese the conductor losses for each layer containing
            %wires.
            fGHz=str2double(get(handles.lossFreqEdit,'String'));
            cosThetIn=cosd(handles.ThetInDeg);
            d=handles.d;
            thereAreWires=0;
            etaLossTotal=0;
            etaLossii=0;
        end
        
        function handles = distributeRandomly(app, handles, lbLayerThickness, ubLayerThickness, ...
                lbWireOffset, ubWireOffset, lbWireReactance, ubWireReactance, isFromRandomPushButton)
            numSeqModes=app.NomodesSpinner.Value;
            isWk=app.WkCheckBox.Value;
            if isWk
                handles.Wk=zeros(1,handles.numMedia-1);
            end
            if isFromRandomPushButton
                for ii=1:numSeqModes
                    if ~(app.TGMincludeLayerThicknessInOptim(ii) ||...
                      app.TGMincludeWireOffsetInOptim(ii) ||...
                      app.TGMincludeWireReactanceInOptim(ii))
                        if ii==1
                            msgbox(['No optimization variable has been set for mode ' num2str(ii)])
                        end
                        if ii==1
                            return
                        end
                    end
                end
            else
                ii=1;
                if ~(app.TGMincludeLayerThicknessInOptim(ii) ||...
                  app.TGMincludeWireOffsetInOptim(ii) ||...
                  app.TGMincludeWireReactanceInOptim(ii))
                    msgbox(['No optimization variable has been set for mode ' num2str(ii)])
                    return
                end
            end
            %
            handles.hOverWLMode1=handles.hOverWL;  %Initialize
            set(handles.mode2EfficiencyText,'String',' ')
            app.mode2EffiencyLabel.Text='.000';
            app.mode3EffiencyLabel.Text='.000';
            app.mode4EffiencyLabel.Text='.000';
            app.mode5EffiencyLabel.Text='.000';
            app.mode6EffiencyLabel.Text='.000';
            %
            addVec1=rand(numSeqModes,handles.numMedia-1);
            addVec2=rand(numSeqModes,handles.numMedia-1);
            addVec3=rand(numSeqModes,handles.numMedia-1);
            addVec4=rand(numSeqModes,handles.numMedia-1);
            %For the time being, symmetry and constant thickness is limited
            %to only a single mode optimization.
            isConstantThickness=app.constantThicknessCheckBox.Value;
            constantThickness=lbLayerThickness+(ubLayerThickness-lbLayerThickness)*addVec3(1,1);
            isSymmetric=app.symmetricCheckBox.Value;
            %doSymmetric=true;
            for jj=1:numSeqModes
                wireHorizOffsetPrev=app.TGMwireHorizOffset(jj,:);
                for ii=1:handles.numMedia-1
                    if handles.isWire(ii)==1
                        if app.TGMincludeInOptim(jj,ii)
                            if  app.TGMincludeWireOffsetInOptim(jj)
                                app.TGMwireHorizOffset(jj,ii)=lbWireOffset+(ubWireOffset-lbWireOffset)*addVec1(jj,ii);
                                %prevOffset=app.TGMwireHorizOffset(jj,ii);
                            else
                                if isFromRandomPushButton && jj>1
                                    app.TGMwireHorizOffset(jj,ii)=app.TGMwireHorizOffset(jj-1,ii);
                                end
                            end
                            %
                            %*******This part adapted from optvar2modelvar.
                            %
                            handles.isPossibleCoupling=app.TGMisPossibleCoupling(jj);
                            if app.TGMisPossibleCoupling(jj)
                                %Coupling can only be valid if an offset is being
                                %optimized.  
                                handles.nCoupledTo=app.TGMnCoupledTo(jj,:);
                                %get the distance between the slave wire and the 
                                %master wire.
                                %Find the indices of the wires that are linked to
                                %other wires. These are those that are not equal to
                                %the sequence vector (because if there is no
                                %coupling, 1 is coupled to 1, 2 is coupled to 2,
                                %etc.).
                                ind=find(handles.nCoupledTo ~= 1:handles.numMedia-1);
                                if isempty(ind)
                                    %oops. Since isPossibleCoupling is true, we
                                    %should have at least one layer coupled.
                                    msgbox('Coupling not found.')
                                end
                                for kk=1:length(ind)
                                    jjj=ind(kk);
                                    masterLayer=handles.nCoupledTo(jjj);
                                    handles.distCoupledTo(jjj)=wireHorizOffsetPrev(masterLayer)-wireHorizOffsetPrev(jjj);
                                    %
                                    %The following is to make sure the offset
                                    %parameter is defined for the slave wire as
                                    %well. This will be important in producing the
                                    %proper printout.
                                    app.TGMwireHorizOffset(jj,jjj)=app.TGMwireHorizOffset(jj,masterLayer)-handles.distCoupledTo(jjj);
                                    if app.TGMwireHorizOffset(jj,jjj)<0
                                        app.TGMwireHorizOffset(jj,jjj)=app.TGMwireHorizOffset(jj,jjj)+1;
                                    elseif app.TGMwireHorizOffset(jj,jjj)>1
                                        app.TGMwireHorizOffset(jj,jjj)=app.TGMwireHorizOffset(jj,jjj)-1;
                                    end
                                    %
                                end
                                %checkoffsets(handles)
                                app.TGMdistCoupledTo(jj,:)=handles.distCoupledTo;
                            end   %Possible coupling
                        end  %TGMincludeInOptim
                        %
                        %*******end This part adapted from optvar2modelvar.
                        %
                        %if get(handles.wireReactanceCheckBox,'Value')
                        if app.TGMincludeWireReactanceInOptim(jj)
                            %Only use TGMincludeInOptim to disinclude when 
                            %TGMincludeWireOffsetInOptim is off.
                            if app.TGMincludeInOptim(jj,ii) || app.TGMincludeWireOffsetInOptim(jj)
                                 if isWk
                                     Wk1=app.EditFieldlbWk.Value;
                                     Wk2=app.EditFieldubWk.Value;
                                     %Wk1=1;
                                     %Wk2=80; 
                                     %Wk1=0;
                                     %Wk2=120; 
                                     %Wk2=110; 
                                     handles.Wk(ii)=Wk1+(Wk2-Wk1)*addVec2(jj,ii);
                                 else
                                    app.TGMwireDistImped(jj,ii)=lbWireReactance+(ubWireReactance-lbWireReactance)*addVec2(jj,ii);
                                    %prevImped=handles.wireDistImped(ii);
                                 end
                            end
                        else
                            if isFromRandomPushButton && jj>1
                                app.TGMwireDistImped(jj,ii)=app.TGMwireDistImped(jj-1,ii);
                            end
                        end
                    else
                        %if app.layerThicknessCheckBox.Value
                        if app.TGMincludeLayerThicknessInOptim(jj)
                            if app.TGMincludeInOptim(jj,ii)
                                if isConstantThickness
                                    app.TGMhOverWL(jj,ii)=constantThickness;
                                else
                                    app.TGMhOverWL(jj,ii)=lbLayerThickness+(ubLayerThickness-lbLayerThickness)*addVec4(jj,ii);
                                end
                            end
                            %handles.hOverWLMode1(ii)=handles.hOverWL(ii);
                        else
                            if isFromRandomPushButton && jj>1
                                app.TGMhOverWL(jj,ii)=app.TGMhOverWL(jj-1,ii);
                            end
                        end
                    end  %isWire
                end %ii
            end %jj
            %
            if isSymmetric
                %Based on the randomized locations which did not assume
                %symmetry, impose the symmetry. Only the first mode (jj=1)
                %is necessary. Symmetry only applies to wires, and applies
                %to both impedance and offset.
                %First impedance.
                app.TGMwireDistImped(1,app.indWireImpedSymB)=...
                    app.TGMwireDistImped(1,app.indWireImpedSymA);
                %For offset, it is more involved since there might be
                %values of indWireOffsetSymA with 0 entries. Find the
                %indices of these entries.
                ind0=find(app.indWireOffsetSymA==0);
                indNot0=find(app.indWireOffsetSymA~=0);
                cen11=app.TGMwireHorizOffset(1,app.indWireOffsetSymCenter(1,indNot0));
                cen12=app.TGMwireHorizOffset(1,app.indWireOffsetSymCenter(2,indNot0));
                cen1=mean([cen11;cen12]);
                %cen1 is the avg of the upper row and lower row of indWireOffsetSymCenter.
                app.TGMwireHorizOffset(1,app.indWireOffsetSymB(indNot0))=...
                    2*cen1-app.TGMwireHorizOffset(1,app.indWireOffsetSymA(indNot0));
                cen21=app.TGMwireHorizOffset(1,app.indWireOffsetSymCenter(1,ind0));
                cen22=app.TGMwireHorizOffset(1,app.indWireOffsetSymCenter(2,ind0));
                cen2=mean([cen21;cen22]);
                app.TGMwireHorizOffset(1,app.indWireOffsetSymB(ind0))=cen2;
                %Make sure it is between 0 and 1.
                indWires=find(handles.isWire==1);
                app.TGMwireHorizOffset(1,indWires)=mod(app.TGMwireHorizOffset(1,indWires),1);
            end
            %checkoffsets(app.TGMwireHorizOffset(1,:))
            TGmodeNumberSave=app.modenoSpinner.Value;
            if isFromRandomPushButton && numSeqModes>1
                eff=zeros(numSeqModes,1);
                for ii=1:numSeqModes
                    %handles=displayTargetModeInfo(app,handles,ii);
                    app.modenoSpinner.Value=ii;
                    handles=optimModeSeqNumEdit_Function(app, handles);
                    eff(ii)=str2double(app.targetOptimEfficiency1Text.Text);
                    switch ii
                        case 1
                            app.targetOptimEfficiency1Text.Text=num2str(eff(ii));
                            %For each of the next modes, the first one has to
                            %be rewritten since the program currently places
                            %each result into the first text box.
                        case 2
                            app.mode2EffiencyLabel.Text=num2str(eff(ii),3);
                            app.targetOptimEfficiency1Text.Text=num2str(eff(1));
                        case 3
                            app.mode3EffiencyLabel.Text=num2str(eff(ii),3);
                            app.targetOptimEfficiency1Text.Text=num2str(eff(1));
                        case 4
                            app.mode4EffiencyLabel.Text=num2str(eff(ii),3);
                            app.targetOptimEfficiency1Text.Text=num2str(eff(1));
                        case 5
                             app.mode5EffiencyLabel.Text=num2str(eff(ii),3);
                            app.targetOptimEfficiency1Text.Text=num2str(eff(1));
                        case 6
                            app.mode6EffiencyLabel.Text=num2str(eff(ii),3);
                            app.targetOptimEfficiency1Text.Text=num2str(eff(1));
                    end   %switch
                end    %for ii
                zerotarget=sum((1-eff).*(1-eff));
                app.target0Label.Text=num2str(zerotarget);
            end       %if from randompushbutton
            app.modenoSpinner.Value=TGmodeNumberSave;
            handles=displayTargetModeInfo(app,handles,TGmodeNumberSave);
            %handles=setNewMediumFrame(app, handles);
            %The above was commented out Dec 2024 because setNewMediumFrame
            %is called in displayTargetModeInfo.
            %checkoffsets(handles.wireHorizOffset);
            if app.WkSymCheckBox.Value 
                handles=makeWkSym(app,handles);
            end
        end
        
        function handles = doGroup(app, handles)
            if ~get(handles.groupingCheckBox,'Value')
                return
            end
            %We want each group to be symmetric. This levels requirements on the
            %distances between the wires and on the impedances. Sort the locations of
            %the first 3 wires in the group (which are the ones which are participating
            %in the optimization). This assumes the offset is between 0 and d.
            sizegwi=size(handles.groupedWireIndices);
            nGroups=sizegwi(1);
            nWiresInGroup=sizegwi(2);
            indexDependent1=fix(nWiresInGroup/2)+3;
            iseven=rem(nWiresInGroup,2)==0;
            %We are assuming that there are two instances when this grouping option
            %is being used. (1) When offsets are the only thing being varied. (2)
            %When other things are being varied (e.g. impedances) in addition to
            %offsets.
            if get(handles.wireReactanceCheckBox,'Value')
                %offsets are not the only thing being varied.
                for ii=1:nGroups
                    offsets=handles.wireHorizOffset(handles.groupedWireIndices(ii,1:indexDependent1));
                    [offsetsSorted,I]=sort(offsets);
                    diffSorted=diff(offsetsSorted);
                    lengthAux=nWiresInGroup-indexDependent1;
                    offsetSortedAux=zeros(1,lengthAux);
                    %Note that in the following, the results of one round of the loop
                    %affects the next round of the loop.
                    kk=indexDependent1-1;
                    if ~iseven
                        kk=kk+1;
                    end
                    lastOffsetsSorted=offsetsSorted(end);
                    for jj=1:lengthAux
                        kk=kk-1;
                        offsetSortedAux(jj)=lastOffsetsSorted+diffSorted(kk);
                        lastOffsetsSorted=offsetSortedAux(jj);
                    end
                    %Make it between 0 and 1
                    offsetSortedAux(offsetSortedAux>1)=offsetSortedAux(offsetSortedAux>1)-1;
            %         dist12=offsetsSorted(2)-offsetsSorted(1);
            %         offset4=offsetsSorted(3)+dist12;
            %         if offset4>1
            %             offset4=offset4-1;
            %         end
                    %handles.wireHorizOffset(handles.groupedWireIndices(ii,4))=offset4;
                    handles.wireHorizOffset(handles.groupedWireIndices(ii,indexDependent1+1:nWiresInGroup))=offsetSortedAux;
                    %
                    %Now the impedances.
                    impedances=handles.wireDistImped(handles.groupedWireIndices(ii,1:indexDependent1));
                    impedancesSorted=impedances(I);
                    %For symmetry, the last one equals the first one, the next-to-last one equals the second, ...
                    %handles.wireDistImped(handles.groupedWireIndices(ii,4))=impedancesSorted(1);
                    if iseven
                        handles.wireDistImped(handles.groupedWireIndices(ii,indexDependent1+1:nWiresInGroup))=fliplr(impedancesSorted(1:indexDependent1-2));
                        %...and the last sorted one (the third sorted one, number
                        %indexDependent1) equals the indexDependent1-1
                        %sorted one. The absolute index of this (third) indexDependent1 sorted one:
                        index3=handles.groupedWireIndices(ii,I(end));
                        handles.wireDistImped(index3)=impedancesSorted(end-1);
                    else
                        handles.wireDistImped(handles.groupedWireIndices(ii,indexDependent1+1:nWiresInGroup))=fliplr(impedancesSorted(1:indexDependent1-1));
                    end
                end
            else
                %Offsets are the only thing being varied. Since they are grouped, they
                %have to be varied as a group.
                offsets=handles.wireHorizOffset(handles.groupedWireIndices(:,1)).'+handles.diffOffset;
                %Make them between 0 and 1.
                offsets(offsets>1)=offsets(offsets>1)-1;
                offsets(offsets<0)=offsets(offsets<0)+1;
               handles.wireHorizOffset(handles.groupedWireIndices)=offsets;
            end
            for ii=1:handles.numMedia-1
                handles=mgGAMMA(app, handles,ii);
            end
        end
        
        
        function handles = drawIncArrow(app, handles)
            %Skip drawing when running in batch mode
            if isappdata(app.figure1,'BatchSuppressDraw') && getappdata(app.figure1,'BatchSuppressDraw')
                return
            end
            %Draw incidence arrow
            global haxis111 ColorOrder
            %handles=drawWaves(handles);
            %We want it to be at the proper angle.
            %Set its length as the fraction of the minimum of ylim and xlim.
            ylim=get(handles.prismAxes,'YLim');
            yLength=ylim(2)-ylim(1);
            xlim=get(handles.prismAxes,'XLim');
            xLength=xlim(2)-xlim(1);
            fac=0.3;
            arrowLength=fac*min(xLength,yLength);
            %For incident wave, the arrow will point downward.
            %To get the source of the arrow, the y-component will be positive.
            %The x-component of a positive angle is positive,
            %and for a negative angle negative.  However, since we want the
            %SOURCE POINT of the arrow, it will be the opposite.
            %Therefore, put a minus sign before the x-component.
            %
            %In what follows, the wavepower (Poynting vector) should have the impedance
            %of free space in the denominator.  Since we are taking ratios of
            %wavepower, this factor will cancel.  It will therefore not be included to
            %begin with.
            if handles.numMedia==1
                hbot=0;
            else
                hbot=-cumsum(handles.hOverWL(1:handles.numMedia-1));
            end
            %Field arrows for components which propagate
            %The eta1 above is the RELATIVE eta1.  The actual eta1 is this multiplied
            %by eta0 (free space impedance) which is being cancelled as mentioned
            %above.
            xlima=get(handles.prismAxes,'xlim');
            dInc=0.1*(xlima(2)-xlima(1));
            %
            jj=0;
            %
            if app.FloqincwavesCheckBox.Value
                %More general: Multiple input waves along the Floquet
                %directions.
                if handles.isFloquet
                    thetaIncDegDim=handles.incAngDegFloqDraw;
                    nPropagatingWaves=length(thetaIncDegDim);
                    %We assume that the normal component PincMag of the Poynting vector
                    %is given for each of these nPropagatingWaves, so that they
                    %sum to unity. Also, the phase of the wave at x=y=0 is given in
                    %degrees as PincPhaseDeg. If they don't sum to unity, then
                    %normalize them so that they sum unity.
                    PincMag=handles.PincMagNorm;
                    if length(PincMag)~=nPropagatingWaves
                        msgbox('The incident waves must be redefined.')
                    else
                        %Get the E field magnitude from P=E*E*cos
                        Einc=sqrt(PincMag./cosd(thetaIncDegDim));
                        EorP=Einc;
                        if get(handles.powerCouplingEff,'Value')
                            %Instead of E,use P.
                            EorP=PincMag;
                        end
                        for ii=1:nPropagatingWaves
                            xArrowRefF=-EorP(ii)*arrowLength*sind(handles.incAngDegFloqDraw(ii));
                            yArrowRefF=EorP(ii)*arrowLength*cosd(handles.incAngDegFloqDraw(ii));
                            if EorP(ii)>.01
                                jj=jj+1;
                                p2(jj,:)=[0+dInc/2 0];
                                p1(jj,:)=[xArrowRefF+dInc/2 yArrowRefF];
                                aColor(jj)='k';
                            end
                        end
                    end
                end
            else
                jj=jj+1;
                xArrow=-arrowLength*sind(handles.incAngDeg);
                cosIncAngDeg=cosd(handles.incAngDeg);
                yArrow=arrowLength*cosIncAngDeg;
                %p1(jj,:)=[xArrow+dInc/2 yArrow];
                %p2(jj,:)=[0+dInc/2 0];
                p1(jj,:)=[xArrow+dInc yArrow];
                p2(jj,:)=[0+dInc 0];
                aColor(jj)='k';
            end
            %
            %
            %reflected wave
            if handles.isFloquet
                %Add the other Floquet reflected wave
                rhoFloqPropagating=handles.rhoFloq(handles.nPropagating);
                nPropagatingWaves=length(handles.incAngDegFloqDraw);
                for ii=1:nPropagatingWaves
                    rhoFloqPii=abs(rhoFloqPropagating(ii));
                    if get(handles.powerCouplingEff,'Value')
                        %Instead of rho,use eta.
                        rhoFloqPii=rhoFloqPii*rhoFloqPii*cosd(handles.incAngDegFloqDraw(ii))/cosIncAngDeg;
                    end
                    xArrowRefF=rhoFloqPii*arrowLength*sind(handles.incAngDegFloqDraw(ii));
                    yArrowRefF=rhoFloqPii*arrowLength*cosd(handles.incAngDegFloqDraw(ii));
                    if rhoFloqPii>.01
                        jj=jj+1;
                        p1(jj,:)=[0 0];
                        p2(jj,:)=[xArrowRefF yArrowRefF];
                        aColor(jj)='m';
                    end
                end
            else
                xArrowRef=abs(handles.rho)*arrowLength*sind(handles.incAngDeg);
                yArrowRef=abs(handles.rho)*arrowLength*cosd(handles.incAngDeg);
                if abs(handles.rho)>.01
                    jj=jj+1;
                    p1(jj,:)=[0 0];
                    p2(jj,:)=[xArrowRef yArrowRef];
                    aColor(jj)='r';
                end
            end
            %
            
            %
            %transmitted wave
            if handles.isFloquet && handles.isRefraction
                %Add the Floquet refracted waves
                tauFloqPropagating=handles.tauFloq(handles.nPropagating);
                nPropagatingWaves=length(handles.incAngDegFloqDraw);
                ysource=hbot(end);
                for ii=1:nPropagatingWaves
                    tauFloqPii=abs(tauFloqPropagating(ii));
                    if get(handles.powerCouplingEff,'Value')
                        %Instead of rho,use eta.
                        tauFloqPii=tauFloqPii*tauFloqPii*cosd(handles.incAngDegFloqDraw(ii))/cosIncAngDeg;
                    end
                    xArrowRefF=tauFloqPii*arrowLength*sind(handles.incAngDegFloqDraw(ii));
                    yArrowRefF=-tauFloqPii*arrowLength*cosd(handles.incAngDegFloqDraw(ii));
                    if tauFloqPii>.01
                        jj=jj+1;
                        p1(jj,:)=[0 ysource];
                        p2(jj,:)=[xArrowRefF ysource+yArrowRefF];
                        aColor(jj)='b';
                    end
                end
            end
            if abs(handles.tau)>.01 && ~handles.isFloquet
                if handles.numMedia==1
                    ii=1;
                    realBeta=real(handles.beta(ii));
                    if realBeta~=0
                        %This mode in region 2 is propagating
                        ang=atan(handles.alfa/realBeta);
                        mag=abs(handles.tau);
                        if mag>1.e-2
                            xArrow=mag*arrowLength*sin(ang);
                            yArrow=-mag*arrowLength*cos(ang);
                            ysource=hbot(end);
                            jj=jj+1;
                            p1(jj,:)=[0 ysource];
                            p2(jj,:)=[xArrow ysource+yArrow];
                            aColor(jj)='b';
                        end
                    end
                else
                    xArrowTrans=abs(handles.tau)*arrowLength*sind(handles.incAngDeg);
                    yArrowTrans=hbot(end)-abs(handles.tau)*arrowLength*cosd(handles.incAngDeg);
                    jj=jj+1;
                    p1(jj,:)=[0 hbot(end)];
                    p2(jj,:)=[xArrowTrans yArrowTrans];
                    aColor(jj)='b';
                end
            end
            %
            %
            %Plot the phase. We want to display phase by an arrow within a circle
            %pointing in the direction of the phase.  The problem is, to draw a circle
            %when the axis is not "equal".  Use the circular marker of a plot.
            %We want the markersize to be markerSize
            markerSize=30;
            %We want the center to be half that above 0.
            curunits = get(handles.prismAxes, 'Units');
            set(handles.prismAxes, 'Units', 'Points');
            cursizePoints = get(handles.prismAxes, 'Position');
            set(handles.prismAxes, 'Units', curunits);
            yUnitsPerPoint=(ylim(2)-ylim(1))/cursizePoints(4);
            xUnitsPerPoint=(xlim(2)-xlim(1))/cursizePoints(3);
            halfMarkerSize=fix(markerSize/2);
            yPhaseCenter=halfMarkerSize*yUnitsPerPoint;
            xPhaseCenter=-halfMarkerSize*xUnitsPerPoint-dInc;
            %Reflection coefficient
            if ishandle(handles.refPhaseCircle)
                delete(handles.refPhaseCircle)
            end
            hold(handles.prismAxes,'on')
            if ~handles.isFloquet
                if get(handles.arrowsCheckBox,'Value')
                    handles.refPhaseCircle=plot(handles.prismAxes,xPhaseCenter,yPhaseCenter,'or','markersize',markerSize);
                end
                %calculate the arrow within the circle
                angRad=angle(handles.rho);
                xend2=xPhaseCenter+xUnitsPerPoint*halfMarkerSize*cos(angRad);
                xend1=xPhaseCenter-xUnitsPerPoint*halfMarkerSize*cos(angRad);
                yend2=yPhaseCenter+yUnitsPerPoint*halfMarkerSize*sin(angRad);
                yend1=yPhaseCenter-yUnitsPerPoint*halfMarkerSize*sin(angRad);
                jj=jj+1;
                p1(jj,:)=[xend1 yend1];
                p2(jj,:)=[xend2 yend2];
                aColor(jj)='r';
            end
            %
            % if ishandle(handles.refPhaseCircleFloq)
            %     delete(handles.refPhaseCircleFloq)
            % end
            % if handles.isFloquet
            %     xPhaseCenterFloq=-halfMarkerSize*xUnitsPerPoint+2*dInc;
            %     handles.refPhaseCircleFloq=plot(handles.prismAxes,xPhaseCenterFloq,yPhaseCenter,'om','markersize',markerSize);
            %     angRad=angle(handles.rhoAnomReflec);
            %     xend2=xPhaseCenterFloq+xUnitsPerPoint*halfMarkerSize*cos(angRad);
            %     xend1=xPhaseCenterFloq-xUnitsPerPoint*halfMarkerSize*cos(angRad);
            %     yend2=yPhaseCenter+yUnitsPerPoint*halfMarkerSize*sin(angRad);
            %     yend1=yPhaseCenter-yUnitsPerPoint*halfMarkerSize*sin(angRad);
            %     jj=jj+1;
            %     p1(jj,:)=[xend1 yend1];
            %     p2(jj,:)=[xend2 yend2];
            %     aColor(jj)='m';
            % end
            %
            %transmission coefficient
            if ishandle(handles.transPhaseCircle)
                delete(handles.transPhaseCircle)
            end
            if ~handles.isFloquet
                if get(handles.arrowsCheckBox,'Value')
                    handles.transPhaseCircle=plot(handles.prismAxes,xPhaseCenter,hbot(end)-yPhaseCenter,'ob','markersize',markerSize);
                end
                %calculate the arrow within the circle
                angRad=angle(handles.tau);
                xend2=xPhaseCenter+xUnitsPerPoint*halfMarkerSize*cos(angRad);
                xend1=xPhaseCenter-xUnitsPerPoint*halfMarkerSize*cos(angRad);
                yend2=hbot(end)-yPhaseCenter+yUnitsPerPoint*halfMarkerSize*sin(angRad);
                yend1=hbot(end)-yPhaseCenter-yUnitsPerPoint*halfMarkerSize*sin(angRad);
                jj=jj+1;
                p1(jj,:)=[xend1 yend1];
                p2(jj,:)=[xend2 yend2];
                aColor(jj)='b';
            end
            hold(handles.prismAxes,'off')
            %
            %
            %Intermediate media
            %I believe the for loop is only executed handles.numMedia>0
            if false
            for ii=1:handles.numMedia-1
                h1=0;
                if ii>1
                    h1=hbot(ii-1);
                end
                ysource=(hbot(ii)+h1)/2;
                realBeta=real(handles.beta(ii));
                if realBeta~=0
                    %This mode in region 2 is propagating
                    ang=atan(handles.alfa/realBeta);
                    mag=abs(handles.sigmaA(ii));
                    %since we are at the top of the layer, the imaginary part
                    if mag>1.e-2
                        xArrow=mag*arrowLength*sin(ang);
                        yArrow=-mag*arrowLength*cos(ang);
                        jj=jj+1;
                        p1(jj,:)=[0 ysource];
                        p2(jj,:)=[xArrow ysource+yArrow];
                        aColor(jj)='b';
                    end
                    %There is also an upward wave in region 2
                    mag=abs(handles.sigmaB(ii));
                    if mag>1.e-2
                        xArrow=-mag*arrowLength*sin(ang);
                        yArrow=-mag*arrowLength*cos(ang);
                        jj=jj+1;
                        p2(jj,:)=[0 ysource];
                        p1(jj,:)=[xArrow ysource+yArrow];
                        aColor(jj)='b';
                    end
                end
            end
            end
            ColorOrder=aColor;
            %
            if get(handles.arrowsCheckBox,'Value')
                haxis111=handles.prismAxes;
                hold(haxis111,'on')
                haxis111.ColorOrderIndex = 1;
                %The above is necessary for matlab versions later than 2014a.
                %After a hold, it tells matlab to start plotting using the current
                %colororder.  Otherwise, it would continue plots from the plot of the
                %last color used in the order.
                if ishandle(handles.hIncArrow)
                    delete(handles.hIncArrow(:))  % Delete all handles in array
                end
                handles.hIncArrow=arrow3(p1,p2,'o');
                hold(haxis111,'off')
            end
        end
        
        function handles = prepareForCalculation(app, handles)
            % Prepare handles for physics calculation by applying coupling logic.
            % This must be called before runMain, whether in batch or interactive mode.
            % Separated from drawMedia to allow batch processing without graphics.
            handles = coupling(app, handles);
        end
        
        function handles = drawMedia(app, handles)
            % Always prepare for calculation first (needed for physics)
            handles = prepareForCalculation(app, handles);
            
            %Skip drawing when running in batch mode
            if isappdata(app.figure1,'BatchSuppressDraw') && getappdata(app.figure1,'BatchSuppressDraw')
                % Still need to run physics even when suppressing graphics
                handles = runMain(app, handles);
                return
            end
            %drawMedia draws the media and their boundaries on the axis prismAxes
            %
            xlim=get(handles.prismAxes,'xlim');
            ylim=get(handles.prismAxes,'ylim');
            %The above will only be used if axes are frozen.
            %The following is necessary because arrow3 changes this mode to manual.
            set(handles.prismAxes,'DataAspectRatioMode','auto')
            set(handles.prismAxes,'XLimMode','auto')
            %set(handles.prismAxes,'YLimMode','auto')
            set(handles.prismAxes,'ZLimMode','auto')
            set(handles.prismAxes,'CLimMode','auto')
            %
            %Delete the rectangles
            children=get(handles.prismAxes,'children');
            types=get(children,'type');
            itypes=find(strcmp(types,'rectangle'));
            delete(children(itypes))
            if ishandle(handles.hbdry)
                delete(handles.hbdry)
            end
            lengthhwire=length(handles.hwire);
            for ii=1:lengthhwire
                if ishandle(handles.hwire(ii))
                    delete(handles.hwire(ii))
                end
            end
            epsMax=10;
            d=handles.d;
            %
            if handles.isFloquet && handles.numMedia>1 ...
                    && get(handles.DisplayWaveImageCheckBox,'Value')...
                    %&& ~handles.isRefraction
                bdryy=-cumsum(handles.hOverWL(1:handles.numMedia-1));
                dy=abs(bdryy(end));
                %nPeriods=str2double(get(handles.NPeriodsHorizEdit,'String'));
                nPeriods=app.NoperiodsSpinner.Value;
                xExtent=nPeriods*d;
                yExtent=xExtent;
                if handles.isRefraction
                    yLimBot=-yExtent/2-dy/2;
                else
                    yLimBot=-dy;
                end
                %yLimTop=yExtent-dy;
                yLimTop=yLimBot+yExtent;
                set(handles.prismAxes,'YLim',[yLimBot yLimTop])
                set(handles.prismAxes,'XLim',[-xExtent/2 xExtent/2])
            else
                if handles.numMedia>1
                    bdryy=-cumsum(handles.hOverWL(1:handles.numMedia-1));
                    xExtent=2*abs(bdryy(end));
                    %Avoid case of xExtent=0;
                    xExtent=max(xExtent,0.001);
                else
                    %xExtent=2*handles.WL;
                    xExtent=2;
                end
                %xExtent=xExtent*8;  %***************
                yLimBot=-3*xExtent/4;
                %yLimBot=bdryy(end)*1.1;
                if ~get(handles.freezeAxisCheckBox,'value')
                    set(handles.prismAxes,'YLim',[yLimBot xExtent/4])
                    set(handles.prismAxes,'XLim',[-xExtent/2 xExtent/2])
                else
                    set(handles.prismAxes,'YLim',ylim)
                    set(handles.prismAxes,'XLim',xlim)
                    xExtent=xlim(2)-xlim(1);
                    xExtent=0.1;
                end
            end
            col='rgbcmyk';
            jj=0;
            ncolors=length(col);
            if handles.numMedia>1
                hold(handles.prismAxes,'on')
                handles.hwire=-ones(handles.numMedia-1,1);
                for ii=1:handles.numMedia-1
                    thick=handles.hOverWL(ii);
                    hbot=bdryy(ii);
                    %We want epsColor to be 1 when eps(ii)=1, and 0 when
                    %eps(ii)>=epsMax.
                    epsColor=1-(1-handles.eps(ii))/(1-epsMax);
                    if epsColor<0
                        epsColor=0;
                    end
                    %Make dielectric material shades of black
                    %ecolor=epsColor*[1 1 1];
                    %Make dielectric material shades of cyan
                    %ecolor=[0 1 1]+epsColor*([1 1 1]-[0 1 1]);
                    ecolor=[0 1 1]+epsColor*[1 0 0];
                    handles.hbdry(ii)=rectangle(handles.prismAxes,...
                        'Position',[-xExtent/2 hbot xExtent thick],...
                        'FaceColor',ecolor,'hittest','off');
                    if get(handles.metagratingCheckBox,'Value')
                        if handles.isWire(ii)==1
                            %draw wires
                            jj=jj+1;
                            if jj>ncolors
                                jj=1;
                            end
                            coljj=col(jj);
                            mm=5;
                            nn=-mm:mm;
                            dk=handles.wireHorizOffset(ii);
                            xwire=d*dk+nn'*d;
            %                 if dk>0.5
            %                     xwire=d*(dk-1);
            %                 end
                            ywire=hbot*ones(2*mm+1,1);
                            %handles.hwire(ii)=plot(handles.prismAxes,xwire,ywire,'ok','MarkerFaceColor','k');
                            handles.hwire(ii)=plot(handles.prismAxes,xwire,ywire,['o' coljj],'MarkerFaceColor',coljj);
                        else
                            handles.hwire(ii)=-1;
                        end
                    end
                end
                %And now color the bottom medium
                if ~get(handles.freezeAxisCheckBox,'value')
                    ii=handles.numMedia;
                    thick=hbot-yLimBot;
                    hbot=yLimBot;
                    epsColor=1-(1-handles.eps(ii))/(1-epsMax);
                    if epsColor<0
                        epsColor=0;
                    end
                    %ecolor=[1 1 epsColor];
                    %ecolor=epsColor*[1 1 1];
                    ecolor=[0 1 1]+epsColor*[1 0 0];
                    handles.hbdry(ii)=rectangle(handles.prismAxes,...
                        'Position',[-xExtent/2 hbot xExtent thick],...
                        'FaceColor',ecolor,...
                        'hittest','off');
                end
                hold(handles.prismAxes,'off')
            else
                hold(handles.prismAxes,'on')
                handles.hbdry(1)=plot(handles.prismAxes,[-xExtent/2 xExtent/2],[0 0],'k');
                hold(handles.prismAxes,'off')
            end
            %
            handles=runMain(app, handles);
            %The following statement was originally in runMain where
            %handles.modeNumberPropagating is defined.  But when that is
            %called by lsqnonlin, there is an error, probably because the
            %function called cannot change anything outside the call.
            %app.NomodesSpinner.Limits=[1 length(handles.modeNumberPropagating)];
            %The above was commented out because I don't think is gives me
            %anything.
            handles=drawWaves(app, handles);
            handles=drawIncArrow(app, handles);
        end
        
        function handles = drawWaves(app, handles)
            global dPhase
            % Skip drawing when running in batch mode
            if isappdata(app.figure1,'BatchSuppressDraw') && getappdata(app.figure1,'BatchSuppressDraw')
                return
            end
            if ~get(handles.DisplayWaveImageCheckBox,'value')
                return
            end
            xlim=get(handles.prismAxes,'XLim');
            ylim=get(handles.prismAxes,'YLim');
            % nWLx=0.5*(xlim(2)-xlim(1))/handles.WL;
            % nWLy=0.5*(ylim(2)-ylim(1))/handles.WL;
            % x1=-nWLx*handles.WL;
            % x2=-x1;
            %     y1=-nWLy*handles.WL;
            %     y2=-y1;
            %dx=handles.WL/handles.nPtsPerWL;
            x1=xlim(1);
            x2=xlim(2);
            dx=(x2-x1)/handles.nPtsPerWL;
            y1=ylim(1);
            y2=ylim(2);
            x=x1:dx:x2;
            y=y1:dx:y2;
            lengthx=length(x);
            lengthy=length(y);
            %[X,Y]=meshgrid(x,y);
            [X,Y]=meshgrid(x,y);
            %X=X*handles.WL;
            %Y=Y*handles.WL;
            %
            h=-cumsum(handles.hOverWL(1:handles.numMedia-1));
            h=[0;h];
            E=zeros(lengthy,lengthx);
            indyTop=0;
            nummed=handles.numMedia;
            %if nummed==2 && handles.isWire
            if nummed==2 && handles.isWire==1
                nummed=1;
            end
            for iy=nummed:-1:1
                indyBot=indyTop+1;
                indy=find(y<=h(iy));
                indyTop=indy(end);
                E(indyBot:indyTop,:)=getE(app, X(indyBot:indyTop,:),Y(indyBot:indyTop,:),handles,iy,h);
            end
            %And now the incident region
            indyBot=indyTop+1;
            indyTop=lengthy;
            E(indyBot:indyTop,:)=getE(app, X(indyBot:indyTop,:),Y(indyBot:indyTop,:),handles,0,h);
            
            expTimePhase=exp(-1i*handles.timePhase*pi/180);
            %I think that arrows3 louses up the clim property.  So reset it.
            set(handles.prismAxes,'CLim',[-2 2])
            ET=real(E*expTimePhase);
            rot=str2double(get(handles.rotationEdit,'String'));
            if rot~=0
                ET=imrotate(ET,rot);
            end
            %if ishandle(handles.hWaveImage)
            %    set(handles.hWaveImage,'CData',ET)
            %else
                % Delete old image handle before creating new one to prevent accumulation
                if ishandle(handles.hWaveImage)
                    delete(handles.hWaveImage);
                end
                hold(handles.prismAxes,'on')
                handles.hWaveImage=imagesc(x,y,ET,'parent',handles.prismAxes,'hittest','off');
                set(handles.prismAxes,'YDir','normal')
                hold(handles.prismAxes,'off')
            %     %Brind handles.hbdry to the top.
            %     hradarontop(handles.hbdry(1),1);
            %     if handles.isTwoMedia~=1
            %         hradarontop(handles.hbdry(2),1);
            %     end
            %end
            handles.E=E;
            isAnimateWaveCheckBox=get(handles.animateWaveCheckBox,'value');
            while isAnimateWaveCheckBox
                handles.timePhase=handles.timePhase+dPhase;
                if handles.timePhase>360
                    handles.timePhase=handles.timePhase-360;
                end
                expTimePhase=exp(-1i*handles.timePhase*pi/180);
                ET=real(E*expTimePhase);
                if rot~=0
                    ET=imrotate(ET,rot);
                end
                set(handles.hWaveImage,'CData',ET)
                set(handles.timephaseEdit,'String',num2str(handles.timePhase))
                drawnow
                %handlesOutside=guidata(handles.figure1);
                %isAnimateWaveCheckBox=get(handlesOutside.animateWaveCheckBox,'Value');
                isAnimateWaveCheckBox=get(handles.animateWaveCheckBox,'Value');
            end
        end
        
        function edit51_CreateFcn(app, hObject, eventdata, handles)
            % --- Executes during object creation, after setting all properties.
            
            % hObject    handle to edit51 (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    empty - handles not created until after all CreateFcns called
            
            % Hint: edit controls usually have a white background on Windows.
            %       See ISPC and COMPUTER.
            if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
                set(hObject,'BackgroundColor','white');
            end
        end
        
        function epsMuCheckBox_Callback(app, hObject, eventdata, handles)
            % --- Executes on button press in epsMuCheckBox.
            
            % hObject    handle to epsMuCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of epsMuCheckBox
            handles.isEpsEqualMu=get(hObject,'Value');
            %When drawMedia is not called, coupling (which is contained 
            % in drawMedia, must be considered anyway.
            handles=coupling(app,handles);
            handles=runMain(app, handles);
            handles=drawWaves(app, handles);
            handles=drawIncArrow(app, handles);
            guidata(hObject,handles);
        end
        
        function [Ez, Hx, Hy] = fieldComponents(app, x, y, alfa, beta, ampDown, ampUp)
            argExpnA=1i*(alfa*x-beta*y);
            argExpnB=1i*(alfa*x+beta*y);
            EzA=ampDown*exp(argExpnA);
            EzB=ampUp*exp(argExpnB);
            Ez=EzA+EzB;
            Hx=-beta*(EzA-EzB);
            Hy=-alfa*Ez;
        end
        
        function handles = fillInResults(app, handles)
            %Get the location of this number in the nVec array.
            %nn=find(handles.nVec==handles.nIndexResult);
            if ~get(handles.computeCheckBox,'Value')
                return
            end
            if get(handles.FloquetCheckBox,'Value')
                %The vector of the indices of the propagating wave modes is
                %handles.modeNumberPropagating.
                %The vector of the beam angles of these waves is
                %handles.incAngDegFloqDraw.
                %The vector of the indices of the target modes for which optimization
                %is performed is app.TGMpropModeNumber
                cosdInc=cosd(handles.incAngDeg);
                totalThick=sum(handles.hOverWL(1:handles.numMedia-1));
                set(handles.optimTotalThicknessText,'String',num2str(totalThick))
                set(handles.targetOptimAngle1text,'String','')
                set(handles.targetOptimEfficiency1Text,'String','')
                for ii=1:length(handles.modesForOptimization)
                    if ~isnan(handles.modesForOptimization(ii))
                        %Get the index of handles.modeNumberPropagating that corresponds to
                        %the mode for optimization
                        indx=find(handles.modeNumberPropagating==handles.modesForOptimization(ii));
                        if isempty(indx)
                            %The number of propagating modes has been changed, and they
                            %don't correspond to those listed in the "optimization for target modes"
                            %panel. So change it in the panel.
                            switch ii
                                case 1
                                    %set(handles.targetOptimMode1Edit,'String','0')
                                    app.targetOptimModeSpinner.Value=0;
                                % case 2
                                %     set(handles.targetOptimMode2Edit,'String','0')
                                % case 3
                                %     set(handles.targetOptimMode3Edit,'String','0')
                            end
                            handles.modesForOptimization(ii)=0;
                            %It could be that TGMpropModeNumber is not yet
                            %defined.  In that, use 0 - mode.
                            if isempty(app.TGMpropModeNumber)
                                indx=find(handles.modeNumberPropagating==0);
                            else    
                                indx=find(handles.modeNumberPropagating==app.TGMpropModeNumber(ii));
                            end
                        end
                        beamAngle=handles.incAngDegFloqDraw(indx);
                        if abs(beamAngle)<1.e-2
                            beamAngle=0;
                        end
                        optFac=cosd(beamAngle)/cosdInc;
                        %if handles.isRefraction  Changed by swm 6/6/2023.
                        if ~get(handles.optimizeReflectionCheckBox,'Value')
                            tauFloqPropagating=handles.tauFloq(handles.nPropagating);
                            tauOptimize=abs(tauFloqPropagating(indx));
                            eff=tauOptimize*tauOptimize*optFac;
                        else
                            rhoFloqPropagating=handles.rhoFloq(handles.nPropagating);
                            rhoOptimize=abs(rhoFloqPropagating(indx));
                            eff=rhoOptimize*rhoOptimize*optFac;
                        end
                        %Write the results
                        switch ii
                            case 1
                                set(handles.targetOptimAngle1text,'String',num2str(beamAngle))
                                set(handles.targetOptimEfficiency1Text,'String',num2str(eff,4))
                                optFacDim=cosd(handles.incAngDegFloqDraw')/cosdInc;
                                rhoFloqPropagating=abs(handles.rhoFloq(handles.nPropagating));
                                totalReflectedPower=sum(rhoFloqPropagating.*rhoFloqPropagating.*optFacDim);
                                tauFloqPropagating=abs(handles.tauFloq(handles.nPropagating));
                                totalTransmittedPower=sum(tauFloqPropagating.*tauFloqPropagating.*optFacDim);
                                app.reflectedPowerLabel.Text=num2str(totalReflectedPower);
                                app.transmittedPowerLabel.Text=num2str(totalTransmittedPower);
                            % case 2
                            %     set(handles.targetOptimAngle2text,'String',num2str(beamAngle))
                            %     set(handles.targetOptimEfficiency2Text,'String',num2str(eff,4))
                            % case 3
                            %     set(handles.targetOptimAngle3text,'String',num2str(beamAngle))
                            %     set(handles.targetOptimEfficiency3Text,'String',num2str(eff,4))
                        end
                    end
                end
            
            
            %     if length(handles.incAngDegFloqDraw)>=2
            %         %Fill in optimization params.
            %         if get(handles.m1FloqModeToOptimize,'Value')
            %             iMax=1;
            %         end
            %         if get(handles.zeroFloqModeToOptimize,'Value')
            %             iMax=2;
            %         end
            %         if get(handles.p1FloqModeToOptimize,'Value')
            %             iMax=3;
            %         end
            %         cosdInc=cosd(handles.incAngDeg);
            %         optFac=cosd(handles.incAngDegFloqDraw(iMax))/cosdInc;
            %         if handles.isRefraction
            %             tauFloqPropagating=handles.tauFloq(handles.nPropagating);
            %             tauOptimize=abs(tauFloqPropagating(iMax));
            %             eff=tauOptimize*tauOptimize*optFac;
            %         else
            %             rhoFloqPropagating=handles.rhoFloq(handles.nPropagating);
            %             rhoOptimize=abs(rhoFloqPropagating(iMax));
            %             eff=rhoOptimize*rhoOptimize*optFac;
            %         end
            %         totalThick=sum(handles.hOverWL(1:handles.numMedia-1));
            %         set(handles.optimTotalThicknessText,'String',num2str(totalThick))
            %         set(handles.optimEfficiencyText,'String',num2str(eff))
            %     end
            end
            %handles.singleWaveDisplay=nn;
            %Start filling in the results
            %rho
            set(handles.rhoAbsText,'String',num2str(abs(handles.rho)))
            set(handles.rhoPhaseText,'String',num2str(angle(handles.rho)*180/pi))
            %tau
            set(handles.tauAbsText,'String',num2str(abs(handles.tau)))
            set(handles.tauPhaseText,'String',num2str(angle(handles.tau)*180/pi))
            thet=handles.incAngDeg;
            angleString=num2str(-thet);
            set(handles.rhoAngleText,'String',angleString)
            angleString=' ';
            if imag(handles.beta(handles.numMedia))==0
                thet=atan(handles.alfa/handles.beta(handles.numMedia));
                angleString=num2str(thet*180/pi);
            end
            set(handles.tauAngleText,'String',angleString)
            
            %sigmaA, sigmaB
            nn=handles.mediumNumber;
            
            if nn<handles.numMedia
                if ~isempty(handles.sigmaA)
                    set(handles.sigAAbsText,'String',num2str(abs(handles.sigmaA(nn))))
                    set(handles.sigAPhaseText,'String',num2str(angle(handles.sigmaA(nn))*180/pi))
                end
                angleStringA=' ';
                angleStringB=' ';
                %if imag(handles.beta2(nn))==0
                realBeta=real(handles.beta(nn));
                if realBeta~=0
                    thet=atan(handles.alfa/realBeta);
                    angleStringA=num2str(thet*180/pi);
                    angleStringB=num2str(-thet*180/pi);
                end
                if ~isempty(handles.sigmaA)
                    set(handles.sigAAngleText,'String',angleStringA)
                    set(handles.sigBAbsText,'String',num2str(abs(handles.sigmaB(nn))))
                    set(handles.sigBPhaseText,'String',num2str(angle(handles.sigmaB(nn))*180/pi))
                    set(handles.sigBAngleText,'String',angleStringB)
                end
            else
                set(handles.sigAAbsText,'String',' ')
                set(handles.sigAPhaseText,'String',' ')
                set(handles.sigAAngleText,'String',' ')
                set(handles.sigBAbsText,'String',' ')
                set(handles.sigBPhaseText,'String',' ')
                set(handles.sigBAngleText,'String',' ')
            end
        end
        
        function f = fsolveFun1(app, x)
            global ghandles tauTarget
            f=zeros(2,1);
            handles=ghandles;
            %handles.hOverWL(1:handles.numMedia-1)=x;   %3 independent variables
            handles.hOverWL(1:2,1)=x;                  %2 independent variables
            handles.hOverWL(3,1)=handles.hOverWL(1);   %2 independent variables
            %handles=drawMedia(handles);
            %When drawMedia is not called, coupling (which is contained 
            % in drawMedia, must be considered anyway.
            handles=coupling(app,handles);
            handles=runMain(app, handles);
            %
            fc=handles.tau-tauTarget;
            f(1)=real(fc);
            f(2)=imag(fc);
        end
        
        function f = fsolveFun2(app, x)
            global ghandles
            global cosIncAngDeg rTarget
            f=zeros(2,1);
            handles=ghandles;
            handles.hOverWL(1:2,1)=x;                  %2 independent variables
            handles.hOverWL(3,1)=handles.hOverWL(1);   %2 independent variables
            %handles=drawMedia(handles);
            %When drawMedia is not called, coupling (which is contained 
            % in drawMedia, must be considered anyway.
            handles=coupling(app,handles);
            handles=runMain(app, handles);
            %
            f(1)=abs(handles.rho)-rTarget;
            k=2*pi;
            thick=handles.hOverWL(1)+handles.hOverWL(2)+handles.hOverWL(3);
            f(2)=angle(handles.tau)+k*cosIncAngDeg*thick-angle(handles.rho);
            %f(2) should be between -pi and pi.
            if f(2)>pi
                f(2)=f(2)-2*pi;
            end
            if f(2)<-pi
                f(2)=f(2)+2*pi;
            end
            %Normalize the result
            f(2)=f(2)/pi;
        end
        
        function f = fsolveFun3(app, x)
            global ghandles
            global cosIncAngDeg rTarget
            f=zeros(3,1);
            handles=ghandles;
            handles.hOverWL(1:3,1)=x;                  %2 independent variables
            %handles=drawMedia(handles);
            %When drawMedia is not called, coupling (which is contained 
            % in drawMedia, must be considered anyway.
            handles=coupling(app,handles);
            handles=runMain(app, handles);
            %
            f(1)=abs(handles.rho)-rTarget;
            k=2*pi;
            thick=handles.hOverWL(1)+handles.hOverWL(2)+handles.hOverWL(3);
            freeSpacePhase=k*cosIncAngDeg*thick;
            tauPhase=angle(handles.tau);
            rhoPhase=angle(handles.rho);
            %f(2)=tauPhase+freeSpacePhase-rhoPhase-pi;
            %f(2)=2*(tauPhase+freeSpacePhase)-rhoPhase-pi;
            f(2)=2*(tauPhase+freeSpacePhase)-rhoPhase;
            %f(2) should be between -pi and pi.
            if f(2)>pi
                f(2)=f(2)-2*pi;
            end
            if f(2)<-pi
                f(2)=f(2)+2*pi;
            end
            %Normalize the result
            f(2)=f(2)/pi;
            %Since the same number of conditions is required as the number of
            %variables, set up a dummy:
            f(3)=0;
        end
        
        function F = fullHanKelSum(app, k, km, d, x)
            km2=km*km;
            G=0;
            jj=0;
            N=50;
            Gdim=zeros(2*N+1,1);
            q=0;
            kxq=2*pi*q/d;
            kyq=km*sqrt(1-kxq*kxq/km2);
            ekxq=exp(1i*kxq*x);
            G=G+ekxq/kyq;
            jj=jj+1;
            Gdim(jj)=G;
            for qq=1:N
                q=qq;
                kxq=2*pi*q/d;
                kyq=km*sqrt(1-kxq*kxq/km2);
                ekxq=exp(1i*kxq*x);
                G=G+ekxq/kyq;
                jj=jj+1;
                Gdim(jj)=G;
                q=-qq;
                kxq=2*pi*q/d;
                kyq=km*sqrt(1-kxq*kxq/km2);
                ekxq=exp(1i*kxq*x);
                G=G+ekxq/kyq;
                jj=jj+1;
                Gdim(jj)=G;
            end
            eta=376.730313668;
            F=-(k*eta/2*d)*mean(Gdim(N:2*N+1));
        end
        
        function E = getE(app, x, y, handles, iy, h)
            %iy is the region number (0 is uppermost).
            %h(i) is the y-location of the ith interface. h(1)=0, h(2)=-(width of
            %topmost layer), ...
            incidentOnly=get(handles.incidentWaveOnlyCheckBox,'Value');
            isWithoutIncidentWave=get(handles.withoutIncidentWaveCheckBox,'Value');
            isFloquet=get(handles.FloquetCheckBox,'Value');
            E=zeros(size(x));
            if iy==0
                %Incidence region
                k0=handles.k0;
                if ~incidentOnly
                    if get(handles.upwardRadioButton,'Value') || get(handles.bothRadioButton,'Value')
                        %Reflected wave
                        if isFloquet
                            for n=1:length(handles.alfaFloq)
                                argExpn=1i*(handles.alfaFloq(n)*x+handles.betaFloq(1,n)*y);
                                E=E+handles.rhoFloq(n)*exp(argExpn);
                            end
                        else
                            beta0=k0*sqrt(1-handles.alfa*handles.alfa/(k0*k0));
                            argExpn=1i*(handles.alfa*x+beta0*y);
                            E=handles.rho*exp(argExpn);
                        end
                    end
                end
                %Incident wave Einc
                if app.FloqincwavesCheckBox.Value
                    %Incident waves are given externally.
                    npropWaves=length(handles.incAngDegFloqDraw);
                    incAngDegFloq=handles.incAngDegFloq;
                    isPropagating=~isnan(incAngDegFloq);
                    nPropagating=find(isPropagating);
                    EincComplex=handles.EincComplexFull(nPropagating);
                    sinTheta=sind(handles.incAngDegFloqDraw);
                    cosTheta=cosd(handles.incAngDegFloqDraw);
                    Einc=zeros(size(x));
                    for ii=1:npropWaves
                        argExp=1i*k0*(x*sinTheta(ii)-y*cosTheta(ii));
                        Einc=Einc+EincComplex(ii)*exp(argExp);
                    end
                else
                    sinTheta=sind(handles.incAngDeg);
                    cosTheta=cosd(handles.incAngDeg);
                    argExp=1i*k0*(x*sinTheta-y*cosTheta);
                    Einc=exp(argExp);
                end
                if incidentOnly
                    E=Einc;
                else
                    if isWithoutIncidentWave
                        Einc=0;
                    end
                    E=E+Einc;
                end
            else
                if isFloquet
                    %if iy~=handles.numMedia
                    %Changed to consider the possibility of the configuration
                    %consisting only of a single wire array.
                    if iy~=handles.numMedia && ~isempty(handles.sigmaAFloq)
                        %Get the downward wave
                        if get(handles.downwardRadioButton,'Value') || get(handles.bothRadioButton,'Value')
                            for n=1:length(handles.alfaFloq)
                                %argExpn=1i*(handles.alfaFloq(n)*x-handles.betaFloq(iy+1,n)*y);
                                argExpn=1i*(handles.alfaFloq(n)*x-handles.betaFloq(iy+1,n)*(y-h(iy+1)));
                                E=E+handles.sigmaAFloq(iy,n)*exp(argExpn);
                            end
                        end
                        %Get the upward wave
                        if get(handles.upwardRadioButton,'Value') || get(handles.bothRadioButton,'Value')
                            for n=1:length(handles.alfaFloq)
                                %argExpn=1i*(handles.alfaFloq(n)*x+handles.betaFloq(iy+1,n)*y);
                                argExpn=1i*(handles.alfaFloq(n)*x+handles.betaFloq(iy+1,n)*(y-h(iy+1)));
                                E=E+handles.sigmaBFloq(iy,n)*exp(argExpn);
                            end
                        end
                    elseif handles.isRefraction
                        %Get the downward wave in lowest region
                        if get(handles.downwardRadioButton,'Value') || get(handles.bothRadioButton,'Value')
                            for n=1:length(handles.alfaFloq)
                                %argExpn=1i*(handles.alfaFloq(n)*x-handles.betaFloq(iy+1,n)*y);
                                argExpn=1i*(handles.alfaFloq(n)*x-handles.betaFloq(1,n)*(y-h(iy)));
                                E=E+handles.tauFloq(n)*exp(argExpn);
                            end
                        end
            %             if handles.isWire(1) && iy==1
            %                 %When the first level is a wire array, then in the region
            %                 %below it, the incident wave Einc should be added.
            %                 sinTheta=sind(handles.incAngDeg);
            %                 cosTheta=cosd(handles.incAngDeg);
            %                 argExp=1i*handles.k0*(x*sinTheta-y*cosTheta);
            %                 Einc=exp(argExp);
            %                 if incidentOnly
            %                     E=Einc;
            %                 else
            %                     if isWithoutIncidentWave
            %                         Einc=0;
            %                     end
            %                     E=E+Einc;
            %                 end
            %             end
                    end
                else
                    if iy~=handles.numMedia
                        %Get the downward wave
                        if get(handles.downwardRadioButton,'Value') || get(handles.bothRadioButton,'Value')
                            argExpnA=1i*(handles.alfa*x-handles.beta(iy)*y);
                            E=E+handles.sigmaA(iy)*exp(argExpnA);
                        end
                        %Get the upward wave
                        if get(handles.upwardRadioButton,'Value') || get(handles.bothRadioButton,'Value')
                            argExpnB=1i*(handles.alfa*x+handles.beta(iy)*y);
                            E=E+handles.sigmaB(iy)*exp(argExpnB);
                        end
                    else
                        %We are in last medium.  Get downward wave there.
                        if get(handles.downwardRadioButton,'Value') || get(handles.bothRadioButton,'Value')
                            argExpnA=1i*(handles.alfa*x-handles.beta(iy)*y);
                            E=E+handles.tau*exp(argExpnA);
                        end
                    end
                end
            end
        end
        
        function E1 = getE1(app, x, y, handles)
            %getE1 computes the the field in the upper region at the points (x,y).
            incidentOnly=get(handles.incidentWaveOnlyCheckBox,'Value');
            if ~incidentOnly
                if get(handles.singleWaveDisplayCheckBox,'Value')
                    if get(handles.upwardRadioButton,'Value') || get(handles.bothRadioButton,'Value')
                        ii=handles.singleWaveDisplay;
                        argExpn=1i*(handles.alfa(ii)*x+handles.beta1(ii)*y);
                        E1=handles.rho(ii)*exp(argExpn);
                    else
                        E1=0;
                    end
                    return
                end
            end
            %Incident wave Einc
            sinTheta=sind(handles.incAngDeg);
            cosTheta=cosd(handles.incAngDeg);
            k1=handles.k1;
            argExp=1i*k1*(x*sinTheta-y*cosTheta);
            Einc=exp(argExp);
            if incidentOnly
                E1=Einc;
                return
            end
            %Einc=0;
            %Reflected wave Eref;
            %Eref=0;
            ErefPropagating=0;
            ErefEvanescent=0;
            for ii=1:handles.mediumNumber
                argExpn=1i*(handles.alfa(ii)*x+handles.beta1(ii)*y);
                if imag(handles.beta1(ii))==0
                    ErefPropagating=ErefPropagating+handles.rho(ii)*exp(argExpn);
                else
                    ErefEvanescent=ErefEvanescent+handles.rho(ii)*exp(argExpn);
                end
                %Eref=Eref+handles.rho(ii)*exp(argExpn);
            end
            if get(handles.allWavesRadioButton,'Value')
                E1=Einc+ErefPropagating+ErefEvanescent;
            else
                if get(handles.propagatingWavesRadioButton,'Value')
                    E1=Einc+ErefPropagating;
                else
                    %Evanescent waves
                    E1=ErefEvanescent;
                end
            end
        end
        
        function E2 = getE2(app, x, y, handles)
            %getE2 computes the the field in the lower region at the points (x,y).
            %Transmitted wave Etrans=E2
            %E2=0;
            if handles.isTwoMedia==1
                if get(handles.singleWaveDisplayCheckBox,'Value')
                    ii=handles.singleWaveDisplay;
                    E2=0;
                    argExpnA=1i*(handles.alfa(ii)*x-handles.beta2(ii)*y);
                    E2=E2+handles.sigmaA(ii)*exp(argExpnA);
                    return
                end
                EtransPropagating=0;
                EtransEvanescent=0;
                for ii=1:handles.mediumNumber
                    argExpnA=1i*(handles.alfa(ii)*x-handles.beta2(ii)*y);
                    %if imag(handles.beta2(ii))==0
                    if real(handles.beta2(ii))~=0
                        EtransPropagating=EtransPropagating+handles.sigmaA(ii)*exp(argExpnA);
                    else
                        EtransEvanescent=EtransEvanescent+handles.sigmaA(ii)*exp(argExpnA);
                    end
                end
            else
                if get(handles.singleWaveDisplayCheckBox,'Value')
                    ii=handles.singleWaveDisplay;
                    E2=0;
                    if get(handles.upwardRadioButton,'Value') || get(handles.bothRadioButton,'Value')
                        argExpnB=1i*(handles.alfa(ii)*x+handles.beta2(ii)*y);
                        E2=E2+handles.sigmaB(ii)*exp(argExpnB);
                    end
                    if get(handles.downwardRadioButton,'Value') || get(handles.bothRadioButton,'Value')
                        argExpnA=1i*(handles.alfa(ii)*x-handles.beta2(ii)*y);
                        E2=E2+handles.sigmaA(ii)*exp(argExpnA);
                    end
                    %argExpnA=1i*(handles.alfa(ii)*x-handles.beta2(ii)*y);
                    %argExpnB=1i*(handles.alfa(ii)*x+handles.beta2(ii)*y);
                    %E2=handles.sigmaA(ii)*exp(argExpnA)+handles.sigmaB(ii)*exp(argExpnB);
                    return
                end
                EtransPropagating=0;
                EtransEvanescent=0;
                for ii=1:handles.mediumNumber
                    argExpnA=1i*(handles.alfa(ii)*x-handles.beta2(ii)*y);
                    argExpnB=1i*(handles.alfa(ii)*x+handles.beta2(ii)*y);
                    %if imag(handles.beta2(ii))==0
                    if real(handles.beta2(ii))~=0
                        EtransPropagating=EtransPropagating+handles.sigmaA(ii)*exp(argExpnA)+handles.sigmaB(ii)*exp(argExpnB);
                    else
                        EtransEvanescent=EtransEvanescent+handles.sigmaA(ii)*exp(argExpnA)+handles.sigmaB(ii)*exp(argExpnB);
                    end
                end
            end
            if get(handles.allWavesRadioButton,'Value')
                E2=EtransPropagating+EtransEvanescent;
            else
                if get(handles.propagatingWavesRadioButton,'Value')
                    E2=EtransPropagating;
                else
                    %Evanescent waves
                    E2=EtransEvanescent;
                end
            end
        end
        
        function E3 = getE3(app, x, y, handles)
            %getE3 computes the the field in the lower region at the points (x,y).
            %Transmitted wave Etrans=E3
            if handles.isTwoMedia==-1
                %Conductor region, field vanishes
                E3=zeros(size(x));
                return
            end
            if get(handles.singleWaveDisplayCheckBox,'Value')
                if get(handles.downwardRadioButton,'Value') || get(handles.bothRadioButton,'Value')
                    ii=handles.singleWaveDisplay;
                    argExpn=1i*(handles.alfa(ii)*x-handles.beta3(ii)*y);
                    E3=handles.tau(ii)*exp(argExpn);
                else
                    E3=0;
                end
                return
            end
            EtransPropagating=0;
            EtransEvanescent=0;
            for ii=1:handles.mediumNumber
                argExpn=1i*(handles.alfa(ii)*x-handles.beta3(ii)*y);
                if imag(handles.beta3(ii))==0
                    EtransPropagating=EtransPropagating+handles.tau(ii)*exp(argExpn);
                else
                    EtransEvanescent=EtransEvanescent+handles.tau(ii)*exp(argExpn);
                end
                %E2=E2+handles.tau(ii)*exp(argExpn);
            end
            if get(handles.allWavesRadioButton,'Value')
                E3=EtransPropagating+EtransEvanescent;
            else
                if get(handles.propagatingWavesRadioButton,'Value')
                    E3=EtransPropagating;
                else
                    %Evanescent waves
                    E3=EtransEvanescent;
                end
            end
        end
        
        function handles = getModesForOptimization(app, handles)
            %This routine scans the information in the toggleButtonGroup "Optimization for Target Modes"
            %Look at each entry for the target mode number.
            handles.modesForOptimization=NaN(1,3);
            %
            val=app.targetOptimModeSpinner.Value;
            %The entry must be one of the propagating modes
            indPM=find(handles.modeNumberPropagating==val);
            if isempty(indPM)
                msgbox('The number entered must be a propagating mode.')
                return
            end
            handles.modesForOptimization(1)=val;
        end
        
        function handles = getRealZTilde(app, handles)
            handles.realZtilde=0;   %PEC default
            eta=376.73;
            %Other possibilities.
            %These are based on the approximate calculations mentioned in the
            %"Unveiling" paper, around Eq. (24). Also based on analysis described in
            %mg9.docx around Eq. (211). This is not really real(ztilde), but a
            %parameter required in its calculation. Namely deltaR0*lambda^(-5/2),
            %lambda is actual in meters, and not unit length. In mgGAMMA, this will be
            %utilized.
            if get(handles.copperWireRadioButton,'Value') || get(handles.aluminumWireRadioButton,'Value')
                f=str2double(get(handles.lossFreqEdit,'String'));  %GHz
                lambda=.2997925/f;  %meters
                wmil=str2double(get(handles.wireWidthMilEdit,'String'));
                w=25.4e-6*wmil;   %meters
                mu0=pi*4.e-7;
                c=2.997925e8;
                sqrtFac=sqrt(4*mu0*c/pi);
            %    sqrtFac=sqrt(4*mu0*c/(pi*eta*eta));
            %    sqrtFac=0.058135333424153;
                if get(handles.copperWireRadioButton,'Value')
                    sigma=58.e6;
                else
                    %aluminum
                    sigma=35.38e6;
                end
                %delR0=sqrtFac/(eta*w*sqrt(sigma));
                %handles.realZtilde=delR0*lambda^(-3/2);
                %handles.realZtilde=delR0*lambda^(1/2);
                delRtilde=sqrtFac/(w*sqrt(sigma));
                empiricalFactor=0.02;
                handles.realZtilde=empiricalFactor*delRtilde/sqrt(lambda);
            end
            app.realZLabel.Text=num2str(handles.realZtilde*handles.WL/eta,3);
            %
            % if get(handles.copperWireRadioButton,'Value')
            %     %The reference value is .0145 for freq=20 GHz, w=3 mil.
            %     %The factor eta/lambda will be factored later.
            %     %The formula for copper is
            %     %z=0.165/[w*sqrt(f)]
            %     zref=0.0145;
            %     fref=20;
            %     wref=3;
            %     f=str2double(get(handles.lossFreqEdit,'String'));
            %     w=str2double(get(handles.wireWidthMilEdit,'String'));
            %     handles.realZtilde=zref*(wref/w)*sqrt(fref/f);
            % end
            for ii=1:handles.numMedia-1
                handles=mgGAMMA(app, handles,ii);
            end
        end
        
        
        
        function f = getWireOffsetFun(app, x, ii, MI, EF)
            global ghandles iMax isBeamSplit
            handles=ghandles;
            handles.wireHorizOffset(1,1:handles.numMedia-1)=x;
            if ii>0
                handles=mgGAMMA(app, handles,ii);
            end
            %When drawMedia is not called, coupling (which is contained 
            % in drawMedia, must be considered anyway.
            handles=coupling(app,handles);
            handles=runMain(app, handles);
            %
            %We want abs(handles.rhoFloq(3)) to be max.
            %The size of incAngDegFloq is greater than 3 because of NaN terms at end.
            %So use 1 more than the center term.
            %icen=fix(length(handles.incAngDegFloq)/2)+1;
            %f=(abs(handles.rhoFloq(3)))^2*cosd(handles.incAngDegFloq(icen+1));
            if handles.isRefraction && ~get(handles.optimizeReflectionCheckBox,'Value')
                taurhoFloqPropagating=handles.tauFloq(handles.nPropagating);
            else
                taurhoFloqPropagating=handles.rhoFloq(handles.nPropagating);
            end
            %
            %The vector of the indices of the propagating wave modes is
            %handles.modeNumberPropagating.
            %The vector of the indices of the target modes for which optimization
            %is performed is handles.modesForOptimization
            %For now, get the first legitimate entry of handles.modesForOptimization.
            %Later, we will use more than one.
            % for ii=1:length(handles.modesForOptimization)
            %     if ~isnan(handles.modesForOptimization(ii))
            %         modeForOptimization=handles.modesForOptimization(ii);
            %         break
            %     end
            % end
            % indx=find(handles.modeNumberPropagating==modeForOptimization);
            % f=abs(taurhoFloqPropagating(indx));
            % if modeForOptimization==0 && isBeamSplit
            f=abs(taurhoFloqPropagating(MI));
            f=f*f*EF;
            if isBeamSplit
            %f=abs(taurhoFloqPropagating(iMax));
            %if iMax==2 && isBeamSplit
                %changed 6 jan 2022.
                icen=fix(length(handles.incAngDegFloq)/2)+1;
                fm1=(abs(taurhoFloqPropagating(1)))^2*cosd(handles.incAngDegFloq(icen-1));
                f1=(abs(taurhoFloqPropagating(3)))^2*cosd(handles.incAngDegFloq(icen+1));
                %The following is without losses
                fm1a=abs(fm1-0.5);
                f1a=abs(f1-0.5);
                %The following is with losses.  I guess it should depend on the amount
                %of losses.  0.4 worked.  Higher, didn't.
                fm1a=abs(fm1-0.41);
                f1a=abs(f1-0.41);
                %
                f=sqrt(1-f*f-fm1a-f1a);
            %      fdif=abs(f1-fm1);
            %      if fdif>0.05
            %          %If the difference  between fm1 and f1 is not small, then make f
            %          %a number that will not be considered.
            %          f=0;
            %      end
                return
                f=sqrt(1-f*f);
            %     %For the 0 mode, we want to minimize (not maximize). Also, we want the
            %     %other two to be equal.
                 fm1=abs(taurhoFloqPropagating(1));
                 f1=abs(taurhoFloqPropagating(3));
                 fdif=abs(f1-fm1);
                 if fdif>0.1
                     %If the difference  between fm1 and f1 is not small, then make f
                     %a number that will not be considered.
                     f=0;
                 end
            end
        end
        
        function incAngDegEdit_Callback(app, hObject, eventdata, handles)
            % hObject    handle to incAngDegEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of incAngDegEdit as text
            %        str2double(get(hObject,'String')) returns contents of incAngDegEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String',num2str(handles.incAngDeg));
            else
                handles.incAngDeg=val;
                %When drawMedia is not called, coupling (which is contained 
                % in drawMedia, must be considered anyway.
                handles=coupling(app,handles);
                handles=runMain(app, handles);
                handles=drawWaves(app, handles);
                handles=drawIncArrow(app, handles);
                guidata(hObject,handles);
            end
        end
        
        function incAngDegEdit_CreateFcn(app, hObject, eventdata, handles)
            % --- Executes during object creation, after setting all properties.
            
            % hObject    handle to incAngDegEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    empty - handles not created until after all CreateFcns called
            
            % Hint: edit controls usually have a white background on Windows.
            %       See ISPC and COMPUTER.
            if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
                set(hObject,'BackgroundColor','white');
            end
        end
        
        function handles = insertLayerBelow(app, handles)
            mnum=handles.mediumNumber;
            %We want to add a layer with index mnum+1;
            %We must re-number all layers, from mnum+2 to the highest index, to one index greater.
            %
            %Increase the number of media
            handles.numMedia=handles.numMedia+1;
            jj=handles.numMedia;
            for ii=mnum+2:handles.numMedia-1
                jj=jj-1;
                handles.eps(jj)=handles.eps(jj-1);
                handles.n(jj)=handles.n(jj-1);
                handles.conductivity(jj)=handles.conductivity(jj-1);
                handles.hOverWL(jj,1)=handles.hOverWL(jj-1);
                handles.mu(jj)=handles.mu(jj-1);
                handles.includeInOptim(jj,1)=handles.includeInOptim(jj-1,1);
                handles.isWire(jj)=handles.isWire(jj-1);
                handles.wireDistImped(jj)=handles.wireDistImped(jj-1);
                handles.wireHorizOffset(jj)=handles.wireHorizOffset(jj-1);
                handles.wireStripWidth(jj)=handles.wireStripWidth(jj-1);
                handles.GAMMAMGReflect(:,:,jj)=handles.GAMMAMGReflect(:,:,jj-1);
                handles.inductDiff(jj)=handles.inductDiff(jj-1,1);
                handles.GAMMAMGTransmit(:,:,jj)=handles.GAMMAMGTransmit(:,:,jj-1);
            
            end
            %Add and define the inserted layer
            jj=jj-1;
            handles.eps(jj)=1;
            handles.n(jj)=1;
            handles.conductivity(jj)=0;
            handles.hOverWL(jj,1)=handles.hOverWL(jj-1);
            handles.mu(jj)=1;
            handles.includeInOptim(jj,1)=1;
            handles.isWire(jj)=0;
            handles.wireDistImped(jj)=0;
            handles.wireHorizOffset(jj)=0;
            handles.wireStripWidth(jj)=0.00677;
            handles.GAMMAMGReflect(:,:,jj)=NaN;
            handles.GAMMAMGTransmit(:,:,jj)=NaN;
            handles.inductDiff(jj,1)=0;
            handles.mediumNumber=jj;
            %Redefine the vectors. Some don't include the last medium which is air.
            %Define the air medium for those that do.
            handles.eps=[handles.eps(1:handles.numMedia-1);1];
            handles.n=[handles.n(1:handles.numMedia-1);1];
            handles.conductivity=[handles.conductivity(1:handles.numMedia-1);0];
            handles.mu=[handles.mu(1:handles.numMedia-1);1];
            %The above includes the air medium at end. The following 2 doe't.
            handles.hOverWL=handles.hOverWL(1:handles.numMedia-1,1);
            handles.includeInOptim=handles.includeInOptim(1:handles.numMedia-1);
            handles.isWire=handles.isWire(1:handles.numMedia-1);
            handles.wireDistImped=handles.wireDistImped(1:handles.numMedia-1);
            handles.wireHorizOffset=handles.wireHorizOffset(1:handles.numMedia-1);
            handles.distCoupledTo=zeros(size(handles.wireHorizOffset(1:handles.numMedia-1)));
            handles.wireStripWidth=handles.wireStripWidth(1:handles.numMedia-1);
            %
            handles=setNewMediumFrame(app, handles);
            %set(handles.numMediaEdit,'String',num2str(handles.numMedia))
            handles.numMediaEdit.Value=handles.numMedia;
            %set(handles.mediumNumberEdit,'String',num2str(handles.mediumNumber))
            handles.HankelSum=sumHankel(app, handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
            for ii=1:handles.numMedia-1
                handles=mgGAMMA(app, handles,ii);
            end
            handles=drawMedia(app, handles);
        end
        
        function layerConfig_Callback(app, ~, ~)
            %function layerConfig_Callback(hObject,eventdata,handles)
            
            global layersFig
            %get coords of points on graph, which is on current axis.
            %Get name of bf file.
            layersHandles=guidata(layersFig);
            bfFileName=[get(gcf,'Name') '.bf'];
            [eta ,totalThickness,epsbfdim,eps,tanDelta,gamFileName]=readbfFile(app, bfFileName);
            layersHandles.gamFileName=gamFileName;
            layersHandles.eps=[eps;1];
            layersHandles.conductivity=[tanDelta;0];
            layersHandles.numMedia=length(layersHandles.eps);
            %
            rightClicked=false;
            while ~rightClicked
                [x,y,button]=ginput(1);
                if button==3
                    rightClicked=true;
                else
                    %Get the point closest to click point.
                    distFromPt=(x-totalThickness).^2+(y-eta).^2;
                    [~,ii]=min(distFromPt);
                    layersHandles.hOverWL=epsbfdim(ii,:)';
                    layersHandles=reconfigLayers(app, layersHandles);
                    guidata(layersFig,layersHandles);
                end
            end
        end
        
        function [handles,resultsDim,propModeNumbers,endingEfficiency,...
                totalReflectedPower,totalTransmittedPower,T0Ravi,R0Ravi] ...
                = lsqnonlin2(app, handles, lbLayerThickness, ubLayerThickness, ...
                lbWireOffset, ubWireOffset, lbWireReactance, ubWireReactance)
            resultsDim=[];
            propModeNumbers=0;
            endingEfficiency=0;
            totalReflectedPower=0;
            totalTransmittedPower=0;
            if ~app.TGMdefined(1)
                %At least the first mode has to be defined.
                msgbox('The optimization configuration has not been defined.')
                return
            end
            isLUT=app.LUTCheckBox.Value;
            %The optimization is performed by lsqnonlin.
            %We want to optimize quantities for beams scattered in a single
            %direction.
            %There is at least one target mode to optimize. The variables to be varied are
            %those indicated in the "include in optimization" panel.
            %Since lsqnonlin minimizes the function, we can choose our goal to minimize
            %abs(efficiency-1) of each mode. Also, the wireHorizOffset of the first wire
            %can be fixed so that it need not participate in the optimization.
            %
            %Get the beam mode to be optimized and its index mode1Index among all modes
            %(propagating and envanescent).
            %The vector of the indices of the propagating wave modes is
            %handles.modeNumberPropagating.
            %The vector of the indices of the target modes for which optimization
            %is performed is handles.modesForOptimization
            %For now, get the first legitimate entries of handles.modesForOptimization.
            %Instead of handles.modesForOptimization, we will use
            %app.TGMpropModeNumber(n) for the nth optimization mode being
            %considered.
            cosdInc=cosd(handles.incAngDeg);
            %It will be assumed that the main target mode for optimization is the first in the
            %table in the "optimization for target modes" toggle frame.
            %
            %Determine if this optimization is to be performed for multiple
            %modes.
            numOptModes=app.NomodesSpinner.Value;
            if numOptModes>1
                %Make sure that there is no duplicate of the propagating
                %mode.
                A=app.TGMpropModeNumber(1:numOptModes);
                if length(unique(A))<numOptModes
                    msgbox('A propagation mode number appears for more than one mode')
                    return
                end
                for ii=1:numOptModes
                    if ~app.TGMdefined(ii)
                        msgbox(['Configuration for sequential mode ' num2str(ii) ' not defined.'])
                        return
                    end
                end
            end
            %
            app.mode2EfficiencyText.Text=' ';
            app.mode2EffiencyLabel.Text='.000';
            app.mode3EffiencyLabel.Text='.000';
            app.mode4EffiencyLabel.Text='.000';
            app.mode5EffiencyLabel.Text='.000';
            app.mode6EffiencyLabel.Text='.000';
            %mode1ForOptimization=handles.modesForOptimization(1);
            beamAngle=handles.incAngDegFloqDraw; %This will be a vector and so will optFac.
            optFac=cosd(beamAngle')/cosdInc;
            %
            isConstantThickness=get(handles.constantThicknessCheckBox,'Value');
            %If isConstantThickness is true,
            %all the dielectric layers will have the same thickness. Then only only one
            %layer thickness variable is needed.
            %
            isSymmetric=get(handles.symmetricCheckBox,'Value');
            %If isSymmetric is true,
            %arrange wire offsets and and wire reactances symmetrically.
            %The order will be in accordance with the file wireAssocSym. 
            % Then only about half of the optimization variables are needed.
            %Later we can add consideration of the switch "include in optimization".
            isRavi=app.RaviCheckBox.Value;
            isWk=app.WkCheckBox.Value;
            %
            %Get the initial values of the variables.
            %Get the indeces for the wires.
            indWire=find(handles.isWire==1); %This is the same for all modes.
            if isSymmetric
                indWireOff=indWire(1:end);  %The offset of the first wire is included.
            else
                indWireOff=indWire(2:end);  %The offset of the first wire is not included.
            end
            indLay=find(handles.isWire>1);
            x0=[];
            lb=[];
            ub=[];
            %
            %***********This is new*************************************
            %indWire would be the same for each mode.
            %Build the index vectors for each mode. Make the total a cell
            %array.
            NindWireImped=zeros(1,numOptModes);
            NindWireOffset=zeros(1,numOptModes);
            NindLayers=zeros(1,numOptModes);
            indWireImped=[];
            indWireOffset=[];
            indLayers=[];
            for ii=1:numOptModes
                indInclude=find(app.TGMincludeInOptim(ii,:)); 
                %The structures for which the "incl. in opt." checkbox has 
                % been checked.
                if app.TGMincludeWireReactanceInOptim(ii)
                    if isSymmetric && ii==1
                        %The fact that all wires are included was checked
                        %in lsqnonlinPushButton callback.
                        xDistImped=app.TGMwireDistImped(ii,app.indWireImpedSymA);
                        NindWireImped(ii)=length(app.indWireImpedSymA);
                        indWireImped=[indWireImped app.indWireImpedSymA];
                        %xDistImped=xDistImped(1:2:end);
                        %NindWireImped(ii)=NindWireImped(ii)/2;
                    else
                        intsect=indWire;
                        %Only consider TGMincludeInOptim to impedance when
                        %TGMincludeWireOffsetInOptim is false.
                        if ~app.TGMincludeWireOffsetInOptim(ii)
                            intsect=intersect(indWire,indInclude);
                        end
                        NindWireImped(ii)=length(intsect);
                        indWireImped=[indWireImped intsect];
                        xDistImped=app.TGMwireDistImped(ii,intsect);
                    end
                    if isWk
                        %We will use Wk as an optimization variable instead
                        %of xDistImped.  Wk will be given in mil.
                        %The starting values of Wk will be estimated from
                        %the current values of xDistImped.
                        %mm2mil=39.37;
                        %mil2mm=0.0254;
                         Wk1mil=app.EditFieldlbWk.Value;
                         Wk2mil=app.EditFieldubWk.Value;
                        %Wk1mil=1;
                        %Wk2mil=80;
                        %Wk1mil=0;
                        %Wk2mil=120;
                        %Wk2mil=110; 
                        if isfield(handles,'Wk')
                            Wk=handles.Wk(indWireImped);
                        else
                            %Try to reproduce the Wk from the impedance.
                            %This is a little hokey.
                            MM=50;
                            %Get Wk values for interpolation
                            Wkk=linspace(Wk1mil,Wk2mil,MM+2);
                            %Let's remove the end points.
                            Wkk=Wkk(2:MM+1);
                            %Wk1mm=0;
                            %Wk2mm=Wk2mil*mil2mm;
                            imZkk=zeros(MM,1);
                            Wk=zeros(NindWireImped(ii),1);
                            for jj=1:NindWireImped(ii)
                                mediumNo=indWireImped(jj);
                                %Get the Z values corresponding to Wkk for this
                                %medium number.
                                for kk=1:MM
                                    imZkk(kk)=Wk2Z(app,mediumNo,Wkk(kk));
                                end
                                %Now interpolate to get the Wk corresponding to
                                %imZ (approximately).
                                imZ=xDistImped(jj);
                                Wk(jj)=interp1(imag(imZkk),Wkk,imZ,'linear','extrap');
                            end
                        end
                        if app.isMeanEfficiencyOptim
                            %The optimization will depend on the mean
                            %efficiency over several frequencies. Set
                            %up the variables needed for determining
                            %the mean efficiency.
                            nPoints=str2double(get(handles.numPlotPointsEdit,'String'));
                            xIni=app.tiltAngleEditNumeric.Value;
                            xFin=str2double(get(handles.maxPlotValueEdit,'String'));
                            angText=app.FloqAngleText.Text;
                            %Remove the degrees sign attached to the end
                            angText=angText(1:end-1);
                            angDeg=str2double(angText);
                            freqReduced=linspace(xIni,xFin,nPoints);
                            %Define for the EffVsFreq function. MEO means mean efficiency
                            %optimization. We want to be able to define the parameters for
                            %this function only on the basis of app.
                            app.MEOfreqReduced=freqReduced;
                            app.MEOangDeg=angDeg;
                        end
                        lbDistImped=Wk1mil*ones(size(xDistImped));
                        ubDistImped=Wk2mil*ones(size(xDistImped));
                        x0=[x0 Wk];
                        lb=[lb lbDistImped];
                        ub=[ub ubDistImped];
                    else
                        lbDistImped=lbWireReactance*ones(size(xDistImped));
                        ubDistImped=ubWireReactance*ones(size(xDistImped));
                        x0=[x0 xDistImped];
                        lb=[lb lbDistImped];
                        ub=[ub ubDistImped];
                    end
                    if isRavi
                        x0=[x0 handles.realZtilde]; %Note Ztilde=Z*eta/lambda
                        lb=[lb 0];
                        %ub=[ub 50];  %Check this later.
                        ub=[ub 2000];  
                        NindWireImped(ii)=NindWireImped(ii)+1;
                    end
                end
                if app.TGMincludeWireOffsetInOptim(ii)
                    if isSymmetric && ii==1
                        indNot0=find(app.indWireOffsetSymA~=0);
                        indWireOffsetSymANot0=app.indWireOffsetSymA(indNot0);
                        xHorizOffset=app.TGMwireHorizOffset(ii,indWireOffsetSymANot0);
                        NindWireOffset(ii)=length(indWireOffsetSymANot0);
                        indWireOffset=[indWireOffset indWireOffsetSymANot0];
                        %xHorizOffset=xHorizOffset(1:2:end);
                        %NindWireOffset(ii)=NindWireOffset(ii)/2;
                    else
                        intsect=intersect(indWireOff,indInclude);
                        NindWireOffset(ii)=length(intsect);
                        indWireOffset=[indWireOffset intsect];
                        xHorizOffset=app.TGMwireHorizOffset(ii,intsect);
                    end
                    lbHorizOffset=lbWireOffset*ones(size(xHorizOffset));
                    ubHorizOffset=ubWireOffset*ones(size(xHorizOffset));
                    x0=[x0 xHorizOffset];
                    lb=[lb lbHorizOffset];
                    ub=[ub ubHorizOffset];
                end
                if app.TGMincludeLayerThicknessInOptim(ii)
                    intsect=intersect(indLay,indInclude);
                    NindLayers(ii)=length(intsect);
                    indLayers=[indLayers intsect];
                    xlayerThickness=app.TGMhOverWL(ii,intsect);
                    if isConstantThickness
                        xlayerThickness=xlayerThickness(1);
                        NindLayers(ii)=1;
                    end
                    lblayerThickness=lbLayerThickness*ones(size(xlayerThickness));
                    ublayerThickness=ubLayerThickness*ones(size(xlayerThickness));
                    x0=[x0 xlayerThickness];
                    lb=[lb lblayerThickness];
                    ub=[ub ublayerThickness];
                end
            end
            modeIndex=app.TGMmodeIndex(1:numOptModes);
            %If there are multiple incident waves (modeIndex>1), save the
            %fields for these incident waves.
            incAngDegFloq=handles.incAngDegFloq;
            isPropagating=~isnan(incAngDegFloq);
            nPropagating=find(isPropagating);
            thetaIncDegDim=incAngDegFloq(nPropagating);
            nFloq=length(incAngDegFloq);
            handles.EincComplexDim=zeros(nFloq,length(modeIndex));
            if app.FloqincwavesCheckBox.Value
                for ii=1:length(modeIndex)
                    handles.PincMag=handles.PincMagDim(:,ii);
                    handles.PincPhaseDeg=handles.PincPhaseDegDim(:,ii);
                    handles=manipIncWaves(app,handles.PincMag,handles.PincPhaseDeg,thetaIncDegDim,nFloq,nPropagating,handles);
                    handles.EincComplexDim(:,ii)=handles.EincComplexFull;
                end
            else
                for ii=1:length(modeIndex)
                    handles.EincComplexDim(:,ii)=handles.EincComplexFull;
                end
            end
            %Start from the mode 1 configuration.
            handles=displayTargetModeInfo(app,handles,1);
            %drawnow
%***********End this is new*****************************
            %
            %
            options = optimoptions('lsqnonlin');
            options.MaxFunctionEvaluations = 1.e4*length(x0);
            if isLUT
                options.MaxIterations=options.MaxIterations;
                options.FunctionTolerance=1.e-3;
            else
                options.MaxIterations=100*options.MaxIterations;
                options.FunctionTolerance=1.e-5;
            end
            options.OutputFcn=@(x,optimValues,state)outfun(app, x,optimValues,state,handles.quitOptimCheckBox);
            % In headless/batch mode, when the figure is hidden, disable the
            % optimizer output function to avoid per-iteration UI work.
            try
                if isprop(app,'figure1') && isvalid(app.figure1) && strcmp(app.figure1.Visible,'off')
                    options.OutputFcn = [];
                end
            catch
            end
            options.UseParallel=false;
            %options.UseParallel=true;
            %There is a problem using parallel "workers" with app. Some
            %app designer objects cannot be saved. This throws a warning.
            %Its not clear if the parallel processing is implemented but
            %only the save is not implemented, or if the entire parallel
            %processing is not implemented.
            f=@(xx)lsqnonlin2Fun(app,xx,handles,indWireImped,indWireOffset,...
                indLayers,modeIndex,optFac,isSymmetric,isConstantThickness,...
                NindWireImped,NindWireOffset,NindLayers,isRavi,isWk);
            set(handles.workingText,'Visible','on')
            app.safeDrawnow();
            exitflag=0;
            jj=0;
            while exitflag==0
                set(handles.quitOptimCheckBox,'Enable','on')
                setappdata(handles.quitOptimCheckBox,'optimstop',0)
                %checkoffsets(app.TGMwireHorizOffset(1,:))
                drawnow
                [x,resnorm,residual,exitflag,output]=lsqnonlin(f,x0,lb,ub,options);
                set(handles.quitOptimCheckBox,'Value',0)
                set(handles.quitOptimCheckBox,'Enable','off')
                %
                %Translate back from x to wireDistImped and wireHorizOffset and
                isAfterOpt=true;
                [handles,endingEfficiency,totalReflectedPower,...
                    totalTransmittedPower,T0Ravi,R0Ravi]=optVar2ModelVar...
                    (app,x,handles,indWireImped,indWireOffset,indLayers,...
                    modeIndex,optFac,isSymmetric,isConstantThickness,isAfterOpt,...
                    NindWireImped,NindWireOffset,NindLayers,isRavi,isWk);
                %In case the loop will be repeated:
                %checkoffsets(app.TGMwireHorizOffset(1,:))
                %checkoffsets(handles.wireHorizOffset(1,:))
                jj=jj+1;
                %In case exitflag=0 (i.e. solution hasn't been reached but the maximum
                %calls to the function has been exceeded, then keep going but only if
                %this has only happened once before.
                if jj==2
                    break
                end
                x0=x;
            end
            %
            %
            %Append to output file.
            nPropagatingModes=2*length(handles.modeNumberPropagating); %reflection and transmission
            %modeForOptimization
            nVars=length(x);
            nIterations=output.iterations;
            nCallsToFunc=output.funcCount;
            propModeNumbers=app.TGMpropModeNumber(1:numOptModes);
            resultsDim=[nPropagatingModes nVars resnorm nIterations nCallsToFunc];
            %
            if isWk
                %save the Wk. The following takes advantage of the fact
                %that the distributed impedance is the first variable
                %defined in x0.
                handles.Wk=zeros(size(handles.wireDistImped));
                handles.Wk(indWireImped)=x(1:length(indWireImped));
                if app.WkSymCheckBox.Value 
                    handles=makeWkSym(app,handles);
                end
                handles=displayTargetModeInfo(app,handles,1);
                drawnow
            end
            %
            set(handles.workingText,'Visible','off')
        end
        
        function f=lsqnonlin2Fun(app,x,handles,indWireImped,indWireOffset,...
                indLayers,modeIndex,optFac,isSymmetric,isConstantThickness,...
                NindWireImped,NindWireOffset,NindLayers,isRavi,isWk)
        % function f=lsqnonlin2Fun(app,x,handles,indWireImped,indWireOffset,...
        %         indLayers,mode1Index,optFac,indWireImped2,indWireOffset2,...
        %         indLayers2, mode2Index, isSymmetric, isConstantThickness)
            %Translate back
            isAfterOpt=false;
            [handles,endingEfficiency,totalReflectedPower,...
                totalTransmittedPower,T0Ravi,R0Ravi]=optVar2ModelVar...
                (app, x,handles,indWireImped,indWireOffset,indLayers,...
                modeIndex,optFac,isSymmetric,isConstantThickness,isAfterOpt,...
                NindWireImped,NindWireOffset,NindLayers,isRavi,isWk);
            % [handles,endingEfficiency1,endingEfficiency2]=optVar2ModelVar...
            %     (app, x,handles,indWireImped,indWireOffset,indLayers,...
            %     mode1Index,optFac,indWireImped2,indWireOffset2,indLayers2,...
            %     mode2Index,isSymmetric,isConstantThickness,isAfterOpt);
            f=zeros(size(x));
            jj=0;
            target=0;
            if app.NoreflectionCheckBox.Value || app.NotransmissionCheckBox.Value
                for ii=1:length(endingEfficiency)
                    jj=jj+1;
                    %The sqrt is placed below to give the scattered wave
                    %more weight. A coefficient >1 would give it even more
                    %weight. Try, e.g., 2 or 3.
                    if app.NoreflectionCheckBox.Value
                        f(jj)=3*sqrt(totalReflectedPower(ii));
                    else
                        f(jj)=3*sqrt(totalTransmittedPower(ii));
                    end
                    target=target+f(jj)*f(jj);
                end
            end
            T0CST=app.realT0Edit.Value+1i*app.ImagT0Edit.Value;
            if abs(T0CST)>0
                %if isRavi   The above is more general than if isRavi. It can
                %be used for other applications as well.
                %T0Ravi,R0Ravi real and imag parts of T0-T0CST
                T0diff=T0CST-T0Ravi;
                f(1)=real(T0diff);
                f(2)=imag(T0diff);
                target=f(1)*f(1)+f(2)*f(2);
                if app.isMeanEfficiencyOptim
                    %Get the mean efficiency over frequency.
                    %CAUTION. See what happens later. I think the next line
                    %might be necessary so that when changing frequencies,
                    %the Wk will be relative to the Wk values being tested.
                    app.WkAtWL1=handles.Wk;
                    [~,~,meanEff]=EffVsFreq(app,handles);
                    f(3)=1-sqrt(meanEff);
                    %Account for weights
                    f(1)=f(1)*(1-app.MeanEfficiencyOptimWeight);
                    f(2)=f(2)*(1-app.MeanEfficiencyOptimWeight);
                    f(3)=f(3)*app.MeanEfficiencyOptimWeight;
                    target=f(1)*f(1)+f(2)*f(2)+f(3)*f(3);
                end
            else
                for ii=1:length(endingEfficiency)
                    jj=jj+1;
                    %f(jj)=abs(1-endingEfficiency(ii));
                    %Revised Nov. 2024
                    f(jj)=app.TGMweight(ii)*abs(1-endingEfficiency(ii));
                    target=target+f(jj)*f(jj);
                end
            end
            app.target0Label.Text=num2str(target,3);
        end
        
        function makeMovie(app, handles)
            dPhase=360/handles.nPhaseDivisions;
            %hFig=get(handles.prismAxes,'parent');
            %set(hFig, 'Renderer', 'zbuffer')
            E=get(handles.hWaveImage,'CData');
            f = getframe(handles.prismAxes);
            %f = getframe(hFig,'nodither');
            %imm=frame2im(f);
            %[im,map] = rgb2ind(imm,256,'nodither');
            [im,map] = rgb2ind(f.cdata,256,'nodither');
            im(1,1,1,handles.nPhaseDivisions) = 0;
            for nn=1:handles.nPhaseDivisions
                timePhase=(nn-1)*dPhase;
                expTimePhase=exp(-1i*timePhase*pi/180);
                set(handles.hWaveImage,'CData',real(E*expTimePhase))
                drawnow
                f = getframe(handles.prismAxes);
                %f = getframe(hFig,'nodither');
                %imm=frame2im(f);
                %im(:,:,1,nn) = rgb2ind(imm,map,'nodither');
                im(:,:,1,nn) = rgb2ind(f.cdata,map,'nodither');
            end
            imwrite(im,map,'waveMotion.gif','DelayTime',0,'LoopCount',inf)
            msgbox('Animated GIF placed on file waveMotion.gif.')
        end
        
        function handles = mgGAMMA(app, handles, numLayer)
                % global isdoChange
                % isdoChange=true;
            %
            %No need to do this unless isWire is true.
            %if ~handles.isWire(numLayer)
            if handles.isWire(numLayer)~=1
                nTermsFQ=app.NoFloqmdsSpinner.Value;
                maxMode=fix(nTermsFQ/2);
                nVec=-maxMode:maxMode;
                k0=handles.k0;
                %kxq=k0*sind(handles.ThetInDeg)+(2*pi/handles.d)*nVec;
                kxq=k0*sind(handles.incAngDeg)+(2*pi/handles.d)*nVec;
                kyq=sqrt((k0-kxq).*(k0+kxq));
                handles.incAngDegFloq=NaN(nTermsFQ,1);
                indexImagkyq0=find(imag(kyq)==0);
                handles.incAngDegFloq(indexImagkyq0)=asind(kxq(indexImagkyq0)/k0);
                return
            end
            eta=376.730313668;
            k0=handles.k0;
            %k=2*pi;
            w=handles.wireStripWidth(numLayer);
            %Changed by swm 5.12.23. I think that as a result, we don't have to place a
            %virtual layer at the start if a dielectric is the first layer.
            %sqrteps=sqrt(handles.eps(1));
            sqrteps=1;
            kreff=sqrteps*2*pi*w/(4*handles.WL);
            %kreff=sqrt(handles.eps(1))*2*pi*w/2;
            %Changed to conform with CST results
            %kreff=2*pi*w/2;
            F0=-k0*eta/2*(handles.HankelSum+besselh(0,1,kreff)/2);
            %isRefraction=true;
            %set(handles.optimizeReflectionCheckBox,'Enable','on')
            %thetaInc=handles.ThetInDeg;
            %thetaRef=handles.ThetOutDeg;
            nTermsFQ=app.NoFloqmdsSpinner.Value;
            %Set up Floquet params.
            maxMode=fix(nTermsFQ/2);
            nVec=-maxMode:maxMode;
            n0=maxMode+1;     %nVec(n0) represents mode 0.
            %
            d=handles.d;
            % y=cumsum(handles.hOverWL);
            % if numLayer==1
            %     yy=0;
            % else
            %     y=cumsum(handles.hOverWL);
            %     yy=-y(numLayer-1);
            % end
            sinThetIn=sind(handles.ThetInDeg);
            kxq=k0*sinThetIn+(2*pi/d)*nVec;
            km=k0*sqrteps;
            kyq=sqrt((km-kxq).*(km+kxq));
            indexImagkyqNeg=find(imag(kyq)<0);
            kyq(indexImagkyqNeg)=-kyq(indexImagkyqNeg);
            %Ztilde=1i*handles.wireDistImped(numLayer)*eta*handles.distImpedFac/sqrteps;
            %The real part of the next statement represents ohmic losses for
            %copper at 20 GHz.handles.realZtilde
            %Ztilde=(.0145+1i*handles.wireDistImped(numLayer))*eta*handles.distImpedFac/sqrteps;
            %Ztilde=(handles.realZtilde+1i*handles.wireDistImped(numLayer))*eta*handles.distImpedFac/sqrteps;
            %Ztilde=(handles.realZtilde+1i*handles.wireDistImped(numLayer))*eta/handles.WL;
            %Since if the wavelength is different from 1, we are interested in the
            %capacitance when lambda=1. Therefore the dependence on the wavelength is
            %entirely different.
            %Ztilde=(handles.realZtilde+1i*handles.wireDistImped(numLayer))*eta*(handles.WL)^2;
            %Ztilde=(handles.realZtilde+1i*handles.wireDistImped(numLayer))*eta*(handles.WL);

            %Ztilde=handles.realZtilde+1i*handles.wireDistImped(numLayer)*eta*handles.WL;
            %Ztilde=handles.realZtilde+1i*handles.wireDistImped(numLayer)*eta*(handles.WL)^2;
            %This gives good results of mag, but I can't justify it. Phase
            %results are not good.
            %Okay, here's the lowdown. Normally, we consider a unit
            %wavelength, so that handles.WL will not affect anything. When
            %we change the frequency, we change the dimensions so that we
            %keep a unit wavelength. Changing these dimensions is done
            %before we reach this point, including for wireDistImped. So
            %all changes due to a frequency change are made in the
            %changeFreq routine. One of these parameters is wireDistImped.
            Ztilde=handles.realZtilde+1i*handles.wireDistImped(numLayer)*eta/handles.WL;
            %I think that the division by handles.WL requires that
            %handles.WL be unity. The effect on wireDistImped would be
            %WL^2.


            %***check if *eta above is correct.
            dk=handles.wireHorizOffset(numLayer);
            ekxq=exp(1i*kxq*dk*d);
            emkxq=1./ekxq;   %row vector
            ekxp=ekxq.';   %column vector
            Itildep=ekxp/(Ztilde-F0); %column vector
            %swm
            % alfqp=-(k0*eta/(2*d))*Itildep*(emkxq./kyq);
            % handles.GAMMAMGReflect(:,:,numLayer)=alfqp;
            % addForTransmit=eye(nTermsFQ);
            % handles.GAMMAMGTransmit(:,:,numLayer)=handles.GAMMAMGReflect(:,:,numLayer)+addForTransmit;
            alfqp=(k0*eta/d)*Itildep*emkxq;
            identMatrix=eye(nTermsFQ);
            %handles.GAMMAMGReflect(:,:,numLayer)=alfqp+kyq*identMatrix;
            %handles.GAMMAMGReflect(:,:,numLayer)=-alfqp+diag(kyq);
            %The negative sign was added to get good results for a single wire.  Check
            %it.
            %Changed back.
            handles.GAMMAMGReflect(:,:,numLayer)=-alfqp;
            %ekyqh=exp(1i*kyq*handles.hOverWL(numLayer)*handles.WL);
            ekyqh=exp(1i*kyq*handles.hOverWL(numLayer));
            handles.GAMMAMGTransmit(:,:,numLayer)=handles.GAMMAMGReflect(:,:,numLayer).*ekyqh;
            
            %********
            %The following is being commented out because it was found to be faulty.
            %Perhaps it can be fixed in the future.
            % if isdoChange
            %     %get the GAMMAMGReflect, GAMMAMGTransmit when there are two wire arrays
            %     %at the same level.
            %     %This will be implemented only when the next "layer" is also a wire.
            %     %This will be a situation where there are 2 wires at an interface
            %     %between two material layers.  For the time being assume these layers
            %     %have the same material properties. Determine if two wires are
            %     %adjacent. If so, the numLayer one will be numA, the other one will be
            %     %numB.
            %     isAdjacent=false;
            %     lengthisWire=length(handles.isWire);
            %     if lengthisWire>1
            %         if numLayer==1
            %             %If there is an adjacent wire, it must have index 1.
            %             if handles.isWire(2)==1
            %                 numA=numLayer;
            %                 numB=numLayer+1;
            %                 isAdjacent=true;
            %             end
            %         elseif numLayer==lengthisWire
            %             if handles.isWire(lengthisWire-1)==1
            %                 numA=numLayer;
            %                 numB=numLayer-1;
            %                 isAdjacent=true;
            %             end
            %         else
            %             if handles.isWire(numLayer+1)==1
            %                 numA=numLayer;
            %                 numB=numLayer+1;
            %                 isAdjacent=true;
            %             elseif handles.isWire(numLayer-1)==1
            %                 numA=numLayer;
            %                 numB=numLayer-1;
            %                 isAdjacent=true;
            %             end
            %         end
            %     end
            %     if isAdjacent
            %         %This is the one of a pair of wire arrays at this interface.
            % %         numA=numLayer;
            % %         numB=numLayer+1;
            %         ZAtilde=Ztilde;
            %         %ZBtilde=1i*handles.wireDistImped(numB)*eta*handles.distImpedFac;
            %         %The real part of the next statement represents ohmic losses for
            %         %copper at 20 GHz. (handles.realZtilde
            %         ZBtilde=(.0145+1i*handles.wireDistImped(numB))*eta*handles.distImpedFac;
            %         F0A=F0;
            %         w=handles.wireStripWidth(numB);
            %         %kreff=sqrt(handles.eps(1))*2*pi*w/4;
            %         kreff=sqrt(handles.eps(1))*2*pi*w/2;
            %         F0B=-k0*eta/2*(handles.HankelSum+besselh(0,1,kreff)/2);
            %         dA=dk;
            %         dB=handles.wireHorizOffset(numB);
            %         k=k0;
            %         km=k0*sqrt(handles.eps(1));
            %         x=(dB-dA)*d;
            %         FA=fullHanKelSum(k,km,d,x);
            %         x=(dA-dB)*d;
            %         FB=fullHanKelSum(k,km,d,x);
            %         %Solve for the currents.
            %         %Compute the determinant.
            %         D=(ZAtilde-F0A)*(ZBtilde-F0B)-FA*FB;
            %         %Now the currents
            %         ekxpA=exp(1i*kxq.'*dA*d);   %column vector
            %         ekxpB=exp(1i*kxq.'*dB*d);   %column vector
            %         emkxqA=1./ekxpA.';   %row vector exp(-1i*kxq*dA*d)
            %         emkxqB=1./ekxpB.';   %row vector exp(-1i*kxq*dB*d)
            %         ItildepA=(ekxpA*(ZBtilde-F0B)+ekxpB*FB)/D;  %column vector
            %         ItildepB=(ekxpB*(ZAtilde-F0A)+ekxpA*FA)/D;  %column vector
            %         alfqp=-(eta*k0/(2*d))*(ItildepA*(emkxqA./kyq)+ItildepB*(emkxqB./kyq));
            %         handles.GAMMAMGReflect(:,:,numA)=alfqp;
            %         addForTransmit=eye(nTermsFQ);
            %         handles.GAMMAMGTransmit(:,:,numA)=handles.GAMMAMGReflect(:,:,numA)+addForTransmit;
            %         handles.GAMMAMGReflect(:,:,numB)=handles.GAMMAMGReflect(:,:,numA);
            %         handles.GAMMAMGTransmit(:,:,numB)=handles.GAMMAMGTransmit(:,:,numA);
            %         %For the time being, this means that the two adjacent wires will
            %         %have the same GAMMAMGReflect and GAMMAMGTransmit.
            %     end
            % end
            
            handles.inductDiff(numLayer,1)=Ztilde-F0;
            %
            kyq=sqrt((k0-kxq).*(k0+kxq));
            handles.incAngDegFloq=NaN(nTermsFQ,1);
            indexImagkyq0=find(imag(kyq)==0);
            handles.incAngDegFloq(indexImagkyq0)=asind(kxq(indexImagkyq0)/k0);
        end
        
        function nIndexEdit_Callback(app, hObject, eventdata, handles)
            % hObject    handle to nIndexEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of nIndexEdit as text
            %        str2double(get(hObject,'String')) returns contents of nIndexEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String',num2str(handles.nIndexResult));
            else
                if val<handles.nVec(1) || val > handles.nVec(end)
                    set(hObject,'String',num2str(handles.nIndexResult));
                else
                    handles.nIndexResult=val;
                    handles=fillInResults(app, handles);
                    if get(handles.DisplayWaveImageCheckBox,'Value')
                        if get(handles.animateWaveCheckBox,'Value')
                            %We have to stop the animation before deleting the image.
                            msgbox('Please turn off animation before continuing.')
                            guidata(hObject,handles);
                            return
                        else
                            delete(handles.hWaveImage)
                            handles=drawWaves(app, handles);
                        end
                    end
                    handles=drawIncArrow(app, handles);
                    guidata(hObject,handles);
                end
            end
        end
        
        function nIndexEdit_CreateFcn(app, hObject, eventdata, handles)
            % --- Executes during object creation, after setting all properties.
            
            % hObject    handle to nIndexEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    empty - handles not created until after all CreateFcns called
            
            % Hint: edit controls usually have a white background on Windows.
            %       See ISPC and COMPUTER.
            if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
                set(hObject,'BackgroundColor','white');
            end
        end
        
        function nIndexUpDownSlider_Callback(app, hObject, eventdata, handles)
            % --- Executes on slider movement.
            
            % hObject    handle to nIndexUpDownSlider (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'Value') returns position of slider
            %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
            if get(hObject,'Value')>0.5
                if handles.nIndexResult>=handles.nVec(end)
                    set(hObject,'Value',0.5)
                    return
                end
                inc=1;
                handles.nIndexResult=handles.nIndexResult+inc;
            else
                if handles.nIndexResult<=handles.nVec(1)
                    set(hObject,'Value',0.5)
                    return
                end
                inc=-1;
                handles.nIndexResult=handles.nIndexResult+inc;
            end
            set(handles.nIndexEdit,'String',num2str(handles.nIndexResult))
            set(hObject,'Value',0.5)
            handles=fillInResults(app, handles);
            if get(handles.DisplayWaveImageCheckBox,'Value')
                if get(handles.animateWaveCheckBox,'Value')
                    %We have to stop the animation before deleting the image.
                    msgbox('Please turn off animation before continuing.')
                    guidata(hObject,handles)
                    return
                else
                    delete(handles.hWaveImage)
                    handles=drawWaves(app, handles);
                end
            end
            handles=drawIncArrow(app, handles);
            guidata(hObject,handles)
        end
        
        function nIndexUpDownSlider_CreateFcn(app, hObject, eventdata, handles)
            % --- Executes during object creation, after setting all properties.
            
            % hObject    handle to nIndexUpDownSlider (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    empty - handles not created until after all CreateFcns called
            
            % Hint: slider controls usually have a light gray background.
            if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
                set(hObject,'BackgroundColor',[.9 .9 .9]);
            end
        end
        
        function handles = normalizeLocation(app, handles)
            isFirstWireDefined=0;
            for ii=1:handles.numMedia-1
                if handles.isWire(ii)==1
                    if isFirstWireDefined
                        handles.wireHorizOffset(ii)=handles.wireHorizOffset(ii)-firstWireOffset;
                        if handles.wireHorizOffset(ii)<0
                            handles.wireHorizOffset(ii)=1+handles.wireHorizOffset(ii);
                        end
                    else
                        firstWireOffset=handles.wireHorizOffset(ii);
                        handles.wireHorizOffset(ii)=0;
                        isFirstWireDefined=1;
                    end
                    handles=mgGAMMA(app, handles,ii);
                end
            end
        end
        
        function phsMagCmplx(app,freq,magML,phsML,f0)
            %This function draws the line with magnitude,phase
            %magML,phsML as a function of frequency in the complex
            %space of a unit circle.
            %Find the freqs for which freq is a whole number.
            freq1=freq(1);
            freqEnd=freq(end);
            freqFix1=fix(freq1)+1;
            freqFixEnd=fix(freqEnd);
            %nWholeNumbers=freqFixEnd-freqFix1+1;
            freqFixes=[];
            if freqFixEnd>=freqFix1
                freqFixes=[freq1 freqFix1:freqFixEnd freqEnd];
            else
                freqFixes=[freq1 freqEnd];
            end
            %Add the nominal frequency to the party.
            freqFixes=sort([freqFixes f0]);
            %Get the indices of points closest to freqFixes
            lenFreqFixes=length(freqFixes);
            indFix=zeros(1,lenFreqFixes);
            for ii=1:lenFreqFixes
                indd=find(freq>=freqFixes(ii));
                indFix(ii)=indd(1);
            end

            reML=magML.*cosd(phsML);
            imML=magML.*sind(phsML);
            %Get axis to plot on.
            figure
            % hML=plot(reML,imML,'.');
            % hML.Color='b';
            % hML.MarkerSize=12;
            hML=plot(reML,imML,'b');
            set(hML,'LineWidth',2)
            grid
            axis('equal')
            hold on
            hMLFix=plot(reML(indFix),imML(indFix),'o');
            %hold off
            hMLFix.MarkerSize=8;
            hMLFix.Color='b';
            hMLFix.MarkerFaceColor='b';
            %Text for freqs.
            for ii=1:lenFreqFixes
                text(reML(indFix(ii))+.05,imML(indFix(ii)),num2str(freqFixes(ii)))
            end
            %Reference circles
            h1=fplot(@(t) sin(t), @(t) cos(t));
            h1.Color='r';
            r=0.5:0.1:0.9;
            for ii=1:length(r)
                hr(ii)=fplot(@(t) r(ii)*sin(t), @(t) r(ii)*cos(t));
                hr(ii).Color='b';
            end
            %Plot radials to indicate segments of 30 deg.
            ang=-180:30:150;
            for ii=1:length(ang)
                hang(ii)=line([0 sind(ang(ii))],[0,cosd(ang(ii))]);
                hang(ii).LineStyle='--';
                hang(ii).Color='k';
            end
            hold off
            xlabel('Re(T_0)')
            ylabel('Im(T_0)')
            title('Transmission Efficiency')
            legend(hML,'Analytical')
        end


        function [handles,endingEfficiency,totalReflectedPower,...
                totalTransmittedPower,T0Ravi,R0Ravi]=optVar2ModelVar...
                (app,x,handles,indWireImped,indWireOffset,indLayers,...
                modeIndex,optFac,isSymmetric,isConstantThickness,isAfterOpt, ...
                NindWireImped,NindWireOffset,NindLayers,isRavi,isWk)
            %MM->multimodes
            %Translate back from x to wireDistImped and wireHorizOffset and
            %hOverWL.
            %endingEfficiency  vector containing the ending efficiency of
            %each mode..
            %
            %Get the handles structure to mode 1.
            handles.wireHorizOffset=app.TGMwireHorizOffset(1,:);
            handles.wireDistImped=app.TGMwireDistImped(1,:);
            handles.hOverWL=app.TGMhOverWL(1,:)'; 
            %
            numOptModes=length(modeIndex);
            endingEfficiency=zeros(1,numOptModes);
            totalReflectedPower=zeros(1,numOptModes);
            totalTransmittedPower=zeros(1,numOptModes);
            lastIndex=0;
            jjWireImped=0;  %Count of wire impedance optimization variables.
            jjWireOffset=0;  %Count of wire offset optimization variables.
            jjLayerThickness=0; %Count of layer thickness optimization variables.
            for ii=1:numOptModes
                %
                if NindWireImped(ii)>0
                    %handles.wireDistImped=app.TGMwireDistImped(ii,:);
                    %commented 31.7
                    m1=lastIndex+1;
                    m2=lastIndex+NindWireImped(ii);  %Even for symmetry
                    jjWireImpedPrev=jjWireImped+1;
                    jjWireImped=jjWireImped+m2-m1+1;
                    if isSymmetric && ii==1
                        %Since the configuration is symmetric, only half the variables
                        %are found in x. Expand these to cover all wires. That is, we want
                        %x(m1),x(m1),x(m1+1),x(m1+1),...,x(m2),x(m2).
                        %This was changed.
                        %m2=lastIndex+NindWireImped(ii)/2;
                        %xDistImped=repelem(x(m1:m2),2);
                        handles.wireDistImped(app.indWireImpedSymA)=x(m1:m2);
                        handles.wireDistImped(app.indWireImpedSymB)=handles.wireDistImped(app.indWireImpedSymA);
                    else
                        if isRavi
                            xDistImped=x(m1:m2-1);
                            indWireImpedOptimii=indWireImped(jjWireImpedPrev:jjWireImped-1);
                            handles.wireDistImped(indWireImpedOptimii)=xDistImped;
                            handles.realZtilde=x(m2);
                        else
                            xDistImped=x(m1:m2);
                            indWireImpedOptimii=indWireImped(jjWireImpedPrev:jjWireImped);
                            if isWk
                                %xDistImped are values of Wk in the media 
                                % with indices indWireImpedOptimii. Find
                                % the corresponding values of the imaginary
                                % part of the impedance wireDistImped and
                                % the real part handles.realZtilde.
                                handles.realZ=zeros(size(handles.wireDistImped));
                                %handles.Wk was originally not defined here
                                %at all. But it was added to be able to use
                                %makeWkSym.
                                handles.Wk=zeros(size(handles.wireDistImped));
                                for jj=1:length(xDistImped)
                                    indjj=indWireImpedOptimii(jj);
                                    Wk=xDistImped(jj);
                                    Z=Wk2Z(app,indjj,Wk);
                                    handles.Wk(indjj)=Wk;
                                    handles.wireDistImped(indjj)=imag(Z);
                                    handles.realZ(indjj)=real(Z);
                                end
                                if app.WkSymCheckBox.Value 
                                    handles=makeWkSym(app,handles);
                                end
                            else
                                handles.wireDistImped(indWireImpedOptimii)=xDistImped;
                            end
                        end
                    end
                    lastIndex=m2;
                end
                app.TGMwireDistImped(ii,:)=handles.wireDistImped;
                %
                if NindWireOffset(ii)>0
                    % %Save current offset config for coupling calcs later.
                    % wireHorizOffsetPrev=handles.wireHorizOffset;
                    % %handles.wireHorizOffset=app.TGMwireHorizOffset(ii,:);
                    % %commented 31.7
                    %The above change was modified on 8.8.24
                    if app.TGMisPossibleCoupling(ii)
                        %Save current offset config for coupling calcs later.
                        wireHorizOffsetPrev=handles.wireHorizOffset;
                        handles.wireHorizOffset=app.TGMwireHorizOffset(ii,:);
                        %Didn't investigate sufficiently why the above
                        %statement is necessary.
                    end
                    %End modification
                    m1=lastIndex+1;
                    m2=lastIndex+NindWireOffset(ii);  %Even when symmetric.
                    jjWireOffsetPrev=jjWireOffset+1;
                    jjWireOffset=jjWireOffset+m2-m1+1;
                    if isSymmetric && ii==1
                        %Since the configuration is symmetric, only half the variables
                        %are found in x. Expand these to cover all wires. That is, we want
                        %x(m1),1-x(m1),x(m1+1),1-x(m1+1),...,x(m2),1-x(m2). Make the x
                        %and 1-x separate vectors, make them separate rows, then
                        %reshape the matrix into a vector.
                        %m2=lastIndex+NindWireOffset(ii)/2;
                        % xa=x(m1:m2);
                        % xb=1-x(m1:m2);
                        % xc=[xa;xb];
                        % xHorizOffset=reshape(xc,1,[]);
                        %This has been changed.
                        ind0=find(app.indWireOffsetSymA==0);
                        indNot0=find(app.indWireOffsetSymA~=0);
                        handles.wireHorizOffset(app.indWireOffsetSymA(indNot0))=x(m1:m2);
                        cen11=handles.wireHorizOffset(app.indWireOffsetSymCenter(1,indNot0));
                        cen12=handles.wireHorizOffset(app.indWireOffsetSymCenter(2,indNot0));
                        cen1=mean([cen11;cen12]);
                        %cen1 is the avg of the upper row and lower row of indWireOffsetSymCenter.
                        handles.wireHorizOffset(app.indWireOffsetSymB(indNot0))=...
                            2*cen1-handles.wireHorizOffset(app.indWireOffsetSymA(indNot0));
                        cen21=app.TGMwireHorizOffset(1,app.indWireOffsetSymCenter(1,ind0));
                        cen22=app.TGMwireHorizOffset(1,app.indWireOffsetSymCenter(2,ind0));
                        cen2=mean([cen21;cen22]);
                        handles.wireHorizOffset(app.indWireOffsetSymB(ind0))=cen2;
                        %Make sure it is between 0 and 1.
                        indWires=find(handles.isWire==1);
                        handles.wireHorizOffset(indWires)=mod(app.TGMwireHorizOffset(1,indWires),1);
                    else
                        %m2=lastIndex+NindWireOffset(ii);
                        xHorizOffset=x(m1:m2);
                        xHorizOffset=mod(xHorizOffset,1);
                        %By definition, this must be between 0 and 1.  But if
                        %during optimization, a larager field is used, it
                        %should in the end be periodic with the period of
                        %interest between 0 and 1. Thus the mod.
                        handles.wireHorizOffset(indWireOffset(jjWireOffsetPrev:jjWireOffset))=xHorizOffset;
                    end
                    lastIndex=m2;
                    %
                    handles.isPossibleCoupling=app.TGMisPossibleCoupling(ii);
                    if app.TGMisPossibleCoupling(ii)
                        %Coupling can only be valid if an offset is being
                        %optimized.  Therefore coupling can be placed within
                        %the NindWireOffset(ii) "if".
                        handles.nCoupledTo=app.TGMnCoupledTo(ii,:);
                        %get the distance between the slave wire and the 
                        %master wire.
                        %Find the indices of the wires that are linked to
                        %other wires. These are those that are not equal to
                        %the sequence vector (because if there is no
                        %coupling, 1 is coupled to 1, 2 is coupled to 2,
                        %etc.).
                        ind=find(handles.nCoupledTo ~= 1:handles.numMedia-1);
                        if isempty(ind)
                            %oops. Since isPossibleCoupling is true, we
                            %should have at least one layer coupled.
                            msgbox('Coupling not found.')
                        end
                        for kk=1:length(ind)
                            jj=ind(kk);
                            masterLayer=handles.nCoupledTo(jj);
                            handles.distCoupledTo(jj)=wireHorizOffsetPrev(masterLayer)-wireHorizOffsetPrev(jj);
                            %
                            %The following is to make sure the offset
                            %parameter is defined for the slave wire as
                            %well. This will be important in producing the
                            %proper printout.
                            handles.wireHorizOffset(jj)=handles.wireHorizOffset(masterLayer)-handles.distCoupledTo(jj);
                            if handles.wireHorizOffset(jj)<0
                                handles.wireHorizOffset(jj)=handles.wireHorizOffset(jj)+1;
                            elseif handles.wireHorizOffset(jj)>1
                                    handles.wireHorizOffset(jj)=handles.wireHorizOffset(jj)-1;
                            end
                            %
                        end
                        %checkoffsets(handles)
                        app.TGMdistCoupledTo(ii,:)=handles.distCoupledTo;
                    end   %Possible coupling
                end    %NindWireOffset(ii)>0
                app.TGMwireHorizOffset(ii,:)=handles.wireHorizOffset;
                %
                if NindLayers(ii)>0
                    %handles.hOverWL=app.TGMhOverWL(ii,:)';
                    %commented 31.7
                    m1=lastIndex+1;
                    if isConstantThickness
                        m2=m1;
                        xlayerThickness=repelem(x(m1),NindLayers(ii));
                        % jjLayerThicknessPrev=jjLayerThickness+1;
                        % jjLayerThickness=jjLayerThickness+m2-m1+1;
                        % handles.hOverWL(indLayers(jjLayerThicknessPrev:jjLayerThickness))=xlayerThickness;
                        %The above was changed 13.8.24.
                        %It could be that for constant thickness,
                        %NindLayers(ii) is always 1.But we want the same
                        %values for all layers.
                        handles.hOverWL(indLayers)=xlayerThickness;
                    else
                        m2=lastIndex+NindLayers(ii);
                        xlayerThickness=x(m1:m2);
                        jjLayerThicknessPrev=jjLayerThickness+1;
                        jjLayerThickness=jjLayerThickness+m2-m1+1;
                        handles.hOverWL(indLayers(jjLayerThicknessPrev:jjLayerThickness))=xlayerThickness;
                    end
                    lastIndex=m2;
                end
                app.TGMhOverWL(ii,:)=handles.hOverWL';
                %
                if isWk
                    eta=376.730313668;
                    for kk=1:handles.numMedia-1
                        %In the standard (~isWk) version,
                        %handles.realZtilde is the same for all media. Here
                        %it changes. The imagZ (which is the distributed
                        %impedance, was already changed above.
                        handles.realZtilde=handles.realZ(kk)*eta/handles.WL;
                        handles=mgGAMMA(app, handles,kk);
                    end
                else    
                    for kk=1:handles.numMedia-1
                        handles=mgGAMMA(app, handles,kk);
                    end
                end
                [handles,endingEfficiency(ii),totalReflectedPower(ii),...
                    totalTransmittedPower(ii),T0Ravi,R0Ravi]=...
                    callToModel(app,handles,isAfterOpt,optFac,modeIndex(ii));
                %T0Ravi,R0Ravi are the complex transmitted and reflected
                %fields.
                % if ii==2
                %     endingEfficiency2str=get(handles.targetOptimEfficiency2Text,'String');
                %     set(handles.mode2EfficiencyText,'String',endingEfficiency2str)
                % end
                switch ii
                    case 1
                        app.targetOptimEfficiency1Text.Text=num2str(endingEfficiency(ii));
                        %For each of the next modes, the first one has to
                        %be rewritten since the program currently places
                        %each result into the first text box.
                    case 2
                        app.mode2EffiencyLabel.Text=num2str(endingEfficiency(ii),3);
                        app.targetOptimEfficiency1Text.Text=num2str(endingEfficiency(1));
                    case 3
                        app.mode3EffiencyLabel.Text=num2str(endingEfficiency(ii),3);
                        app.targetOptimEfficiency1Text.Text=num2str(endingEfficiency(1));
                    case 4
                        app.mode4EffiencyLabel.Text=num2str(endingEfficiency(ii),3);
                        app.targetOptimEfficiency1Text.Text=num2str(endingEfficiency(1));
                    case 5
                         app.mode5EffiencyLabel.Text=num2str(endingEfficiency(ii),3);
                        app.targetOptimEfficiency1Text.Text=num2str(endingEfficiency(1));
                    case 6
                        app.mode6EffiencyLabel.Text=num2str(endingEfficiency(ii),3);
                        app.targetOptimEfficiency1Text.Text=num2str(endingEfficiency(1));
                end
            end %ii loop over optimization modes.
            app.reflectedPowerLabel.Text=num2str(mean(totalReflectedPower));
            app.transmittedPowerLabel.Text=num2str(mean(totalTransmittedPower));
            %Insert the results 

            if get(handles.constraint1CheckBox,'Value')
                %constraint1=true;
                %if constraint1
                %With great trepidation, below is a temporary constraint. We are
                %interested in the distributed impedances of layers 12 and 14. We don't
                %want the results for these for mode 1 to be far from those of mode2.
                %If they are, then set ending efficiencies to 0.
                %indImped=[10 12 14];
                %indImped=[10 12];
                indImped=indWireImpedOptimii;
                %vecMode1=handles.wireDistImpedMode1(indImped);
                %vecMode2=handles.wireDistImpedMode2(indImped);
                vecMode1=app.TGMwireDistImped(1,indImped);
                vecMode2=app.TGMwireDistImped(2,indImped);
                vec=[vecMode1';vecMode2'];
                % vec1=[handles.wireDistImpedMode1(12);handles.wireDistImpedMode2(12);...
                %     handles.wireDistImpedMode1(14);handles.wireDistImpedMode2(14)];
                wdimax=max(vec);
                wdimin=min(vec);
                ratioMinMax=wdimin/wdimax;
                ratioCrit=0.75;
                reductionMinMax=1;
                if ratioMinMax<ratioCrit
                    reductionMinMax=ratioMinMax/ratioCrit;
                end
                endingEfficiency(1)=endingEfficiency(1)*reductionMinMax^2;
                endingEfficiency(2)=endingEfficiency(2)*reductionMinMax^2;
           end
        end



        
        
        
        function stop = outfun(app, x, optimValues, state, hObject)
            %This has been defined as the outputFcn for lsqnonlin. That is, at the end
            %of every iteration, data related to the run is sent to this routine so
            %that a operations can be undertaken. We have used this to determine
            %whether the user has pressed a "quit" button. If that button is pressed,
            %then handles.optimstop is set to true.
            %stop = false;
            % Check if user has requested to stop the optimization.
            stop=0;
            if strcmp(state,'iter')
                %Only stop if it is at the end of an iteration.
                %Hopefully, then, lsqnonlin will output the current solution.
                %(Maybe not.)
                stop = getappdata(hObject,'optimstop');
                drawnow        %This will probably eat a lot of time.
            end
        end
        
        function plotLayers(app, handles)
            FileName=get(handles.dataFileText,'String');
            outData=importdata(FileName);
            phaseAngleDeg=outData(:,1);
            widths=outData(:,2:4);
            
            figure
            plot(phaseAngleDeg,widths)
            xlabel('phase (deg)')
            ylabel('width/\lambda')
            legend('layer 1','layer 2','layer 3')
            title('refraction index = 4')
            grid
            
            figure
            %Find maximum width:
            widthTotal=sum(widths');
            maxWidth=max(widthTotal);
            yInterfacesTem=cumsum(widths');
            zeroInterface=zeros(1,length(phaseAngleDeg));
            yInterfacesA=-[zeroInterface;yInterfacesTem];
            %In order to place the center of each at the same point:
            yInterfacesA=yInterfacesA+widthTotal/2;
            %This provides the negative values of the interfaces relative to y=0.
            %But we want the interfaces relative to -maxWidth.  So subtract an amount
            %equal to the maxWidth minus the local widthTotal.
            %amountToSubtract=maxWidth-widthTotal;
            %yInterfaces=yInterfacesA-amountToSubtract;
            hlayers=plot(phaseAngleDeg,yInterfacesA);
            xlabel('phase (deg)')
            ylabel('interface location')
            legend('incident interface','interface 1','interface 2','interface 3')
            title('refraction index = 4')
            grid
        end
        
        function handles = plotbfFile(app, fileName, handles)
            global layersFig
            layersFig=handles.figure1;
            [eta,totalThickness,epsbfdim,eps,tanDelta,gamFileName]=readbfFile(app, fileName);
            handles.gamFileName=gamFileName;
            set(handles.gamFileNameText,'String',handles.gamFileName)
            handles.eps=[eps;1];
            handles.conductivity=[tanDelta;0];
            handles.numMedia=length(handles.eps);
            %give the figure the name of the bf file.
            kk=strfind(fileName,'.');
            figName=fileName(1:kk-1);
            figure('Name',figName);
            plot(totalThickness,eta,'.k','markersize',8)
            xlabel('total thickness')
            ylabel('\eta^\rho_1')
            grid
            %
            %
            %Place pushbutton on bf figure
            unitscur=get(gca,'units');
            set(gca,'units','pixels')
            pos=get(gca,'position');
            %Get distance from left end of figure window to right end of axis,
            %and from bottom of window to top of axis.
            distToAxisRight=pos(1)+pos(3);
            distToAxisTop=pos(2)+pos(4);
            buttonWidth=70;
            buttonHeight=20;
            buttony=distToAxisTop+5;
            buttonx=fix(distToAxisRight/2)-fix(buttonHeight/2);
            handles.layerConfig=uicontrol(gcf,'Style','pushbutton',...
                'Units','Pixels','String','Choose point',...
                'TooltipString','Enter a mode that will allow a point to be chosen for which the configuration will be drawn, right click to end.',...
                'Position',[buttonx buttony buttonWidth buttonHeight]);
            hObject=handles.layerConfig;
            set(gca,'units',unitscur)
            %set(hObject,'callback',{@app.layerConfig_Callback})
            set(hObject,'callback',@app.layerConfig_Callback)
        end


        function handles = readOptFile(app, handles)
            FileName=get(handles.dataFileText,'String');
            fid=fopen(FileName);
            %Find the date-time stamps and the number of modes for each
            %date-time stamp. The date-time stamp is identified by the line
            %with the ":".
            tline=fgetl(fid);
            while ~contains(tline,':')
                tline=fgetl(fid);
                if tline==-1
                    break
                end
            end
            %The pointer is at a line with a ":".
            dateTimeVal=tline;
            %The number of modes is the number of times this dateTimeVal is
            %encountered in the file. So keep searching for other
            %instances.
            nModes=0;
            dateTimeValNext=dateTimeVal;
            while strcmp(dateTimeVal,dateTimeValNext)
                nModes=nModes+1;
                tline=fgetl(fid);
                nLines=1;
                while ~contains(tline,':')
                    tline=fgetl(fid);
                    nLines=nLines+1;
                    if tline==-1
                        break
                    end
                end
                if tline==-1
                    break
                end
                %The pointer is at a line with a ":".
                dateTimeValNext=tline;
            end
            %There are nModes. Compile the list of date-time stamps.
            %
            frewind(fid)
            nCase=0;
            while ~feof(fid)
                nCase=nCase+1;
                for n=1:nModes
                    tline=fgetl(fid);
                    while ~contains(tline,':')
                        tline=fgetl(fid);
                        if tline==-1
                            break
                        end
                    end
                    if tline==-1
                        break
                    end
                    %The pointer is at a line with a ":".
                    %Skip 2 lines to get to the efficiency result.
                    dateTimeVal=tline;
                    if n==1
                        %dateTimeVec(nCase,:)=dateTimeVal;
                        %We want this vector to be a string array, not a
                        %character array. (Didn't know there was a
                        %difference.)
                        dateTimeVec(nCase)=string(dateTimeVal);
                    end
                end
            end
            %Open a drop-down menu with the dateTimeVec values displayed,
            %which can be chosen.
            %dt=uidropdown("Items",dateTimeVec);
            [indx,tf]=listdlg('PromptString','Choose one.',...
                'SelectionMode','single','ListString',dateTimeVec);
            if ~tf
                fclose(fid);
                return
            end
            %Search for the entries corresponding to dateTimeVec(indx).
            frewind(fid)
            %while ~feof(fid)
            %Move pointer past indx-1 timestamps.
            for m=1:indx-1
                for n=1:nModes
                    tline=fgetl(fid);
                    while ~contains(tline,':')
                        tline=fgetl(fid);
                    end
                    %The pointer is at a line with a ":".
                    dateTimeVal=string(tline);
                end
            end
            %The next nModes sections are those we want to load.
            modeNumber=zeros(nModes,1);
            tline=fgetl(fid);
            for n=1:nModes
                %tline=fgetl(fid);
                while ~contains(tline,':')
                    tline=fgetl(fid);
                end
                %The pointer is at a line with a ":".
                %Skip 2 lines to get to the efficiency result.
                dateTimeVal=string(tline);
                %Make sure this is the same as the one chosen.
                if ~strcmp(dateTimeVal,dateTimeVec(indx))
                    msgbox('time stamps different')
                    fclose(fid);
                    return
                end
                for m=1:5
                    %The last number above may need changing in the future.
                    tline=fgetl(fid);
                    if m==2
                        %Get the mode number (e.g. -3, -2, etc.)
                        c=textscan(tline,'%f');
                        cmat=cell2mat(c);
                        modeNumber(n)=cmat;
                    end
                end
                %okay, the next line begins the data file
                %The data file will extend until the line with the next
                %time stamp (or EOF). Form the matrix, and create a file
                %from it. The number of lines in a complete cycle of the
                %file is nLines.
                nLinesData=nLines-6;
                outData=zeros(nLinesData,7);
                for m=1:nLinesData
                    tline=fgetl(fid);
                    c=textscan(tline,'%f');
                    cmat=cell2mat(c);
                    outData(m,:)=cmat;
                end    
                filenameMakor=[char(dateTimeVec(indx)) '-' num2str(n) '.dat'];
                filenameNew=replace(filenameMakor,':','-');
                filenameNew=replace(filenameNew,' ','-');
                save(filenameNew,'outData','-ascii')
                fileNameDim(n,:)=filenameNew;
            end
            fclose(fid);
            %
            %
            %Load the data files
            undefinePushButtonCallback(app);
            app.wireOffsetCheckBox.Value=1;
            app.NomodesSpinner.Value=nModes;
            app.modenoSpinner.Limits=[1,nModes];
            for n=1:nModes
                set(handles.dataFileText,'String',fileNameDim(n,:))
                handles=readDataFile(app, handles);
                app.targetOptimModeSpinner.Value=modeNumber(n);
                handles=getModesForOptimization(app, handles);
                handles=drawMedia(app, handles);
                app.modenoSpinner.Value=n;
                handles=optimModeSeqNumEdit_Function(app, handles);
                handles = saveTargetModeInfo(app,handles,n);
            end
        end

        function loadDatFileWithoutDialog(app, fullFileName)
            % Loads a .dat file without UI dialog.
            % Ensures handles struct exists before calling readDataFile.

            handles = guidata(app.figure1);
            if isempty(handles)
                handles = struct();  % fresh bootstrap
            end

            % Store full path (important if readDataFile expects relative vs full)
            if isprop(app,'dataFileText')
                % Some code uses get(handles.dataFileText,'String'), so keep that in sync.
                set(handles.dataFileText,'String', fullFileName);
                % If app.dataFileText.Text is also used elsewhere (App Designer style):
                try
                    app.dataFileText.Text = fullFileName;
                catch
                end
            end

            handles = readDataFile(app, handles);  % existing parser + setup
            guidata(app.figure1, handles);
        end


        function handles = readDataFile(app, handles)
            %function handles=readDataFile(handles,isTransposed)
            %Save some of the old data for possible use later.
            isWirePrev=handles.isWire;
            wireHorizOffsetPrev=handles.wireHorizOffset;
            %
            FileName=get(handles.dataFileText,'String');
            %Read file
            %outDataA=importdata(FileName,' ',1);
            %outDataA=importdata(FileName,' ');
            %outData=outDataA.data;
            outData=importdata(FileName,' ');
            sizeoutData=size(outData);
            %This programming allows data files to be read even if they are in
            %"transposed" state. It is desired to change the "transposed" state to the
            %standard state, which will be characterized by outData containing 7
            %columns. This should be the standard storage. But since the programming
            %logic was developed for outdata having 7 rows, it must be transferred to
            %that form.
            %if isTransposed
            if sizeoutData(2)==7  %7 columns
                if sizeoutData(1)==7
                    %If there are also 7 rows, then we don't know whether or not to
                    %transpose the matrix. So consider something else.
                    if outData(1,6)==0 && outData(1,7)==0
                        outData=outData.'; %transformed to 7 rows.
                    end
                else
                    outData=outData.'; %transformed to 7 rows.
                end
            end
            %
            sizeoutData=size(outData);
            handles.numMedia=sizeoutData(2);
            handles.mediumNumber=1;
            handles.incAngDeg=outData(1,1);
            handles.n=[outData(1,2:end)';1];
            handles.eps=handles.n.*handles.n;
            handles.ThetInDeg=outData(2,1);
            handles.ThetOutDeg=outData(3,1);
            nfloq=outData(4,1);
            if nfloq>0
                app.NoFloqmdsSpinner.Value=nfloq;
            end
            app.currentFloqMode=0;
            app.currentFloqmdSpinner.Value=app.currentFloqMode;
            handles.conductivity=[outData(2,2:end)';0];  %This is tan delta.  The first entry is a dummy.
            handles.mu=ones(handles.numMedia,1);
            handles.hOverWL=outData(3,2:end)';
            handles.isWire=outData(4,2:end);
            isWk=outData(5,1);
            if isWk
                %If the LUT window is open, close it.  This is because it
                %was opened when the app and handles structures were
                %different, and come functions utilize those old
                %structures. To prevent this, it is closed now and if opened, 
                %will have the proper updated data.
                delete(app.LUTappRef)
                app.LUTCheckBox.Value=0;
                app.LUTCheckBox.Enable=1;
                app.isJCross=outData(6,1);
                app.WkCheckBox.Value=1;
                %Define the switch case expressions in Wk2Z.
                switchCaseExpressions(app,handles.isWire);
                handles.Wk=outData(5,2:end);
                handles.wireDistImped=zeros(1,handles.numMedia-1);
                handles.realZ=zeros(1,handles.numMedia-1);
                for ii=1:handles.numMedia-1
                    if handles.isWire(ii)==1
                        Z=Wk2Z(app,ii,handles.Wk(ii));
                        handles.wireDistImped(ii)=imag(Z);
                        handles.realZ(ii)=real(Z);
                    end
                end
                app.WkAtWL1=handles.Wk;
            else    
                app.WkCheckBox.Value=0;
                handles.wireDistImped=outData(5,2:end);
                app.wireWkmilEdit.Value=' ';
            end
            handles.wireHorizOffset=outData(6,2:end);
            handles.distCoupledTo=zeros(size(handles.wireHorizOffset));
            %
            handles.nCoupledTo=1:handles.numMedia-1;
            handles.isPossibleCoupling=false;
            handles.includeInOptim=ones(handles.numMedia-1,1);
            %Turn off includeInOptim for media with 0 width except for wires.
            zeroWidthInd=find(handles.hOverWL==0);
            %wireInd=find(handles.isWire);
            wireInd=find(handles.isWire==1);
            removeFromOptimInd=setdiff(zeroWidthInd,wireInd);
            handles.includeInOptim(removeFromOptimInd)=0;
            %
            handles.wireStripWidth=outData(7,2:end);
            %set(handles.mediumNumberEdit,'String',num2str(handles.mediumNumber))
            app.MediumnoSpinner.Value=handles.mediumNumber;
            %set(handles.numMediaEdit,'String',num2str(handles.numMedia))
            handles.numMediaEdit.Value=handles.numMedia;
            set(handles.waveDirectionEdit,'String',num2str(handles.incAngDeg))
            if isWk
                handles.d=outData(3,1);
            else    
                handles.DELsin=abs(sind(handles.ThetInDeg)-sind(handles.ThetOutDeg));
                %handles.d=handles.WL/handles.DELsin;  %period
                handles.d=1/handles.DELsin;  %period
            end
            %
            %Save these parameters which have dimensions length/wavelength
            %for cases in which the wavelength might be changed.
            app.dAtWL1=handles.d;
            app.hOverWLAtWL1=handles.hOverWL;
            app.wireStripWidthAtWL1=handles.wireStripWidth;
            app.wireDistImpedAtWL1=handles.wireDistImped;
            %app.WkAtWL1=handles.Wk;  %This was placed above in "if isWk"
            %
            %set(handles.periodText,'String',num2str(handles.d))
            app.periodEditField.Value=handles.d;
            handles=setNewMediumFrame(app, handles);
            %set(handles.coupleMedium1Edit,'String','1')
            %set(handles.coupleMedium2Edit,'String','1')
            %
            %
            handles.HankelSum=sumHankel(app, handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
            nTermsFQ=app.NoFloqmdsSpinner.Value;
            handles.GAMMAMGReflect=NaN(nTermsFQ,nTermsFQ,handles.numMedia-1);
            handles.GAMMAMGTransmit=NaN(nTermsFQ,nTermsFQ,handles.numMedia-1);
            handles.inductDiff=zeros(handles.numMedia-1,1);
            handles.distImpedFac=1;
            if isWk
                eta=376.730313668;
                for ii=1:handles.numMedia-1
                    handles.realZtilde=handles.realZ(ii)*eta/handles.WL;
                    handles=mgGAMMA(app, handles,ii);
                end
                getWkmax(app);
            else
                for ii=1:handles.numMedia-1
                    handles=mgGAMMA(app, handles,ii);
                end
            end
            handles=incidentWaves(app,handles);
            handles=drawMedia(app, handles);
            setFloqAngleText(app, handles)
            %handles.wireHorizOffsetMode1=handles.wireHorizOffset;
            %handles.wireHorizOffsetMode2=handles.wireHorizOffset;
            %swm April 2023 I think the following checkbox is no longer used.
            if get(handles.compareLocCheckBox,'Value')
                avgLocDif=LocDiff(app, isWirePrev,wireHorizOffsetPrev,handles.isWire,handles.wireHorizOffset);
                set(handles.avgLocDif,'String',num2str(avgLocDif))
            end
        end


        function handles=readxmtFile(app,handles,FileName)
            %integrate into the program the transmitter data previously
            %saved on file FileName.
            xmtData=importdata(FileName,' ');
            %Divide this into PincMag and PincPhaseDeg
            sizexmt=size(xmtData);
            mWaves=sizexmt(1)/2;
            nModes=sizexmt(2);
            %Check and warn if this data is incompatible with what is
            %currently being considered in this run.  The number of waves
            %mWaves must be the same in order to continue.  
            mWavesCur=length(handles.modeNumberPropagating);
            if mWaves~=mWavesCur
                msgbox('Number of propagating waves inconsistent.')
                return
            end
            handles.PincMagDim=xmtData(1:mWaves,:);
            handles.PincPhaseDegDim=xmtData(mWaves+1:2*mWaves,:);
            %
            %Now make the number of target modes of the run compatible with
            %the number of target modes on the xmt file.
            undefinePushButtonCallback(app);
            app.wireOffsetCheckBox.Value=1;
            app.NomodesSpinner.Value=nModes;
            app.modenoSpinner.Limits=[1,nModes];
            for n=1:nModes
                app.targetOptimModeSpinner.Value=handles.modeNumberPropagating(n);
                handles=getModesForOptimization(app, handles);
                handles=drawMedia(app, handles);
                app.modenoSpinner.Value=n;
                handles=optimModeSeqNumEdit_Function(app, handles);
                handles = saveTargetModeInfo(app,handles,n);
            end
            %Set current value of Pinc
            modeNum=app.modenoSpinner.Value;
            handles.PincMag=handles.PincMagDim(:,modeNum);
            handles.PincPhaseDeg=handles.PincPhaseDegDim(:,modeNum);
            incAngDegFloq=handles.incAngDegFloq;
            isPropagating=~isnan(incAngDegFloq);
            nPropagating=find(isPropagating);
            thetaIncDegDim=incAngDegFloq(nPropagating);
            nFloq=length(incAngDegFloq);
            handles=manipIncWaves(app,handles.PincMag,handles.PincPhaseDeg,thetaIncDegDim,nFloq,nPropagating,handles);
            nPropagatingWaves=length(thetaIncDegDim);
            %Set sliders etc.
            for ii=1:nPropagatingWaves
                eval(['app.incWaveSlider' num2str(ii) '.Value=handles.PincMag(' num2str(ii) ');'])
                eval(['app.incWave' num2str(ii) 'EditNumeric.Value=handles.PincMag(' num2str(ii) ');'])
                eval(['app.incWave' num2str(ii) 'EditPhase.Value=handles.PincPhaseDeg(' num2str(ii) ');'])
            end
            %
            if app.FloqincwavesCheckBox.Value
                handles=drawMedia(app, handles);
                %handles=drawIncArrow(app, handles);
            end
        end    

        
        function [eta, totalThickness, epsbfdim, eps, tanDelta, gamFileName] = readbfFile(app, fileName)
            fid=fopen(fileName);
            tline = fgetl(fid);
            gamFileName=strtrim(tline);
            %
            tline = fgetl(fid);
            c=textscan(tline,'%f');
            cmat=cell2mat(c);
            eps=cmat;
            %
            tline = fgetl(fid);
            c=textscan(tline,'%f');
            cmat=cell2mat(c);
            tanDelta=cmat;
            ii=0;
            while true    %
                tline = fgetl(fid);
                if tline==-1
                    break
                end
                c=textscan(tline,'%f');
                cmat=cell2mat(c);
                ii=ii+1;
                eta(ii)=cmat(1);
                totalThickness(ii)=cmat(2);
                epsbfdim(ii,:)=cmat(3:end);
            end
            fclose(fid);
        end
        
        function handles = readgamFile(app, handles, FileName)
            %Get information on the size of the GAMMA file, and whether it is only for
            %reflection or for reflection and refraction together.
            app.currentFloqMode=0;
            app.currentFloqmdSpinner.Value=app.currentFloqMode;
            fid=fopen(FileName);
            %Read up to the GAMMA data.
            for ii=1:6
                tline = fgetl(fid);
            end
            %Now the first line of the S-params.
            tline = fgetl(fid);
            c=textscan(tline,'%f');
            cmat=cell2mat(c);
            nModes=length(cmat)/2;
            %Get passed the remaining modes for reflection.
            for ii=1:nModes-1
                tline = fgetl(fid);
            end
            %Now determine if there are refracted modes.
            tline = fgetl(fid);
            if ~ischar(tline) || isempty(strip(tline))
                isRefraction=false;
                set(handles.optimizeReflectionCheckBox,'Enable','off')
            else
                isRefraction=true;
                set(handles.optimizeReflectionCheckBox,'Enable','on')
            end
            fclose(fid);
            %
            %Now start from the beginning again.
            fid=fopen(FileName);
            %
            tline = fgetl(fid);
            c=textscan(tline,'%f');
            cmat=cell2mat(c);
            thetaInc=cmat(1);
            %
            tline = fgetl(fid);
            c=textscan(tline,'%f');
            cmat=cell2mat(c);
            thetaRef=cmat(1);
            %
            tline = fgetl(fid);
            c=textscan(tline,'%f');
            cmat=cell2mat(c);
            psiInc=cmat(1);
            %
            tline = fgetl(fid);
            c=textscan(tline,'%f');
            cmat=cell2mat(c);
            nPropagatingModes=cmat(1);
            %
            tline = fgetl(fid);
            c=textscan(tline,'%f');
            cmat=cell2mat(c);
            yMax=cmat(1);
            %
            tline = fgetl(fid);
            c=textscan(tline,'%f');
            cmat=cell2mat(c);
            psiRef=cmat(1:nPropagatingModes);
            incAngDegFloq=NaN(nModes,1);
            %incAngDegFloq=NaN(5,1);
            %n0=3; %The middle of the 5.
            fixnModes2=fix(nModes/2);
            n0=fixnModes2+1; %The middle of the 5.
            %We want to form incAngDegFloq from the psiRef so that the value of
            %psiRef that is equal to psiInc is at position n0.
            ipos=find(psiRef==psiInc);
            i1=n0-ipos+1;
            i2=i1+nPropagatingModes-1;
            incAngDegFloq(i1:i2)=psiRef;
            %
            %The manner in which the GAMMA data is listed. If iFormat=1, then only
            %the propagating S-parameters are given, from which GAMMA is obtained.
            %If iFormat=2, then GAMMA is given directly and can contain evanescent
            %components.
            %
            isDraw=false;
            waveLength=1;
            DELsin=abs(sind(thetaRef)-sind(thetaInc));
            handles.ThetInDeg=thetaInc;
            handles.incAngDeg=handles.ThetInDeg;
            set(handles.waveDirectionEdit,'String',num2str(handles.incAngDeg))
            handles.ThetOutDeg=thetaRef;
            handles.DELsin=DELsin;
            d=waveLength/DELsin;  %period
            %It is assumed that nPropagationModes<=5.
            %nModes=5;
            GAMMA=zeros(nModes,nModes);
            %
            %
            if get(handles.TERadioButton,'Value')
                pol='TE';
            else
                pol='TM';
            end
            %ppRef=-2:2;   %indeces of reflection angles.
            ppRef=-fixnModes2:fixnModes2;
            sinPsiIncOrig=sind(psiInc);
            sinPsi=sinPsiIncOrig+ppRef'*DELsin;
            cosPsi=sqrt(1-sinPsi.*sinPsi);
            SPar=zeros(nModes,nModes);
            for ii=1:nModes
                tline = fgetl(fid);
                c=textscan(tline,'%f');
                cmat=cell2mat(c);
                SParReIm=cmat(1:2*nModes);
                SPar(ii,:)=SParReIm(1:2:2*nModes)+1i*SParReIm(2:2:2*nModes);
            %     if ii==3
            %         isDraw=true;
            %     else
            %         isDraw=false;
            %     end
                %GAMPartial=SPar2rhoA(sinPsi(ii),cosPsi(ii),sinPsi,cosPsi,SPar(ii,:).',yMax,isDraw,waveLength,d,pol);
                GAMPartial=SPar2rhoA(sinPsi(ii),cosPsi(ii),sinPsi,cosPsi,SPar(ii,:).',yMax,isDraw,waveLength,d,pol,ppRef(ii));
                GAMMA(ii,:)=GAMPartial;
            end
            %
            if isRefraction
                GAMMARefract=zeros(nModes,nModes);
                for ii=1:nModes
                    tline = fgetl(fid);
                    c=textscan(tline,'%f');
                    cmat=cell2mat(c);
                    SParReIm=cmat(1:2*nModes);
                    SPar(ii,:)=SParReIm(1:2:2*nModes)+1i*SParReIm(2:2:2*nModes);
                %     if ii==3
                %         isDraw=true;
                %     else
                %         isDraw=false;
                %     end
                    %GAMPartial=SPar2rhoA(sinPsi(ii),cosPsi(ii),sinPsi,cosPsi,SPar(ii,:).',yMax,isDraw,waveLength,d,pol);
                    GAMPartial=SPar2tauA(sinPsi(ii),cosPsi(ii),sinPsi,cosPsi,SPar(ii,:).',yMax,isDraw,waveLength,d,pol);
                    GAMMARefract(ii,:)=GAMPartial;
                end
                handles.GAMMARefract=GAMMARefract;
            end
            %
            fclose(fid);
            %
            %
            handles.isRefraction=isRefraction;
            handles.d=d;
            %set(handles.periodText,'String',num2str(d))
            app.periodEditField.Value=d;
            handles.incAngDeg=psiInc;
            set(handles.waveDirectionEdit,'String',num2str(psiInc))
            app.NoFloqmdsSpinner.Value=nModes;
            %handles.GAMMA=conj(GAMMA);
            handles.GAMMA=GAMMA;
            handles.incAngDegFloq=incAngDegFloq;
            handles=drawMedia(app, handles);
            %The number of modes has changed, so redefine metagrating gamma.
            handles.GAMMAMGReflect=NaN(nModes,nModes,handles.numMedia-1);
            handles.GAMMAMGTransmit=NaN(nModes,nModes,handles.numMedia-1);
            handles.inductDiff=zeros(handles.numMedia-1,1);
            setFloqAngleText(app, handles)
        end
        
        function handles = reconfigLayers(app, handles)
            %handles.eps, handles.numMedia and handles.hOverWL and handles.conductivity must be set before
            %entering this function.
            handles.mediumNumber=1;
            handles.incAngDeg=0;
            handles.n=sqrt(handles.eps);
            %handles.conductivity=zeros(handles.numMedia,1);
            handles.mu=ones(handles.numMedia,1);
            handles.includeInOptim=ones(handles.numMedia-1,1);
            handles.isWire=zeros(handles.numMedia-1,1);
            handles.wireDistImped=zeros(handles.numMedia-1,1);
            handles.wireHorizOffset=zeros(handles.numMedia-1,1);
            handles.distCoupledTo=zeros(handles.numMedia-1,1);
            handles.wireStripWidth=0.00677*ones(handles.numMedia-1,1);
            %set(handles.mediumNumberEdit,'String',num2str(handles.mediumNumber))
            %set(handles.numMediaEdit,'String',num2str(handles.numMedia))
            handles.numMediaEdit.Value=handles.numMedia;
            %set(handles.incAngDegEdit,'String',num2str(handles.incAngDeg));
            set(handles.epsEdit,'String',num2str(handles.eps(handles.mediumNumber)))
            set(handles.nText,'String',num2str(handles.n(handles.mediumNumber)))
            set(handles.waveDirectionEdit,'String',num2str(handles.incAngDeg))
            set(handles.thickEdit,'String',num2str(handles.hOverWL(handles.mediumNumber)))
            set(handles.includeInOptimizationCheckBox,'Value',handles.includeInOptim(handles.mediumNumber))
            set(handles.isWireCheckBox,'Value',handles.isWire(handles.mediumNumber)==1)
            set(handles.wireTypeRadioButton,'Value',handles.isWire(handles.mediumNumber)==1)
            set(handles.wireDistImpedEdit,'String',num2str(handles.wireDistImped(handles.mediumNumber)))
            if app.WkCheckBox.Value && isfield(handles,'Wk')
                app.wireWkmilEdit.Value=num2str(handles.Wk(handles.mediumNumber));
                app.realZLabel.Text=num2str(handles.realZ(handles.mediumNumber),3);
            end
            set(handles.wireHorizOffsetEdit,'String',num2str(handles.wireHorizOffset(handles.mediumNumber)))
            set(handles.wireStripWidthEdit,'String',num2str(handles.wireStripWidth(handles.mediumNumber)))
                %Implement the gam file
                gamFileName=handles.gamFileName;
                handles=readgamFile(app, handles,gamFileName);
        end
        
        function handles = runMainA(app, handles)
            %global isdoChange
            if ~get(handles.computeCheckBox,'Value')
                return
            end
            %If during optimization, there are groupings or constraints.
            handles=doGroup(app, handles);
            %
            k0=handles.k0;
            mu=handles.mu(1:handles.numMedia);
            %eps=handles.eps(1:handles.numMedia);
            %eps=handles.eps(1:handles.numMedia)+1i*handles.conductivity(1:handles.numMedia)/(handles.omega*handles.eps0);
            %Assume conductivity is delta (as in tan delta ~ delta.
            %eps=handles.eps(1:handles.numMedia).*sqrt(1+1i*handles.conductivity(1:handles.numMedia));
            %I don't know where the equation above came from.  Instead of the above,
            %assume the conductivity variable is actually tan(delta).
            eps=handles.eps(1:handles.numMedia).*(1+1i*handles.conductivity(1:handles.numMedia));
            k=[k0;k0*sqrt(mu.*eps)];
            k(mu<0)=-k(mu<0);
            %zj=[0;cumsum(-handles.hOverWL(1:handles.numMedia-1))*handles.WL];
            %swm In this version, the layer thickness remains unchanged when wavelength
            %changes. Dec. 2023.
            zj=[0;cumsum(-handles.hOverWL(1:handles.numMedia-1))];
            incAngleDeg=handles.incAngDeg;
            numMedia=handles.numMedia+1;
            if get(handles.FloquetCheckBox,'Value')
                nTermsFQ=app.NoFloqmdsSpinner.Value;
                handles.isFloquet=true;
                %Set up Floquet params.
                maxMode=fix(nTermsFQ/2);
                nVec=-maxMode:maxMode;
                n0=maxMode+1;     %nVec(n0) represents mode 0.
                d=handles.d;
                %handles.GAMMA=[];
                isMetagrating=get(handles.metagratingCheckBox,'Value');
                if (~isMetagrating && ~isempty(handles.GAMMA)) || isMetagrating
                    if isMetagrating
                        GAMMAMGReflect=handles.GAMMAMGReflect;
                        GAMMAMGTransmit=handles.GAMMAMGTransmit;
                        inductDiff=handles.inductDiff;
                    else
                        GAMMA=handles.GAMMA;
                    end
                    incAngDegFloq=handles.incAngDegFloq;
                    isPropagating=~isnan(incAngDegFloq);
                    nPropagating=find(isPropagating);
                else
                    %
                    %Floquet, but not metagrating.
                    %For the phase gradient reflecting surface,
                    %get incAngleDeg1, GAMMA00,GAMMA01,GAMMA10,GAMMA11.
                    %Start by getting the Floquet components rho.
                    handles.isRefraction=false;
                    set(handles.optimizeReflectionCheckBox,'Enable','off')
                    [nPropagating,isPropagating,rho,alfaIn,beta1]=mainDesignReflec(k0,incAngleDeg,nTermsFQ,d,nVec);
                    GAMMA=zeros(nTermsFQ,nTermsFQ);
                    GAMMA(n0,:)=rho;
                    lenNpropagating=length(nPropagating);
                    SPar=zeros(lenNpropagating,lenNpropagating);
                    %GAMMA(n0,n0-1:n0+1)=rho(n0-1:n0+1);
                    incAngDegFloq=NaN(nTermsFQ,1);
                    incAngDegFloq(n0)=incAngleDeg;
                    for m=nPropagating(1):nPropagating(end)
                        if m~=n0
                            incAngDegFloq(m)=atan2d(alfaIn(m),beta1(m));
                            mDif=m-n0;
                            maxModeTem=maxMode+abs(mDif);
                            nVecTem=-maxModeTem:maxModeTem;
                            nTermsFQTem=2*maxModeTem+1;
                            n0Tem=maxModeTem+1;
                            [~,~,rhoTem,~,~]=mainDesignReflec(k0,incAngDegFloq(m),nTermsFQTem,d,nVecTem);
                            %We want to line up rho(n0Tem) with position m.
                            GAMMA(m,:)=rhoTem(n0Tem-mDif-maxMode:n0Tem-mDif+maxMode);
                        end
                    end
                    %Compute SPar for debugging
                    mm=0;
                    nn=nPropagating(1):nPropagating(end);
                    for m=nn
                        mm=mm+1;
                        SPar(mm,:)=GAMMA(m,nn).*sqrt(cosd(incAngDegFloq(nn)')/cosd(incAngDegFloq(m)));
                    end
                    handles.incAngDegFloq=incAngDegFloq;
                    %End Compute SPar for debugging
                end
                %
            %     %Make sure that the optimization controls which determine which Floquet
            %     %component to optimize (i.e. m1FloqModeToOptimize,
            %     %zeroFloqModeToOptimize, p1FloqModeToOptimize) is compatible with
            %     %nPropagating. Otherwise, change the component to zero mode. (I assume
            %     %there will always be a zero mode.)
            %     nPropFloqModes=nVec(nPropagating);
            %     if get(handles.m1FloqModeToOptimize,'Value')
            %         if ~any(nPropFloqModes==-1)
            %             set(handles.zeroFloqModeToOptimize,'Value',1)
            %         end
            %     end
            %     if get(handles.p1FloqModeToOptimize,'Value')
            %         if ~any(nPropFloqModes==1)
            %             set(handles.zeroFloqModeToOptimize,'Value',1)
            %         end
            %     end
                %
                handles.nPropagating=nPropagating;
                %Use the info gleaned up to now to determine the effect of a layered
                %dielectric slab over the periodic phase-gradient reflecting surface.
                epsa=[1;eps];
                if get(handles.TERadioButton,'Value')
                    %For TE, the mu is used in place of the eps, but mu=1.
                    epsa=ones(size(epsa));
                end
                if isMetagrating
                    %if isdoChange
                        [rhoFloq,sigmaAFloq,sigmaBFloq,tauFloq,alfa,beta,residual,alfaFloq,betaFloq,ABsumForCurrent]=...
                             mainBotFloquetMG3(k,epsa,zj,numMedia-1,incAngleDeg,GAMMAMGReflect,GAMMAMGTransmit,...
                             d,nVec,handles.incAngDegFloq,handles.isWire);
                    % else
                    %     [rhoFloq,sigmaAFloq,sigmaBFloq,tauFloq,alfa,beta,residual,alfaFloq,betaFloq,ABsumForCurrent]=...
                    %          mainBotFloquetMG(k,epsa,zj,numMedia-1,incAngleDeg,GAMMAMGReflect,GAMMAMGTransmit,...
                    %          d,nVec,handles.incAngDegFloq,handles.isWire);
                    % end
            %         [rhoFloq,sigmaAFloq,sigmaBFloq,tauFloq,alfa,beta,residual,alfaFloq,betaFloq,ABsumForCurrent]=...
            %              mainBotFloquetMG1(k,epsa,zj,numMedia-1,incAngleDeg,GAMMAMGReflect,GAMMAMGTransmit,...
            %              d,nVec,handles.incAngDegFloq,handles.isWire);
                    %handles.CurrentI=abs(ABsumForCurrent./handles.inductDiff);
                    %conductorLosses(handles);
                     %NOTE NOTE NOTE The fact that there is an argument numMedia-1 is
                     %because for some reason I set numMedia to numMedia+1 (and I don't
                     %remember why).
                else
                    [rhoFloq,sigmaAFloq,sigmaBFloq,tauAFloq,tauBFloq,alfa,beta,residual,alfaFloq,betaFloq]=...
                        mainBotFloquetA(k,epsa,zj,numMedia,incAngleDeg,GAMMA,d,nVec,handles.incAngDegFloq);
                end
                nCurMd=find(nVec==app.currentFloqMode);
                rho=rhoFloq(nCurMd);
                if isempty(sigmaAFloq)
                    sigmaA=[];
                    sigmaB=[];
                else
                    sigmaA=sigmaAFloq(:,nCurMd);
                    sigmaB=sigmaBFloq(:,nCurMd);
                end
                %only keep the values of incAngDegFloq and rhoFloq for propagating
                %waves.
                incAngDegFloqPropagating=incAngDegFloq(nPropagating);
                rhoFloqPropagating=rhoFloq(nPropagating);
                tau=0;
                powTot=0;
                cosdInc=cosd(incAngleDeg);
                if handles.isRefraction
                    if isMetagrating
                        handles.tauFloq=tauFloq;
                    else
                        handles.tauFloq=(handles.GAMMARefract.'*tauAFloq.').';
                        handles.tauAFloq=tauAFloq;
                        handles.tauBFloq=tauBFloq;
                    end
                    tauFloqPropagating=handles.tauFloq(nPropagating);
                    for ii=1:length(nPropagating)
                        powTot=powTot+abs(tauFloqPropagating(ii))^2*cosd(incAngDegFloqPropagating(ii))/cosdInc;
                    end
                    tau=handles.tauFloq(nCurMd);
                end
                for ii=1:length(nPropagating)
                    %n=nPropagating(ii);
                    powTot=powTot+abs(rhoFloqPropagating(ii))^2*cosd(incAngDegFloqPropagating(ii))/cosdInc;
                end
                handles.alfaFloq=alfaFloq;
                handles.betaFloq=betaFloq;  %Note: first row is incidence region.
                handles.rhoFloq=rhoFloq;
                handles.sigmaAFloq=sigmaAFloq;
                handles.sigmaBFloq=sigmaBFloq;
                handles.incAngDegFloqDraw=incAngDegFloqPropagating;
                handles.modeNumberPropagating=nVec(nPropagating);
                %app.NomodesSpinner.Limits=[1 length(handles.modeNumberPropagating)];
                set(handles.powerConsText,'String',num2str(powTot))
            else
                handles.isFloquet=false;
                if get(handles.isBotAirCheckBox,'Value')
                    if get(handles.TERadioButton,'Value')
                        mu=[1;mu];
                        [rho,sigmaA,sigmaB,tau,alfa,beta,residual]=mainBot(k,incAngleDeg,mu,zj,numMedia);
                    else
                        eps=[1;eps];
                        [rho,sigmaA,sigmaB,tau,alfa,beta,residual]=mainBot(k,incAngleDeg,eps,zj,numMedia);
                    end
                else
                    %The bottom is PEC (not air)
                    if get(handles.TERadioButton,'Value')
                        isTE=true;
                        mu=[1;mu];
                        [rho,sigmaA,sigmaB,tau,alfa,beta,residual]=mainBotPEC(k,incAngleDeg,mu,zj,numMedia,isTE);
                    else
                        isTE=false;
                        eps=[1;eps];
                        [rho,sigmaA,sigmaB,tau,alfa,beta,residual]=mainBotPEC(k,incAngleDeg,eps,zj,numMedia,isTE);
                    end
                end
                powTot=abs(rho)^2+abs(tau)^2;
                set(handles.powerConsText,'String',num2str(powTot))
            end
            handles.rho=rho;
            %handles.rhoAnomReflec=rhoAnomReflec;
            
            handles.tau=tau;
            if isempty(sigmaA)
                handles.sigmaA=sigmaA;
                handles.sigmaB=sigmaB;
            else
                handles.sigmaA=sigmaA(1:handles.numMedia-1);
                handles.sigmaB=sigmaB(1:handles.numMedia-1);
            end
            handles.beta=beta(2:handles.numMedia+1);
            handles.alfa=alfa;
            handles.k=k(2:handles.numMedia+1);
            handles.residual=residual;
            handles=fillInResults(app, handles);
        end




        function handles = runMain(app, handles)
            %This is the same as runMainA, but meant only for metagratings.
            if ~get(handles.computeCheckBox,'Value')
                return
            end
            %If during optimization, there are groupings or constraints.
            handles=doGroup(app, handles);
            %
            k0=handles.k0;
            mu=handles.mu(1:handles.numMedia);
            %assume the conductivity variable is actually tan(delta).
            eps=handles.eps(1:handles.numMedia).*(1+1i*handles.conductivity(1:handles.numMedia));
            k=[k0;k0*sqrt(mu.*eps)];
            k(mu<0)=-k(mu<0);
            epsa=[1;eps];
            if get(handles.TERadioButton,'Value')
                %For TE, the mu is used in place of the eps, but mu=1.
                epsa=ones(size(epsa));
            end
            %swm In this version, the layer thickness remains unchanged when wavelength
            %changes. Dec. 2023.
            zj=[0;cumsum(-handles.hOverWL(1:handles.numMedia-1))];
            numMedia=handles.numMedia+1;
            %
            nTermsFQ=app.NoFloqmdsSpinner.Value;
            handles.isFloquet=true;
            %Set up Floquet params.
            maxMode=fix(nTermsFQ/2);
            nVec=-maxMode:maxMode;
            n0=maxMode+1;     %nVec(n0) represents mode 0.
            d=handles.d;
            %
            GAMMAMGReflect=handles.GAMMAMGReflect;
            GAMMAMGTransmit=handles.GAMMAMGTransmit;
            %
            incAngleDeg=handles.incAngDeg;
            incAngDegFloq=handles.incAngDegFloq;
            isPropagating=~isnan(incAngDegFloq);
            nPropagating=find(isPropagating);
            EincComplex=handles.EincComplexFull;
            %
            handles.nPropagating=nPropagating;
            isIncWavePropSpectrum=app.FloqincwavesCheckBox.Value;
            [rhoFloq,sigmaAFloq,sigmaBFloq,tauFloq,alfa,beta,residual,alfaFloq,betaFloq,ABsumForCurrent]=...
                 mainBotFloquetMG3(k,epsa,zj,numMedia-1,incAngleDeg,GAMMAMGReflect,GAMMAMGTransmit,...
                 d,nVec,handles.incAngDegFloq,handles.isWire,...
                 isIncWavePropSpectrum,EincComplex,nPropagating);
            nCurMd=find(nVec==app.currentFloqMode);
            handles.nCurMd=nCurMd;
            rho=rhoFloq(nCurMd);
            if isempty(sigmaAFloq)
                sigmaA=[];
                sigmaB=[];
            else
                sigmaA=sigmaAFloq(:,nCurMd);
                sigmaB=sigmaBFloq(:,nCurMd);
            end
            tau=tauFloq(nCurMd);
            %only keep the values of incAngDegFloq and rhoFloq for propagating
            %waves.
            incAngDegFloqPropagating=incAngDegFloq(nPropagating);
            rhoFloqPropagating=rhoFloq(nPropagating);
            tauFloqPropagating=tauFloq(nPropagating);
            cosdInc=cosd(incAngleDeg);
            powTot=0;
            for ii=1:length(nPropagating)
                powTot=powTot+abs(tauFloqPropagating(ii))^2*cosd(incAngDegFloqPropagating(ii))/cosdInc;
            end
            for ii=1:length(nPropagating)
                powTot=powTot+abs(rhoFloqPropagating(ii))^2*cosd(incAngDegFloqPropagating(ii))/cosdInc;
            end
            handles.alfaFloq=alfaFloq;
            handles.betaFloq=betaFloq;  %Note: first row is incidence region.
            handles.rhoFloq=rhoFloq;
            handles.sigmaAFloq=sigmaAFloq;
            handles.sigmaBFloq=sigmaBFloq;
            handles.tauFloq=tauFloq;
            handles.incAngDegFloqDraw=incAngDegFloqPropagating;
            handles.modeNumberPropagating=nVec(nPropagating);
            %app.NomodesSpinner.Limits=[1 length(handles.modeNumberPropagating)];
            set(handles.powerConsText,'String',num2str(powTot))
            %
            handles.rho=rho;
            %handles.rhoAnomReflec=rhoAnomReflec;
            
            handles.tau=tau;
            if isempty(sigmaA)
                handles.sigmaA=sigmaA;
                handles.sigmaB=sigmaB;
            else
                handles.sigmaA=sigmaA(1:handles.numMedia-1);
                handles.sigmaB=sigmaB(1:handles.numMedia-1);
            end
            handles.beta=beta(2:handles.numMedia+1);
            handles.alfa=alfa;
            handles.k=k(2:handles.numMedia+1);
            handles.residual=residual;
            handles=fillInResults(app, handles);
        end




        function handles = setData(app, handles)
            global dPhase
            %imshow('pImage.bmp','parent',handles.prismAxes,'InitialMagnification',100)
            
            
            handles.hpatchBdry=-1;
            handles.hpatchBdryBot=-1;
            handles.hIncArrow=-1;
            %handles.hPoyntingArrow=-1;
            handles.hWaveImage=-1;
            handles.refPhaseCircle=-1;
            handles.refPhaseCircleFloq=-1;
            handles.transPhaseCircle=-1;
            handles.hPropDirec=-1;
            handles.isBotAir=1;
            %handles.isEpsEqualMu=1;
            handles.eps0=8.854*1.e-12;
            handles.freqGHz=str2double(get(handles.freqGHzEdit,'String'));
            handles.WL=.2997925/handles.freqGHz;
            handles.omega=2*pi*handles.freqGHz*1.e9;
            handles.k0=2*pi/handles.WL;
            %The topmost medium is air.
            %The medium number and the number of media DO NOT INCLUDE THE AIR.
            handles.mediumNumber=1;
            %set(handles.mediumNumberEdit,'String',num2str(handles.mediumNumber))
            app.MediumnoSpinner.Value=handles.mediumNumber;
            handles.numMedia=2;
            %set(handles.numMediaEdit,'String',num2str(handles.numMedia))
            handles.numMediaEdit.Value=handles.numMedia;
            handles.incAngDegEdit=0;
            handles.eps=ones(handles.numMedia,1);
            handles.mu=ones(handles.numMedia,1);
            handles.n=ones(handles.numMedia,1);
            handles.conductivity=zeros(handles.numMedia,1);
            handles.hOverWL=[.1;.1];
            handles.hbdry=-ones(handles.numMedia,1);
            handles.includeInOptim=ones(handles.numMedia-1,1);
            handles.isWire=zeros(handles.numMedia-1,1);
            handles.wireDistImped=zeros(handles.numMedia-1,1);
            handles.wireHorizOffset=zeros(handles.numMedia-1,1);
            handles.distCoupledTo=zeros(handles.numMedia-1,1);
            handles.wireStripWidth=0.00677*ones(handles.numMedia-1,1);
            set(handles.wireStripWidthEdit,'String',num2str(handles.wireStripWidth(handles.mediumNumber)))
            handles.wireHorizOffsetMode1=handles.wireHorizOffset;
            handles.wireDistImpedMode1=handles.wireDistImped;
            handles.hOverWLMode1=handles.hOverWL;
            handles.wireHorizOffsetMode2=handles.wireHorizOffset;
            handles.wireDistImpedMode2=handles.wireDistImped;
            handles.hOverWLMode2=handles.hOverWL;
            
            
            handles.nPhaseDivisions=100;
            dPhase=360/handles.nPhaseDivisions;
            handles.timePhase=0;
            handles.nPtsPerWL=100;
            set(handles.nPtsPerWLEdit,'String',num2str(handles.nPtsPerWL))
            handles.NPeriodsHoriz=10;
            %set(handles.NPeriodsHorizEdit,'String',num2str(handles.NPeriodsHoriz))
            app.NoperiodsSpinner.Value=handles.NPeriodsHoriz;
            %handles.singleWaveDisplay=1;
            handles.nIndexResult=0;
            handles.plotDependentVariable='tau';
            handles.incAngDeg=0;
            
            
            set(handles.waveLengthText,'String',num2str(handles.WL))
            set(handles.isBotAirCheckBox,'Value',handles.isBotAir)
            set(handles.epsEdit,'String',num2str(handles.eps(handles.mediumNumber)))
            set(handles.waveDirectionEdit,'String',num2str(handles.incAngDeg))
            set(handles.multibeamConfig1RadioButton,'Enable','off')
            set(handles.multibeamConfig2RadioButton,'Enable','off')
            set(handles.prismAxes,'YLimMode','auto')
            handles.GAMMA=[];
            handles.gamFileName=[];
            set(handles.gamFileNameText,'String',' ')
            handles.isFloquet=false;
            set(handles.FloquetCheckBox,'Value',true)
            %get period for when Floquet mode is used.
            ThetInDeg=0;
            ThetOutDeg=70;
            sinThetIn=sind(ThetInDeg);
            sinThetOut=sind(ThetOutDeg);
            DELsin=abs(sinThetOut-sinThetIn);
            handles.ThetInDeg=ThetInDeg;
            handles.incAngDeg=handles.ThetInDeg;
            set(handles.waveDirectionEdit,'String',num2str(ThetInDeg))
            handles.ThetOutDeg=ThetOutDeg;
            handles.DELsin=DELsin;
            waveLengthStr=get(handles.waveLengthText,'String');
            waveLength=str2double(waveLengthStr);
            d=waveLength/DELsin;
            handles.d=d;
            %set(handles.periodText,'String',num2str(handles.d))
            app.periodEditField.Value=handles.d;
            handles.isRefraction=false;
            set(handles.optimizeReflectionCheckBox,'Enable','off')
            %
            handles.hwire=-1;
            handles.HankelSum=sumHankel(app, handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
            %Compute this whether or not we are in metagrating mode.
            set(handles.metagratingCheckBox,'Value',1)
            %
            %Allocate the scattering matrices for metagrating.
            nTermsFQ=app.NoFloqmdsSpinner.Value;
            handles.GAMMAMGReflect=NaN(nTermsFQ,nTermsFQ,handles.numMedia-1);
            handles.GAMMAMGTransmit=NaN(nTermsFQ,nTermsFQ,handles.numMedia-1);
            handles.inductDiff=zeros(handles.numMedia-1,1);
            handles.distImpedFac=1;
            handles=getRealZTilde(app, handles);
            if get(handles.metagratingCheckBox,'Value')
                handles=setMetagratingCheckbox(app, handles);
                set(handles.isWireCheckBox,'Value',1)
                set(handles.wireTypeRadioButton,'Value',1)
                handles.isWire(handles.mediumNumber)=1;
                handles=setIsWireCheckbox(app, handles);
            end
            %
            handles.nCoupledTo=1:handles.numMedia-1;
            handles.isPossibleCoupling=false;
            %Some more pre-defs so that the call to the next routine won't
            %bomb out.
            %
                maxMode=fix(nTermsFQ/2);
                nVec=-maxMode:maxMode;
                incAngDegFloq=handles.incAngDegFloq;
                isPropagating=~isnan(incAngDegFloq);
                nPropagating=find(isPropagating);
                handles.modeNumberPropagating=nVec(nPropagating);
            %
            handles=getModesForOptimization(app, handles);
            app.TGMdefined(1)=0;
            app.seqModeNumber=0;
            app.currentFloqMode=0;
            %set(handles.figure1,'WindowButtonDownFcn',{@app.axisClickCallback,handles})
            %
            % %Set up DLL's
            % handles.thisFilePath=fileparts(mfilename('fullpath'));
            % thisFilePath=handles.thisFilePath;
            % try
            %     unloadlibrary('mtgr')
            % end
            % try
            %     dllFileName=[thisFilePath '\metagratingDLL\metagratingDLL\x64\debug\mtgr.dll'];
            %     hFileName=[thisFilePath '\metagratingDLL\metagratingDLL\mtgr.h'];
            %     loadlibrary(dllFileName,hFileName,'alias','mtgr')
            % catch
            %     errordlg('Error loading metagratingDLL DLL from Matlab','DLL problem')
            %     return
            % end
            %
            %
            handles=incidentWaves(app,handles);
            %
            handles=drawMedia(app, handles);
            setFloqAngleText(app, handles)
            handles=setParamsToControl(app, handles);
            %
            %  Default data for optimization for look-up-table (LUT).
            app.LUTmaxtimes=10;
            app.LUTminEff=0.8;
            app.NLUTangles=30;
            app.LUTang1=-180;
            app.LUTang2=180;
            app.LUTtargetTMagnitude=1;
            app.NLUTmags=1;
            app.LUTtargetTMagnitude2=1;
            app.isJCross=0;
            app.isMeanEfficiencyOptim=0;
        end

        function handles=incidentWaves(app,handles)
            %We assume that the normal component PincMag of the Poynting vector
            %is given for each of these nPropagatingWaves, so that they
            %sum to unity. Also, the phase of the wave at x=y=0 is given in
            %degrees as PincPhaseDeg. If they don't sum to unity, then
            %normalize them so that they sum unity.
            incAngDegFloq=handles.incAngDegFloq;
            isPropagating=~isnan(incAngDegFloq);
            nPropagating=find(isPropagating);
            thetaIncDegDim=incAngDegFloq(nPropagating);
            %handles.incAngDegFloqDraw=incAngDegFloqPropagating;
            %thetaIncDegDim=handles.incAngDegFloqDraw;
            nPropagatingWaves=length(thetaIncDegDim);
            %
            %PincMag=ones(nPropagatingWaves,1);
            handles.PincMag=zeros(nPropagatingWaves,1);
            n0=fix(nPropagatingWaves/2+1);
            %nn=n0-1;
            nn=n0;
            %PincMag(nn)=1/cosd(thetaIncDegDim(nn));
            handles.PincMag(nn)=1;
            %Note: handles.PincMag is the status of the sliders and numeric
            %boxes.
            %The division by the angle is so that the power component
            %normal to the surface would be unity.
            %
            nFloq=length(incAngDegFloq);
            PincPhaseDeg=zeros(nPropagatingWaves,1);
            handles=manipIncWaves(app,handles.PincMag,PincPhaseDeg,thetaIncDegDim,nFloq,nPropagating,handles);
            %
            %
            %Enable the required sliders and edit boxes.
            numSliders=7;
            if nPropagatingWaves>numSliders
                msgbox(['No. propagating waves exceeds ' num2str(numSliders)])
                return
            end
            for ii=1:nPropagatingWaves
                eval(['app.incWaveSlider' num2str(ii) '.Visible=1;'])
                eval(['app.incWaveSlider' num2str(ii) '.Enable=1;'])
                eval(['app.incWaveSlider' num2str(ii) '.Value=handles.PincMag(' num2str(ii) ');'])
                eval(['app.incWave' num2str(ii) 'EditNumeric.Visible=1;'])
                eval(['app.incWave' num2str(ii) 'EditNumeric.Enable=1;'])
                eval(['app.incWave' num2str(ii) 'EditNumeric.Value=handles.PincMag(' num2str(ii) ');'])
                eval(['app.incWave' num2str(ii) 'EditPhase.Visible=1;'])
                eval(['app.incWave' num2str(ii) 'EditPhase.Enable=1;'])
                eval(['app.incWave' num2str(ii) 'EditPhase.Value=handles.PincPhaseDeg(' num2str(ii) ');'])
                eval(['app.Label_' num2str(ii) '.Visible=1;'])
            end
            for ii=nPropagatingWaves+1:numSliders
                eval(['app.incWaveSlider' num2str(ii) '.Visible=0;'])
                eval(['app.incWaveSlider' num2str(ii) '.Enable=0;'])
                eval(['app.incWaveSlider' num2str(ii) '.Value=0;'])
                eval(['app.incWave' num2str(ii) 'EditNumeric.Visible=0;'])
                eval(['app.incWave' num2str(ii) 'EditNumeric.Enable=0;']);
                eval(['app.incWave' num2str(ii) 'EditNumeric.Value=0;'])
                eval(['app.incWave' num2str(ii) 'EditPhase.Visible=0;'])
                eval(['app.incWave' num2str(ii) 'EditPhase.Enable=0;'])
                eval(['app.incWave' num2str(ii) 'EditPhase.Value=0;'])
                eval(['app.Label_' num2str(ii) '.Visible=0;'])
            end
        end

        function handles=manipIncWaves(app,PincMag,PincPhaseDeg,thetaIncDegDim,nFloq,nPropagating,handles)
            PincMagSum=sum(PincMag);
            handles.PincMagNorm=PincMag/PincMagSum;   %Component normal to surface.
            %handles.PincPhaseDeg=zeros(nPropagatingWaves,1);
            handles.PincPhaseDeg=PincPhaseDeg;
            EincComplex=sqrt(handles.PincMagNorm./cosd(thetaIncDegDim)).*exp(1i*handles.PincPhaseDeg*pi/180);
            %handles.EincComplex=sqrt(PincMag).*exp(1i*handles.PincPhaseDeg*pi/180);
            %handles.EincComplexFull=zeros(size(isPropagating));
            handles.EincComplexFull=zeros(nFloq,1);
            handles.EincComplexFull(nPropagating)=EincComplex;
            %Note that EincComplex is defined only for the propagating
            %waves in the Floquet series, whereas EincComplexFull is
            %defined for all the waves of the series with 0's entered for
            %the non-propagating waves.
        end
        
        function setFloqAngleText(app, handles)
            %Get the index of the current mode from among all modes considered.
            nFloqModes=app.NoFloqmdsSpinner.Value;
            maxMode=fix(nFloqModes/2);
            currentFloquetModeIndex=app.currentFloqMode-(-maxMode)+1;
            isPropagating=~isnan(handles.incAngDegFloq(currentFloquetModeIndex));
            if isPropagating
                incAngDegFloqText=[num2str(handles.incAngDegFloq(currentFloquetModeIndex)) '°'];
            else
                incAngDegFloqText=' ';
            end
            set(handles.FloqAngleText,'String',incAngDegFloqText)
        end
        
        function handles = setIsWireCheckbox(app, handles)
            handles.hOverWL(handles.mediumNumber,1)=0;
            %Make the material air.
            handles.eps(handles.mediumNumber)=1;
            handles.n(handles.mediumNumber)=1;
            handles.conductivity(handles.mediumNumber)=0;
            set(handles.nText,'String',num2str(handles.n(handles.mediumNumber)))
            set(handles.epsEdit,'String',num2str(handles.eps(handles.mediumNumber)))
            set(handles.thickEdit,'String',num2str(handles.hOverWL(handles.mediumNumber)))
            set(handles.conductivityEdit,'String',num2str(handles.conductivity(handles.mediumNumber)))
            handles=mgGAMMA(app, handles,handles.mediumNumber);
        end
        
        function handles = setMetagratingCheckbox(app, handles)
            set(handles.TERadioButton,'Value',1)
            set(handles.FloquetCheckBox,'Value',1)
            handles.isFloquet=true;
            handles.isRefraction=true;
            set(handles.optimizeReflectionCheckBox,'Enable','on')
            for ii=1:handles.numMedia-1
                handles=mgGAMMA(app, handles,ii);
            end
        end
        
        function handles = setNewMedium(app, handles)
            %Change the values in the medium frame.
            handles=setNewMediumFrame(app, handles);
            handles=fillInResults(app, handles);
        end
        
        function handles = setNewMediumFrame(app, handles)
            %Change the values in the medium frame.
            mnum=handles.mediumNumber;
            set(handles.nText,'String',num2str(handles.n(mnum)))
            set(handles.epsEdit,'String',num2str(handles.eps(mnum)))
            set(handles.thickEdit,'String',num2str(handles.hOverWL(mnum)))
            set(handles.conductivityEdit,'String',num2str(handles.conductivity(mnum)))
            set(handles.includeInOptimizationCheckBox,'Value',handles.includeInOptim(mnum))
            tf=false;
            if handles.isWire(mnum)==1
                tf=true;
            end
            set(handles.isWireCheckBox,'Value',tf)
            switch handles.isWire(mnum)
                case 0
                    set(handles.virtualTypeRadioButton,'Value',1)
                    set(handles.coupleMedium2Edit,'String',' ')
                case 1
                    set(handles.wireTypeRadioButton,'Value',1)
                    set(handles.coupleMedium2Edit,'String',num2str(handles.nCoupledTo(mnum)))
                case 2
                    set(handles.dielectricTypeRadioButton,'Value',1)
                    set(handles.coupleMedium2Edit,'String',' ')
                case 3
                    set(handles.airGapTypeRadioButton,'Value',1)
                    set(handles.coupleMedium2Edit,'String',' ')
            end
            %set(handles.wireTypeRadioButton,'Value',tf)
            %set(handles.isWireCheckBox,'Value',handles.isWire(mnum))
            set(handles.wireDistImpedEdit,'String',num2str(handles.wireDistImped(mnum)))
            if app.WkCheckBox.Value && isfield(handles,'Wk')
                app.wireWkmilEdit.Value=num2str(handles.Wk(handles.mediumNumber));
                app.realZLabel.Text=num2str(handles.realZ(handles.mediumNumber),3);
            end
            set(handles.wireHorizOffsetEdit,'String',num2str(handles.wireHorizOffset(mnum)))
            set(handles.wireStripWidthEdit,'String',num2str(handles.wireStripWidth(mnum)))
            %If the slider shows a variable that depends on the medium number,
            %change it.
            nParamToControl=handles.nParamToControl;
            varName=handles.nameParamToControl(nParamToControl,:);
            varName=deblank(varName);
            if nParamToControl>1 && nParamToControl<8
                %The parameter is one that depends on the current medium number
                valStrForEval=['handles.' varName '(' num2str(handles.mediumNumber) ')'];
                valParam=eval(valStrForEval);
                handles.valParamToControl(nParamToControl)=valParam;
                %Set the edit control and the slider to this value.
                app.Slider.Value=handles.valParamToControl(nParamToControl);
                %set(handles.tiltAngleEdit,'String',num2str(handles.valParamToControl(nParamToControl)))
                app.tiltAngleEditNumeric.Value=handles.valParamToControl(nParamToControl);
            end
        end
        
        function handles = setNotWire(app, handles)
            handles.wireDistImped(handles.mediumNumber)=0;
            handles.wireHorizOffset(handles.mediumNumber)=0;
            handles.distCoupledTo(handles.mediumNumber)=0;
            handles.wireStripWidth(handles.mediumNumber)=0;
            set(handles.wireDistImpedEdit,'String',num2str(handles.wireDistImped(handles.mediumNumber)))
            if app.WkCheckBox.Value && isfield(handles,'Wk')
                app.wireWkmilEdit.Value=num2str(handles.Wk(handles.mediumNumber));
                app.realZLabel.Text=num2str(handles.realZ(handles.mediumNumber),3);
            end
            set(handles.wireHorizOffsetEdit,'String',num2str(handles.wireHorizOffset(handles.mediumNumber)))
            set(handles.wireStripWidthEdit,'String',num2str(handles.wireStripWidth(handles.mediumNumber)))
        end
        
        function handles = setParamsToControl(app, handles)
            numParamsToControl=0;
            handles.numParamsToControl=0;
            fid=fopen('paramsToControlBot.inp');
            readNext=true;
            while readNext
                tline = fgetl(fid);
                if tline==-1
                    break
                end
                c=textscan(tline,'%s%f%f');
                lenc=length(c);
                cmat=cell2mat(c(2:lenc));
            
                numParamsToControl=numParamsToControl+1;
                handles.nameParamToControl(numParamsToControl,:)='                               ';
                varName=cell2mat(c{1});
                handles.nameParamToControl(numParamsToControl,1:length(varName))=varName;
                handles.minParamToControl(numParamsToControl)=cmat(1);
                handles.maxParamToControl(numParamsToControl)=cmat(2);
                if numParamsToControl>1 && numParamsToControl<5
                    %The parameter is one that depends on the current medium number
                    valStrForEval=['handles.' varName '(' num2str(handles.mediumNumber) ')'];
                else
                    valStrForEval=['handles.' varName];
                end
                valParam=eval(valStrForEval);
                handles.valParamToControl(numParamsToControl)=valParam;
            end
            fclose(fid);
            handles.numParamsToControl=numParamsToControl;
            
            if numParamsToControl>0
                set(handles.paramsToControlListbox,'String',handles.nameParamToControl(1:numParamsToControl,:))
                set(handles.paramsToControlListbox,'Visible','on')
                set(handles.tiltAnglePanel,'Visible','on')
                handles.nParamToControl=1;
                nParamToControl=1;
                app.Slider.Value=handles.valParamToControl(nParamToControl);
                app.Slider.Limits=[handles.minParamToControl(nParamToControl),handles.maxParamToControl(nParamToControl)];
                %set(handles.tiltAngleEdit,'String',num2str(handles.valParamToControl(nParamToControl)))
                app.tiltAngleEditNumeric.Value=handles.valParamToControl(nParamToControl);
                varname=handles.nameParamToControl(nParamToControl,:);
                varname=deblank(varname);
                set(handles.tiltAnglePanel,'Title',varname)
            else
                set(handles.paramsToControlListbox,'Visible','off')
                set(handles.tiltAnglePanel,'Visible','off')
            end
        end
        
        function specialPlot(app, handles)
            %Plot magnitude and phase of tau as a function of eps and h/lambda
            %for 3 layers (+ the incident layer), where layer 1 is fixed and layer
            %2 is varied.
            nPointse=50;
            nPointsh=100;
            eps=linspace(1,4,nPointse);
            hOverWL=linspace(.25,1,nPointsh);
            tauMag=zeros(nPointsh,nPointse);
            tauPhaseDeg=zeros(nPointsh,nPointse);
            %b is x, h is y
            
            for ii=1:nPointsh
                handles.hOverWL(2,1)=hOverWL(ii);
                for jj=1:nPointse
                    handles.eps(2)=eps(jj);
                    handles.n(2)=sqrt(eps(jj));
                    handles=drawMedia(app, handles);
                    tauMag(ii,jj)=abs(handles.tau);
                    tauPhaseDeg(ii,jj)=(180/pi)*angle(handles.tau);
                    drawnow
                end
            end
            gcfTemp=gcf;
            
            figure
            imagesc(eps,hOverWL,tauMag)
            set(gca,'ydir','normal')
            ylabel('h/\lambda')
            xlabel('\epsilon_2')
            title('|\tau|')
            grid on
            colorbar
            
            figure
            imagesc(eps,hOverWL,tauPhaseDeg)
            set(gca,'ydir','normal')
            ylabel('h/\lambda')
            xlabel('\epsilon_2')
            title('phase(\tau)')
            grid on
            colorbar
            
            figure(gcfTemp);
        end

        function safeDrawnow(app)
            % Call drawnow only when the app figure is visible to avoid
            % GUI event overhead during headless/batch runs.
            try
                if isprop(app,'figure1') && isvalid(app.figure1) && strcmp(app.figure1.Visible,'on')
                    drawnow
                end
            catch
                % ignore any errors here
            end
        end
        
        function specialPlot2(app, handles)
            %Plot magnitude and phase of tau as a function of eps(1) and eps(2)
            %for 3 layers (+ the incident layer), where hOverWL of 1 and 2 are fixed.
            nPointse1=50;
            nPointse2=50;
            %eps1=linspace(1,4,nPointse1);
            %eps2=linspace(1,4,nPointse2);
            eps1=linspace(1,16,nPointse1);
            eps2=linspace(1,16,nPointse2);
            tauMag=zeros(nPointse2,nPointse1);
            tauPhaseDeg=zeros(nPointse2,nPointse1);
            %b is x, h is y
            
            for ii=1:nPointse2
                handles.eps(2)=eps2(ii);
                handles.n(2)=sqrt(eps2(ii));
                for jj=1:nPointse1
                    handles.eps(1)=eps1(jj);
                    handles.n(1)=sqrt(eps1(jj));
                    handles=drawMedia(app, handles);
                    tauMag(ii,jj)=abs(handles.tau);
                    tauPhaseDeg(ii,jj)=(180/pi)*angle(handles.tau);
                    drawnow
                end
            end
            gcfTemp=gcf;
            
            figure
            imagesc(eps1,eps2,tauMag)
            set(gca,'ydir','normal')
            ylabel('\epsilon_2')
            xlabel('\epsilon_1')
            title('|\tau|')
            grid on
            colorbar
            
            figure
            imagesc(eps1,eps2,tauPhaseDeg)
            set(gca,'ydir','normal')
            ylabel('\epsilon_2')
            xlabel('\epsilon_1')
            title('phase(\tau)')
            grid on
            colorbar
            figure(gcfTemp);
        end
        
        function specialPlot3(app, handles)
            %Plot magnitude and phase of tau as a function of eps(1,3) and hoverwl(2)
            %for 4 layers (+ the incident layer), where hOverWL(1,3) are fixed
            htotal=.6;
            nPointse13=50;
            nPointsh2=50;
            %eps1=linspace(1,4,nPointse1);
            %eps2=linspace(1,4,nPointse2);
            eps13=linspace(1,8,nPointse13);
            %h2=linspace(.005,.5,nPointsh2);
            %h2=linspace(.005,.25,nPointsh2);
            %h2=linspace(.005,.19,nPointsh2);
            h2=linspace(.005,.125,nPointsh2);
            tauMag=zeros(nPointse13,nPointsh2);
            tauPhaseDeg=zeros(nPointse13,nPointsh2);
            %b is x, h is y
            
            for ii=1:nPointsh2
                handles.hOverWL(2,1)=h2(ii);
                handles.hOverWL(4,1)=h2(ii);
                handles.hOverWL(6,1)=h2(ii);
                handles.hOverWL(8,1)=h2(ii);
                %h13=(htotal-h2(ii))/2;
                %h13=(htotal-2*h2(ii))/3;
                %h13=(htotal-3*h2(ii))/4;
                h13=(htotal-4*h2(ii))/5;
                handles.hOverWL(1,1)=h13;
                handles.hOverWL(3,1)=h13;
                handles.hOverWL(5,1)=h13;
                handles.hOverWL(7,1)=h13;
                handles.hOverWL(9,1)=h13;
                for jj=1:nPointse13
                    handles.eps(1)=eps13(jj);
                    handles.eps(3)=eps13(jj);
                    handles.eps(5)=eps13(jj);
                    handles.eps(7)=eps13(jj);
                    handles.eps(9)=eps13(jj);
                    handles.n(1)=sqrt(handles.eps(1));
                    handles.n(3)=sqrt(handles.eps(3));
                    handles.n(5)=sqrt(handles.eps(5));
                    handles.n(7)=sqrt(handles.eps(7));
                    handles.n(9)=sqrt(handles.eps(9));
                    handles=drawMedia(app, handles);
                    tauMag(ii,jj)=abs(handles.tau);
                    tauPhaseDeg(ii,jj)=(180/pi)*angle(handles.tau);
                    drawnow
                end
            end
            gcfTemp=gcf;
            
            figure
            imagesc(eps13,h2,tauMag)
            set(gca,'ydir','normal')
            ylabel('h_2')
            xlabel('\epsilon_1,\epsilon_3')
            title('|\tau|')
            grid on
            colorbar
            
            figure
            imagesc(eps13,h2,tauPhaseDeg)
            set(gca,'ydir','normal')
            ylabel('h_2')
            xlabel('\epsilon_1,\epsilon_3')
            title('phase(\tau)')
            grid on
            colorbar
            
            figure(gcfTemp);
        end
        
        function handles = specialPlot4_1(app, handles)
            global ghandles tauTarget
            nc=4;
            handles.n(1)=nc;
            handles.n(3)=nc;
            handles.eps(1)=nc*nc;
            handles.eps(3)=nc*nc;
            %lb=[0.05;0.05;0.05];    %3 independent variables
            %ub=[.8;.8;.8];          %3 independent variables
            lb=[0.01;0.01];    %2 independent variables
            ub=[.8;.8];        %2 independent variables
            mag=str2double(get(handles.tauMagEdit,'String'));
            %mag=0.85;
            %x=handles.hOverWL(1:handles.numMedia-1);    %3 independent variables
            x=handles.hOverWL(1:2);                      %2 independent variables
            ghandles=handles;
            %phaseDeg=0:5:355;
            phsIni=str2double(get(handles.tauPhaseIniEdit,'String'));
            phsFin=str2double(get(handles.tauPhaseFinEdit,'String'));
            phsDel=str2double(get(handles.tauPhaseDelEdit,'String'));
            phaseDeg=phsIni:phsDel:phsFin;
            phaseDeg=phaseDeg';
            lengthPhase=length(phaseDeg);
            xout=NaN(lengthPhase,3);
            isSolutionFound=0;
            for ii=1:lengthPhase
            %for ii=16:-1:1
                %phaseDeg=30;
                set(handles.tauCurText,'String',num2str(phaseDeg(ii)))
                phas=phaseDeg(ii)*pi/180;
                tauTarget=mag*exp(1i*phas);
                %[X,FVAL,EXITFLAG] = fsolve(@fsolveFun,x)
                [xx,resnorm,residual,exitflag] = lsqnonlin(@app.fsolveFun1,x,lb,ub);
                if resnorm<1.e-5
                    isSolutionFound=1;
                    x=xx;
                    %xout(ii,:)=xx';            %3 independent variables
                    xout(ii,:)=[xx' xx(1)];     %2 independent variables
                    handles.hOverWL(1:3,1)=xout(ii,:);
                    %drawnow;
                    disp('solution found')
                else
                    disp('no solution found')
                end
                drawnow;
            end
            if isSolutionFound
                handles=drawMedia(app, handles);
            end
            outArray=[phaseDeg xout];
            if phsDel<0
                outArray=flipud(outArray);
            end
            outArray=[handles.incAngDeg handles.n(1:handles.numMedia-1)';outArray];
            save('out.dat','outArray','-ascii')
        end
        
        function handles = specialPlot4_2(app, handles)
            global ghandles
            global cosIncAngDeg rTarget
            cosIncAngDeg=cosd(handles.incAngDeg);
            rTarget=(tand(handles.incAngDeg/2))^2;
            lb=[0.01;0.01];    %2 independent variables
            ub=[.8;.8];        %2 independent variables
            x=handles.hOverWL(1:2);                      %2 independent variables
            ghandles=handles;
            [xx,resnorm,residual,exitflag] = lsqnonlin(@app.fsolveFun2,x,lb,ub);
            if resnorm<1.e-5
                x=xx;
                xout=[xx' xx(1)];     %2 independent variables
                handles.hOverWL(1:3,1)=xout;
                handles=drawMedia(app, handles);
                outArray=[0 xout];
                outArray=[handles.incAngDeg handles.n(1:handles.numMedia-1)';outArray];
                save('out.dat','outArray','-ascii')
                %drawnow;
                disp('solution found')
            else
                disp('no solution found')
            end
            drawnow;
        end
        
        function handles = specialPlot4_3(app, handles)
            global ghandles
            global cosIncAngDeg rTarget
            cosIncAngDeg=cosd(handles.incAngDeg);
            rTarget=(tand(handles.incAngDeg/2))^2;
            %set(handles.coupleMedium1Edit,'String','1')
            set(handles.coupleMedium2Edit,'String','1')
            lb=[0.05;0.05;0.05];    %3 independent variables
            ub=[3;3;3];          %3 independent variables
            x=handles.hOverWL(1:3);                      %3 independent variables
            ghandles=handles;
            [xx,resnorm,residual,exitflag] = lsqnonlin(@app.fsolveFun3,x,lb,ub);
            if resnorm<1.e-3
                x=xx;
                f=fsolveFun3(app, x);
                %xout(ii,:)=xx';            %3 independent variables
                xout=xx';     %2 independent variables
                handles.hOverWL(1:3,1)=xout;
                handles=drawMedia(app, handles);
                outArray=[0 xout];
                outArray=[handles.incAngDeg handles.n(1:handles.numMedia-1)';outArray];
                save('out.dat','outArray','-ascii')
                %drawnow;
                disp('solution found')
            else
                disp('no solution found')
            end
            drawnow;
        end
        
        function HankelSum = sumHankel(app, d, ThetInDeg, eps, WL)
            %Compute the function F(x,y) of the wire array at the edge of the wire at the origin.
            %eps is the relative permittivity of the PCB which is assumed to be the
            %same in all layers. Without the eps, the wave number is assumed to
            %lambda/2*pi=1/2*pi. This has been changed with the addition of the parameter WL,
            %the wavelength. Since the d always appears with k, the k=2pi has been
            %integrated. To account for eps, then, d should be multiplied by sqrt(eps).
            %21 Nov 2024 this line of thought was changed because it was
            %found to lead to unphysical results in a problem where the
            %dielectric had 0 thickness (and thus should not contribute)
            %and yet it led to power conservation being violated.  Instead,
            %eps will be set to unity. One rationalization might be that
            %the program assumes all metagratings are in air, but the air
            %region is set to 0.
            eps=1;
            sinThetIn=sind(ThetInDeg);
            %d=1/handles.DELsin;
            % sinThetIn=0;
            % d=1/abs(sind(70));
            %d=d*sqrt(eps);
            d=d*sqrt(eps)/WL;
            %d=d*sqrt(1);
            d2=d*d;
            N=5000;
            %
            %Gradsteyn and Ridzik:
            ratioMinus=d*(1-sinThetIn);
            m=fix(ratioMinus);
            ratioPlus=d*(1+sinThetIn);
            n=fix(ratioPlus);
            %Compute the J-sum.
            cosThetIn=sqrt(1-sinThetIn*sinThetIn);
            Jsumm=0;
            for L=1:m
                termL=L+d*sinThetIn;
                Jsumm=Jsumm+1/sqrt(d2-termL*termL);
            end
            Jsumn=0;
             for L=1:n
                termL=L-d*sinThetIn;
                Jsumn=Jsumn+1/sqrt(d2-termL*termL);
            end
            Jsum=-0.5+(Jsumm+Jsumn+1/(d*cosThetIn))/(2*pi);
            %This should be the real part of the result that was plotted.
            %xlim=get(gca,'xlim');
            %line([xlim(1) xlim(2)],[Jsum Jsum],'color','k')
            %
            %
            %Now the N-sum.
            euler=0.577215664901532860606512;
            %Finite sums
            Lsumm=0;
            for L=1:m
                Lsumm=Lsumm+1/L;
            end
            Lsumn=0;
             for L=1:n
                Lsumn=Lsumn+1/L;
            end
            Lsum=Lsumm+Lsumn;
            %
            tol=0.001;
            %Nsummdim=NaN(N,1);
            %Nsumndim=NaN(N,1);
            Nsumm=0;
            for L=m+1:N
                termL=L+d*sinThetIn;
                delta=1/sqrt(termL*termL-d2)-1/L;
                Nsumm=Nsumm+delta;
                %Nsummdim(L)=Nsumm;
                if abs(delta)<tol*abs(Nsumm)
                    Llastm=L;
                    break
                end
            end
            Nsumn=0;
             for L=n+1:N
                termL=L-d*sinThetIn;
                delta=1/sqrt(termL*termL-d2)-1/L;
                Nsumn=Nsumn+delta;
                %Nsumndim(L)=Nsumn;
                if abs(delta)<tol*abs(Nsumn)
                    Llastn=L;
                    break
                end
            end
            %Nsum=(-2*(euler+log(gam/2))+Lsumm+Lsumn-Nsummdim-Nsumndim)/(2*pi);
            Nsum=(-2*(euler+log(d/2))+Lsumm+Lsumn-Nsumm-Nsumn)/(2*pi);
            %This should be the imag part of the result that was plotted.
            %plot(Nsum,'k')
            %line([xlim(1) xlim(2)],[Nsum Nsum],'color','k')
            %
            %
            HankelSum=Jsum+1i*Nsum;
        end
        
        function surveyThicknessesA(app, handles)
            %surveyThicknesses surveys all possible values of thickness to determine for
            %which set the coupling efficiency for that direction is large. The particular
            %index of rho iMax is determined by "Method" radio button.
            global ghandles iMax isBeamSplit
            %plotbfFile('out.bf')
            % if get(handles.m1FloqModeToOptimize,'Value')
            %     iMax=1;
            %     imaxfac=cosd(70);
            % end
            % if get(handles.zeroFloqModeToOptimize,'Value')
            %     iMax=2;
            %     imaxfac=1;
            %     isBeamSplit=false;
            %     if get(handles.isBeamsplitCheckBox,'Value')
            %         isBeamSplit=true;
            %     end
            % end
            % if get(handles.p1FloqModeToOptimize,'Value')
            %     iMax=3;
            %     imaxfac=cosd(70);
            % end
            
            isBeamSplit=false;
            if get(handles.isBeamsplitCheckBox,'Value')
                isBeamSplit=true;
            end
            %
            %The vector of the indices of the propagating wave modes is
            %handles.modeNumberPropagating.
            %The vector of the indices of the target modes for which optimization
            %is performed is handles.modesForOptimization
            %The vector of the beam angles of these waves is
            %handles.incAngDegFloqDraw.
            %For now, get the first legitimate entry of handles.modesForOptimization.
            %Later, we will use more than one.
            for ii=1:length(handles.modesForOptimization)
                if ~isnan(handles.modesForOptimization(ii))
                    modeForOptimization=handles.modesForOptimization(ii);
                    break
                end
            end
            indx=find(handles.modeNumberPropagating==modeForOptimization);
            imaxfac=cosd(handles.incAngDegFloqDraw(indx));
            
            x=handles.hOverWL(1:handles.numMedia-1);
            %We wish to find the indeces of the thicknesses that are NOT included in
            %the optimization.
            indNotInOptimization=find(handles.includeInOptim==0);
            xNotInOptimization=handles.hOverWL(indNotInOptimization);
            %
            x=zeros(size(x));
            ghandles=handles;
            %
            %test
            % del=.02;
            % maxThickness=1.;
            % maxSingleLayerThickness=.5;
            % etaThreshold=.4;
            %
            del=str2double(get(handles.bruteForceDelEdit,'String'));
            maxSingleLayerThickness=str2double(get(handles.bruteForceMaxSingleEdit,'String'));
            minThickness=str2double(get(handles.bruteForceMinTotalEdit,'String'));
            maxThickness=str2double(get(handles.bruteForceMaxTotalEdit,'String'));
            etaThreshold=str2double(get(handles.bruteForceEtaThresholdEdit,'String'));
            set(handles.bruteForceNumSolsFoundText,'String','0')
            %
            nSolutionsFound=0;
            etaMax=0;
            eps=handles.eps(1:handles.numMedia-1)';
            tanDelta=handles.conductivity(1:handles.numMedia-1)';
            %
            %Get generic bf file name that does not currently exist.
            %This is because it takes a long time, and it might be convenient to use
            %different computers for different tasks, but they would have to use
            %different file names since they are connected to oneDrive.
            %The basic name is out.bf.
            isFilenameExists=true;
            bfFileNameBase='out';
            bfFileName=bfFileNameBase;
            icharNum=96;  %'a'
            while isFilenameExists
                ex=exist([bfFileName '.bf'],'file');
                if ex==2
                    isFilenameExists=true;
                    %Get new file name
                    icharNum=icharNum+1;
                    bfFileName=[bfFileNameBase char(icharNum)];
                else
                    isFilenameExists=false;
                    bfFileName=[bfFileName '.bf'];
                end
            end
            %
            gamFileName=handles.gamFileName;
            fid=fopen(bfFileName,'w'); %Open for appending because save doesn't write text
            %save('out.bf','gamFileName','-ascii')
            fprintf(fid,[gamFileName '\n']);
            fclose(fid);
            save(bfFileName,'eps','-ascii','-append')
            save(bfFileName,'tanDelta','-ascii','-append')
            numLayers=handles.numMedia-1;
            xsamples=0:del:maxSingleLayerThickness;
            xsamples=xsamples';
            %
            %The following is a general method to perform for loops on an initially
            %unknown number of layers.  It was taken from
            %https://www.mathworks.com/matlabcentral/answers/386638-how-to-loop-through-an-unknown-number-of-matrix-dimensions
            nv=length(eps);
            v=ones(nv,1);
            vLim=length(xsamples);
            ready = false;
            isSolution=false;
            set(handles.bruteForceCancelCheckbox,'Visible','on')
            set(handles.bruteForceCancelCheckbox,'Value',0)
            app.safeDrawnow();
            while ~ready
                %drawnow
                if get(handles.bruteForceCancelCheckbox,'Value')
                    break
                end
                % Do what you need with X and the index vector v
                %Get the total thickness.
                x=xsamples(v);
                %
                %Replace thicknesses that are not included in optimization
                x(indNotInOptimization)=xNotInOptimization;
                %
                totalThickness=sum(x);
                if totalThickness~=0 && totalThickness>=minThickness && totalThickness<=maxThickness
                    f=getThickFun(app, x);
                    eta=f*f*imaxfac;
                    if eta>etaMax
                        etaMax=eta;
                    end
                    if eta>etaThreshold
                        %write the values to file
                        var=[eta totalThickness x'];
                        save(bfFileName,'var','-ascii','-append')
                        isSolution=true;
                        nSolutionsFound=nSolutionsFound+1;
                        set(handles.bruteForceNumSolsFoundText,'String',num2str(nSolutionsFound))
                        drawnow
                    end
                end
                %
                % Update the index vector:
                ready = true;       % Assume that the WHILE loop is ready
                for k = 1:nv
                    v(k) = v(k) + 1;
                    if v(k) <= vLim
                        ready = false;  % No, WHILE loop is not ready now
                        break;          % v(k) increased successfully, leave "for k" loop
                    end
                    v(k) = 1;         % Reset v(k), proceed to next k
                end
            end
            set(handles.bruteForceCancelCheckbox,'Visible','off')
            set(handles.bruteForceCancelCheckbox,'Value',0)
            %
            %plot the bf file.
            if isSolution
                plotbfFile(app, bfFileName,handles);
            end
        end
        
        
        function writeLsqnonlinToFile(app, handles, resultsDim, isWriteConfigInfo,...
                        modeForOptimization,efficiency,totalReflectedPower,...
                        totalTransmittedPower,T0Ravi,R0Ravi)
            resultsFileName='results.opt';
            direct=pwd;
            diskLetter=direct(1);
            if strcmp(diskLetter,'D')
                resultsFileName='resultsTechnion.opt';
            end
            dt=string(datetime);
            fid=fopen(resultsFileName,'a');   %Open for appending
            fprintf(fid,'%s\n',dt);
            fclose(fid);
            
            save(resultsFileName,'resultsDim','-ascii','-append')
            save(resultsFileName,'modeForOptimization','efficiency','-ascii','-append')
            save(resultsFileName,'totalReflectedPower','totalTransmittedPower','-ascii','-append')
            T0CST=app.realT0Edit.Value+1i*app.ImagT0Edit.Value;
            if abs(T0CST)>0
                %reT0=app.realT0Edit.Value;
                %imT0=app.ImagT0Edit.Value;
                if app.LUTCheckBox.Value
                    absT=abs(T0Ravi);
                    phaseT=angle(T0Ravi)*180/pi;
                else
                    absT=abs(T0CST);
                    phaseT=angle(T0CST)*180/pi;
                end
                save(resultsFileName,'absT','phaseT','-ascii','-append')
            end
            %And now write the data that can be used in the read data function to
            %display the configuration.
            if isWriteConfigInfo
                C=WriteData(app, handles);
                Ctranspose=C.';
                save(resultsFileName,'Ctranspose','-ascii','-append')
            end
        end
        
        
        function handles = saveTargetModeInfo(app,handles,TGmodeNumber)
            %saveTargetModeInfo saves the current configuration for the
            %current sequential target mode (tgm). Note: this is the sequential
            %>=1. Thus, for mode 0, the sequential target mode can be 2.
            %We have to save the mode number of a propagating mode.  
            % Make sure the entry in the edit box is a propagating mode.
            modeNumProp=app.targetOptimModeSpinner.Value;
            if modeNumProp<handles.modeNumberPropagating(1) || ...
               modeNumProp>handles.modeNumberPropagating(end)
                msgbox('This is not a propagating mode.')
                return
            end
            if TGmodeNumber==1 %changed 30.10.24 to conform with requirements.
                if ~app.layerThicknessCheckBox.Value && ...
                     ~app.wireOffsetCheckBox.Value && ... 
                     ~app.wireReactanceCheckBox.Value
                    msgbox('No parameter has been chosen for optimization.')
                    return
                end
            end
            app.TGMpropModeNumber(TGmodeNumber)=modeNumProp;
            app.TGMmodeIndex(TGmodeNumber)=find(handles.modeNumberPropagating==modeNumProp);
            LL=length(handles.wireHorizOffset);
            app.TGMwireHorizOffset(TGmodeNumber,1:LL)=handles.wireHorizOffset;
            app.TGMwireDistImped(TGmodeNumber,1:LL)=handles.wireDistImped;
            app.TGMhOverWL(TGmodeNumber,1:LL)=handles.hOverWL'; 
            %For some reason, hOverWL is a column vector and not a row
            %vector.
            app.TGMnCoupledTo(TGmodeNumber,1:LL)=handles.nCoupledTo;
            app.TGMdistCoupledTo(TGmodeNumber,1:LL)=handles.distCoupledTo;
            app.TGMincludeInOptim(TGmodeNumber,1:LL)=handles.includeInOptim;
            app.TGMisPossibleCoupling(TGmodeNumber)=handles.isPossibleCoupling;
            app.TGMdefined(TGmodeNumber)=true;
            app.TGMincludeLayerThicknessInOptim(TGmodeNumber)=app.layerThicknessCheckBox.Value;
            app.TGMincludeWireOffsetInOptim(TGmodeNumber)=app.wireOffsetCheckBox.Value;
            app.TGMincludeWireReactanceInOptim(TGmodeNumber)=app.wireReactanceCheckBox.Value;
            app.TGMefficiency(TGmodeNumber)=str2double(app.targetOptimEfficiency1Text.Text);
            app.undefinedLabel.Text='defined';
            app.TGMweight(TGmodeNumber)=app.WtEditField.Value;
        end

        function handles=displayTargetModeInfo(app,handles,TGmodeNumber)
            %displayTargetModeInfo displays the configuration of the 
            % sequential target mode (tgm) TGmodeNumber
            %Note: this is the sequential mode
            %>=1. Thus, for mode 0, the sequential target mode can be 2.
            modeNumProp=app.TGMpropModeNumber(TGmodeNumber);
            app.targetOptimModeSpinner.Value=modeNumProp;
            %
            handles.wireHorizOffset=app.TGMwireHorizOffset(TGmodeNumber,:);
            handles.wireDistImped=app.TGMwireDistImped(TGmodeNumber,:);
            handles.hOverWL=app.TGMhOverWL(TGmodeNumber,:)'; 
            %For some reason, hOverWL is a column vector and not a row
            %vector.
            handles.nCoupledTo=app.TGMnCoupledTo(TGmodeNumber,:);
            handles.distCoupledTo=app.TGMdistCoupledTo(TGmodeNumber,:);
            handles.includeInOptim=app.TGMincludeInOptim(TGmodeNumber,:);
            handles.isPossibleCoupling=app.TGMisPossibleCoupling(TGmodeNumber);
            app.layerThicknessCheckBox.Value=app.TGMincludeLayerThicknessInOptim(TGmodeNumber);
            app.wireOffsetCheckBox.Value=app.TGMincludeWireOffsetInOptim(TGmodeNumber);
            app.wireReactanceCheckBox.Value=app.TGMincludeWireReactanceInOptim(TGmodeNumber);
            app.WtEditField.Value=app.TGMweight(TGmodeNumber);
            %
            mediumNumber=handles.mediumNumber;
            app.includeInOptimizationCheckBox.Value=handles.includeInOptim(mediumNumber);
            app.coupleMedium2Edit.Value=num2str(handles.nCoupledTo(mediumNumber));
            %conductorLosses(handles);
            %guidata(hObject,handles);
            %
            isWk=app.WkCheckBox.Value;
            if isWk
                handles.realZ=zeros(size(handles.wireDistImped));
                eta=376.730313668;
                for ii=1:handles.numMedia-1
                    if handles.isWire(ii)==1
                        Z=Wk2Z(app,ii,handles.Wk(ii));
                        handles.wireDistImped(ii)=imag(Z);
                        handles.realZ(ii)=real(Z);
                        handles.realZtilde=real(Z)*eta/handles.WL;
                    end
                    handles=mgGAMMA(app, handles,ii);
                end
            else
                for ii=1:handles.numMedia-1
                    handles=mgGAMMA(app, handles,ii);
                end
            end
            handles=getModesForOptimization(app, handles);
            handles=drawMedia(app, handles);
            %Place the following at the end so that coupling would already
            %have been implemented as the latest values are in handles.wireHorizOffset
            handles = setNewMediumFrame(app, handles);
        end
        
        function handles=coupling(app,handles)
            if handles.isPossibleCoupling
                %Find the indices of the wires that are linked to other wires.
                ind=find(handles.nCoupledTo ~= 1:handles.numMedia-1);
                if isempty(ind)
                    msgbox('Coupling not found.')
                end
                for ii=1:length(ind)
                    jj=ind(ii);
                    layerForCoupling=handles.nCoupledTo(jj);
                    handles.wireHorizOffset(jj)=handles.wireHorizOffset(layerForCoupling)-handles.distCoupledTo(jj);
                    if handles.wireHorizOffset(jj)<0
                        handles.wireHorizOffset(jj)=handles.wireHorizOffset(jj)+1;
                    else
                        if handles.wireHorizOffset(jj)>1
                            handles.wireHorizOffset(jj)=handles.wireHorizOffset(jj)-1;
                        end
                    end
                    handles=mgGAMMA(app, handles,jj);
                end
                %checkoffsets(handles.wireHorizOffset)
            end
            
        end
        
        function wiresTopBotDielectric(app,handles)
            %This function finds the indices of the first and last wires on
            %the tops of the dielectrics and on the bottom of the
            %dielectrics. This is necessary for including symmetry of the
            %wires which is, in turn required if we wish to use symmetry to
            %obtain the solution for half the modes.
            %
            %Get the number of dielectric layers.
            indDielectrics=find(handles.isWire==2);
            app.ndielectrics=length(indDielectrics);
            if app.ndielectrics==0
                return
            end
            %
            %For each of the dielctrics, determine the wires on their top
            %and on their bottoms. The criterion will include not crossing
            %an air gap or another dielectric.
            %Get params for optimization with symmetry. 
            % NindWireImped,NindWireOffset are the number of independent indices
            %for distributed impedance and wire offset, respectively. When
            %there is symmetry, there will be fewer, since some are not
            %indepedendet in order to attain symmetry. Find these lower
            %values NindWireImpedSym,NindWireOffsetSym. These will not
            %necessarily be equal.
            NindWireImpedSym=0;
            NindWireOffsetSym=0;
            indWireImpedSymA=[];   %The indices of the independent wires for impedance.
            indWireImpedSymB=[];   %The indices of the wires symmetrical with those above.
            indWireOffsetSymA=[];  %The indices of the independent wires for offset.
            indWireOffsetSymB=[];  %The indices of the wires symmetrical with those above.
            indWireOffsetSymCenter=[]; %Two rows corresponding to the above.
            %The locations of the wires represented by indWireOffsetSymB 
            % are symmetrical wrt indWireOffsetSymA. But the location of
            % symmetry must be defined. This location will be the average
            % of the locations of the wire in the first row and the second
            % row. 
            for ii=1:app.ndielectrics
                indDielectric=indDielectrics(ii);
                %
                %Consider the region above this dielectric.
                indWiresOnTop=[];
                for iiMinus=indDielectric-1:-1:1
                    if handles.isWire(iiMinus)==1
                        indWiresOnTop=[indWiresOnTop iiMinus];
                    end
                    if handles.isWire(iiMinus)>1  %It is something other than wire.
                        break
                    end
                end
                if ~isempty(indWiresOnTop)
                    %Added the following condition Nov. 2024. The wires on the top
                    %of this dielectric may be the same as the wires at the
                    %bottom of the previous dielectric. If so, skip this
                    %section.
                    iaa=ismember(indWiresOnTop,indWireImpedSymA);
                    if ~any(iaa)
                        m=length(indWiresOnTop);
                        iseven=rem(m,2)==0;
                        if iseven
                            addImped=m/2;
                            indWireImpedSymA=[indWireImpedSymA indWiresOnTop(1:addImped)];
                            indWireImpedSymB=[indWireImpedSymB indWiresOnTop(addImped+1:end)];
                            %The impedances on one side (laterally) will = those 
                            %on the other.
                            addOffset=m/2+1;
                            indWireOffsetSymA=[indWireOffsetSymA indWiresOnTop(1:addOffset)];
                            indWireOffsetSymB=[indWireOffsetSymB indWiresOnTop(addOffset+1:end) indWiresOnTop(addOffset-1:addOffset)];
                            indcen1=indWiresOnTop(addOffset-1);
                            indcen2=indWiresOnTop(addOffset);
                            indcen12=[indcen1;indcen2];
                            indWireOffsetSymCenter=[indWireOffsetSymCenter repmat(indcen12,1,addOffset)];
                            %One of those on the other side can be added to
                            %define the center between it and its partner on
                            %the first side.
                        else
                            addImped=(m-1)/2+1;
                            indWireImpedSymA=[indWireImpedSymA indWiresOnTop(1:addImped)];
                            indWireImpedSymB=[indWireImpedSymB indWiresOnTop(addImped+1:end) indWiresOnTop(addImped)];
                            %Those on one side plus the one in the center.
                            %In order to make the A and B vectors the same
                            %length (which is required during optimization),
                            %the "center" wire index is added at the end, so
                            %that during optimization, the the center
                            %impdedance will equal itself.
                            addOffset=(m-1)/2+1;
                            indWireOffsetSymA=[indWireOffsetSymA indWiresOnTop(1:addOffset)];
                            indWireOffsetSymB=[indWireOffsetSymB indWiresOnTop(addOffset+1:end) indWiresOnTop(addOffset)];
                            indcen1=indWiresOnTop(addOffset);
                            indcen2=indWiresOnTop(addOffset); %The center corresponds to this wire.
                            indcen12=[indcen1;indcen2];
                            indWireOffsetSymCenter=[indWireOffsetSymCenter repmat(indcen12,1,addOffset)];
                        end
                        NindWireImpedSym=NindWireImpedSym+addImped;
                        NindWireOffsetSym=NindWireOffsetSym+addOffset;
                        %
                    end
                end
                %
                %
                %Consider the region below this dielectric.
                indWiresOnBot=[];
                for iiPlus=indDielectric+1:handles.numMedia-1
                    if handles.isWire(iiPlus)==1
                        indWiresOnBot=[indWiresOnBot iiPlus];
                    end
                    if handles.isWire(iiPlus)>1  %It is something other than wire.
                        break
                    end
                end
                if ~isempty(indWiresOnBot)
                    m=length(indWiresOnBot);
                    iseven=rem(m,2)==0;
                    isStartSym=0;
                    %The following condition was changed in Nov. 2024. This
                    %was originally meant to consider a sliding layer for
                    %which it was important that the wires on each layer be
                    %symmetry independently. In most cases, though, the
                    %entire configuration should be symmetric, not just
                    %each layer separately. This change (hopefully) reflects that.
                    %if isempty(indWiresOnTop)
                    if isempty(indWireImpedSymA)
                        isStartSym=1;
                    end
                    if iseven
                        addImped=m/2;
                        indWireImpedSymA=[indWireImpedSymA indWiresOnBot(1:addImped)];
                        indWireImpedSymB=[indWireImpedSymB indWiresOnBot(addImped+1:end)];
                        %The impedances on one side will = those on the
                        %other.
                        if isStartSym
                            %Since there are no wires along the top of the
                            %dielectric, the symmetry will only depend on
                            %the wires of the bottom.
                            addOffset=m/2+1;
                            indWireOffsetSymA=[indWireOffsetSymA indWiresOnBot(1:addOffset)];
                            indWireOffsetSymB=[indWireOffsetSymB indWiresOnBot(addOffset+1:end) indWiresOnBot(addOffset-1:addOffset)];
                            indcen1=indWiresOnBot(addOffset-1);
                            indcen2=indWiresOnBot(addOffset);
                            indcen12=[indcen1;indcen2];
                            indWireOffsetSymCenter=[indWireOffsetSymCenter repmat(indcen12,1,addOffset)];
                        else
                            %The wires of the bottom of the dielectric must
                            %be centered on the point of symmetry of the
                            %wires on the top.
                            addOffset=m/2;
                            indWireOffsetSymA=[indWireOffsetSymA indWiresOnBot(1:addOffset)];
                            indWireOffsetSymB=[indWireOffsetSymB indWiresOnBot(addOffset+1:end)];
                            indWireOffsetSymCenter=[indWireOffsetSymCenter repmat(indcen12,1,addOffset)];
                            %The indcen12 here is the one found for the
                            %top.
                        end
                        %One of those on the other side can be added to
                        %define the center between it and its partner on
                        %the first side.
                    else
                        addImped=(m-1)/2+1;
                        %Those on one side plus the one in the center.
                        indWireImpedSymA=[indWireImpedSymA indWiresOnBot(1:addImped)];
                        indWireImpedSymB=[indWireImpedSymB indWiresOnBot(addImped+1:end) indWiresOnBot(addImped)];
                        if isStartSym
                            %Since there are no wires along the top of the
                            %dielectric, the symmetry will only depend on
                            %the wires of the bottom.
                            addOffset=(m-1)/2+1;
                            indWireOffsetSymA=[indWireOffsetSymA indWiresOnBot(1:addOffset)];
                            indWireOffsetSymB=[indWireOffsetSymB indWiresOnBot(addOffset+1:end) indWiresOnBot(addOffset)];
                            indcen1=indWiresOnBot(addOffset);
                            indcen2=indWiresOnBot(addOffset); %The center corresponds to this wire.
                            indcen12=[indcen1;indcen2];
                            indWireOffsetSymCenter=[indWireOffsetSymCenter repmat(indcen12,1,addOffset)];
                        else
                            %The wires of the bottom of the dielectric must
                            %be centered on the point of symmetry of the
                            %wires on the top.
                            addOffset=(m-1)/2;
                            %This does not include the center point which
                            %is constrained to be at the location of the
                            %center point of the wires-on-top.
                            indWireOffsetSymA=[indWireOffsetSymA indWiresOnBot(1:addOffset) 0];
                            indWireOffsetSymB=[indWireOffsetSymB indWiresOnBot(addOffset+2:end) indWiresOnBot(addOffset+1)];
                            indWireOffsetSymCenter=[indWireOffsetSymCenter repmat(indcen12,1,addOffset+1)];
                            %Note Note Note
                            %This is exceptional. Hopefully it will work in
                            %the code. The last term in these vectors
                            %represents the center wire which is not
                            %independent, but must be placed at the center
                            %of the top wires. The value 0 in
                            %indWireOffsetSymA is meant to indicate that
                            %the corresponding entry in indWireOffsetSymB
                            %does not depend on indWireOffsetSymA, but
                            %rather solely on indWireOffsetSymCenter.
                            %The indcen12 here is the one found for the
                            %top.
                        end
                    end
                    NindWireImpedSym=NindWireImpedSym+addImped;
                    NindWireOffsetSym=NindWireOffsetSym+addOffset;
                    %
                end
            end
            app.indWireImpedSymA=indWireImpedSymA;   %The indices of the independent wires for impedance.
            app.indWireImpedSymB=indWireImpedSymB;   %The indices of the wires symmetrical with those above.
            app.indWireOffsetSymA=indWireOffsetSymA;  %The indices of the independent wires for offset.
            app.indWireOffsetSymB=indWireOffsetSymB;  %The indices of the wires symmetrical with those above.
            app.indWireOffsetSymCenter=indWireOffsetSymCenter; %Two rows corresponding to the above.
            app.NindWireImpedSym=NindWireImpedSym;
            app.NindWireOffsetSym=NindWireOffsetSym;
        end
        
        function handles=incrementalDisplay(app,handles,TGmodeNumber,TGmodeNumberPrev,nincrements)
            %incrementalDisplay displays the configuration in nincrements increments
            %from the configuration of sequential target mode (tgm)
            %TGmodeNumberPrev to the configuration of sequential target
            %mode TGmodeNumber.  Note: this is the sequential mode
            %>=1. Thus, for mode 0, the sequential target mode can be 2.
            %since this only deals with display, anything to do with
            %optimization is not needed.
            %
            wireHorizOffset1=app.TGMwireHorizOffset(TGmodeNumberPrev,:);
            wireDistImped1=app.TGMwireDistImped(TGmodeNumberPrev,:);
            hOverWL1=app.TGMhOverWL(TGmodeNumber,:)'; 
            wireHorizOffset2=app.TGMwireHorizOffset(TGmodeNumber,:);
            wireDistImped2=app.TGMwireDistImped(TGmodeNumber,:);
            hOverWL2=app.TGMhOverWL(TGmodeNumber,:)';
            wireHorizOffsetDel=(wireHorizOffset2-wireHorizOffset1)/(nincrements+1);
            wireDistImpedDel=(wireDistImped2-wireDistImped1)/(nincrements+1);
            hOverWLDel=(hOverWL2-hOverWL1)/(nincrements+1);
            for jj=1:nincrements
                handles.wireHorizOffset=wireHorizOffset1+jj*wireHorizOffsetDel;
                handles.wireDistImped=wireDistImped1+jj*wireDistImpedDel;
                handles.hOverWL=hOverWL1+jj*hOverWLDel; 
                for ii=1:handles.numMedia-1
                    handles=mgGAMMA(app, handles,ii);
                end
                handles=drawMedia(app, handles);
                drawnow
            end
            % %For some reason, hOverWL is a column vector and not a row
            % %vector.
            % handles.nCoupledTo=app.TGMnCoupledTo(TGmodeNumber,:);
            % handles.distCoupledTo=app.TGMdistCoupledTo(TGmodeNumber,:);
            % handles.includeInOptim=app.TGMincludeInOptim(TGmodeNumber,:);
            % handles.isPossibleCoupling=app.TGMisPossibleCoupling(TGmodeNumber);
            % app.layerThicknessCheckBox.Value=app.TGMincludeLayerThicknessInOptim(TGmodeNumber);
            % app.wireOffsetCheckBox.Value=app.TGMincludeWireOffsetInOptim(TGmodeNumber);
            % app.wireReactanceCheckBox.Value=app.TGMincludeWireReactanceInOptim(TGmodeNumber);
            % %
            % mediumNumber=handles.mediumNumber;
            % app.includeInOptimizationCheckBox.Value=handles.includeInOptim(mediumNumber);
            % app.coupleMedium2Edit.Value=num2str(handles.nCoupledTo(mediumNumber));
            % %conductorLosses(handles);
            % %guidata(hObject,handles);
            % %
            % for ii=1:handles.numMedia-1
            %     handles=mgGAMMA(app, handles,ii);
            % end
            % handles=getModesForOptimization(app, handles);
            % handles=drawMedia(app, handles);
            % %Place the following at the end so that coupling would already
            % %have been implemented as the latest values are in handles.wireHorizOffset
            % handles = setNewMediumFrame(app, handles);
        end
        

        function handles=optimModeSeqNumEdit_Function(app,handles)
            modeNumberPrev=app.seqModeNumber;
            modeNumber=app.modenoSpinner.Value;
            app.seqModeNumber=modeNumber;
            if ~isempty(app.TGMdefined)
                if length(app.TGMdefined)>=modeNumber
                    if app.TGMdefined(modeNumber)
                        if app.incrementdisplayCheckBox.Value && modeNumberPrev>0
                            nincrements=app.NoincrSpinner.Value;
                            handles=incrementalDisplay(app,handles,modeNumber,modeNumberPrev,nincrements);
                        end
                        if app.FloqincwavesCheckBox.Value
                            handles.PincMag=handles.PincMagDim(:,modeNumber);
                            handles.PincPhaseDeg=handles.PincPhaseDegDim(:,modeNumber);
                            incAngDegFloq=handles.incAngDegFloq;
                            isPropagating=~isnan(incAngDegFloq);
                            nPropagating=find(isPropagating);
                            thetaIncDegDim=incAngDegFloq(nPropagating);
                            nFloq=length(incAngDegFloq);
                            handles=manipIncWaves(app,handles.PincMag,handles.PincPhaseDeg,thetaIncDegDim,nFloq,nPropagating,handles);
                            nPropagatingWaves=length(thetaIncDegDim);
                            %Set sliders etc.
                            for ii=1:nPropagatingWaves
                                eval(['app.incWaveSlider' num2str(ii) '.Value=handles.PincMag(' num2str(ii) ');'])
                                eval(['app.incWave' num2str(ii) 'EditNumeric.Value=handles.PincMag(' num2str(ii) ');'])
                                eval(['app.incWave' num2str(ii) 'EditPhase.Value=handles.PincPhaseDeg(' num2str(ii) ');'])
                            end
                        end
                        handles=displayTargetModeInfo(app,handles,modeNumber);
                        app.undefinedLabel.Text='defined';
                    else
                        app.undefinedLabel.Text='undefined';
                    end
                else
                    app.undefinedLabel.Text='undefined';
                end
            else
                app.undefinedLabel.Text='undefined';
            end
        end
        
        function Z = Wk2Z(app,mediumNo,Wkmil)
            %Wk2Z determines the real and imaginary parts of the
            %distributed impedance Z for the wires in medium mediumNo for
            %capacitor width Wk given in mil (Wkmil). 
            %The polynomial coefficients pReal and pImag were obtained with
            %the aid of the Basic Curve Fitting tool of Matlab figures, 
            % employing 5th order polynomial. 
            %THE DATA IS APPLICATION-DEPENDENT. It is meant for a specific
            %problem.Most of the data was derived for 5-layer
            %configurations. The main problem with this is for real part of
            %the impedance for internal locations because for this case there 
            %are three locations for which the data is given.  Since the
            %differences between them are not radical, they will be used
            %for configurations with other numbers of layers. If there are
            %more than 5 layers, then there are more 3 internal layers. In
            %such a case, the last internal level will be used for all
            %remaining layers. (This is only slightly hokey.) This is
            %accomplished by using the "otherwise" statement.
            %isJCross=4;
            %isJCross=0 is non-Jerusalem-cross, 20 GHz, wire width = 4 mil,
            %           d=.2041*lambda
            %isJCross=1 is Jerusalem Cross, 14 GHz, w=4 mil
            %isJCross=2 is Jerusalem Cross, 20 GHz, w=4 mil
            %isJCross=3 is Jerusalem Cross, 14 GHz A (i.e. modified), w=4
            %                   mil (I think this should be 6.)
            %isJCross=4 is Jerusalem Cross, 94 GHz, w=2 mil 
            %isJCross=5 is Jerusalem Cross, 94 GHz, but with special handling 
            %           in CST for small Wk. Max Wk: 17, , w=2 mil 
            %isJCross=6 is Jerusalem Cross, 14 GHz B (i.e. modified), w=6
            %            mil, s=6 mil
            %isJCross=7 is Jerusalem Cross, 14 GHz, w=6 mil, s=3 mil
            %isJCross=8 is Jerusalem Cross, 13 GHz, w=6 mil, s=6 mil,
            %             created to check frequency response of isJCross=6
            %isJCross=9 is Jerusalem Cross, 11.7 GHz, w=6 mil, s=6 mil.
            %isJCross=10 is Jerusalem Cross, 11.7 GHz, w=6 mil, s=6 mil,
            %             but using the configuration (i.e. period) of
            %             isJcross=6
            switch app.isJCross
                case 1
                    switch mediumNo
                        case app.caseEdge
                            pReal=[5.1381e-12 -1.1194e-09 4.6502e-08 4.9803e-06 -0.0001246 0.00074261];
                            pImag=[-1.235e-09 4.8182e-07 -7.7007e-05 0.0064929 -0.32478 10.5186];
                        case app.caseInternal
                            %pReal=[1.5863e-10 -4.1612e-08 3.7847e-06 -0.00013446 0.0012285 0.022796];
                            pImag=[7.7458e-12 8.4287e-08 -2.8651e-05 0.0034064 -0.20146 6.8622];
                            %For the internal interfaces, the dependence of
                            %Real(Z) on Wk differs from one interface to
                            %another. Here we tried using the center result
                            %(interface 3). Now let's try to describe each one
                            %separately.
                            switch mediumNo
                                case app.caseInternal{1}
                                    pReal=[1.2794e-10 -3.3636e-08 3.0726e-06 -0.00011021 0.0011656 0.015785];
                                case app.caseInternal{2}
                                    pReal=[1.5863e-10 -4.1612e-08 3.7847e-06 -0.00013446 0.0012285 0.022796];
                                %case app.caseInternal{3}
                                otherwise
                                    pReal=[5.0146e-11 -1.1847e-08 8.7004e-07 -1.1475e-05 -0.0010619 0.040138];
                            end
                    end
                case 2
                    switch mediumNo
                        case app.caseEdge
                            %pReal=[5.1381e-12 -1.1194e-09 4.6502e-08 4.9803e-06 -0.0001246 0.00074261];
                            pReal=[-9.4075e-11 2.9629e-08 -3.4347e-06 0.0001858 -0.0042652 0.039738];
                            %pImag=[-1.235e-09 4.8182e-07 -7.7007e-05 0.0064929 -0.32478 10.5186];
                            pImag=[-9.7017e-09 2.5055e-06 -0.00026403 0.014696 -0.48665 10.5968];
                        case app.caseInternal
                            %pReal=[1.5863e-10 -4.1612e-08 3.7847e-06 -0.00013446 0.0012285 0.022796];
                            %pImag=[7.7458e-12 8.4287e-08 -2.8651e-05 0.0034064 -0.20146 6.8622];
                            pImag=[-8.2664e-09 1.9344e-06 -0.00019011 0.0099359 -0.31603 6.7997];
                            %For the internal interfaces, the dependence of
                            %Real(Z) on Wk differs from one interface to
                            %another. Now let's try to describe each one separately.
                            switch mediumNo
                                case app.caseInternal{1}
                                    %pReal=[1.2794e-10 -3.3636e-08 3.0726e-06 -0.00011021 0.0011656 0.015785];
                                    pReal=[2.3599e-10 -4.8597e-08 3.4241e-06 -8.3052e-05 4.9858e-05 0.026652];
                                case app.caseInternal{2}
                                    %pReal=[1.5863e-10 -4.1612e-08 3.7847e-06 -0.00013446 0.0012285 0.022796];
                                    pReal=[-3.2808e-10 8.3059e-08 -7.7783e-06 0.00034307 -0.0072687 0.072517];
                                %case app.caseInternal{3}
                                otherwise
                                    %pReal=[5.0146e-11 -1.1847e-08 8.7004e-07 -1.1475e-05 -0.0010619 0.040138];
                                    pReal=[-2.1596e-10 5.2436e-08 -4.8439e-06 0.00021772 -0.005133 0.061682];
                            end
                    end
                case 3
                    switch mediumNo
                        case app.caseEdge
                            pReal=[1.1326e-11 -2.839e-09 2.1908e-07 -2.5779e-06 1.2319e-05 -7.1656e-06];
                            pImag=[-1.376e-09 5.2124e-07 -8.0993e-05 0.0066695 -0.32805 10.5373];
                        case app.caseInternal
                            pImag=[-1.1638e-09 3.9472e-07 -5.7467e-05 0.0045036 -0.21606 6.8711];
                            %For the internal interfaces, the dependence of
                            %Real(Z) on Wk differs from one interface to
                            %another. Let's describe each one separately.
                            switch mediumNo
                                case app.caseInternal{1}
                                    %This is interface 2
                                    pReal=[6.8319e-12 -9.4637e-10 -2.6834e-08 1.164e-05 -0.00060488 0.021239];
                                case app.caseInternal{2}
                                    %This is interface 3
                                    pReal=[4.2048e-12 3.7653e-11 -1.7072e-07 2.2089e-05 -0.0010924 0.030561];
                                %case app.caseInternal{3}
                                otherwise
                                    %This is interface 4
                                    pReal=[-1.2843e-11 4.5593e-09 -6.2737e-07 4.4846e-05 -0.0018299 0.042122];
                            end
                    end
                case 4  
                    switch mediumNo
                        case app.caseEdge
                            pReal=[8.3268e-08 -2.208e-06 2.5907e-05 -0.00016627 0.00045769 -0.00026686];
                            pImag=[-1.5847e-05 0.0008397 -0.018193 0.21378 -1.6083 9.2197];
                        case app.caseInternal
                            pImag=[-2.028e-05 0.00088105 -0.016136 0.16407 -1.114 6.0337];
                            %For the internal interfaces, the dependence of
                            %Real(Z) on Wk differs from one interface to
                            %another. Let's describe each one separately.
                            switch mediumNo
                                case app.caseInternal{1}
                                    %This is interface 2
                                    pReal=[-1.1064e-06 5.0933e-05 -0.00087056 0.0072759 -0.037165 0.12111];
                                case app.caseInternal{2}
                                    %This is interface 3
                                    pReal=[-5.6932e-07 2.53e-05 -0.00036614 0.0016258 0.0013917 0.00035781];
                                %case app.caseInternal{3}
                                otherwise
                                    %This is interface 4
                                    pReal=[-3.8778e-07 2.1719e-05 -0.00040839 0.0032089 -0.010204 0.022788];
                            end
                    end
                case 5  
                    switch mediumNo
                        case app.caseEdge
                            pReal=[-2.94e-09 1.6868e-06 -3.5103e-05 0.00022303 -0.0004379 0.00014416];
                            pImag=[-3.9261e-05 0.0021464 -0.045429 0.47394 -2.717 10.8354];
                        case app.caseInternal
                            pImag=[-5.3703e-05 0.0025494 -0.04731 0.43208 -2.1415 7.3535];
                            %For the internal interfaces, the dependence of
                            %Real(Z) on Wk differs from one interface to
                            %another. Let's describe each one separately.
                            switch mediumNo
                                case app.caseInternal{1}
                                    %This is interface 2
                                    pReal=[-2.0598e-06 9.9396e-05 -0.0017995 0.015547 -0.070699 0.16925];
                                case app.caseInternal{2}
                                    %This is interface 3
                                    pReal=[-5.4011e-07 2.3917e-05 -0.00034212 0.0014409 0.0019806 -0.00015717];
                                %case app.caseInternal{3}
                                otherwise
                                    %This is interface 4
                                    pReal=[-3.3904e-07 2.0489e-05 -0.00041336 0.0035587 -0.013112 0.029483];
                            end
                    end
                case {6,10}
                    switch mediumNo
                        case app.caseEdge
                            pReal=[-6.5361e-11 2.1279e-08 -2.4878e-06 0.00012528 -0.0022572 0.012659];
                            pImag=[-4.4507e-09 1.4945e-06 -0.00019403 0.012511 -0.45565 11.3882];
                        case app.caseInternal
                            pImag=[-3.1931e-09 1.0562e-06 -0.00013645 0.0087036 -0.31108 7.5545];
                            %For the internal interfaces, the dependence of
                            %Real(Z) on Wk differs from one interface to
                            %another. Let's describe each one separately.
                            switch mediumNo
                                case app.caseInternal{1}
                                    %This is interface 2
                                    pReal=[-2.4114e-10 7.4846e-08 -8.3872e-06 0.00041193 -0.008455 0.071406];
                                case app.caseInternal{2}
                                    %This is interface 3
                                    pReal=[-2.1967e-10 6.8887e-08 -7.8149e-06 0.00038966 -0.0082489 0.073775];
                                %case app.caseInternal{3}
                                otherwise
                                    %This is interface 4
                                    pReal=[-2.2005e-10 6.9505e-08 -8.0162e-06 0.00041339 -0.0094454 0.09107];
                            end
                    end
                case 7
                    switch mediumNo
                        case app.caseEdge
                            pReal=[-5.6689e-11 1.859e-08 -2.2715e-06 0.00012683 -0.0028432 0.023577];
                            pImag=[-5.1327e-09 1.7138e-06 -0.00022107 0.014048 -0.48741 10.7446];
                        case app.caseInternal
                            pImag=[-3.3796e-09 1.1301e-06 -0.00014738 0.0094153 -0.32572 7.054];
                            %For the internal interfaces, the dependence of
                            %Real(Z) on Wk differs from one interface to
                            %another. Let's describe each one separately.
                            switch mediumNo
                                case app.caseInternal{1}
                                    %This is interface 2
                                    pReal=[-3.3241e-11 1.199e-08 -1.5559e-06 9.1479e-05 -0.0023279 0.032025];
                                case app.caseInternal{2}
                                    %This is interface 3
                                    pReal=[-5.5197e-11 1.9209e-08 -2.428e-06 0.00013926 -0.0036015 0.044633];
                                %case app.caseInternal{3}
                                otherwise
                                    %This is interface 4
                                    pReal=[-3.1499e-11 1.1609e-08 -1.5874e-06 0.00010216 -0.0032197 0.048121];
                            end
                    end
                case 8
                    switch mediumNo
                        case app.caseEdge
                            pReal=[-4.0046e-11 1.6179e-08 -2.4477e-06 0.00017079 -0.0051251 0.053903];
                            pImag=[-2.2473e-09 9.1163e-07 -0.0001437 0.011228 -0.4829 13.1397];
                        case app.caseInternal
                            pImag=[-2.4341e-09 8.7852e-07 -0.00012461 0.0087847 -0.34457 8.7766];
                            %For the internal interfaces, the dependence of
                            %Real(Z) on Wk differs from one interface to
                            %another. Let's describe each one separately.
                            switch mediumNo
                                case app.caseInternal{1}
                                    %This is interface 2
                                    pReal=[-7.6058e-11 2.9665e-08 -4.2317e-06 0.00027281 -0.0077767 0.089611];
                                case app.caseInternal{2}
                                    %This is interface 3
                                    pReal=[-6.1324e-11 2.3625e-08 -3.3529e-06 0.00021846 -0.0065048 0.084064];
                                %case app.caseInternal{3}
                                otherwise
                                    %This is interface 4
                                    pReal=[-7.2205e-11 2.6732e-08 -3.6752e-06 0.00023342 -0.0069053 0.089868];
                            end
                    end
                case 9
                    switch mediumNo
                        case app.caseEdge
                            pReal=[-1.1979e-11 5.2231e-09 -8.4959e-07 6.357e-05 -0.0019573 0.02537];
                            pImag=[-1.6939e-09 6.8427e-07 -0.00010773 0.00851 -0.38213 11.5199];
                        case app.caseInternal
                            pImag=[-1.2839e-09 4.9913e-07 -7.6502e-05 0.0058723 -0.25695 7.5959];
                            %For the internal interfaces, the dependence of
                            %Real(Z) on Wk differs from one interface to
                            %another. Let's describe each one separately.
                            switch mediumNo
                                case app.caseInternal{1}
                                    %This is interface 2
                                    pReal=[-2.2669e-11 1.0013e-08 -1.5978e-06 0.00011552 -0.0037723 0.057223];
                                case app.caseInternal{2}
                                    %This is interface 3
                                    pReal=[-2.7722e-11 1.0947e-08 -1.6055e-06 0.00010964 -0.0034879 0.054269];
                                %case app.caseInternal{3}
                                otherwise
                                    %This is interface 4
                                    pReal=[-1.861e-11 7.9818e-09 -1.2583e-06 9.203e-05 -0.0031953 0.054613];
                            end
                    end
                case 0
                    switch mediumNo
                        %case {1,17}
                        case app.caseEdge
                            pReal=[-3.4427e-11 1.2662e-08 -1.7703e-06 1.1459e-04 -0.0030 0.0323];
                            pImag=[-2.4840e-09 9.4074e-07 -1.3967e-04 0.0104 -0.4294 10.3596];
                        %case {5,9,13}
                        case app.caseInternal
                            pReal=[-1.3116e-11 4.7243e-09 -6.4858e-07 4.2492e-05 -0.0014 0.0286];
                            pImag=[-1.8218e-09 6.8541e-07 -1.0085e-04 0.0074 -0.3015 7.1708];
                    end
            end
            %pReal=zeros(1,6);   %For testing.
            reZ=0;
            imZ=0;
            P=6;
            WkPower=1;
            for ii=1:P
                m=P+1-ii;
                reZ=reZ+pReal(m)*WkPower;
                imZ=imZ+pImag(m)*WkPower;
                WkPower=WkPower*Wkmil;
            end
            Z=reZ+1i*imZ;
        end
        
        function switchCaseExpressions(app,isWire)
            %The function Wk2Z evaluates Z as a function of Wk by using a
            %polynomial fit. The results of a wire in a given layer
            %depeends on whether the wire is at the edge of the dielectric
            %or in an interior layer. This function defines the switch case
            %media for which wires in these media are at the edge of the
            %stack, and the media for which wires in these media are
            %internal to the stack. The results are returned in cell arrays
            %app.caseEdge and app.caseInternal.
            %
            %Get the indeces of the wires and the dielectrics.
            indWires=find(isWire==1);
            indDielectrics=find(isWire>1); %We're assuming no air gaps.
            indWiresAtEdges1a=find(indWires<indDielectrics(1));
            indWiresAtEdges2a=find(indWires>indDielectrics(end));
            indWiresAtEdges=[indWires(indWiresAtEdges1a) indWires(indWiresAtEdges2a)];
            indWiresInternal=indWires(indWiresAtEdges1a(end)+1:indWiresAtEdges2a(1)-1);
            %We must now transform indWiresAtEdges and indWiresInternal to
            %cell arrays.
            lenedge=length(indWiresAtEdges);
            app.caseEdge=cell(1,lenedge);
            for ii=1:lenedge
                app.caseEdge{ii}=[indWiresAtEdges(ii)];
            end
            %
            leninternal=length(indWiresInternal);
            app.caseInternal=cell(1,leninternal);
            for ii=1:leninternal
                app.caseInternal{ii}=[indWiresInternal(ii)];
            end

        end
        
        function handles = readOptFileHMS(app, handles)
            FileName=get(handles.dataFileText,'String');
            fid=fopen(FileName);
            %Find the date-time stamps and the number of modes for each
            %date-time stamp. The date-time stamp is identified by the line
            %with the ":". The  number of meta-atoms Natoms
            %should be the number of lines in the file that
            %contain ":". Get this number. 
            Natoms=0;
            isNotEndOfFile=1;
            while isNotEndOfFile
                tline=fgetl(fid);
                if tline==-1
                    break
                end
                if contains(tline,':')
                    Natoms=Natoms+1;
                end
            end
            %There are Natoms meta-atoms.
            frewind(fid)
            %Get the configuration data which is the data that is identical
            %to a data file. Do this for the first meta-atom.
            %Skip 8 lines to get to the beginning of the data file
            for jj=1:8
                tline=fgetl(fid);
            end
            %Now count the lines to the next time stamp (line with ":").
            nConfigLines=0;
            isContainsColon=false;
            while ~isContainsColon
                tline=fgetl(fid);
                if contains(tline,':')
                    isContainsColon=true;
                else
                    nConfigLines=nConfigLines+1;
                end
            end
            %There are nConfigLines in each configuration data group.
            frewind(fid)
            %Skip 8 lines to get to the beginning of the data file
            for jj=1:8
                tline=fgetl(fid);
            end
            %We want the next nConfigLines to be the matrix A of the first
            %group of config data.
            A=zeros(nConfigLines,7);
            for kk=1:nConfigLines
                tline=fgetl(fid);
                c=textscan(tline,'%f');
                cmat=cell2mat(c);
                A(kk,:)=cmat;
                %For this first configuration, make sure that the location
                %of the wire is 0.
                if kk>1 && A(kk,4)==1
                    A(kk,6)=0;
                end
            end
            %Get the period d. It is assumed this is the same for each
            %meta-atom.
            dOrig=A(1,3);
            d=dOrig*Natoms;
            A(1,3)=d;
            %We will now go through the other configs and integrate each
            %one into A.
            %We will be adding rows to A in the vicinity of the  current
            %rows that represent wires.  Find these rows:
            indwiresA=find(A(:,4)==1);
            if indwiresA(1)==1
                %we want to ignore the first line because it is a header.
                indwiresA=indwiresA(2:end);
            end
            indwiresB=indwiresA;
            lenindwiresA=length(indwiresA);
            lenindwiresB=lenindwiresA;
            %We will need to add virtual media here and there.
            VM=[1 0 0 0 0 0 0];
            for ii=2:Natoms
                %Skip 8 lines to get to the beginning of the data file
                for jj=1:8
                    tline=fgetl(fid);
                end
                %Now get the next configuration data
                B=zeros(nConfigLines,7);
                for kk=1:nConfigLines
                    tline=fgetl(fid);
                    c=textscan(tline,'%f');
                    cmat=cell2mat(c);
                    B(kk,:)=cmat;
                end
                %Adjust the wire location within the period.
                %dii=(ii-1)*dOrig;
                dii=(ii-1)/Natoms;
                B(indwiresB,6)=dii;
                %Integrate the wire-rows of B into A, adding virtual media.
                %After we add rows to A, we will update the value of
                %indwiresA so that it will represent the index of the last
                %row of a wire group. The group will consist of all the
                %wires at the same level.
                for kk=1:lenindwiresB
                    A=[A(1:indwiresA(kk),:);VM;B(indwiresB(kk),:);A(indwiresA(kk)+1:end,:)];
                    indwiresA(kk:end)=indwiresA(kk:end)+2;
                    %Be sure to fully debug this.
                end
            end    
            %A should now represent the expanded configuration data.
            fclose(fid);
            %
            %Save the data file
            save('combinedHMS.dat','A','-ascii');
            %Now read it.
            set(handles.dataFileText,'String','combinedHMS.dat')
            handles=readDataFile(app, handles);
            %handles=drawMedia(app, handles);  %included in readDataFile
        end
            
        
        function handles=makeWkSym(app,handles)
            if app.WkCheckBox.Value && isfield(handles,'Wk')
                %Impose the symmetry on Wk.
                eta=376.730313668;
                wireInd=find(handles.isWire==1); %These are the layer indices for wires
                lenwireInd=length(wireInd);  %this should be odd  %Not necessarily 8/2025
                lenwireIndHalf=fix(lenwireInd/2);
                if lenwireIndHalf*2~=lenwireInd
                    lenwireIndHalf=lenwireIndHalf+1;
                end
                indsStart=wireInd(1:lenwireIndHalf);
                %indsEnd=wireInd(lenwireIndHalf+2:end);
                indsEnd=wireInd(lenwireIndHalf+1:end);
                indsFin=fliplr(indsEnd);
                for ii=1:lenwireInd-lenwireIndHalf
                    iij=indsFin(ii);
                    handles.Wk(iij)=handles.Wk(indsStart(ii));
                    Z=Wk2Z(app,iij,handles.Wk(iij));
                    imagZ=imag(Z);
                    realZ=real(Z);
                    if iij==handles.mediumNumber
                        app.wireWkmilEdit.Value=num2str(handles.Wk(iij));
                        app.wireDistImpedEdit.Value=num2str(imagZ);
                        app.realZLabel.Text=num2str(realZ,3);
                    end
                    handles.realZtilde=realZ*eta/handles.WL;
                    handles.wireDistImped(iij)=imagZ;
                    handles=mgGAMMA(app, handles,iij);
                end
            end
            
        end
        
        function handles=WkSymFunc(app,handles) 
            wireInd=find(handles.isWire==1); %These are the layer indices for wires
            lenwireInd=length(wireInd);  %this should be odd %Not necessarily 8/2025
            lenwireIndHalf=fix(lenwireInd/2);
            if lenwireIndHalf*2~=lenwireInd
                lenwireIndHalf=lenwireIndHalf+1;
            end
            indsStart=wireInd(1:lenwireIndHalf);
            %indsEnd=wireInd(lenwireIndHalf+2:end); %These are those to turn on and off.
            indsEnd=wireInd(lenwireIndHalf+1:end); %These are those to turn on and off.
            if app.WkSymCheckBox.Value
                %We want to turn off indsEnd indices to include in
                %optimization
                handles.includeInOptim(indsEnd)=0;
                %We must save this
                TGmodeNumber=app.modenoSpinner.Value;
                handles = saveTargetModeInfo(app,handles,TGmodeNumber);
                handles=makeWkSym(app,handles);
                handles=drawMedia(app, handles);
            else
                %We want to turn back on indsEnd indices to include in optimzation. 
                handles.includeInOptim(indsEnd)=1;
                %We must save this
                TGmodeNumber=app.modenoSpinner.Value;
                handles = saveTargetModeInfo(app,handles,TGmodeNumber);
            end
            app.includeInOptimizationCheckBox.Value=handles.includeInOptim(handles.mediumNumber);
        end
        
        function getWkmax(app)
            %getWkmax estimates the value of the maximum allowed value of
            %Wk, and places the result in app.EditFieldubWk. This value is
            %in mil (and not normalized to the wavelength). It must
            %therefore be based on other information. This information is
            %in the "Metagrating wires" panel: the frequency and the wire width.
            %Get wavelength.
            switch app.isJCross
                case 2
                    Wkmaxmil=80;
                case {6,10}
                    Wkmaxmil=114;
                case 7
                    Wkmaxmil=112;
                case 8
                    Wkmaxmil=120;
                case 9
                    Wkmaxmil=134;
                otherwise
                    c0=299792458;
                    freqForLossGHz=str2double(app.lossFreqEdit.Value);
                    lambdaForLossMeters=c0/(freqForLossGHz*1.e9);
                    lambdamm=lambdaForLossMeters*1000;
                    %Get lambda in mils
                    lambdamil=lambdamm/.0254;
                    periodmil=app.periodEditField.Value*lambdamil;
                    wireWidthmil=str2double(app.wireWidthMilEdit.Value);
                    Wkmaxmil=periodmil-3*wireWidthmil; %Otherwise the two directions would touch.
            end
            app.EditFieldubWk.Value=Wkmaxmil;
            %msgbox('Wk upper bound for optimization has been adjusted. This depends on frequency and wire width.')
        end
        
        function WkExhaustiveSearch(app,handles)
            %WkExhaustiveSearch creates an .opt file by analyzing all
            %combinations of Wk for the wires of the structure, where Wk in 
            % in mils, and determining the corresponding magnitude and phase 
            % of the transmission coefficient. It is currently valid only 
            % for 5 wire layers.
            isWk=app.WkCheckBox.Value;
            if ~isWk
                msgbox('Exhaustive search is only possible if Wk is checked')
                app.safeDrawnow();
            end
            %Some preliminaries to prepare the .opt file
            LUTFileName='LUT.opt';
            direct=pwd;
            diskLetter=direct(1);
            if strcmp(diskLetter,'D')
                LUTFileName='TechnionLUT.opt';
            end
            %
            fid=fopen(LUTFileName,'w+');
            app.workingText.Visible='on';
            drawnow
            %
            %nwires=5;
            dmil=app.dmilnumEdit.Value; %The increment in mil, usually 2 or 3 
            indWire=find(handles.isWire==1);
            nwires=length(indWire);
            Wk1=app.EditFieldlbWk.Value;
            Wkend=app.EditFieldubWk.Value;
            Wki=Wk1:dmil:Wkend;
            Wksample=zeros(1,nwires);
            lenWki=length(Wki);
            isSym=app.WkSymCheckBox.Value;
            % https://www.mathworks.com/matlabcentral/answers/12564-change-text-in-a-msgbox
            msgboxstring=['Performing exhaustive search. 0 / ' num2str(lenWki) ...
                ' complete. Time remaining: ???? hours.'];
            hmsg=msgbox(msgboxstring);
            %set(findobj(hmsg,'Tag','MessageBox'),'String',msgboxstring)
            set(findobj(hmsg,'style','pushbutton'),'Visible','off')
            msgboxFontSize(hmsg, 14);  %External function
            app.quitOptimCheckBox.Enable=1;
            app.quitOptimCheckBox.Value=0;
            tic
            if isSym
                % if false
                % for i1=1:lenWki
                %     Wksample(1)=Wki(i1);
                %     Wksample(5)=Wki(i1);
                %     for i2=1:lenWki
                %         Wksample(2)=Wki(i2);
                %         Wksample(4)=Wki(i2);
                %         for i3=1:lenWki
                %             Wksample(3)=Wki(i3);
                %             WkExhaustiveCalc(app,handles,indWire,Wksample,fid)
                %         end
                %     end
                %     timeElapsed=toc;
                %     fractionCompleted=i1/lenWki;
                %     timeRemaining=timeElapsed*(1-fractionCompleted)/fractionCompleted;
                %     %https://www.mathworks.com/matlabcentral/answers/12564-change-text-in-a-msgbox
                %     msgboxstring=['Performing exhaustive search. ' num2str(i1) '/' num2str(lenWki) ...
                %         ' complete. Time remaining:' num2str(timeRemaining/3600) ' hours.'];
                %     set(findobj(hmsg,'Tag','MessageBox'),'String',msgboxstring)
                % end
                % end
                %
                %Let's try to emulate the nested for loops without the
                %for loops. This may be found at:
                %https://www.mathworks.com/matlabcentral/answers/386638-how-to-loop-through-an-unknown-number-of-matrix-dimensions
                %Get the number of layers that are varied for the
                %symmetric case.
                nwiresHalf=fix(nwires/2);
                if nwiresHalf*2~=nwires
                    nwiresHalf=nwiresHalf+1;
                end
                nv=nwiresHalf;
                v=ones(1,nv);
                vLim=lenWki;
                ready=false;
                while ~ready
                    % Do what you need with X and the index vector v
                    Wksample(1:nv)=Wki(v);
                    %Use symmetry
                    for jj=1:nwires-nwiresHalf
                        Wksample(nwires+1-jj)=Wksample(jj);
                    end
                    WkExhaustiveCalc(app,handles,indWire,Wksample,fid)
                    % Update the index vector:
                    ready = true;       % Assume that the WHILE loop is ready
                    for k = 1:nv
                        v(k) = v(k) + 1;
                        %if v(k) <= vLim(k)
                        if v(k) <= vLim
                            ready = false;  % No, WHILE loop is not ready now
                            if k==nv
                                %Added by swm
                                timeElapsed=toc;
                                fractionCompleted=(v(k)-1)/vLim;
                                timeRemaining=timeElapsed*(1-fractionCompleted)/fractionCompleted;
                                %https://www.mathworks.com/matlabcentral/answers/12564-change-text-in-a-msgbox
                                msgboxstring=['Performing exhaustive search. ' num2str(v(k)-1) '/' num2str(vLim) ...
                                    ' complete. Time remaining:' num2str(timeRemaining/3600) ' hours.'];
                                set(findobj(hmsg,'Tag','MessageBox'),'String',msgboxstring)
                                if  app.quitOptimCheckBox.Value
                                    if ishandle(hmsg)
                                        delete(hmsg)
                                    end
                                    app.workingText.Visible='off';
                                    fclose(fid);
                                    app.quitOptimCheckBox.Enable=0;
                                    app.quitOptimCheckBox.Value=0;
                                end
                                %End added by swm.
                            end
                            break;          % v(k) increased successfully, leave "for k" loop
                        end
                        v(k) = 1;         % Reset v(k), proceed to next k
                    end
                end
                %
                %end
            else
                % for i1=1:lenWki
                %     Wksample(1)=Wki(i1);
                %     for i2=1:lenWki
                %         Wksample(2)=Wki(i2);
                %         for i3=1:lenWki
                %             Wksample(3)=Wki(i3);
                %             for i4=1:lenWki
                %                 Wksample(4)=Wki(i4);
                %                 for i5=1:lenWki
                %                     Wksample(5)=Wki(i5);
                %                     WkExhaustiveCalc(app,handles,indWire,Wksample,fid)
                %                 end
                %             end
                %         end
                %     end
                %     timeElapsed=toc;
                %     fractionCompleted=i1/lenWki;
                %     timeRemaining=timeElapsed*(1-fractionCompleted)/fractionCompleted;
                %     %https://www.mathworks.com/matlabcentral/answers/12564-change-text-in-a-msgbox
                %     msgboxstring=['Performing exhaustive search. ' num2str(i1) '/' num2str(lenWki) ...
                %         ' complete. Time remaining:' num2str(timeRemaining/3600) ' hours.'];
                %     set(findobj(hmsg,'Tag','MessageBox'),'String',msgboxstring)
                % end
                %Let's try to emulate the nested for loops without the
                %for loops. This may be found at:
                %https://www.mathworks.com/matlabcentral/answers/386638-how-to-loop-through-an-unknown-number-of-matrix-dimensions
                %Get the number of layers that are varied for the
                %non-symmetric case.
                nv=nwires;
                v=ones(1,nv);
                vLim=lenWki;
                ready=false;
                while ~ready
                    % Do what you need with X and the index vector v
                    Wksample(1:nv)=Wki(v);
                    WkExhaustiveCalc(app,handles,indWire,Wksample,fid)
                    % Update the index vector:
                    ready = true;       % Assume that the WHILE loop is ready
                    for k = 1:nv
                        v(k) = v(k) + 1;
                        %if v(k) <= vLim(k)
                        if v(k) <= vLim
                            ready = false;  % No, WHILE loop is not ready now
                            if k==nv
                                %Added by swm
                                timeElapsed=toc;
                                fractionCompleted=(v(k)-1)/vLim;
                                timeRemaining=timeElapsed*(1-fractionCompleted)/fractionCompleted;
                                %https://www.mathworks.com/matlabcentral/answers/12564-change-text-in-a-msgbox
                                msgboxstring=['Performing exhaustive search. ' num2str(v(k)-1) '/' num2str(vLim) ...
                                    ' complete. Time remaining:' num2str(timeRemaining/3600) ' hours.'];
                                set(findobj(hmsg,'Tag','MessageBox'),'String',msgboxstring)
                                if  app.quitOptimCheckBox.Value
                                    if ishandle(hmsg)
                                        delete(hmsg)
                                    end
                                    app.workingText.Visible='off';
                                    fclose(fid);
                                    app.quitOptimCheckBox.Enable=0;
                                    app.quitOptimCheckBox.Value=0;
                                end
                                %End added by swm.
                            end
                            break;          % v(k) increased successfully, leave "for k" loop
                        end
                        v(k) = 1;         % Reset v(k), proceed to next k
                    end
                end
                %
                %end

            end
            if ishandle(hmsg)
                delete(hmsg)
            end
            app.workingText.Visible='off';
            fclose(fid);
            app.quitOptimCheckBox.Enable=0;
            app.quitOptimCheckBox.Value=0;
        end

        function WkExhaustiveCalc(app,handles,indWire,Wksample,fid)
            handles.Wk(indWire)=Wksample;
            %Recalculate.
            %handles=displayTargetModeInfo(app,handles,1);

            handles.realZ=zeros(size(handles.wireDistImped));
            for jj=1:length(Wksample)
                indjj=indWire(jj);
                Wk=Wksample(jj);
                Z=Wk2Z(app,indjj,Wk);
                handles.wireDistImped(indjj)=imag(Z);
                handles.realZ(indjj)=real(Z);
            end
            eta=376.730313668;
            for kk=1:handles.numMedia-1
                %In the standard (~isWk) version,
                %handles.realZtilde is the same for all media. Here
                %it changes. The imagZ (which is the distributed
                %impedance, was already changed above.
                handles.realZtilde=handles.realZ(kk)*eta/handles.WL;
                handles=mgGAMMA(app, handles,kk);
            end
            %When drawMedia is not called, coupling (which is contained 
            % in drawMedia, must be considered anyway.
            handles=coupling(app,handles);
            handles=runMain(app, handles);

            guidata(handles.figure1,handles);
            T0Ravi=handles.tauFloq(handles.nCurMd);
            R0Ravi=handles.rhoFloq(handles.nCurMd);
            absT0=abs(T0Ravi);
            if absT0*absT0>0.6
                phaseT0=angle(T0Ravi)*180/pi;
                absR0=abs(R0Ravi);
                LUTpartialResults=[phaseT0 absT0 phaseT0 absR0 Wksample];
                nelements=length(LUTpartialResults);
                formatSpec1='%.6e ';
                formatSpec2=repmat(formatSpec1,1,nelements);
                formatSpec=[formatSpec2 '\n'];
                fprintf(fid,formatSpec,LUTpartialResults);
                %fprintf(fid,'%.6e  %.6e  %.6e  %.6e  %.6e  %.6e  %.6e  %.6e  %.6e \n',LUTpartialResults);
                %save(LUTFileName,'LUTpartialResults','-ascii','-append')
                %Note that for exhaustive search, there is
                %no target phase, so that phaseT0
                %appears in its place.
            end
            drawnow
        end
        
        function handles=changeFreq(app,handles,newFreq)
            handles.freqGHz=newFreq;
            %This is only for presentation. We've decided to change the
            %parameters, but to leave the wavelength as unity.
            WL=.2997925/handles.freqGHz;
            % handles.WL=.2997925/handles.freqGHz;
            % handles.omega=2*pi*handles.freqGHz*1.e9;
            % handles.k0=2*pi/handles.WL;
            %handles.hOverWL(:,1)=h/handles.WL;
            %The (:,1) was added above to assure this remains column vector.
            %handles.d=handles.WL/handles.DELsin;
            % if get(handles.ghzRadioButton,'value')
            %     %GHz radio button is on
            %     wlString=num2str(handles.WL);
            % else
            %     %THz radio button is on
            %     wlString=num2str(handles.WL*1.e9);
            % end
            %
            %We are assuming that when we change the frequency and
            %wavelength, the structure remains unchanged. Since the length
            %parameters of the structure are given as relative to the
            %wavelength (which is normally taken as unity), if we change
            %the wavelength, these parameters must change as well. It is
            %assumed that the values of these parameters for wavelength=1
            %were saved in app elements
            %dAtWL1,hOverWLAtWL1,wireStripWidthAtWL1,wireDistImpedAtWL1,WkAtWL1
            %This does not have to be done for the Wk because they are
            %not normalized, but are given in mils. On second thought, so
            %what? 
            handles.d=app.dAtWL1/WL;
            handles.hOverWL=app.hOverWLAtWL1/WL;
            handles.wireStripWidth=app.wireStripWidthAtWL1/WL;
            %handles.wireDistImped=app.wireDistImpedAtWL1*(WL)^2;
            %handles.Wk=app.WkAtWL1/WL; This was placed below in the isWk if block.
            %
            handles.HankelSum=sumHankel(app,handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);  
            %set(handles.waveLengthText,'String',wlString)
            isWk=app.WkCheckBox.Value;
            if isWk
                handles.Wk=app.WkAtWL1/WL;
                %A little hokey. Why should Wk be changed since it is given
                %in mils, and so is not subject to changes in wavelength. 
                %Not so hokey after all, because in our model, it is as if
                %the wave length is remaining the same while the length
                %dimensions are changing. 
                eta=376.730313668;
                for ii=1:handles.numMedia-1
                    if handles.isWire(ii)==1
                        Z=Wk2Z(app,ii,handles.Wk(ii));
                        handles.wireDistImped(ii)=imag(Z)*(WL)^2;
                        handles.realZ(ii)=real(Z);
                    end
                    handles.realZtilde=handles.realZ(ii)*eta/handles.WL;
                    %For the time being, let's leave this (handles.WL=1)
                    handles=mgGAMMA(app,handles,ii);
                end
                %getWkmax(app);
            else
                handles.wireDistImped=app.wireDistImpedAtWL1*(WL)^2;
                for ii=1:handles.numMedia-1
                    handles=mgGAMMA(app, handles,ii);
                end
            end
        end
        
        function handles=lsqnonlin2PushButton_Function(app,handles,hObject)
            isRavi=app.RaviCheckBox.Value;
            isWk=app.WkCheckBox.Value;
            isLUT=app.LUTCheckBox.Value;
            %LBS is lastBestSolutions.
            isLUTLBS=false;
            isMeanEffOptim=app.isMeanEfficiencyOptim;
            if isRavi
                realZtildeIn=handles.realZtilde;
                %Implement the "save" button in the "optimization for
                %target modes" frame.
                TGmodeNumber=1;
                app.modenoSpinner.Value=TGmodeNumber;
                handles = saveTargetModeInfo(app,handles,TGmodeNumber);
                %
                lbLayerThickness=app.EditFieldlbLayerThickness.Value;
                ubLayerThickness=app.EditFieldubLayerThickness.Value;
                lbWireOffset=app.EditFieldlbWireOffset.Value;
                ubWireOffset=app.EditFieldubWireOffset.Value;
                lbWireReactance=app.EditFieldlbWireReactance.Value;
                ubWireReactance=app.EditFieldubWireReactance.Value;
                %Check if a CST Wk vs. T file is to be read if its name
                %exists.
                %TfileName=app.TCoefFileEdit.Value;
                %TfileName='';
                %TfileName='raviIntface1transmission.txt';
                TfileName=app.TCoefFileEdit.Value;
                if isempty(TfileName)
                    Wk=0;
                    realT=app.realT0Edit.Value;
                    imagT=app.ImagT0Edit.Value;
                else
                    %File name is defined. Read the data on it.
                    CSTTa=importdata(TfileName);
                    CSTT=CSTTa.data;
                    Wk=CSTT(:,1);
                    realT=CSTT(:,2);
                    imagT=-CSTT(:,3); %Note: negative because we assume e(-iwt).
                end
                lenT=length(Wk);
                realZ=zeros(lenT,1);
                imagZ=zeros(lenT,1);
                for ii=1:lenT
                    app.realT0Edit.Value=realT(ii);
                    app.ImagT0Edit.Value=imagT(ii);
                    app.magT0Edit.Value=sqrt(realT(ii)^2+imagT(ii)^2);
                    app.phaseT0Edit.Value=atan2(imagT(ii),realT(ii))*180/pi;
                    drawnow
                    [handles,~,~,~,~,~,~,~]...
                        =lsqnonlin2(app, handles,...
                        lbLayerThickness,ubLayerThickness,...
                        lbWireOffset,ubWireOffset,...
                        lbWireReactance,ubWireReactance);
                    precis=str2double(app.target0Label.Text);
                    if precis<1.e-3
                        %print the impedance results.
                        ind1=find(handles.isWire==1);
                        imagZ(ii)=handles.wireDistImped(ind1);
                        eta=376.730313668;
                        realZ(ii)=handles.realZtilde*handles.WL/eta;
                        app.realZEdit.Value=realZ(ii);
                        app.ImagZEdit.Value=imagZ(ii);
                    else
                        imagZ(ii)=NaN;
                        realZ(ii)=NaN;
                        app.realZEdit.Value=-999;
                        app.ImagZEdit.Value=-999;
                    end
                    drawnow
                end
                if lenT>1
                    %plot results
                    mm2mil=39.37;
                    figure
                    %plot(Wk,imagZ)
                    %xlabel('W_k (mm)')
                    plot(Wk*mm2mil,imagZ)
                    xlabel('W_k (mil)')
                    ylabel('Im(Z)')
                    grid
                    %
                    figure
                    %plot(Wk,realZ)
                    %xlabel('W_k (mm)')
                    plot(Wk*mm2mil,realZ)
                    xlabel('W_k (mil)')
                    ylabel('Re(Z)')
                    grid
                end
                handles.realZtilde=realZtildeIn;
                handles=drawMedia(app, handles);
                %guidata(hObject,handles)
                return
            end   %isRavi
            
            % hObject    handle to lsqnonlinPushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            %
            %
            %
            %Check compatibility with symmetry if necessary.
            if app.symmetricCheckBox.Value
                %make sure no wires have been excluded
                indWire=find(handles.isWire==1); %This is the same for all modes.
                indInclude=find(app.TGMincludeInOptim(1,:)); 
                %The structures for which the "incl. in opt." checkbox has been checked.
                %Only mode 1 need be checked.
                intsect=intersect(indWire,indInclude);
                if length(indWire)~=length(intsect)
                    msgbox('Wires excluded for mode 1, but symmetry chosen. Cannot optimize.')
                    return
                end
            end
            %Define the lower and upper bounds of the variables.
            lbLayerThickness=app.EditFieldlbLayerThickness.Value;
            ubLayerThickness=app.EditFieldubLayerThickness.Value;
            lbWireOffset=app.EditFieldlbWireOffset.Value;
            ubWireOffset=app.EditFieldubWireOffset.Value;
            lbWireReactance=app.EditFieldlbWireReactance.Value;
            ubWireReactance=app.EditFieldubWireReactance.Value;
            %
            effAll=0;
            resultsDim=[];
            isFirst=true;
            ntimes=0;
            if isLUT
                if ~app.TGMdefined(1)
                    %At least the first mode has to be defined.
                    msgbox('The optimization configuration has not been defined.')
                    return
                end
                %For the case of optimization that includes mean efficiency
                %over frequency, allow multiple times not to be checked.
                if ~app.multipleTimesCheckBox.Value && ~isMeanEffOptim
                    msgbox('LUT being used, but multiple-times not checked')
                    return
                end
                if ~isWk
                    msgbox('LUT being used, but Wk not checked')
                    %return
                end
                %
                direct=pwd;
                diskLetter=direct(1);
                if isMeanEffOptim
                    LUTFileName='LUT.opte';
                    if strcmp(diskLetter,'D')
                        LUTFileName='TechnionLUT.opte';
                    end
                else
                    LUTFileName='LUT.opt';
                    if strcmp(diskLetter,'D')
                        LUTFileName='TechnionLUT.opt';
                    end
                end
                %
                %Record all results with efficiency > LUTminEff.
                set(handles.maxEffEdit,'String',num2str(app.LUTminEff))
                set(handles.minEffEdit,'String',num2str(app.LUTminEff))
                %
                %When optimization will include the mean efficiency over
                %frequency, define T in terms of the current value, and not
                %in terms other target values.
                if isMeanEffOptim
                    %targetTMag=str2double(app.tauAbsText.Text);
                    targetTMag=1;
                    targetTPhase=str2double(app.tauPhaseText.Text);
                else
                    %In most cases, we will be varying the phase of T (angle)
                    %while keeping its magnitude constant, usually 1. This will
                    %be done if app.NLUTmags=1. However, if app.NLUTmags=>1,
                    %then the magnitude will be varied and the phase (angle)
                    %will be held constant. 
                    if app.NLUTmags==1
                        LUTangles=linspace(app.LUTang1,app.LUTang2,app.NLUTangles+1);
                        NcurLUTangles=1;
                        targetTPhase=LUTangles(NcurLUTangles);
                        targetTMag=app.LUTtargetTMagnitude;
                    else
                        LUTmags=linspace(app.LUTtargetTMagnitude,app.LUTtargetTMagnitude2,app.NLUTmags+1);
                        NcurLUTmags=1;
                        targetTPhase=app.LUTang1;
                        targetTMag=LUTmags(NcurLUTmags);
                    end
                end
                reT0=targetTMag*cosd(targetTPhase);
                imT0=targetTMag*sind(targetTPhase);
                app.realT0Edit.Value=reT0;
                app.ImagT0Edit.Value=imT0;
                app.magT0Edit.Value=targetTMag;
                app.phaseT0Edit.Value=targetTPhase;
                drawnow
                indWire=find(handles.isWire==1);
                LUTresults=[];   %This will change as additional solutions are found.
                %minTLBS=0.9; 
                %Changed Feb 2025
                minTLBS=targetTMag-0.1;
                %The minimum T that will be used for lastBestSolutions for 
                % determining the initial optimization configuration.
                %The size of LBS will change if there is more
                %than one LBS.
                %LBS=zeros(1,length(indWire)+2);
                %LBS=[0 0 handles.Wk(indWire)];%Added target phase and refl. coef.
                if isWk
                    LBS=[0 0 0 0 handles.Wk(indWire)];%Added target phase and refl. coef.
                else
                    LBS=[0 0 0 0 handles.wireDistImped(indWire)];%Added target phase and refl. coef.
                end
                %The first optimization will use the current config.  This
                %can be set by choosing the solution in the LUT app.
                numLBS=1;
                NcurLBS=0; 
                %The index from 1:numLBS of the last best
                %solutions used as initial configurations so far.
                %The values for the next configuration are being created 
                % while the values of the current configuration is being
                % used. 
                %LBSnext=zeros(1,length(indWire)+2);
                if isMeanEffOptim
                    LBSnext=zeros(1,length(indWire)+5);  %Added target phase and refl. coef.
                else
                    LBSnext=zeros(1,length(indWire)+4);  %Added target phase and refl. coef.
                end
                numLBSnext=0;
            end
            set(handles.stopOptimLoopCheckBox,'Enable','on','Value',0)
            while app.multipleTimesCheckBox.Value || isFirst
                isFirst=false;
                ntimes=ntimes+1;
                if isLUT && ~isMeanEffOptim
                    if ntimes>app.LUTmaxtimes
                        ntimes=1;
                        if app.NLUTmags==1
                            if NcurLUTangles==app.NLUTangles
                                %Nothing more to do.
                                break
                            end
                            NcurLUTangles=NcurLUTangles+1;
                            targetTPhase=LUTangles(NcurLUTangles);
                            targetTMag=app.LUTtargetTMagnitude;
                        else
                            if NcurLUTmags==app.NLUTmags
                                %Nothing more to do.
                                break
                            end
                            NcurLUTmags=NcurLUTmags+1;
                            targetTPhase=app.LUTang1;
                            targetTMag=LUTmags(NcurLUTmags);
                        end
                        reT0=targetTMag*cosd(targetTPhase);
                        imT0=targetTMag*sind(targetTPhase);
                        app.realT0Edit.Value=reT0;
                        app.ImagT0Edit.Value=imT0;
                        app.magT0Edit.Value=targetTMag;
                        app.phaseT0Edit.Value=targetTPhase;
                        drawnow
                        LBS=LBSnext;
                        numLBS=numLBSnext;
                        NcurLBS=0;
                        %LBSnext=zeros(1,length(indWire)+2);
                        LBSnext=zeros(1,length(indWire)+4); %Added target phase and refl. coef.
                        numLBSnext=0;
                    end
                    %Instead of randomly configured wires as initial
                    %configurations, use the configuration of the solutions at
                    %the previous angle.
                    if NcurLBS<numLBS
                        NcurLBS=NcurLBS+1;
                        %handles.Wk(indWire)=LBS(NcurLBS,3:end);
                        if isWk
                            handles.Wk(indWire)=LBS(NcurLBS,5:end);
                        else
                            handles.wireDistImped(indWire)=LBS(NcurLBS,5:end);
                        end
                        isLUTLBS=true;  %Initial config from previous solution
                    else
                        isLUTLBS=false;   %Initial config from random dist.
                    end
                end
                app.numTimesLabel.Text=num2str(ntimes);
                isFromRandomPushButton=0;
                if app.multipleTimesCheckBox.Value && ~isLUTLBS
                    effAll=0; %In order not to miss anything.
                    handles=distributeRandomly(app,handles,...
                        lbLayerThickness,ubLayerThickness,...
                        lbWireOffset,ubWireOffset,...
                        lbWireReactance,ubWireReactance,isFromRandomPushButton);
                    drawnow
                end
                effPrev=-1;
                eff=0;
                isWkSym=app.WkSymCheckBox.Value && isfield(handles,'Wk');
                while eff-effPrev>1.e-4
                    effPrev=eff;
                    [handles,resultsDim,propModeNumbers,endingEfficiency,...
                        totalReflectedPower,totalTransmittedPower,T0Ravi,R0Ravi]...
                        =lsqnonlin2(app, handles,...
                        lbLayerThickness,ubLayerThickness,...
                        lbWireOffset,ubWireOffset,...
                        lbWireReactance,ubWireReactance);
                    %if isWkSym
                    %For now, we don't want to change it.
                    if false
                        %The optimization above was performed assuming the
                        %wires are vertically symmetrical, which is almost
                        %correct. Now, use this symmetric solution as the
                        %initial condition in an optimization with the
                        %complete configuration (including those previously
                        %assumed to be symmetric.
                        %Turn off WkSym.
                        app.WkSymCheckBox.Value=0;
                        handles=WkSymFunc(app,handles);
                        %And perform optimization again with all wires.
                        [handles,resultsDim,propModeNumbers,endingEfficiency,...
                            totalReflectedPower,totalTransmittedPower,T0Ravi,R0Ravi]...
                            =lsqnonlin2(app, handles,...
                            lbLayerThickness,ubLayerThickness,...
                            lbWireOffset,ubWireOffset,...
                            lbWireReactance,ubWireReactance);
                        %Do not return to original state yet, because that
                        %would cancel the changes in the symmetrical wires.
                        eff=mean(endingEfficiency);
                        break %For lack of a better idea.
                    end
                    if isempty(resultsDim)
                        eff=0;
                        %break
                        return
                    end
                    eff=mean(endingEfficiency);
                    set(handles.lsqnonlin2PushButton,'Value',0)
                    drawnow
                    if get(handles.stopOptimLoopCheckBox,'Value')
                        break
                    end
                    guidata(hObject,handles)
                end
                if eff>effAll
                    isWriteConfig=1;
                    effAll=eff;
                else
                    isWriteConfig=0;
                end
                effmax=str2double(get(handles.maxEffEdit,'String'));
                if eff>effmax
                    %Even if this is not the best so far, it might be useful to keep,
                    %for example if other solutions provide wires too close to other
                    %wires.
                    isWriteConfig=1;
                end
                effmin=str2double(get(handles.minEffEdit,'String'));
                if eff<effmin
                    %Even if this is not the best so far, it might be useful to keep,
                    %for example if other solutions provide wires too close to other
                    %wires.
                    isWriteConfig=0;
                end
                if isLUT
                    if isWriteConfig
                        absT0=abs(T0Ravi);
                        phaseT0=angle(T0Ravi)*180/pi;
                        absR0=abs(R0Ravi);
                        if isWk
                            WkLUT=handles.Wk(indWire);
                        else
                            WkLUT=handles.wireDistImped(indWire);
                        end
                        if isMeanEffOptim
                            [~,~,meanEff]=EffVsFreq(app,handles);
                            LUTpartialResults=[targetTPhase absT0 phaseT0 absR0 meanEff WkLUT];
                        else
                            LUTpartialResults=[targetTPhase absT0 phaseT0 absR0 WkLUT];
                        end
                        save(LUTFileName,'LUTpartialResults','-ascii','-append')
                        LUTresults=[LUTresults;LUTpartialResults];
                        if absT0>minTLBS
                            numLBSnext=numLBSnext+1;
                            LBSnext(numLBSnext,:)=LUTpartialResults;
                        end
                    end
                else
                    numOptModes=length(propModeNumbers);
                    for ii=1:numOptModes
                        handles.wireHorizOffset=app.TGMwireHorizOffset(ii,:);
                        handles.wireDistImped=app.TGMwireDistImped(ii,:);
                        handles.hOverWL=app.TGMhOverWL(ii,:)';
                        modeForOptimization=propModeNumbers(ii);
                        efficiency=endingEfficiency(ii);
                        writeLsqnonlinToFile(app, handles,resultsDim,isWriteConfig,...
                            modeForOptimization,efficiency,totalReflectedPower(ii),...
                            totalTransmittedPower(ii),T0Ravi,R0Ravi)
                    end
                end
                if isWkSym
                    %Back earlier above we turned off this switch. Now turn
                    %it back on.
                    app.WkSymCheckBox.Value=1;
                    handles=WkSymFunc(app,handles);
                end
                drawnow
                if get(handles.stopOptimLoopCheckBox,'Value')
                    break
                end
            end
            if isLUT
                if ~isempty(LUTresults)
                    %save(LUTFileName,'LUTresults','-ascii','-append')
                    magLUT=LUTresults(:,2);
                    phsLUT=LUTresults(:,3);
                    reLUT=magLUT.*cosd(phsLUT);
                    imLUT=magLUT.*sind(phsLUT);
                    %plot magnitude and phase results
                    figure
                    h=plot(reLUT,imLUT,'.');
                    h.MarkerSize=12;
                    if isMeanEffOptim
                        meanEffDim=LUTresults(:,5);
                        reLUTe=meanEffDim.*cosd(phsLUT);
                        imLUTe=meanEffDim.*sind(phsLUT);
                        hold on
                        he=plot(reLUTe,imLUTe,'.');
                        he.MarkerSize=25;
                        hold off
                    end
                    %draw unit circle. Saw this at
                    %  https://www.mathworks.com/matlabcentral/answers/98665-how-do-i-plot-a-circle-with-a-given-radius-and-center
                    hold on
                    fplot(@(t) sin(t), @(t) cos(t));
                    hold off
                    xlabel('Re(T_0)')
                    ylabel('Im(T_0)')
                    grid
                    axis('equal')
                end
            end
            %writeLsqnonlinToFile(handles,resultsDim,1)
            set(handles.stopOptimLoopCheckBox,'Enable','off','Value',0)
            if get(handles.groupingCheckBox,'Value')
                set(handles.groupingCheckBox,'Value',0)
                handles.includeInOptim(:)=1;
            end
            % %play sound to announce finis
            % load chirp
            % player=audioplayer(y,Fs);
            % play(player);
        end
    end
    
    methods (Access = public)
        function updateLUT(app,LUTmaxtimes,LUTminEff,...
                NLUTangles,LUTang1,LUTang2,...
                NLUTmags,LUTtargetTMagnitude,LUTtargetTMagnitude2)
            %This is called by LUTapp (a separate app-designed window) to
            %update the LUT parameters for optimization. After this is
            %called that window closes.
            app.LUTmaxtimes=LUTmaxtimes;
            app.LUTminEff=LUTminEff;
            app.NLUTangles=NLUTangles;
            app.LUTang1=LUTang1;
            app.LUTang2=LUTang2;
            app.NLUTmags=NLUTmags;
            app.LUTtargetTMagnitude=LUTtargetTMagnitude;
            app.LUTtargetTMagnitude2=LUTtargetTMagnitude2;
            app.LUTCheckBox.Enable="on";
        end

        function noUpdateLUT(app)
            %This is called when the LUT window is closed by the x at the
            %upper right.  It does not change any parameters.
            app.LUTCheckBox.Enable="on";
        end

        function [handles,app]=newWk(app,handles,Wkpartial)
            %This is called by LUTapp (a separate app-designed window) to
            %update the LUT Wk parameters. After this is
            %called that window remains open.
            indWire=find(handles.isWire==1);
            handles.Wk(indWire)=Wkpartial;
            app.WkAtWL1=handles.Wk;
            %Recalculate.
            handles=displayTargetModeInfo(app,handles,1);
            guidata(handles.figure1,handles);
        end

        function [meanEffCST,meanEff,EffCSTf0,phsCSTf0,EffCSTf0Ref,phsCSTf0Ref,magML,phsML,meanEffCalc]=...
                frequencyResponse(app,handles,...
                isMultipleCases,f0,freqmin,freqmax,numSamples,...
                phsLUTFields,WkLUT,EffRef,CSTresultsfilename,...
                upperDistOverLambda0,lowerDistOverLambda0,resultNumber,...
                isMeanEffOptim,MeanEffOptimWeight,varargin)
            %This is called by LUTapp (a separate app-designed window) to
            %perform frequency response calculations. After this is
            %called that window remains open.
            %The calculations are performed by changing the value of
            %freqGhz. For a single case, this can be done without this
            %routine. It is complicated, though, because a unit wavelength
            %is assumed, which is equivalent to about 300 MHz. This must be
            %changed proportionally, based on the central frequency f0, and
            %the min and max frequencies freqmin and freqmax. 
            %When only a single phase is considered, that phase is given in
            %the result number box. resultNumber is the sequential number
            %of that phase.
            % Optional name-value:
            % 'SuppressPlots' (logical, default false) : when true, suppress all plotting/GUI updates.
            p = inputParser;
            addParameter(p,'SuppressPlots',false,@islogical);
            args = varargin;
            parse(p, args{:});
            suppressPlots = p.Results.SuppressPlots;

            % Initialize new detailed outputs
            magML = [];
            phsML = [];
            meanEffCalc = NaN;

            meanEffCST=0;
            meanEff=0;
            EffCSTf0=0;
            phsCSTf0=0;
            EffCSTf0Ref=0;
            phsCSTf0Ref=0;
            freqminNorm=.2997925/(f0/freqmin);
            freqmaxNorm=.2997925/(f0/freqmax);
            %Set the listbox to freqGHz, and fill in the value. 
            app.paramsToControlListbox.Value='freqGHz';
            app.tiltAngleEditNumeric.Value=freqminNorm;
            app.maxPlotValueEdit.Value=num2str(freqmaxNorm);
            app.numPlotPointsEdit.Value=num2str(numSamples);
            handles.nParamToControl=8;
            handles.valParamToControl(8)=freqminNorm;
            %
            %Determine the CST file status. If it exists, determine if is
            %for multiple cases or for only a single case.
            isCST=0;
            if length(CSTresultsfilename)>1
                %A file name has been given. Determine if the file
                %exists for transmission and reflection.
                if isfile(CSTresultsfilename)
                    %Make sure the name starts with TT and there is
                    %also a file that starts with RR.
                    if strcmp('TT',CSTresultsfilename(1:2))
                        CSTresultsfilenameRef=replace(CSTresultsfilename,'TT','RR');
                        if isfile(CSTresultsfilenameRef)
                            isCST=1;
                        else
                            if ~suppressPlots, msgbox(['The name of reflection CST results file ' CSTresultsfilenameRef 'does not exist.']); end
                            return
                        end
                    else
                        if ~suppressPlots, msgbox(['The name of CST results file ' CSTresultsfilename 'does not start with TT.']); end
                        return
                    end   
                else
                    if ~suppressPlots, msgbox(['CST results file ' CSTresultsfilename 'does not exist.']); end
                    return
                end
            end
            if isCST
                isMultiCST=0;  %The CST file contains only a single phase case.
                nFreqsCST=0;
                %Determine whether the CST file contains multiple phases.
                %The file contains the matrix 
                % [frequency S-parameter-magnitude  S-parameter-phase]
                a=importdata(CSTresultsfilename);
                nFreqsCST=length(a.data);
                %nFreqsCST is the number of lines from the first header to
                %the second header if there is one.
                %Here's a Kurdish way of determining whether there are
                %multiple files. Determine if there are more than nFreqsCST
                %lines in the file.
                fid = fopen(CSTresultsfilename,'r');
                n = 0;
                while ~feof(fid) && n<=2*nFreqsCST
                    fgetl(fid);
                    n = n+1;
                end
                fclose(fid);
                if n>2*nFreqsCST
                    isMultiCST=1;
                else
                    %The CST files contains frequency response for only a
                    %single phase. The cannot be used if isMultipleCases is
                    %true.
                    if isMultipleCases
                        if ~suppressPlots, msgbox('Multiple cases requested, but CST file contains only a single case.'); end
                        return
                    end
                    isMultiCST=0;
                end
                %
            else
                isMultiCST=0;
                nFreqsCST=0;
            end
            %
            if isMeanEffOptim
                %Starting with the current configuration in the Layers window, 
                % optimize the Wk to provide optimum mean efficiency over 
                % the indicated frequencies. 
                % Weight will be given to the current complex efficiency at 
                % the nominal frequency, and to the mean efficiency over 
                % all frequencies.
                app.isMeanEfficiencyOptim=isMeanEffOptim;
                app.MeanEfficiencyOptimWeight=MeanEffOptimWeight;
                %I found this method call a callback programmatically.
                %https://www.mathworks.com/matlabcentral/answers/1808640-programmatically-event-in-app-designer-is-it-possible
                %but it didn't work.
                hObject=handles.figure1;
                handles=lsqnonlin2PushButton_Function(app,handles,hObject);
                app.isMeanEfficiencyOptim=0;
                return
            end
            if isMultipleCases
                nphases=length(phsLUTFields);
                if ~suppressPlots
                    hmsg=msgbox(['phase 1 / ' num2str(nphases) 'mean(Efficiency) =             0']);
                    set(findobj(hmsg,'style','pushbutton'),'Visible','off')
                    msgboxFontSize(hmsg, 14);  %External function
                end
                bandwidth=zeros(nphases,1);
                meanEff=zeros(nphases,1);
                EffNomMinMaxFreq=zeros(nphases,3);
                PhsNomMinMaxFreq=zeros(nphases,3);
                indWire=find(handles.isWire==1);
                for ii=1:nphases
                    %newWk(app,handles,WkLUT(ii,:))
                    handles.Wk(indWire)=WkLUT(ii,:);
                    app.WkAtWL1=handles.Wk;
                    %Recalculate.
                    handles=displayTargetModeInfo(app,handles,1);
                    %guidata(handles.figure1,handles);
                    %bandwidth(ii)=pltVsh(app,handles,isMultipleCases,EffRef);
                    [bandwidth(ii),meanEff(ii),EffNomMinMaxFreq(ii,:),PhsNomMinMaxFreq(ii,:)]=...
                        pltVsFreq(app,handles,isMultipleCases,EffRef,CSTresultsfilename,...
                        upperDistOverLambda0,lowerDistOverLambda0,...
                        isCST,isMultiCST,nFreqsCST,resultNumber);
                    %https://www.mathworks.com/matlabcentral/answers/12564-change-text-in-a-msgbox
                    msgboxstring=['phase ' num2str(ii) ' / ' num2str(nphases) ...
                        ', mean(Efficiency)=' num2str(meanEff(ii))];
                    set(findobj(hmsg,'Tag','MessageBox'),'String',msgboxstring)
                end
                if isCST
                    if ~supressPlots
                        msgboxstring='Working on CST bandwidth';
                        set(findobj(hmsg,'Tag','MessageBox'),'String',msgboxstring)
                    end
                    %Go through the CST file, and for each phase, determine
                    %the bandwidth. Since the number of headerlines is
                    %different for the first phase, do that separately.
                    freq0=str2double(app.lossFreqEdit.Value);
                    bandwidthCST=zeros(nphases,1);
                    meanEffCST=zeros(nphases,1);
                    EffCSTf0=zeros(nphases,1);
                    phsCSTf0=zeros(nphases,1);
                    fid=fopen(CSTresultsfilename);
                    CSTDataCell=textscan(fid,'%f %f %f',nFreqsCST,'Headerlines',3,'CollectOutput',1);
                    CSTData=cell2mat(CSTDataCell);
                    freqCST=CSTData(:,1);
                    magCST=CSTData(:,2);
                    phsCST=CSTData(:,3);
                    magCST=magCST.*magCST;  %Efficiency, not field
                    %Find the indeces of freqCST that correspond to freqmin
                    %and freqmax.
                    [c,indfreqmin] = min(abs(freqCST-freqmin));
                    [c,indfreqmax] = min(abs(freqCST-freqmax));
                    %
                    %Now for the reflection file
                    EffCSTf0Ref=zeros(nphases,1);
                    phsCSTf0Ref=zeros(nphases,1);
                    fidRef=fopen(CSTresultsfilenameRef);
                    CSTDataCellRef=textscan(fidRef,'%f %f %f',nFreqsCST,'Headerlines',3,'CollectOutput',1);
                    CSTDataRef=cell2mat(CSTDataCellRef);
                    magCSTRef=CSTDataRef(:,2);
                    phsCSTRef=CSTDataRef(:,3);
                    magCSTRef=magCSTRef.*magCSTRef;  %Efficiency, not field
                    %
                    [bandwidthCST(1),indfreq0,freqBWmin,freqBWmax]...
                        =getBandwidth(app,freqCST(indfreqmin:indfreqmax),freq0,magCST(indfreqmin:indfreqmax),EffRef);
                    meanEffCST(1)=mean(magCST(indfreqmin:indfreqmax));
                    EffCSTf0(1)=magCST(indfreq0);
                    phsCSTf0(1)=phsCST(indfreq0);
                    EffCSTf0Ref(1)=magCSTRef(indfreq0);
                    phsCSTf0Ref(1)=phsCSTRef(indfreq0);
                    for ii=2:nphases
                        CSTDataCell=textscan(fid,'%f %f %f',nFreqsCST,'Headerlines',4,'CollectOutput',1);
                        CSTData=cell2mat(CSTDataCell);
                        magCST=CSTData(:,2);
                        phsCST=CSTData(:,3);
                        magCST=magCST.*magCST;  %Efficiency, not field
                        [bandwidthCST(ii),indfreq0,freqBWmin,freqBWmax]...
                            =getBandwidth(app,freqCST(indfreqmin:indfreqmax),freq0,magCST(indfreqmin:indfreqmax),EffRef);
                        meanEffCST(ii)=mean(magCST(indfreqmin:indfreqmax));
                        EffCSTf0(ii)=magCST(indfreq0);
                        phsCSTf0(ii)=phsCST(indfreq0);
                        %Now for reflection
                        CSTDataCellRef=textscan(fidRef,'%f %f %f',nFreqsCST,'Headerlines',4,'CollectOutput',1);
                        CSTDataRef=cell2mat(CSTDataCellRef);
                        magCSTRef=CSTDataRef(:,2);
                        phsCSTRef=CSTDataRef(:,3);
                        magCSTRef=magCSTRef.*magCSTRef;  %Efficiency, not field
                        EffCSTf0Ref(ii)=magCSTRef(indfreq0);
                        phsCSTf0Ref(ii)=phsCSTRef(indfreq0);
                    end
                    fclose(fid);
                    fclose(fidRef)
                end
                if ~suppressPlots && ishandle(hmsg)
                    delete(hmsg)
                end
                %
                if ~suppressPlots
                    figure
                    plot(phsLUTFields,bandwidth,'b','Linewidth',2)
                    xlabel('phase (deg)')
                    ylabel('bandwidth (GHz)')
                    grid
                    title(['Efficiency Reference: ' num2str(100*EffRef) ...
                        '%, frequency bounds (GHz): [' num2str(freqmin) ...
                        ' ' num2str(freqmax) ']'])
                    if isCST
                        hold on
                        plot(phsLUTFields,bandwidthCST,'r','Linewidth',2)
                        hold off
                        legend('Matlab','CST')
                    end
                    %
                    figure
                    plot(phsLUTFields,meanEff*100,'b','Linewidth',2)
                    xlabel('phase (deg)')
                    ylabel('mean efficiency (%)')
                    grid
                    title(['frequency bounds (GHz): [' num2str(freqmin) ' ' num2str(freqmax) ']'])
                    if isCST
                        hold on
                        plot(phsLUTFields,meanEffCST*100,'r','Linewidth',2)
                        hold off
                        legend('Matlab','CST')
                    end
                    %
                    figure
                    h=plot(phsLUTFields,EffNomMinMaxFreq*100);
                    set(h(2),'Linewidth',2)
                    xlabel('phase (deg)')
                    ylabel('efficiency (%)')
                    grid
                    legend([num2str(freqmin) 'GHz'],[num2str(f0) 'GHz'],...
                        [num2str(freqmax) 'GHz'])
                    figure
                    h=plot(phsLUTFields,PhsNomMinMaxFreq);
                    set(h(2),'Linewidth',2)
                    xlabel('phase (deg)')
                    ylabel('phase (deg)')
                    grid
                    legend([num2str(freqmin) 'GHz'],[num2str(f0) 'GHz'],...
                        [num2str(freqmax) 'GHz'])
                end
            else
                [~,meanEffCalc,~,~,magML, phsML] = pltVsFreq(app,handles,isMultipleCases,EffRef,CSTresultsfilename,...
                    upperDistOverLambda0,lowerDistOverLambda0,...
                    isCST,isMultiCST,nFreqsCST,resultNumber, 'suppressPlots',suppressPlots);
            end

        end

        function newWkLUT(app,handles,WkLUT)
            %This is called by LUTapp (a separate app-designed window) to
            %update the LUT Wk parameters one by one, and to write the
            % results on a file. After this is
            %called that window remain open.
            %This is no longer used since the R0Ravi is saved to the same
            %file as T0Ravi.
            FileName='RT.ext';
            indWire=find(handles.isWire==1);
            sizeWkLUT=size(WkLUT);
            for ii=1:sizeWkLUT(1)
                Wkpartial=WkLUT(ii,:);
                handles.Wk(indWire)=Wkpartial;
                %Recalculate.
                handles=displayTargetModeInfo(app,handles,1);
                T0Ravi=handles.tauFloq(handles.nCurMd);
                R0Ravi=handles.rhoFloq(handles.nCurMd);
                absT0=abs(T0Ravi);
                phaseT0=angle(T0Ravi)*180/pi;
                absR0=abs(R0Ravi);
                phaseR0=angle(R0Ravi)*180/pi;
                LUTpartialResults=[absT0 phaseT0 absR0 phaseR0];
                save(FileName,'LUTpartialResults','-ascii','-append')
            end
            %guidata(handles.figure1,handles);
        end
        
    end
    

    % Callbacks that handle component events
    methods (Access = public)

        % Code that executes after component creation
        function layers_OpeningFcn(app, varargin)
            % --- Executes just before layers is made visible.
            
            % Ensure that the app appears on screen when run
            movegui(app.figure1, 'onscreen');
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app); %#ok<ASGLU>
            
            % This function has no output args, see OutputFcn.
            % hObject    handle to figure
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            % varargin   command line arguments to layers (see VARARGIN)
            
            % Choose default command line output for layers
            handles.output = hObject;
            handles=setData(app, handles);
            
            % Update handles structure
            guidata(hObject, handles);
        end

        % Button pushed function: CSTfilePushButton
        function CSTfilePushButton_Callback(app, event)
            % --- Executes on button press in CSTfilePushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to CSTfilePushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            %
            %Prepare a file with wire data which our CST macro can read and change
            %values in the CST parameter list. That is in dataFileName1. Also, in
            %dataFileName2, this prepares the standard data file with the same name as
            %the base data file, except with CST at the end of the base name, and with
            %commas as separators, AND NO EXTRA LINES IN THE FILE.
            %The use of dataFileName1 is being phased out.
            %
            dataFileName=get(handles.dataFileText,'String');
            if isempty(dataFileName) || strcmp(dataFileName,' ')
                %dataFileName1='layers.fws';
                dataFileName2='layersCST.dat';
            else
                %Find the location of a period if one is present
                ind=strfind(dataFileName,'.');
                if isempty(ind)
                    %There is no period yet in the name.
                    %dataFileName1=[dataFileName '.fws'];
                    dataFileName2=[dataFileName 'CST.dat'];
                else
                    %There is a period. So replace everything after the period with the
                    %suffix fws.
                    %dataFileName1=[dataFileName(1:ind) 'fws'];
                    dataFileName2=[dataFileName(1:ind-1) 'CST.dat'];
                end
            end
            %Get total number of wires
            %Nwires=sum(handles.isWire==1);
            % fidOut=fopen(dataFileName1,'w');
            % jj=0;
            % for ii=1:handles.numMedia-1
            %     if handles.isWire(ii)==1
            %         jj=jj+1;
            %         %Write the offset to the file
            %         tline=['"dkoverd' num2str(jj) '",' num2str(handles.wireHorizOffset(ii))];
            %         fprintf(fidOut,'%s\r\n',tline);
            %         %Write the impedance
            %         tline=['"Z' num2str(jj) '",' num2str(handles.wireDistImped(ii))];
            %         fprintf(fidOut,'%s\r\n',tline);
            %         %
            %         %Write the average permittivity of both sides of the wire.
            %         %First get the material before the current wire:
            %         epsBefore=1;  %The default is air
            %         if ii>1
            %             for kk=ii-1:-1:1
            %                 if handles.isWire(kk)>1
            %                     epsBefore=handles.eps(kk);
            %                     break
            %                 end
            %             end
            %         end
            %         %Now the material after the current wire.
            %         epsAfter=1;  %The default is air
            %         if ii<handles.numMedia-1
            %             for kk=ii+1:handles.numMedia-1
            %                 if handles.isWire(kk)>1
            %                     epsAfter=handles.eps(kk);
            %                     break
            %                 end
            %             end
            %         end
            %         epsAvg=(epsBefore+epsAfter)/2;
            %         tline=['"epseffr' num2str(jj) '",' num2str(epsAvg)];
            %         %
            %         if jj==Nwires
            %             %This is the last entry.
            %             fprintf(fidOut,'%s',tline); %w/o carriage return
            %         else
            %             fprintf(fidOut,'%s\r\n',tline);
            %         end
            %     end
            % end
            % fclose(fidOut);
            %
            %Now file 2
            C=WriteData(app, handles);
            CT=C.';
            %We want to write the matrix CT as comma-delimited data.
            %save(dataFileName2,'Ctranspose','-ascii')
            fidOut=fopen(dataFileName2,'w');
            sizeCT=size(CT);
            isRavi=app.RaviCheckBox.Value;
            if isRavi
                %If the Ravi box is checked, then this call to prepare a CST
                %file can be before any Wk has been prepared.  Nevertheless,
                %we would like the CST file to be in the format of a Wk file.
                %Since this Wk file will be used as a basis to sweep values of
                %Wk, the value of Wk itself is not important. So use a length
                %(which must be in mils) which is half the period. It is
                %assumed that the period has been entered correctly. The
                %frequency will be based on that shown in wire panel. Get
                %wavelength at this freq. 
                freqGHz=str2double(app.lossFreqEdit.Value);
                c=2.997925e8; %speed of light m/s
                lambdaMeters=c/(freqGHz*1.e9);
                lambdamm=lambdaMeters*1.e3;
                dmm=handles.d*lambdamm;  %The period in mm.
                dmil=dmm/.0254;
                Wkmil=dmil/2;
                CT(1,3)=handles.d;  %These part of header to indicate format of Wk
                CT(1,5)=1;
            end
            %
            %There are 7 columns
            tline=[num2str(CT(1,1)) ',' num2str(CT(1,2)) ',' num2str(CT(1,3)) ',' ...
                num2str(CT(1,4)) ',' num2str(CT(1,5)) ',' num2str(CT(1,6)) ',' num2str(CT(1,7))];
            fprintf(fidOut,'%s\r\n',tline);
            %The limits in the following are because one we have already done above. Also,we
            %don't want to do the last one because that requires a special format.
            for ii=2:sizeCT(1)-1
                if CT(ii,4)>0
                    if isRavi && CT(ii,4)==1
                        CT(ii,5)=Wkmil;
                    end
                    tline=[num2str(CT(ii,1)) ',' num2str(CT(ii,2)) ',' num2str(CT(ii,3)) ',' ...
                        num2str(CT(ii,4)) ',' num2str(CT(ii,5)) ',' num2str(CT(ii,6)) ',' num2str(CT(ii,7))];
                    fprintf(fidOut,'%s\r\n',tline);
                end
            end
            ii=sizeCT(1);
            if isRavi && CT(ii,4)==1
                CT(ii,5)=Wkmil;
            end
            tline=[num2str(CT(ii,1)) ',' num2str(CT(ii,2)) ',' num2str(CT(ii,3)) ',' ...
                num2str(CT(ii,4)) ',' num2str(CT(ii,5)) ',' num2str(CT(ii,6)) ',' num2str(CT(ii,7))];
            fprintf(fidOut,'%s',tline);
            fclose(fidOut);
        end

        % Value changed function: DisplayWaveImageCheckBox
        function DisplayWaveImageCheckBox_Callback(app, event)
            % --- Executes on button press in DisplayWaveImageCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to DisplayWaveImageCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of DisplayWaveImageCheckBox
            if get(hObject,'Value')
                set(handles.makeMoviePushButton,'Enable','on')
                app.ImageCheckBox.Enable='on';
                app.ImageCheckBox.Value=1;
                if handles.isFloquet
                    delete(get(handles.prismAxes,'Children'))
                    handles=drawMedia(app, handles);
                else
                    handles=drawWaves(app, handles);
                    handles=drawIncArrow(app, handles);
                end
                app.prismAxes.Colormap=jet;
                guidata(hObject,handles)
            else
                set(handles.makeMoviePushButton,'Enable','off')
                app.ImageCheckBox.Enable='off';
                app.ImageCheckBox.Enable='off';
                if ishandle(handles.hWaveImage)
                    if get(handles.animateWaveCheckBox,'Value')
                        %We have to stop the animation before deleting the image.
                        msgbox('Please turn off animation before removing wave image display')
                        set(hObject,'Value',true)
                    else
                        if handles.isFloquet
                            delete(get(handles.prismAxes,'Children'))
                            handles=drawMedia(app, handles);
                            guidata(hObject,handles)
                        else
                            delete(handles.hWaveImage)
                        end
                    end
                end
            end
        end

        % Menu selected function: EditMenuCopyGraphToFigureItem
        function EditMenuCopyGraphToFigureItem_Callback(app, event)
            % --------------------------------------------------------------------
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to EditMenuCopyGraphToFigureItem (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            hf=figure;
            copyobj(handles.prismAxes,hf)
            % children=get(handles.prismAxes,'children');
            % copyobj(children,gca)
            %if ishandle(handles.hWaveImage)
            %    imagesc(x,y,real(E*expTimePhase));
            %end
            set(gca,'units','pixels')
            pos=get(gca,'position');
            posNew=[50 50 pos(3) pos(4)-30];
            set(gca,'position',posNew)
            set(hf,'units','pixels')
            posFig=get(hf,'position');
            posFigNew=[posFig(1)-30 posFig(2)-100 pos(3)+70 pos(4)+50];
            set(hf,'position',posFigNew)
            %Something really strange is happening.  If there is an image over a patch,
            %the image does not appear but rather the patch.  If that patch is chosen,
            %the program chooses the image because it knows that it is the image that
            %is really on top.  But the image doesn't show up.  Workaround:  When an
            %image is present, delete the patch.
            children=get(gca,'children');
            types=get(children,'type');
            ind1=strcmp(types,'image');
            indImage=find(ind1==1);
            if ~isempty(indImage)
                ind2=strcmp(types,'patch');
                indPatch=find(ind2==1);
                delete(children(indPatch))
            end
        end

        % Menu selected function: EditMenuOpenbffileItem
        function EditMenuOpenbffileItem_Callback(app, event)
            % --------------------------------------------------------------------
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to EditMenuOpenbffileItem (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            %plot the bf file.
            [bfFileName,PathName]=uigetfile('*.bf','Select the data file');
            if PathName~=0
                handles=plotbfFile(app, bfFileName,handles);
                %reset the data for the layers on which this bf file is based.
                %handles.eps=[handles.eps;1];
                handles.numMedia=length(handles.eps);
                handles.hOverWL=.01*ones(handles.numMedia-1,1);
                handles=reconfigLayers(app, handles);
                guidata(hObject,handles);
            end
        end

        % Selection changed function: FloquestModeToOptimizeButtonGroup
        function FloquestModeToOptimizeButtonGroup_SelectionChangedFcn(app, event)
            % --- Executes when selected object is changed in FloquestModeToOptimizeButtonGroup.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to the selected object in FloquestModeToOptimizeButtonGroup
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            handles=fillInResults(app, handles);
            guidata(hObject,handles)
        end

        % Value changed function: FloquetCheckBox
        function FloquetCheckBox_Callback(app, event)
            % --- Executes on button press in FloquetCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to FloquetCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of FloquetCheckBox
            set(handles.gamFileNameText,'String',' ')
            handles.GAMMA=[];
            handles=drawMedia(app, handles);
            guidata(hObject,handles);
        end

        % Button pushed function: addBeamPushButton
        function addBeamPushButton_Callback(app, event)
            % --- Executes on button press in addBeamPushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to addBeamPushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            %
            %Save the current data file. Call it multibeam1.dat
            A=[handles.incAngDeg handles.n(1:handles.numMedia-1)'];
            AA=[0 handles.conductivity(1:handles.numMedia-1)'];
            B=[0 handles.hOverWL(1:handles.numMedia-1)'];
            C=[A;AA;B];
            save('multibeam1.dat','C','-ascii')
            %Remember the mode that is being optimized.
            % if get(handles.m1FloqModeToOptimize,'Value')
            %     modeOptimized=-1;
            % end
            % if get(handles.zeroFloqModeToOptimize,'Value')
            %     modeOptimized=0;
            % end
            % if get(handles.p1FloqModeToOptimize,'Value')
            %     modeOptimized=1;
            % end
            % handles.multiBeamModeOptimized=modeOptimized;
            
            %The vector of the indices of the propagating wave modes is
            %handles.modeNumberPropagating.
            %The vector of the indices of the target modes for which optimization
            %is performed is handles.modesForOptimization
            %The vector of the beam angles of these waves is
            %handles.incAngDegFloqDraw.
            %For now, get the first legitimate entry of handles.modesForOptimization.
            %Later, we will use more than one.
            for ii=1:length(handles.modesForOptimization)
                if ~isnan(handles.modesForOptimization(ii))
                    modeForOptimization=handles.modesForOptimization(ii);
                    break
                end
            end
            handles.multiBeamModeOptimized=modeForOptimization;
            
            
            %
            %Make the lowest layer the current layer.
            handles.mediumNumber=handles.numMedia-1;
            %set(handles.mediumNumberEdit,'String',num2str(handles.mediumNumber))
            app.MediumnoSpinner.Value=handles.mediumNumber;
            handles=setNewMedium(app, handles);
            %Add air layer at bottom.
            handles=insertLayerBelow(app, handles);
            %Turn off "include for optimization" on all except the new air layer.
            handles.includeInOptim(1:handles.numMedia-2,1)=0;
            handles.includeInOptim(handles.numMedia-1,1)=1;
            %
            %Perform optimization on the air layer.
            set(handles.zeroFloqModeToOptimize,'Value',1)
            set(handles.isBeamsplitCheckBox,'Value',0)
            handles=randomizeThicknesses(app, handles);
            %Set multibeam configuration radiobutton to 2
            set(handles.multibeamConfig1RadioButton,'Enable','on')
            set(handles.multibeamConfig2RadioButton,'Enable','on')
            set(handles.multibeamConfig2RadioButton,'Value',1)
            guidata(hObject,handles);
        end

        % Value changed function: animateWaveCheckBox
        function animateWaveCheckBox_Callback(app, event)
            % --- Executes on button press in animateWaveCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to animateWaveCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            global dPhase
            % Hint: get(hObject,'Value') returns toggle state of animateWaveCheckBox
            if get(hObject,'Value')
                handles=drawWaves(app, handles);
                %In case nPhaseDivisions was changed to make the animation faster or
                %slower while the animation was taking place, it won't be remembered
                %unless set here.
                handles.nPhaseDivisions=round(360/dPhase);
                guidata(hObject,handles)
            end
        end

        % Value changed function: animationSpeedUpDownSlider
        function animationSpeedUpDownSlider_Callback(app, event)
            % --- Executes on slider movement.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to animationSpeedUpDownSlider (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'Value') returns position of slider
            %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
            global dPhase
            %Note that the higher and lower values are reversed in this case, since a
            %higher value of nPhaseDivisions produces slower animation.
            if get(hObject,'Value')>0.5
                if handles.nPhaseDivisions<=10
                    handles.nPhaseDivisions=10;
                    set(hObject,'Value',0.5)
                    return
                end
                inc=-5;
                handles.nPhaseDivisions=handles.nPhaseDivisions+inc;
            else
                inc=5;
                handles.nPhaseDivisions=handles.nPhaseDivisions+inc;
            end
            set(hObject,'Value',0.5)
            guidata(hObject,handles)
            dPhase=360/handles.nPhaseDivisions;
        end

        % Value changed function: arrowsCheckBox
        function arrowsCheckBox_Callback(app, event)
            % --- Executes on button press in arrowsCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to arrowsCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of arrowsCheckBox
            if get(handles.animateWaveCheckBox,'Value')
                %We have to stop the animation before deleting the image.
                msgbox('Please turn off animation before removing wave image display')
                set(hObject,'Value',~get(hObject,'Value'))
            else
                if get(handles.arrowsCheckBox,'Value')
                    handles=drawIncArrow(app, handles);
                    guidata(hObject,handles)
                else
                    if ishandle(handles.hIncArrow)
                        delete(handles.hIncArrow)
                    end
                    if ishandle(handles.refPhaseCircle)
                        delete(handles.refPhaseCircle)
                    end
                    if ishandle(handles.transPhaseCircle)
                        delete(handles.transPhaseCircle)
                    end
                end
            end
        end

        % Button pushed function: bruteForcePushButton
        function bruteForcePushButton_Callback(app, event)
            % --- Executes on button press in bruteForcePushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to bruteForcePushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            %if handles.numMedia-1==3
                set(handles.workingText,'Visible','on')
                drawnow
                surveyThicknessesA(app, handles)
                set(handles.workingText,'Visible','off')
        end

        % Button pushed function: chooseFiguresPushButton
        function chooseFiguresPushButton_Callback(app, event)
            % --- Executes on button press in chooseFiguresPushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to chooseFiguresPushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            %This function is based on determining the current axis when clicking on
            %a figure.  It was problematic at first, because the GUI itself was being
            %determined as the current axis.  This was overcome by right clicking on
            %the GUI figure (when editing it), choosing options, and then choosing not
            %to include the GUI when determining the current axis.
            ButtonName=MFquestdlg([0.6 0.1],...
                             'Please click in the figure containing absolute value and click Ok',...
                             'Combine magnitude and phase','Ok', 'Cancel','Ok');
            if strcmp(ButtonName,'Ok')
                %Process the absolute value data.
                haxisA=gca;
                child=get(gca,'children');
                cdata=child.CData;
                ind=cdata<0.95;
            cdata(ind)=cdata(ind)+360;
            child.CData=cdata;    %hLineA=get(haxisA,'children');
                hLineA=findobj(haxisA,'type','line');
            
                ButtonName=MFquestdlg([0.6 0.1],...
                             'Please click in the figure containing phase and click Ok',...
                             'Combine magnitude and phase','Ok', 'Cancel','Ok');
                if strcmp(ButtonName,'Ok')
                    %haxisB=gca;
                    xdata=get(hLineA(end),'XData');
                    ydata=get(hLineA(end),'YData');
                    %The end is necessary, since in addition to the desired line, there
                    %are also the lines that indicate the beamwidth.
                    line(xdata,ydata)
                end
            end
        end

        % Button pushed function: cloneAllPushButton
        function cloneAllPushButton_Callback(app, event)
            % --- Executes on button press in cloneAllPushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to cloneAllPushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            mediumType= handles.isWire(handles.mediumNumber);
            %Get all the media of this type
            indMedia=find(handles.isWire==mediumType);
            %Make all these media have the same properties as handles.mediumNumber
            handles.wireStripWidth(indMedia)=handles.wireStripWidth(handles.mediumNumber);
            handles.hOverWL(indMedia,1)=handles.hOverWL(handles.mediumNumber,1);
            handles.eps(indMedia)=handles.eps(handles.mediumNumber);
            handles.n(indMedia)=handles.n(handles.mediumNumber);
            handles.conductivity(indMedia)=handles.conductivity(handles.mediumNumber);
            handles.includeInOptim(indMedia)=handles.includeInOptim(handles.mediumNumber);
            %handles.includeInOptim2(indMedia)=handles.includeInOptim2(handles.mediumNumber);
            handles=drawMedia(app, handles);
            guidata(hObject,handles)
        end

        % Value changed function: compareLocCheckBox
        function compareLocCheckBox_Callback(app, event)
            % --- Executes on button press in compareLocCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to compareLocCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of compareLocCheckBox
            if get(hObject,'Value')
                set(handles.avgLocDif,'String','')
            end
        end

        % Value changed function: conductivityEdit
        function conductivityEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to conductivityEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of conductivityEdit as text
            %        str2double(get(hObject,'String')) returns contents of conductivityEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String',num2str(handles.conductivity(handles.mediumNumber)));
            else
                handles.conductivity(handles.mediumNumber)=val;
                handles=drawMedia(app, handles);
                guidata(hObject,handles)
            end
        end

        % Value changed function: coupleMedium2Edit
        function coupleMedium2Edit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to coupleMedium2Edit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of coupleMedium2Edit as text
            %        str2double(get(hObject,'String')) returns contents of coupleMedium2Edit as a double
            %
            %Coupling of one layer to another can only be implemented for wires. Check
            %if current layer is a wire array.
            nCurrent=handles.mediumNumber;
            if handles.isWire(nCurrent)==1
                %Determine to which layer the current wire is to be coupled.
                layerForCoupling=str2double(get(hObject,'String'));
                if ~isnan(layerForCoupling)
                    if layerForCoupling >=1 && layerForCoupling <= handles.numMedia-1
                        if handles.isWire(layerForCoupling)==1
                            handles.nCoupledTo(nCurrent)=layerForCoupling;
                            handles.distCoupledTo(nCurrent)=handles.wireHorizOffset(layerForCoupling)-handles.wireHorizOffset(nCurrent);
                            if layerForCoupling==nCurrent
                                handles.includeInOptim(nCurrent)=true;
                                %Check whether there is still some coupling.
                                if isequal(handles.nCoupledTo,1:handles.numMedia-1)
                                    handles.isPossibleCoupling=false;
                                end
                            else
                                handles.isPossibleCoupling=true;
                                handles.includeInOptim(nCurrent)=false;
                            end
                            set(handles.includeInOptimizationCheckBox,'Value',handles.includeInOptim(nCurrent))
                        else
                            msgbox('The layer to be coupled to is not a wire.')
                            set(handles.coupleMedium2Edit,'String',num2str(handles.nCoupledTo(nCurrent)));
                        end
                    else
                        msgbox('The number of the layer to be coupled to is out of bounds.')
                        set(handles.coupleMedium2Edit,'String',num2str(handles.nCoupledTo(nCurrent)));
                    end
                else
                    msgbox('Error in input.')
                    set(handles.coupleMedium2Edit,'String',num2str(handles.nCoupledTo(nCurrent)));
                end
            else
                msgbox('Coupling is only possible for wires.')
                set(handles.coupleMedium2Edit,'String',' ');
            end
            guidata(hObject,handles)
        end

        % Button pushed function: designFilePushButton
        function designFilePushButton_Callback(app, event)
            % --- Executes on button press in designFilePushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to designFilePushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            %Prepare a file with wire data which contains design information about the
            %characteristics of the wires. The name of the file is dataFileName1.
            %The name will be the same as the file name being used but with a suffix
            %.csv .
            %The file will contain for each wire:
            %1. The distance in mm from a reference point.
            %2. The width of the capcitor.
            %The file will be produced as a csv table.
            %
            %Get a data file name without suffix.
            dataFileName=get(handles.dataFileText,'String');
            if isempty(dataFileName) || strcmp(dataFileName,' ')
                dataFileName='layers';
            else
                %Find the location of a period if one is present
                ind=strfind(dataFileName,'.');
                if ~isempty(ind)
                    %There is a period. So get the string up to the period
                    dataFileName=dataFileName(1:ind-1);
                end
            end
            dataFileName=[dataFileName '.csv'];
            Kcorr=str2double(get(handles.KcorrEdit,'String'));
            %Get wavelength corresponding to the target frequency.
            freqGHz=str2double(get(handles.freqGHzForDesignEdit,'String'));
            c=2.997925e8; %speed of light m/s
            lambdaMeters=c/(freqGHz*1.e9);
            lambdamm=lambdaMeters*1.e3;
            dmm=handles.d*lambdamm;  %The period in mm.
            Nwires=sum(handles.isWire==1);
            %fac1=1.021*Kcorr*lambdamm; Changed Sept 2024. Typo.
            fac1=1.0201*Kcorr*lambdamm;
            %Define the vectors
            %1. sequence number seqNum
            %2. dk of the location of the cneter of the wire relative
            %to the center of the of the period, normalized to unit period.
            %3. dkmm of the location of the center of the wire relative
            %to the center of the period in mm.
            %4. Wkmm of the width of the capacitor in mm.
            dk=zeros(Nwires,1);
            dkmm=zeros(Nwires,1);
            Wkmm=zeros(Nwires,1);
            seqNum=1:1:Nwires;
            seqNum=seqNum';
            jj=0;
            for ii=1:handles.numMedia-1
                if handles.isWire(ii)==1
                    jj=jj+1;
                    %Get the offset dkmm
                    dk(jj)=handles.wireHorizOffset(ii);
                    %This is now between 0 and 1. We wish to make it between -1/2 and
                    %1/2.
                    if dk(jj)>0.5
                        dk(jj)=dk(jj)-1;
                    end
                    dkmm(jj)=dk(jj)*dmm;
                    %Get the capacitor width.
                    %Get the average permittivity of both sides of the wire.
                    %First get the material before (i.e. above) the current wire:
                    epsBefore=1;  %The default is air
                    if ii>1
                        for kk=ii-1:-1:1
                            if handles.isWire(kk)>1
                                epsBefore=handles.eps(kk);
                                break
                            end
                        end
                    end
                    %Now the material after the current wire.
                    epsAfter=1;  %The default is air
                    if ii<handles.numMedia-1
                        for kk=ii+1:handles.numMedia-1
                            if handles.isWire(kk)>1
                                epsAfter=handles.eps(kk);
                                break
                            end
                        end
                    end
                    epsAvg=(epsBefore+epsAfter)/2;
                    Wkmm(jj)=fac1/handles.wireDistImped(ii)/epsAvg;
                end
            end
            TT=table(seqNum,dk,dkmm,Wkmm,'VariableNames', {' ','dk(norm)','dk(mm)','Wk(mm)'});
            writetable(TT,dataFileName)
        end

        % Value changed function: displayBoundaryCheckBox
        function displayBoundaryCheckBox_Callback(app, event)
            % --- Executes on button press in displayBoundaryCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, ~, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to displayBoundaryCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of displayBoundaryCheckBox
            if get(hObject,'Value')
                set(handles.hbdry(1),'Visible','on')
                lengthhwire=length(handles.hwire);
                for ii=1:lengthhwire
                    if ishandle(handles.hwire(ii))
                        set(handles.hwire(ii),'Visible','on')
                    end
                end
            %     if handles.isTwoMedia~=1
            %         set(handles.hbdry(2),'Visible','on')
            %     end
            else
                set(handles.hbdry(1),'Visible','off')
                lengthhwire=length(handles.hwire);
                for ii=1:lengthhwire
                    if ishandle(handles.hwire(ii))
                        set(handles.hwire(ii),'Visible','off')
                    end
                end
            %     if handles.isTwoMedia~=1
            %         set(handles.hbdry(2),'Visible','off')
            %     end
            end
        end

        % Button pushed function: distributeRandomlyPushButton
        function distributeRandomlyPushButton_Callback(app, event)
            % --- Executes on button press in distributeRandomlyPushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            if ~app.TGMdefined(1)
                %At least the first mode has to be defined.
                msgbox('The optimization configuration has not been defined.')
                return
            end
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to distributeRandomlyPushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            %
            %Define the lower and upper bounds of the variables.
            lbLayerThickness=app.EditFieldlbLayerThickness.Value;
            ubLayerThickness=app.EditFieldubLayerThickness.Value;
            lbWireOffset=app.EditFieldlbWireOffset.Value;
            ubWireOffset=app.EditFieldubWireOffset.Value;
            lbWireReactance=app.EditFieldlbWireReactance.Value;
            ubWireReactance=app.EditFieldubWireReactance.Value;
            %
            isFromRandomPushButton=1;
            [handles]=distributeRandomly(app, handles,...
                    lbLayerThickness,ubLayerThickness,...
                    lbWireOffset,ubWireOffset,...
                    lbWireReactance,ubWireReactance,isFromRandomPushButton);
            guidata(hObject,handles)
        end

        % Value changed function: epsEdit
        function epsEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to epsEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of epsEdit as text
            %        str2double(get(hObject,'String')) returns contents of epsEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String',num2str(handles.eps(handles.mediumNumber)));
            else
                handles.eps(handles.mediumNumber)=val;
                handles.n(handles.mediumNumber)=sqrt(val);
                set(handles.nText,'String',num2str(handles.n(handles.mediumNumber)));
                if handles.mediumNumber==1
                    handles.HankelSum=sumHankel(app, handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
                    for ii=1:handles.numMedia-1
                        handles=mgGAMMA(app, handles,ii);
                    end
                end
                handles=drawMedia(app, handles);
                guidata(hObject,handles);
            end
        end

        % Menu selected function: fileMenuReadDataFileItem
        function fileMenuReadDataFileItem_Callback(app, event)
            % --------------------------------------------------------------------
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to fileMenuReadDataFileItem (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            [FileName,PathName]=uigetfile('*.dat','Select the data file');
            figure(app.figure1); 
            %Because of bug in Matlab that causes the window to the back.
            if PathName~=0
                set(handles.dataFileText,'String',FileName)
                %handles=readDataFile(handles,0);
                handles=readDataFile(app, handles);
                if app.WkCheckBox.Value
                    switch app.isJCross
                        case {0,2}
                            app.lossFreqEdit.Value='20';
                            app.wireWidthMilEdit.Value='4';
                        case {1,3,6,7}
                            app.lossFreqEdit.Value='14';
                            app.wireWidthMilEdit.Value='6';
                            %Case 6 also uses the new method to consider
                            %small values of Wk.
                        case {4,5}
                            app.lossFreqEdit.Value='94';
                            app.wireWidthMilEdit.Value='2';
                        case {8}
                            app.lossFreqEdit.Value='13';
                            app.wireWidthMilEdit.Value='6';
                        case {9,10}
                            app.lossFreqEdit.Value='11.7';
                            app.wireWidthMilEdit.Value='6';
                    end
                    getWkmax(app);
                    %Added 17 Aug 25
                    app.wireReactanceCheckBox.Value=1;
                    TGmodeNumber=app.modenoSpinner.Value;
                    handles = saveTargetModeInfo(app,handles,TGmodeNumber);
                    %end added
                end
                guidata(hObject,handles)
            end
        end

        % Menu selected function: fileMenuReadGamaFileItem
        function fileMenuReadGamaFileItem_Callback(app, event)
            % --------------------------------------------------------------------
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to fileMenuReadGamaFileItem (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            [FileName,PathName]=uigetfile('*.gam','Select the data file');
            if PathName~=0
                handles=readgamFile(app, handles,FileName);
                handles.gamFileName=FileName;
                set(handles.gamFileNameText,'String',handles.gamFileName)
                guidata(hObject,handles)
            end
        end

        % Menu selected function: fileMenuWriteDataFileItem
        function fileMenuWriteDataFileItem_Callback(app, event)
            % --------------------------------------------------------------------
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to fileMenuWriteDataFileItem (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            C=WriteData(app, handles);
            Ctranspose=C.';
            %save('out.dat','C','-ascii')
            %save('outTranspose.dat','Ctranspose','-ascii')
            save('out.dat','Ctranspose','-ascii')
        end

        % Value changed function: freezeAxisCheckBox
        function freezeAxisCheckBox_Callback(app, event)
            % --- Executes on button press in freezeAxisCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to freezeAxisCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of freezeAxisCheckBox
            if get(hObject,'Value')
                set(handles.prismAxes,'YLimMode','manual')
            else
                set(handles.prismAxes,'YLimMode','auto')
            end
        end

        % Value changed function: freqGHzEdit
        function freqGHzEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to freqGHzEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of freqGHzEdit as text
            %        str2double(get(hObject,'String')) returns contents of freqGHzEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String',num2str(handles.freqGHz));
            else
                handles=changeFreq(app,handles,val);
                %h=handles.hOverWL*handles.WL;
                if get(handles.DisplayWaveImageCheckBox,'Value')
                    if get(handles.animateWaveCheckBox,'Value')
                        %We have to stop the animation before deleting the image.
                        msgbox('Please turn off animation before changing the display')
                    else
                        delete(handles.hWaveImage)
                    end
                end
                handles=drawMedia(app, handles);
                guidata(hObject,handles);
            end
        end

        % Selection changed function: frequencyButtonGroup
        function frequencyButtonGroup_SelectionChangedFcn(app, event)
            % --- Executes when selected object is changed in frequencyButtonGroup.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to the selected object in frequencyButtonGroup
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            freqGT=str2double(get(handles.freqGHzEdit,'String'));
            switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
                case 'ghzRadioButton'
                    handles.freqGHz=freqGT;
                    handles.WL=.2997925/handles.freqGHz;
                    set(handles.waveLengthText,'String',num2str(handles.WL))
                    set(handles.waveLengthUnitsText,'String','m')
                    handles.maxParamToControl(10)=20;
                    %and the frequency
                    handles.maxParamToControl(11)=300;
                case 'thzRadioButton'
                    handles.freqGHz=freqGT*1000;
                    handles.WL=.2997925/handles.freqGHz;
                    set(handles.waveLengthText,'String',num2str(handles.WL*1.e9))
                    set(handles.waveLengthUnitsText,'String','nm')
                    %Change the maximum conductivity in the user defined parameters
                    handles.maxParamToControl(10)=30000000;
                    %and the frequency
                    handles.maxParamToControl(11)=300000;
            end
            handles.omega=2*pi*handles.freqGHz*1.e9;
            handles.k0=2*pi/handles.WL;
            
            handles.dx=handles.WL/handles.Mc;
            %set(handles.dxText,'String',num2str(handles.dx/handles.WL))
            handles.Dx=handles.DxOverdx*handles.dx;
            handles.Dy=handles.DyOverDx*handles.Dx;
            if get(handles.DisplayWaveImageCheckBox,'Value')
                if get(handles.animateWaveCheckBox,'Value')
                    %We have to stop the animation before deleting the image.
                    msgbox('Please turn off animation before changing the display')
                else
                    delete(handles.hWaveImage)
                end
            end
            handles=drawMedia(app, handles);
            guidata(hObject,handles);
        end

        % Value changed function: groupingCheckBox
        function groupingCheckBox_Callback(app, event)
            % --- Executes on button press in groupingCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to groupingCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of groupingCheckBox
            %When only the offsets are being optimized, this function sets up the
            %groupings when the grouping checkbox is checked. Instead of varying the
            %offset of each wire separately, we wish to vary the offsets in groups. For
            %example, assume that the wires represented by the indices
            %4,6,8,10,12,14,16,18 are in one row, and 21,23,27,29,31,33,35,37 are in
            %another row. Assume we wish to divide each row into two groups so that the
            %offsets of the wires in each group vary together (i.e. the distance
            %between the wires in each group remain the same). We might define the
            %groups using a layers.grp file consisting of:
            
            %  8 14 16 18
            %  4 6  10 12
            % 33 27 21 23
            % 37 25 29 31
            %The first two rows are from the first row of wire arrays, the next two
            %rows are from the second row of wire arrays.
            %This function will set the first wire in each row with the status "include
            %in optimization", and the other wires as "not included in optimzation".
            %These other wires will be moved, however, the same amount as the first
            %wire so that the distance between them remains constant.
            if get(hObject,'Value')
                if ~get(handles.wireOffsetCheckBox,'Value')
                    msgbox('The wire offset box must be checked to use this option')
                    return
                end
                %Define the matrix handles.groupedWireIndices.
                %It is assumed that there are two rows, and that half the wires are on
                %the upper row and half on the lower row.
                %Get the indices of the wires.
                indWires=find(handles.isWire==1);
                nWires=length(indWires);
                %Since we assume there are two rows, and the number of wires on each
                %row will be divided into 2 groups, the total number of wires must be
                %divisible by 4.
                isDivisbleBy4=rem(nWires,4)==0;
                if ~isDivisbleBy4
                    msgbox('The number of wires must be divisible by 4 to use this option')
                    return
                end
                nWiresInGroup=nWires/4;
                %There will be 4 groups. Each group will be on a different row of the
                %matrix
                handles.groupedWireIndices=reshape(indWires,nWiresInGroup,4)';
                %On each of the two lines there are nWiresOnLine wires. The wires on each
                %line must be divided into 2 groups.
            %     FileName='layers.grp';
            %     handles.groupedWireIndices=importdata(FileName,' ');
            %     sizegwi=size(handles.groupedWireIndices);
            %     nWiresInGroup=sizegwi(2);
                %Get first dependent index will be dependent for impedance but not
                %offset.
                if rem(nWiresInGroup,2)==0
                    indexDependent1=fix(nWiresInGroup/2)+1;
                else
                    indexDependent1=fix(nWiresInGroup/2)+2;
                end
                %The index after this is completely dependent.
                indexDependent2=indexDependent1+1;
                %We will assume that there are two instances when this grouping option
                %will be used. For both, the wire offset checkbox must be checked.
                %GroupOption1:
                %When offsets are to be determined from scratch. That is, the offset
                %differences are not yet known. If the impedances must be determined as well,
                %the wire reactance checkbox must also be checked.
                %GroupOption2:
                %The offset differences have already been determined, and if needed, the
                %reactances have been determined. This option will then vary only the group
                %locations to optimize the efficiency. It will not vary the reactances, and not the
                %offset differences between wires in each group.
                if get(handles.wireReactanceCheckBox,'Value')
                    %offsets are not the only thing being changed.
                    handles.includeInOptim(handles.groupedWireIndices(:,indexDependent2:end))=0;
                else
                    %only offsets are being changed. It is assumed that a solution has
                    %already been found for one mode, and now the offsets configuration
                    %must be played with to find the optimum. But if there is grouping,
                    %then each group must be moved as a group.
                    offsets=handles.wireHorizOffset(handles.groupedWireIndices);
                    %Get distance of each entry from the entry in the first column.
                    handles.diffOffset=offsets-offsets(:,1);
                    %Turn off the dependent wires optimization.
                    handles.includeInOptim(handles.groupedWireIndices(:,2:end))=0;
                end
            else
                %Turn back on the dependent wires optimization.
                handles.includeInOptim(:)=1;
            end
            guidata(hObject,handles)
        end

        % Value changed function: incidentWaveOnlyCheckBox
        function incidentWaveOnlyCheckBox_Callback(app, event)
            % --- Executes on button press in incidentWaveOnlyCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to incidentWaveOnlyCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of incidentWaveOnlyCheckBox
            
            if get(handles.DisplayWaveImageCheckBox,'Value')
                if get(handles.animateWaveCheckBox,'Value')
                    %We have to stop the animation before deleting the image.
                    msgbox('Please turn off animation before changing the display')
                else
                    delete(handles.hWaveImage)
                end
            end
            handles=drawMedia(app, handles);
            guidata(hObject,handles);
        end

        % Value changed function: includeInOptimizationCheckBox
        function includeInOptimizationCheckBox_Callback(app, event)
            % --- Executes on button press in includeInOptimizationCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to includeInOptimizationCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of includeInOptimizationCheckBox
            handles.includeInOptim(handles.mediumNumber)=get(hObject,'Value');
            guidata(hObject,handles)
        end

        % Button pushed function: insertAbovePushButton
        function insertAbovePushButton_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to numMediaEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of numMediaEdit as text
            %        str2double(get(hObject,'String')) returns contents of numMediaEdit as a double
            %
            %We want to add a layer with index mnum-1;
            %We must re-number all layers, from mnum to the highest index, to one index greater.
            mnum=handles.mediumNumber;
            %Increase the number of media
            handles.numMedia=handles.numMedia+1;
            jj=handles.numMedia;
            for ii=mnum+1:handles.numMedia-1
                jj=jj-1;
                handles.eps(jj)=handles.eps(jj-1);
                handles.n(jj)=handles.n(jj-1);
                handles.conductivity(jj)=handles.conductivity(jj-1);
                handles.hOverWL(jj,1)=handles.hOverWL(jj-1);
                %In (jj,1), the presence of the ,1 is to assure that this remains a
                %column vector.  If there is only a single element h(1) and then h(2)
                %is defined, then the default is to add another column, not another
                %row. This is important because there are cases when we concatenate
                %hOverWL.
                handles.mu(jj)=handles.mu(jj-1);
                handles.includeInOptim(jj,1)=handles.includeInOptim(jj-1,1);
                handles.isWire(jj)=handles.isWire(jj-1);
                handles.wireDistImped(jj)=handles.wireDistImped(jj-1);
                handles.wireHorizOffset(jj)=handles.wireHorizOffset(jj-1);
                handles.wireStripWidth(jj)=handles.wireStripWidth(jj-1);
                handles.GAMMAMGReflect(:,:,jj)=handles.GAMMAMGReflect(:,:,jj-1);
                handles.GAMMAMGTransmit(:,:,jj)=handles.GAMMAMGTransmit(:,:,jj-1);
                handles.inductDiff(jj,1)=handles.inductDiff(jj-1,1);
            end
            %Add and define the inserted layer
            jj=jj-1;
            handles.eps(jj)=1;
            handles.n(jj)=1;
            handles.conductivity(jj)=0;
            handles.hOverWL(jj,1)=.01;
            handles.mu(jj)=1;
            handles.includeInOptim(jj,1)=1;
            handles.isWire(jj)=0;
            handles.wireDistImped(jj)=0;
            handles.wireHorizOffset(jj)=0;
            handles.wireStripWidth(jj)=.00677;
            handles.GAMMAMGReflect(:,:,jj)=NaN;
            handles.GAMMAMGTransmit(:,:,jj)=NaN;
            handles.inductDiff(jj,1)=0;
            handles.mediumNumber=jj;
            
            %Redefine the vectors. Some don't include the last medium which is air.
            %Define the air medium for those that do.
            handles.eps=[handles.eps(1:handles.numMedia-1);1];
            handles.n=[handles.n(1:handles.numMedia-1);1];
            handles.conductivity=[handles.conductivity(1:handles.numMedia-1);0];
            handles.mu=[handles.mu(1:handles.numMedia-1);1];
            %The above includes the air medium at end. The following 2 don't.
            handles.hOverWL=handles.hOverWL(1:handles.numMedia-1,1);
            handles.includeInOptim=handles.includeInOptim(1:handles.numMedia-1);
            handles.isWire=handles.isWire(1:handles.numMedia-1);
            handles.wireDistImped=handles.wireDistImped(1:handles.numMedia-1);
            handles.wireHorizOffset=handles.wireHorizOffset(1:handles.numMedia-1);
            handles.distCoupledTo=zeros(size(handles.wireHorizOffset(1:handles.numMedia-1)));
            handles.wireStripWidth=handles.wireStripWidth(1:handles.numMedia-1);
            handles.GAMMAMGReflect=handles.GAMMAMGReflect(:,:,1:handles.numMedia-1);
            handles.GAMMAMGTransmit=handles.GAMMAMGTransmit(:,:,1:handles.numMedia-1);
            handles.inductDiff=handles.inductDiff(1:handles.numMedia-1,1);
            %
            handles=setNewMediumFrame(app, handles);
            %set(handles.numMediaEdit,'String',num2str(handles.numMedia))
            handles.numMediaEdit.Value=handles.numMedia;
            handles.HankelSum=sumHankel(app, handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
            for ii=1:handles.numMedia-1
                handles=mgGAMMA(app, handles,ii);
            end
            handles=drawMedia(app, handles);
            %set(handles.mediumNumberEdit,'String',num2str(handles.mediumNumber))
            app.MediumnoSpinner.Value=handles.mediumNumber;
            guidata(hObject,handles);
        end

        % Button pushed function: insertBelowPushButton
        function insertBelowPushButton_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to numMediaEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of numMediaEdit as text
            %        str2double(get(hObject,'String')) returns contents of numMediaEdit as a double
            %
            handles=insertLayerBelow(app, handles);
            guidata(hObject,handles);
        end

        % Value changed function: isBotAirCheckBox
        function isBotAirCheckBox_Callback(app, event)
            % --- Executes on button press in isBotAirCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to isBotAirCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of isBotAirCheckBox
            handles.isBotAir=get(hObject,'Value');
            if handles.isBotAir
                handles.eps(handles.numMedia)=1;
                handles.n(handles.numMedia)=1;
            end
            handles=drawMedia(app, handles);
            guidata(hObject,handles);
        end

        % Value changed function: isWireCheckBox
        function isWireCheckBox_Callback(app, event)
            % --- Executes on button press in isWireCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to isWireCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of isWireCheckBox
            handles.isWire(handles.mediumNumber)=get(hObject,'Value');
            if handles.isWire(handles.mediumNumber)==1
                handles=setIsWireCheckbox(app, handles);
            else
                handles.hOverWL(handles.mediumNumber,1)=0.01;
                set(handles.thickEdit,'String',num2str(handles.hOverWL(handles.mediumNumber)))
            end
            handles=drawMedia(app, handles);
            guidata(hObject,handles)
        end

        % Value changed function: lossFreqEdit
        function lossFreqEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to lossFreqEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of lossFreqEdit as text
            %        str2double(get(hObject,'String')) returns contents of lossFreqEdit as a double
            if app.WkCheckBox.Value
                %msgbox('This is not operational when Wk is checked.')
                %commented out because it can be operational.
                getWkmax(app)
                return
            end
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String','20');
            else
                %conductorLosses(handles);
            end
            handles=getRealZTilde(app, handles);
            handles=drawMedia(app, handles);
            guidata(hObject,handles);
        end

        % Button pushed function: makeMoviePushButton
        function makeMoviePushButton_Callback(app, event)
            % --- Executes on button press in makeMoviePushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to makeMoviePushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            %This can only be enabled if wave image is being displayed.
            if get(handles.animateWaveCheckBox,'Value')
                %We have to stop the animation before deleting the image.
                msgbox('Please turn off animation before removing wave image display')
            else
                dPhase=360/handles.nPhaseDivisions;
                %hFig=get(handles.prismAxes,'parent');
                %set(hFig, 'Renderer', 'zbuffer')
                E=handles.E;
                %
                %Since only the axis handle is given (and not the figure handle), the
                %frame that is produced does not include the axis and tic marks.  In
                %order to include them, the argument rectA is added to the getframe
                %function.  This argument is meant to define the region that is to be
                %included in the frame relative to the lower left corner of the axis.
                %The format of rect is [x y width height].
                %In the expression below for rectA, I don't understand the numbers
                %subracted from rect(3) and rect(4).  In any case, in order to get the
                %required data in pixels, the units must be reset top pixels.
                units=get(handles.prismAxes,'Units');
                set(handles.prismAxes,'Units','pixels')
                rect=get(handles.prismAxes,'OuterPosition');
                set(handles.prismAxes,'Units',units)
                rectA=[-35 -20 rect(3)-90 rect(4)-50];
                %
                %f = getframe(handles.prismAxes,rectA);
                %f = getframe(app.prismAxes,rectA);
                %f = getframe(app.prismAxes);
                f = getframe(app.figure1);
                %f = getframe(hFig,'nodither');
                %imm=frame2im(f);
                %[im,map] = rgb2ind(imm,256,'nodither');
                [im,map] = rgb2ind(f.cdata,256,'nodither');
                im(1,1,1,handles.nPhaseDivisions) = 0;
                for nn=1:handles.nPhaseDivisions
                    timePhase=(nn-1)*dPhase;
                    expTimePhase=exp(-1i*timePhase*pi/180);
                    set(handles.hWaveImage,'CData',real(E*expTimePhase))
                    drawnow
                    %f = getframe(handles.prismAxes,rectA);
                    f = getframe(app.prismAxes,rectA);
                    %f = getframe(hFig,'nodither');
                    %imm=frame2im(f);
                    %im(:,:,1,nn) = rgb2ind(imm,map,'nodither');
                    im(:,:,1,nn) = rgb2ind(f.cdata,map,'nodither');
                end
                imwrite(im,map,'waveMotion.gif','DelayTime',0,'LoopCount',inf)
                msgbox('Animated GIF placed on file waveMotion.gif.')
            end
        end

        % Value changed function: MediumnoSpinner
        function mediumNumberEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to mediumNumberEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of mediumNumberEdit as text
            %        str2double(get(hObject,'String')) returns contents of mediumNumberEdit as a double
            %val=str2double(get(hObject,'String'));
            val=app.MediumnoSpinner.Value;
            %We would like this spinner control to work the opposite from a
            %normal spinner.  That is, by pressing the up button, the
            %medium number will DECREASE, and by pressing the down button,
            %the medium number will INCREASE. There is no elegant solution
            %to this, so we we use an inelegant solution.
            %The problem is, we don't know if this routine has been called
            %because one of the spin buttons has been pushed, or because
            %the value in the box has been edited. So we'll make an
            %assumption that if the new value differs from the old value by
            %one, it is because of a button click.  Otherwise an edit.
            previousval=event.PreviousValue;
            valDif=val-previousval;
            if abs(valDif)==1
                %This value was (most likely) obtained from button clicks.
                %So reverse the increment.
                val=previousval-valDif;
                app.MediumnoSpinner.Value=val;
            end                
          
            if val>handles.numMedia-1 || val<1
                app.MediumnoSpinner.Value=handles.mediumNumber;
                %set(hObject,'String',num2str(handles.mediumNumber));
                return
            end
            handles.mediumNumber=val;
            %
            handles=setNewMedium(app, handles);
            %conductorLosses(handles);
            guidata(hObject,handles);

        end

        % Callback function
        function mediumNumberUpDownSlider_Callback(app, event)
            % --- Executes on slider movement.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to mediumNumberUpDownSlider (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'Value') returns position of slider
            %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
            %
            %The up and down operations have been switched so that going up leads
            %toward 1 and going down leads toward numMedia.
            if get(hObject,'Value')>0.5
                if handles.mediumNumber==1
                    set(hObject,'Value',0.5)
                    return
                end
                inc=-1;
                handles.mediumNumber=handles.mediumNumber+inc;
            else
                if handles.mediumNumber==handles.numMedia-1
                    set(hObject,'Value',0.5)
                    return
                end
                inc=1;
                handles.mediumNumber=handles.mediumNumber+inc;
            end
            %set(handles.mediumNumberEdit,'String',num2str(handles.mediumNumber))
            app.MediumnoSpinner.Value=handles.mediumNumber;
            set(hObject,'Value',0.5)
            %
            %Change the values in the medium frame.
            handles=setNewMedium(app, handles);
            %conductorLosses(handles);
            guidata(hObject,handles);
        end

        % Selection changed function: mediumPanel
        function mediumPanel_SelectionChangeFcn(app, event)
            % --- Executes when selected object is changed in mediumPanel.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to the selected object in mediumPanel
            % eventdata  structure with the following fields (see UIBUTTONGROUP)
            %	EventName: string 'SelectionChanged' (read only)
            %	OldValue: handle of the previously selected object or empty if none was selected
            %	NewValue: handle of the currently selected object
            % handles    structure with handles and user data (see GUIDATA)
            % switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
            %     case 'epsEqualMuRadioButton'
            %     case 'muEqual1RadioButton'
            %     case 'otherRadioButton'
            % end
            %When drawMedia is not called, coupling (which is contained 
            % in drawMedia, must be considered anyway.
            handles=coupling(app,handles);
            handles=runMain(app, handles);
            handles=drawWaves(app, handles);
            handles=drawIncArrow(app, handles);
            guidata(hObject,handles);
        end

        % Selection changed function: mediumTypeButtonGroup
        function mediumTypeButtonGroup_SelectionChangedFcn(app, event)
            % --- Executes when selected object is changed in mediumTypeButtonGroup.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to the selected object in mediumTypeButtonGroup
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
                case 'wireTypeRadioButton'
                    handles.isWire(handles.mediumNumber)=1;
                    handles=setIsWireCheckbox(app, handles);
                    %Set the wire width. We are given this width for the
                    %wavelength specified for losses. Get the width relative to unit
                    %wave length.
                    wireWidthMil=str2double(get(handles.wireWidthMilEdit,'String'));
                    wireWidthMeters=wireWidthMil*25.4e-6;
                    freqForLossGHz=str2double(get(handles.lossFreqEdit,'String'));
                    c0=299792458;
                    lambdaForLossMeters=c0/(freqForLossGHz*1.e9);
                    handles.wireStripWidth(handles.mediumNumber)=wireWidthMeters/lambdaForLossMeters;
                    set(handles.wireStripWidthEdit,'String',num2str(handles.wireStripWidth(handles.mediumNumber)))
                case 'dielectricTypeRadioButton'
                    handles.isWire(handles.mediumNumber)=2;
                    handles=setNotWire(app, handles);
                case 'airGapTypeRadioButton'
                    handles.isWire(handles.mediumNumber)=3;
                    handles=setNotWire(app, handles);
                case 'virtualTypeRadioButton'
                    handles.isWire(handles.mediumNumber)=0;
                    handles=setNotWire(app, handles);
                    handles.hOverWL(handles.mediumNumber,1)=0;
                    set(handles.thickEdit,'String',num2str(handles.hOverWL(handles.mediumNumber)))
            end
            handles=drawMedia(app, handles);
            guidata(hObject,handles)
        end

        % Value changed function: metagratingCheckBox
        function metagratingCheckBox_Callback(app, event)
            % --- Executes on button press in metagratingCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to metagratingCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of metagratingCheckBox
            if get(hObject,'Value')
                handles=setMetagratingCheckbox(app, handles);
            else
                %Determine if a .gam file has been defined.
                if isempty(handles.gamFileName)
                    handles.GAMMA=[];
                    app.NoFloqmdsSpinner.Value=5;
                    %The number of modes has changed. So redefine the metagrating
                    %gamma.
                    nTermsFQ=5;
                    handles.GAMMAMGReflect=NaN(nTermsFQ,nTermsFQ,handles.numMedia-1);
                    handles.GAMMAMGTransmit=NaN(nTermsFQ,nTermsFQ,handles.numMedia-1);
                    handles.inductDiff=zeros(handles.numMedia-1,1);
                else
                    FileName=handles.gamFileName;
                    handles=readgamFile(app, handles,FileName);
                end
            end
            handles=drawMedia(app, handles);
            guidata(hObject,handles);
        end

        % Button pushed function: mirrorWiresPushButton
        function mirrorWiresPushButton_Callback(app, event)
            % --- Executes on button press in mirrorWiresPushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to mirrorWiresPushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            %Change the sign of the incident wave.
            handles.ThetInDeg=-handles.ThetInDeg;
            handles.incAngDeg=handles.ThetInDeg;
            handles.ThetOutDeg=-handles.ThetOutDeg;
            for ii=1:handles.numMedia-1
                if handles.isWire(ii)==1
                    handles.wireHorizOffset(ii)=1-handles.wireHorizOffset(ii);
                    handles=mgGAMMA(app, handles,ii);
                end
            end
            set(handles.waveDirectionEdit,'String',num2str(handles.ThetInDeg))
            handles=drawMedia(app, handles);
            guidata(hObject,handles)
        end

        % Selection changed function: multibeamsButtonGroup
        function multibeamsButtonGroup_SelectionChangedFcn(app, event)
            % --- Executes when selected object is changed in multibeamsButtonGroup.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to the selected object in multibeamsButtonGroup
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
                case 'multibeamConfig1RadioButton'
                    %save configuration 2
                    A=[handles.incAngDeg handles.n(1:handles.numMedia-1)'];
                    AA=[0 handles.conductivity(1:handles.numMedia-1)'];
                    B=[0 handles.hOverWL(1:handles.numMedia-1)'];
                    C=[A;AA;B];
                    save('multibeam2.dat','C','-ascii')
                    %Load configuration 1
                    set(handles.dataFileText,'String','multibeam1.dat')
                    handles=readDataFile(app, handles);
                    %Change mode to be optimized
                    modeOptimized=handles.multiBeamModeOptimized;
            
                    app.targetOptimModeSpinner.Value=modeOptimized;
            %         switch modeOptimized
            %             case -1
            %                 set(handles.m1FloqModeToOptimize,'Value',1);
            %             case 0
            %                 set(handles.zeroFloqModeToOptimize,'Value',1);
            %             case 1
            %                 set(handles.p1FloqModeToOptimize,'Value',1);
            %         end
                case 'multibeamConfig2RadioButton'
                    %Load configuration 1
                    set(handles.dataFileText,'String','multibeam2.dat')
                    handles=readDataFile(app, handles);
                    %Change mode to be optimized
                    set(handles.zeroFloqModeToOptimize,'Value',1);
                    set(handles.isBeamsplitCheckBox,'Value',0)
                    handles.includeInOptim(1:handles.numMedia-2,1)=0;
            end
            handles=fillInResults(app, handles);
            guidata(hObject,handles);
        end

        % Value changed function: nPtsPerWLEdit
        function nPtsPerWLEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to nPtsPerWLEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of nPtsPerWLEdit as text
            %        str2double(get(hObject,'String')) returns contents of nPtsPerWLEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String',num2str(handles.nPtsPerWL));
            else
                handles.nPtsPerWL=val;
                if get(handles.DisplayWaveImageCheckBox,'Value')
                    if get(handles.animateWaveCheckBox,'Value')
                        %We have to stop the animation before deleting the image.
                        msgbox('Please turn off animation before continuing.')
                    else
                        delete(handles.hWaveImage)
                        handles=drawWaves(app, handles);
                        handles=drawIncArrow(app, handles);
                    end
                end
                guidata(hObject,handles);
            end
        end

        % Value changed function: nPtsPerWLUpDownSlider
        function nPtsPerWLUpDownSlider_Callback(app, event)
            % --- Executes on slider movement.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to nPtsPerWLUpDownSlider (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'Value') returns position of slider
            %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
            if get(hObject,'Value')>0.5
                if handles.nPtsPerWL>=15
                    inc=5;
                else
                    inc=1;
                end
                handles.nPtsPerWL=handles.nPtsPerWL+inc;
            else
                if handles.nPtsPerWL<=1
                    set(hObject,'Value',0.5)
                    return
                end
                if handles.nPtsPerWL>15
                    inc=-5;
                else
                    inc=-1;
                end
                handles.nPtsPerWL=handles.nPtsPerWL+inc;
            end
            set(handles.nPtsPerWLEdit,'String',num2str(handles.nPtsPerWL))
            set(hObject,'Value',0.5)
            if get(handles.DisplayWaveImageCheckBox,'Value')
                if get(handles.animateWaveCheckBox,'Value')
                    %We have to stop the animation before deleting the image.
                    msgbox('Please turn off animation before removing wave image display')
                else
                    delete(handles.hWaveImage)
                    handles=drawWaves(app, handles);
                    handles=drawIncArrow(app, handles);
                end
            end
            guidata(hObject,handles)
        end

        % Value changed function: nText
        function nText_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to nText (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of nText as text
            %        str2double(get(hObject,'String')) returns contents of nText as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String',num2str(handles.n(handles.mediumNumber)));
            else
                handles.n(handles.mediumNumber)=val;
                handles.eps(handles.mediumNumber)=val*val;
                set(handles.epsEdit,'String',num2str(handles.eps(handles.mediumNumber)))
                set(handles.nText,'String',num2str(handles.n(handles.mediumNumber)))
                if handles.mediumNumber==1
                    handles.HankelSum=sumHankel(app, handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
                    for ii=1:handles.numMedia-1
                        handles=mgGAMMA(app, handles,ii);
                    end
                end
                handles=drawMedia(app, handles);
                guidata(hObject,handles);
            end
        end

        % Button pushed function: normalizeLocPushButton
        function normalizeLocPushButton_Callback(app, event)
            % --- Executes on button press in normalizeLocPushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to normalizeLocPushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            handles=normalizeLocation(app, handles);
            % isFirstWireDefined=0;
            % for ii=1:handles.numMedia-1
            %     if handles.isWire(ii)
            %         if isFirstWireDefined
            %             handles.wireHorizOffset(ii)=handles.wireHorizOffset(ii)-firstWireOffset;
            %             if handles.wireHorizOffset(ii)<0
            %                 handles.wireHorizOffset(ii)=1+handles.wireHorizOffset(ii);
            %             end
            %         else
            %             firstWireOffset=handles.wireHorizOffset(ii);
            %             handles.wireHorizOffset(ii)=0;
            %             isFirstWireDefined=1;
            %         end
            %         handles=mgGAMMA(handles,ii);
            %     end
            % end
            handles=drawMedia(app, handles);
            guidata(hObject,handles)
        end

        % Value changed function: NoofmediaSpinner
        function numMediaEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            val=app.NoofmediaSpinner.Value;
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to numMediaEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of numMediaEdit as text
            %        str2double(get(hObject,'String')) returns contents of numMediaEdit as a double
            if val>handles.numMedia
                %Media have been added.  Set them to air
                for ii=handles.numMedia+1:val
                    handles.eps(ii)=1;
                    handles.n(ii)=1;
                    handles.conductivity(ii)=0;
                    handles.hOverWL(ii,1)=handles.hOverWL(1);
                    handles.mu(ii)=1;
                    handles.includeInOptim(ii-1,1)=1;
                    handles.isWire(ii-1)=0;
                    handles.wireDistImped(ii-1)=0;
                    handles.wireHorizOffset(ii-1)=0;
                    handles.wireStripWidth(ii-1)=.00677;
                    handles.GAMMAMGReflect(:,:,ii-1)=NaN;
                    handles.GAMMAMGTransmit(:,:,ii-1)=NaN;
                    handles.inductDiff(ii-1,1)=0;
                end
            else
                %Media have been removed.
                %If mediumNumber is out of bounds, adjust it.
                if handles.mediumNumber>val
                    handles.mediumNumber=val;
                    %set(handles.mediumNumberEdit,'String',num2str(handles.mediumNumber))
                    handles=setNewMedium(app, handles);
                end
            end
            handles.numMedia=val;
            handles=drawMedia(app, handles);
            guidata(hObject,handles);

        end

        % Callback function
        function numMediaUpDownSlider_Callback(app, event)
            % --- Executes on slider movement.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to numMediaUpDownSlider (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'Value') returns position of slider
            %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
            if get(hObject,'Value')>0.5
                inc=1;
                handles.numMedia=handles.numMedia+inc;
                ii=handles.numMedia;
                handles.eps(ii)=1;
                handles.n(ii)=1;
                handles.conductivity(ii)=0;
                handles.hOverWL(ii,1)=handles.hOverWL(1);
                handles.mu(ii)=1;
                handles.includeInOptim(ii-1,1)=1;
                handles.isWire(ii-1)=0;
                handles.wireDistImped(ii-1)=0;
                handles.wireHorizOffset(ii-1)=0;
                handles.wireStripWidth(ii-1)=0.00677;
                handles.GAMMAMGReflect(:,:,ii-1)=NaN;
                handles.GAMMAMGTransmit(:,:,ii-1)=NaN;
                handles.inductDiff(ii-1)=0;
            else
                if handles.numMedia==2
                    set(hObject,'Value',0.5)
                    return
                end
                inc=-1;
                handles.numMedia=handles.numMedia+inc;
                if get(handles.isBotAirCheckBox,'Value')
                    handles.eps(handles.numMedia)=1;
                end
                %If mediumNumber is out of bounds, adjust it.
                if handles.mediumNumber>handles.numMedia
                    handles.mediumNumber=handles.numMedia;
                    %set(handles.mediumNumberEdit,'String',num2str(handles.mediumNumber))
                    handles=setNewMedium(app, handles);
                    app.MediumnoSpinner.Value=handles.mediumNumber;
                end
            end
            for ii=1:handles.numMedia-1
                handles=mgGAMMA(app, handles,ii);
            end
            %set(handles.numMediaEdit,'String',num2str(handles.numMedia))
            handles.numMediaEdit.Value=handles.numMedia;
            set(hObject,'Value',0.5)
            handles=drawMedia(app, handles);
            guidata(hObject,handles);
        end

        % Value changed function: NomodesSpinner
        function numOptimModesEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            %[hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to numOptimModesEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of numOptimModesEdit as text
            %        str2double(get(hObject,'String')) returns contents of numOptimModesEdit as a double
            modeSeqNum=app.modenoSpinner.Value;
            val=app.NomodesSpinner.Value;
            if modeSeqNum>val
                app.modenoSpinner.Value=val;
                %displayTargetModeInfo
            end
            app.modenoSpinner.Limits=[1,val];

        end

        % Value changed function: modenoSpinner
        function optimModeSeqNumEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            
            % hObject    handle to optimModeSeqNumEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of optimModeSeqNumEdit as text
            %        str2double(get(hObject,'String')) returns contents of optimModeSeqNumEdit as a double
            %
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            handles=optimModeSeqNumEdit_Function(app, handles);
            guidata(hObject,handles);
        end

        % Value changed function: optimizeReflectionCheckBox
        function optimizeReflectionCheckBox_Callback(app, event)
            % --- Executes on button press in optimizeReflectionCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to optimizeReflectionCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of optimizeReflectionCheckBox
            handles=drawMedia(app, handles);
            guidata(hObject,handles);
        end

        % Value changed function: paramsToControlListbox
        function paramsToControlListbox_Callback(app, event)
            % --- Executes on selection change in paramsToControlListbox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to paramsToControlListbox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: contents = cellstr(get(hObject,'String')) returns paramsToControlListbox contents as cell array
            %        contents{get(hObject,'Value')} returns selected item from paramsToControlListbox
            %
            %Use the tilt angle slider as a generic slider
            nParamToControl=get(hObject,'Value');
            
            %the following is to make sure that the value that is being entered
            %in the control is the current value of the variable.
            varName=handles.nameParamToControl(nParamToControl,:);
            varName=deblank(varName);
            
            if nParamToControl>1 && nParamToControl<8
                %The parameter is one that depends on the current medium number
                valStrForEval=['handles.' varName '(' num2str(handles.mediumNumber) ')'];
            else
                valStrForEval=['handles.' varName];
            end
            handles.valParamToControl(nParamToControl)=eval(valStrForEval);
            
            app.Slider.Limits=[handles.minParamToControl(nParamToControl),handles.maxParamToControl(nParamToControl)];
            app.Slider.Value=handles.valParamToControl(nParamToControl);
            %set(handles.tiltAngleEdit,'String',num2str(handles.valParamToControl(nParamToControl)))
            app.tiltAngleEditNumeric.Limits=app.Slider.Limits;
            app.tiltAngleEditNumeric.Value=handles.valParamToControl(nParamToControl);
            %varname=handles.nameParamToControl(nParamToControl,:);
            %varname=deblank(varname);
            if nParamToControl==3
                %hOverWL.  make the small slider step smaller.
                sliderStep=[.00025 .05];
                app.sliderStep=sliderStep(1);
            else
                sliderStep=[.001 .05];
                app.sliderStep=sliderStep(1);
            end
            %set(handles.tiltAngleSlider,'SliderStep',sliderStep)
            set(handles.tiltAnglePanel,'Title',varName)
            handles.nParamToControl=nParamToControl;
            guidata(hObject,handles)
        end

        % Button pushed function: plotLayersPushButton
        function plotLayersPushButton_Callback(app, event)
            % --- Executes on button press in plotLayersPushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to plotLayersPushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            plotLayers(app, handles)
        end

        % Button pushed function: pltVshPushButton
        function pltVshPushButton_Callback(app, event)
            % --- Executes on button press in pltVshPushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to pltVshPushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            %
            nParamToControl=handles.nParamToControl;
            if nParamToControl==8
                isMultipleCases=0;
                EffRef=70;
                CSTresultsfilename='';
                upperDistOverLambda0=0;
                lowerDistOverLambda0=0;
                isCST=0;
                isMultiCST=0;
                nFreqsCST=0;
                pltVsFreq(app,handles,isMultipleCases,EffRef,CSTresultsfilename,...
                    upperDistOverLambda0,lowerDistOverLambda0,...
                    isCST,isMultiCST,nFreqsCST,resultNumber);
            else
                pltVsh(app,handles)
            end
        end

        % Selection changed function: polarizationButtonGroup
        function polarizationButtonGroup_SelectionChangedFcn(app, event)
            % --- Executes when selected object is changed in polarizationButtonGroup.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to the selected object in polarizationButtonGroup
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            handles=drawMedia(app, handles);
            guidata(hObject,handles)
        end

        % Value changed function: powerCouplingEff
        function powerCouplingEff_Callback(app, event)
            % --- Executes on button press in powerCouplingEff.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to powerCouplingEff (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of powerCouplingEff
            handles=drawIncArrow(app, handles);
            guidata(hObject,handles);
        end

        % Value changed function: poyntingVectorsCheckBox
        function poyntingVectorsCheckBox_Callback(app, event)
            % --- Executes on button press in poyntingVectorsCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to poyntingVectorsCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of poyntingVectorsCheckBox
            if get(handles.animateWaveCheckBox,'Value')
                %We have to stop the animation before deleting the image.
                msgbox('Please turn off animation before removing wave image display')
                set(hObject,'Value',~get(hObject,'Value'))
            else
                if get(hObject,'Value')
                    handles=drawIncArrow(app, handles);
                    guidata(hObject,handles)
                else
                    if ishandle(handles.hPoyntingArrow)
                        delete(handles.hPoyntingArrow)
                    end
                end
            end
        end

        % Button down function: prismAxes
        function prismAxes_ButtonDownFcn(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            axisClickCallback(app, hObject, eventdata, handles)
        end

        % Value changed function: propagationDirectionsCheckBox
        function propagationDirectionsCheckBox_Callback(app, event)
            % --- Executes on button press in propagationDirectionsCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to propagationDirectionsCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of propagationDirectionsCheckBox
            if get(hObject,'Value')
                handles=PropagationDirections(app, handles);
                guidata(hObject,handles)
            else
                if ishandle(handles.hPropDirec)
                    delete(handles.hPropDirec)
                end
            end
        end

        % Value changed function: quitOptimCheckBox
        function quitOptimCheckBox_Callback(app, event)
            % --- Executes on button press in quitOptimCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to quitOptimCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            setappdata(hObject,'optimstop',1)
        end

        % Button pushed function: reciprocalPushButton
        function reciprocalPushButton_Callback(app, event)
            % --- Executes on button press in reciprocalPushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to reciprocalPushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of reciprocalPushButton
            handles.hOverWL(1:handles.numMedia-1,1)=flipud(handles.hOverWL(1:handles.numMedia-1));
            handles.n(1:handles.numMedia-1)=flipud(handles.n(1:handles.numMedia-1));
            handles.eps(1:handles.numMedia-1)=flipud(handles.eps(1:handles.numMedia-1));
            handles.conductivity(1:handles.numMedia-1)=flipud(handles.conductivity(1:handles.numMedia-1));
            handles.mu(1:handles.numMedia-1)=flipud(handles.mu(1:handles.numMedia-1));
            handles.includeInOptim(1:handles.numMedia-1)=flipud(handles.includeInOptim(1:handles.numMedia-1));
            handles.isWire(1:handles.numMedia-1)=fliplr(handles.isWire(1:handles.numMedia-1));
            handles.wireDistImped(1:handles.numMedia-1)=fliplr(handles.wireDistImped(1:handles.numMedia-1));
            handles.wireHorizOffset(1:handles.numMedia-1)=fliplr(handles.wireHorizOffset(1:handles.numMedia-1));
            handles.wireStripWidth(1:handles.numMedia-1)=fliplr(handles.wireStripWidth(1:handles.numMedia-1));
            ThetOutDeg=handles.ThetOutDeg;
            handles.ThetOutDeg=-handles.ThetInDeg;
            handles.ThetInDeg=-ThetOutDeg;
            handles.incAngDeg=handles.ThetInDeg;
            for ii=1:handles.numMedia-1
                handles=mgGAMMA(app, handles,ii);
            end
            set(handles.waveDirectionEdit,'String',num2str(handles.ThetInDeg))
            set(handles.epsEdit,'String',num2str(handles.eps(handles.mediumNumber)))
            set(handles.nText,'String',num2str(handles.n(handles.mediumNumber)))
            set(handles.thickEdit,'String',num2str(handles.hOverWL(handles.mediumNumber)))
            set(handles.includeInOptimizationCheckBox,'Value',handles.includeInOptim(handles.mediumNumber))
            %set(handles.isWireCheckBox,'Value',handles.isWire(handles.mediumNumber))
            set(handles.isWireCheckBox,'Value',handles.isWire(handles.mediumNumber)==1)
            set(handles.wireTypeRadioButton,'Value',handles.isWire(handles.mediumNumber)==1)
            set(handles.wireDistImpedEdit,'String',num2str(handles.wireDistImped(handles.mediumNumber)))
            if app.WkCheckBox.Value && isfield(handles,'Wk')
                app.wireWkmilEdit.Value=num2str(handles.Wk(handles.mediumNumber));
                app.realZLabel.Text=num2str(handles.realZ(handles.mediumNumber),3);
            end
            set(handles.wireHorizOffsetEdit,'String',num2str(handles.wireHorizOffset(handles.mediumNumber)))
            set(handles.wireStripWidthEdit,'String',num2str(handles.wireStripWidth(handles.mediumNumber)))
            handles=drawMedia(app, handles);
            guidata(hObject,handles)
        end

        % Button pushed function: redrawPushButton
        function redrawPushButton_Callback(app, event)
            % --- Executes on button press in redrawPushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to redrawPushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            delete(get(handles.prismAxes,'Children'))
            handles=drawMedia(app, handles);
            guidata(hObject,handles)
        end

        % Button pushed function: removeLayerPushButton
        function removeLayerPushButton_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to numMediaEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of numMediaEdit as text
            %        str2double(get(hObject,'String')) returns contents of numMediaEdit as a double
            %
            %If the number of media is at its minimum level, then nothing can be done.
            if handles.numMedia<=2
                msgbox('The number of media cannot be reduced further.')
                return
            end
            mnum=handles.mediumNumber;
            %We want to remove layer number mnum;
            %We must re-number all layers above mnum to one less than their current
            %number.
            for ii=mnum+1:handles.numMedia-1
                handles.eps(ii-1)=handles.eps(ii);
                handles.n(ii-1)=handles.n(ii);
                handles.conductivity(ii-1)=handles.conductivity(ii);
                handles.hOverWL(ii-1,1)=handles.hOverWL(ii);
                handles.mu(ii-1)=handles.mu(ii);
                handles.includeInOptim(ii-1)=handles.includeInOptim(ii);
                handles.isWire(ii-1)=handles.isWire(ii);
                handles.wireDistImped(ii-1)=handles.wireDistImped(ii);
                handles.wireHorizOffset(ii-1)=handles.wireHorizOffset(ii);
                handles.wireStripWidth(ii-1)=handles.wireStripWidth(ii);
                handles.GAMMAMGReflect(:,:,ii-1)=handles.GAMMAMGReflect(:,:,ii);
                handles.GAMMAMGTransmit(:,:,ii-1)=handles.GAMMAMGTransmit(:,:,ii);
                handles.inductDiff(ii-1,1)=handles.inductDiff(ii,1);
            end
            %Reduce the number of media
            handles.numMedia=handles.numMedia-1;
            %Redefine the vectors. Some don't include the last medium which is air.
            %Define the air medium for those that do.
            handles.eps=[handles.eps(1:handles.numMedia-1);1];
            handles.n=[handles.n(1:handles.numMedia-1);1];
            handles.conductivity=[handles.conductivity(1:handles.numMedia-1);0];
            handles.mu=[handles.mu(1:handles.numMedia-1);1];
            %The above includes the air medium at end. The following 2 doe't.
            handles.hOverWL=handles.hOverWL(1:handles.numMedia-1,1);
            handles.includeInOptim=handles.includeInOptim(1:handles.numMedia-1);
            handles.isWire=handles.isWire(1:handles.numMedia-1);
            handles.wireDistImped=handles.wireDistImped(1:handles.numMedia-1);
            handles.wireHorizOffset=handles.wireHorizOffset(1:handles.numMedia-1);
            handles.distCoupledTo=zeros(size(handles.wireHorizOffset(1:handles.numMedia-1)));
            handles.wireStripWidth=handles.wireStripWidth(1:handles.numMedia-1);
            handles.GAMMAMGReflect=handles.GAMMAMGReflect(:,:,1:handles.numMedia-1);
            handles.GAMMAMGTransmit=handles.GAMMAMGTransmit(:,:,1:handles.numMedia-1);
            handles.inductDiff=handles.inductDiff(1:handles.numMedia-1,1);
            %
            if handles.mediumNumber>handles.numMedia-1
                handles.mediumNumber=handles.numMedia-1;
            else
                %The layer that was removed is not the last layer.
                if handles.mediumNumber>1
                    %The medium that was removed is not an end medium (first or last).
                    %The new current medium is the one that was after the removed
                    %layer. It could be that the previous layer has the same properties
                    %as this one.  If so, combine them, but only if they are not wire media.
                    %if ~handles.isWire(handles.mediumNumber) && ~handles.isWire(handles.mediumNumber-1)
                    if handles.isWire(handles.mediumNumber)~=1 && handles.isWire(handles.mediumNumber-1)~=1
                        if handles.eps(handles.mediumNumber)==handles.eps(handles.mediumNumber-1) && ...
                           handles.mu(handles.mediumNumber)==handles.mu(handles.mediumNumber-1) && ...
                           handles.conductivity(handles.mediumNumber)==handles.conductivity(handles.mediumNumber-1)
                            %Combine the two media
                            handles.hOverWL(handles.mediumNumber,1)=handles.hOverWL(handles.mediumNumber-1)+handles.hOverWL(handles.mediumNumber);
                            handles.mediumNumber=handles.mediumNumber-1;
                            mnum=handles.mediumNumber;
                            %We want to remove layer number mnum;
                            %We must re-number all layers above mnum to one less than their current
                            %number.
                            for ii=mnum+1:handles.numMedia-1
                                handles.eps(ii-1)=handles.eps(ii);
                                handles.n(ii-1)=handles.n(ii);
                                handles.conductivity(ii-1)=handles.conductivity(ii);
                                handles.hOverWL(ii-1,1)=handles.hOverWL(ii);
                                handles.mu(ii-1)=handles.mu(ii);
                                handles.includeInOptim(ii-1,1)=handles.includeInOptim(ii,1);
                                handles.isWire(ii-1)=handles.isWire(ii);
                                handles.wireDistImped(ii-1)=handles.wireDistImped(ii);
                                handles.wireHorizOffset(ii-1)=handles.wireHorizOffset(ii);
                                handles.wireStripWidth(ii-1)=handles.wireStripWidth(ii);
                                handles.GAMMAMGReflect(:,:,ii-1)=handles.GAMMAMGReflect(:,:,ii);
                                handles.GAMMAMGTransmit(:,:,ii-1)=handles.GAMMAMGTransmit(:,:,ii);
                                handles.inductDiff(ii-1,1)=handles.inductDiff(ii,1);
                            end
                            %Reduce the number of media
                            handles.numMedia=handles.numMedia-1;
                            %Redefine the vectors. Some don't include the last medium which is air.
                            %Define the air medium for those that do.
                            handles.eps=[handles.eps(1:handles.numMedia-1);1];
                            handles.n=[handles.n(1:handles.numMedia-1);1];
                            handles.conductivity=[handles.conductivity(1:handles.numMedia-1);0];
                            handles.mu=[handles.mu(1:handles.numMedia-1);1];
                            %The above includes the air medium at end. The following 2 doe't.
                            handles.hOverWL=handles.hOverWL(1:handles.numMedia-1,1);
                            handles.includeInOptim=handles.includeInOptim(1:handles.numMedia-1);
                            handles.isWire=handles.isWire(1:handles.numMedia-1);
                            handles.wireDistImped=handles.wireDistImped(1:handles.numMedia-1);
                            handles.wireHorizOffset=handles.wireHorizOffset(1:handles.numMedia-1);
                            handles.distCoupledTo=zeros(size(handles.wireHorizOffset(1:handles.numMedia-1)));
                            handles.wireStripWidth=handles.wireStripWidth(1:handles.numMedia-1);
                            handles.GAMMAMGReflect=handles.GAMMAMGReflect(:,:,1:handles.numMedia-1);
                            handles.GAMMAMGTransmit=handles.GAMMAMGTransmit(:,:,1:handles.numMedia-1);
                            handles.inductDiff=handles.inductDiff(1:handles.numMedia-1,1);
                        end
                    end
                end
            end
            %set(handles.numMediaEdit,'String',num2str(handles.numMedia))
            handles.numMediaEdit.Value=handles.numMedia;
            %set(handles.mediumNumberEdit,'String',num2str(handles.mediumNumber))
            app.MediumnoSpinner.Value=handles.mediumNumber;
            handles=setNewMediumFrame(app, handles);
            handles.HankelSum=sumHankel(app, handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
            for ii=1:handles.numMedia-1
                handles=mgGAMMA(app, handles,ii);
            end
            handles=drawMedia(app, handles);
            guidata(hObject,handles);
        end

        % Selection changed function: resultsButtonGroup
        function resultsButtonGroup_SelectionChangeFcn(app, event)
            % --- Executes when selected object is changed in resultsButtonGroup.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to the selected object in resultsButtonGroup
            % eventdata  structure with the following fields (see UIBUTTONGROUP)
            %	EventName: string 'SelectionChanged' (read only)
            %	OldValue: handle of the previously selected object or empty if none was selected
            %	NewValue: handle of the currently selected object
            % handles    structure with handles and user data (see GUIDATA)
            switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
                case 'rhoRadioButton'
                    handles.plotDependentVariable='rho';
                case 'sigmaARadioButton'
                    handles.plotDependentVariable='sigmaA';
                case 'sigmaBRadioButton'
                    handles.plotDependentVariable='sigmaB';
                case 'tauRadioButton'
                    handles.plotDependentVariable='tau';
            end
            guidata(hObject,handles)
        end

        % Value changed function: rotationEdit
        function rotationEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to rotationEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of rotationEdit as text
            %        str2double(get(hObject,'String')) returns contents of rotationEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String','0');
            else
                if get(handles.DisplayWaveImageCheckBox,'Value')
                    if get(handles.animateWaveCheckBox,'Value')
                        %We have to stop the animation before deleting the image.
                        msgbox('Please turn off animation before continuing.')
                    else
                        rot=val;
                        expTimePhase=exp(-1i*handles.timePhase*pi/180);
                        E=handles.E;
                        cdata=real(E*expTimePhase);
                        cdataNew=imrotate(cdata,rot);
                        set(handles.hWaveImage,'CData',cdataNew);
                    end
                end
                guidata(hObject,handles);
            end
        end

        % Value changed function: rotationUpDownSlider
        function rotationUpDownSlider_Callback(app, event)
            % --- Executes on slider movement.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to rotationUpDownSlider (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'Value') returns position of slider
            %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
            rot=str2double(get(handles.rotationEdit,'String'));
            if get(hObject,'Value')>0.5
                rot=rot+1;
            else
                rot=rot-1;
            end
            set(handles.rotationEdit,'String',num2str(rot))
            set(hObject,'Value',0.5)
            if get(handles.DisplayWaveImageCheckBox,'Value')
                if get(handles.animateWaveCheckBox,'Value')
                    %We have to stop the animation before deleting the image.
                    msgbox('Please turn off animation before removing wave image display')
                else
                    expTimePhase=exp(-1i*handles.timePhase*pi/180);
                    E=handles.E;
                    cdata=real(E*expTimePhase);
                    cdataNew=imrotate(cdata,rot);
                    set(handles.hWaveImage,'CData',cdataNew);
                end
            end
            guidata(hObject,handles)
        end

        % Selection changed function: singleWaveButtonGroup
        function singleWaveButtonGroup_SelectionChangeFcn(app, event)
            % --- Executes when selected object is changed in singleWaveButtonGroup.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to the selected object in singleWaveButtonGroup
            % eventdata  structure with the following fields (see UIBUTTONGROUP)
            %	EventName: string 'SelectionChanged' (read only)
            %	OldValue: handle of the previously selected object or empty if none was selected
            %	NewValue: handle of the currently selected object
            % handles    structure with handles and user data (see GUIDATA)
            if get(handles.DisplayWaveImageCheckBox,'Value')  && get(handles.singleWaveDisplayCheckBox,'Value')
                if get(handles.animateWaveCheckBox,'Value')
                    %We have to stop the animation before deleting the image.
                    msgbox('Please turn off animation before removing wave image display')
                else
                    delete(handles.hWaveImage)
                    handles=drawWaves(app, handles);
                    handles=drawIncArrow(app, handles);
                    guidata(hObject,handles)
                end
            end
        end

        % Value changed function: singleWaveDisplayCheckBox
        function singleWaveDisplayCheckBox_Callback(app, event)
            % --- Executes on button press in singleWaveDisplayCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to singleWaveDisplayCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of singleWaveDisplayCheckBox
            if get(handles.DisplayWaveImageCheckBox,'Value')
                if get(handles.animateWaveCheckBox,'Value')
                    %We have to stop the animation before deleting the image.
                    msgbox('Please turn off animation before removing wave image display')
                    set(hObject,'Value',~get(hObject,'Value'))
                    return
                else
                    delete(handles.hWaveImage)
                    handles=drawWaves(app, handles);
                end
            end
            handles=drawIncArrow(app, handles);
            guidata(hObject,handles)
        end

        % Button pushed function: solvePushButton
        function solvePushButton_Callback(app, event)
            % --- Executes on button press in solvePushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to solvePushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            set(handles.workingText,'Visible','on')
            drawnow
            if get(handles.method1RadioButton,'Value')
                method=1;
            end
            if get(handles.method2RadioButton,'Value')
                method=2;
            end
            if get(handles.method3RadioButton,'Value')
                method=3;
            end
            switch method
                case 1
                    handles=specialPlot4_1(app, handles);
                case 2
                    handles=specialPlot4_2(app, handles);
                case 3
                    handles=specialPlot4_3(app, handles);
            end
            guidata(hObject,handles);
            set(handles.workingText,'Visible','off')
            drawnow
        end

        % Button pushed function: startMonteCarloPushButton
        function startMonteCarloPushButton_Callback(app, event)
            % --- Executes on button press in startMonteCarloPushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to startMonteCarloPushButton (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            set(handles.MonteCarloCancelCheckBox,'Value',0)
            set(handles.workingText,'Visible','on')
            drawnow
            MonteCarlo(app, handles)
            set(handles.workingText,'Visible','off')
        end

        % Selection changed function: targetModeOptimizationButtonGroup
        function targetModeOptimizationButtonGroup_SelectionChangedFcn(app, event)
            % --- Executes when selected object is changed in targetModeOptimizationButtonGroup.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to the selected object in targetModeOptimizationButtonGroup
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
                case 'targetOptimView1RadioButton'
                    handles.wireHorizOffset=handles.wireHorizOffsetMode1;
                    handles.wireDistImped=handles.wireDistImpedMode1;
                    handles.hOverWL=handles.hOverWLMode1;
                case 'targetOptimView2RadioButton'
                    handles.wireHorizOffset=handles.wireHorizOffsetMode2;
                    handles.wireDistImped=handles.wireDistImpedMode2;
                    handles.hOverWL=handles.hOverWLMode2;
                case 'targetOptimView3RadioButton'
                    handles.wireHorizOffset=handles.wireHorizOffsetMode3;
                    handles.wireDistImped=handles.wireDistImpedMode3;
                    handles.hOverWL=handles.hOverWLMode3;
            end
            for ii=1:handles.numMedia-1
                handles=mgGAMMA(app, handles,ii);
            end
            handles=drawMedia(app, handles);
            guidata(hObject,handles)
        end

        % Value changed function: thickEdit
        function thickEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to thickEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of thickEdit as text
            %        str2double(get(hObject,'String')) returns contents of thickEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String',num2str(handles.hOverWL(handles.mediumNumber,1)));
            else
                handles.hOverWL(handles.mediumNumber,1)=val;
                handles=drawMedia(app, handles);
                guidata(hObject,handles)
            end
        end

        % Value changed function: timephaseEdit
        function timephaseEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to timephaseEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of timephaseEdit as text
            %        str2double(get(hObject,'String')) returns contents of timephaseEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hobject,'String','0')
                handles.timePhase=0;
            else
                handles.timePhase=val;
            end
            handles=drawWaves(app, handles);
            guidata(hObject,handles);
        end

        % Value changed function: waveDirectionEdit
        function waveDirectionEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to waveDirectionEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of waveDirectionEdit as text
            %        str2double(get(hObject,'String')) returns contents of waveDirectionEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String',num2str(handles.incAngDeg));
            else
                handles.incAngDeg=val;
                handles=drawMedia(app, handles);
                guidata(hObject,handles);
            end
        end

        % Selection changed function: waveImagePanel
        function waveImagePanel_SelectionChangeFcn(app, event)
            % --- Executes when selected object is changed in waveImagePanel.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to the selected object in waveImagePanel
            % eventdata  structure with the following fields (see UIBUTTONGROUP)
            %	EventName: string 'SelectionChanged' (read only)
            %	OldValue: handle of the previously selected object or empty if none was selected
            %	NewValue: handle of the currently selected object
            % handles    structure with handles and user data (see GUIDATA)
            if get(handles.DisplayWaveImageCheckBox,'Value')
                if get(handles.animateWaveCheckBox,'Value')
                    %We have to stop the animation before deleting the image.
                    msgbox('Please turn off animation before removing wave image display')
                else
                    handles=drawWaves(app, handles);
                    handles=drawIncArrow(app, handles);
                    guidata(hObject,handles)
                end
            end
        end

        % Value changed function: wireDistImpedEdit
        function wireDistImpedEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to wireDistImpedEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of wireDistImpedEdit as text
            %        str2double(get(hObject,'String')) returns contents of wireDistImpedEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String',num2str(handles.wireDistImped(handles.mediumNumber)));
            else
                handles.wireDistImped(handles.mediumNumber)=val;
                handles=mgGAMMA(app, handles,handles.mediumNumber);
                handles=drawMedia(app, handles);
                guidata(hObject,handles)
            end
        end

        % Value changed function: wireHorizOffsetEdit
        function wireHorizOffsetEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to wireHorizOffsetEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of wireHorizOffsetEdit as text
            %        str2double(get(hObject,'String')) returns contents of wireHorizOffsetEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String',num2str(handles.wireHorizOffset(handles.mediumNumber)));
            else
                handles.distCoupledTo(handles.mediumNumber)=0;
                handles.wireHorizOffset(handles.mediumNumber)=val;
                handles=mgGAMMA(app, handles,handles.mediumNumber);
                handles=drawMedia(app, handles);
                guidata(hObject,handles)
            end
        end

        % Value changed function: wireStripWidthEdit
        function wireStripWidthEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to wireStripWidthEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of wireStripWidthEdit as text
            %        str2double(get(hObject,'String')) returns contents of wireStripWidthEdit as a double
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String',num2str(handles.wireStripWidth(handles.mediumNumber)));
            else
                handles.wireStripWidth(handles.mediumNumber)=val;
                handles=mgGAMMA(app, handles,handles.mediumNumber);
                handles=drawMedia(app, handles);
                guidata(hObject,handles)
            end
        end

        % Value changed function: wireWidthMilEdit
        function wireWidthMilEdit_Callback(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to wireWidthMilEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of wireWidthMilEdit as text
            %        str2double(get(hObject,'String')) returns contents of wireWidthMilEdit as a double
            if app.WkCheckBox.Value
                %msgbox('This is not operational when Wk is checked.')
                %Commented out because it can be used, but not the same
                %way.
                getWkmax(app)
                return
            end
            val=str2double(get(hObject,'String'));
            if isnan(val)
                set(hObject,'String','4');
            end
            handles=getRealZTilde(app, handles);
            handles=drawMedia(app, handles);
            guidata(hObject,handles);
        end

        % Selection changed function: wiresButtonGroup
        function wiresButtonGroup_SelectionChangedFcn(app, event)
            % --- Executes when selected object is changed in wiresButtonGroup.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to the selected object in wiresButtonGroup
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            % switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
            %     case 'copperWireRadioButton'
            %     case 'PECWiresRadioButton'
            % end
            if app.WkCheckBox.Value
                msgbox('This is not operational when Wk is checked.')
                return
            end
            handles=getRealZTilde(app, handles);
            handles=drawMedia(app, handles);
            guidata(hObject,handles);
        end

        % Value changed function: withoutIncidentWaveCheckBox
        function withoutIncidentWaveCheckBox_Callback(app, event)
            % --- Executes on button press in withoutIncidentWaveCheckBox.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to withoutIncidentWaveCheckBox (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hint: get(hObject,'Value') returns toggle state of withoutIncidentWaveCheckBox
            
            if get(handles.DisplayWaveImageCheckBox,'Value')
                if get(handles.animateWaveCheckBox,'Value')
                    %We have to stop the animation before deleting the image.
                    msgbox('Please turn off animation before changing the display')
                else
                    delete(handles.hWaveImage)
                end
            end
            handles=drawMedia(app, handles);
            guidata(hObject,handles);
        end

        % Value changing function: Slider
        function tiltAngleSliderValueChanging(app, event)
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            %changingValue = event.Value;
            %val=get(hObject,'Value');
            val=event.Value;
            %set(handles.tiltAngleEdit,'String',num2str(val))
            app.tiltAngleEditNumeric.Value=val;
            nParamToControl=handles.nParamToControl;
            varname=handles.nameParamToControl(nParamToControl,:);
            varname=deblank(varname);
        
            if nParamToControl>1 && nParamToControl<8
                %The parameter is one that depends on the current medium number
                 estring=['handles.' varname '(' num2str(handles.mediumNumber) ')' '=' num2str(val) ';'];
            else
                 estring=['handles.' varname '=' num2str(val) ';'];
            end
            
            eval(estring)
            handles.valParamToControl(nParamToControl)=val;
            if strcmp(varname,'freqGHz')
                newFreq=handles.freqGHz;
                handles=changeFreq(app,handles,newFreq);
            end
            if strcmp(varname,'incAngDeg')
                set(handles.waveDirectionEdit,'String',num2str(handles.incAngDeg))
                for ii=1:handles.numMedia-1
                    handles=mgGAMMA(app, handles,ii);
                end
            end
            if strcmp(varname,'n')
                set(handles.nText,'String',num2str(val))
                handles.eps(handles.mediumNumber)=val*val;
                set(handles.epsEdit,'String',num2str(handles.eps(handles.mediumNumber)))
                if handles.mediumNumber==1
                    handles.HankelSum=sumHankel(app,handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
                    for ii=1:handles.numMedia-1
                        handles=mgGAMMA(app,handles,ii);
                    end
                end
            end
            if strcmp(varname,'hOverWL')
                set(handles.thickEdit,'String',num2str(val))
            end
            if strcmp(varname,'conductivity')
                set(handles.conductivityEdit,'String',num2str(val))
            end
            %if strcmp(varname,'ThetInDeg') || strcmp(varname,'ThetOutDeg')
            if strcmp(varname,'ThetInDeg') 
                %It is assumed ThetInDeg is being varied. Then also
                %vary incAngDeg so it equals ThetInDeg, and also vary
                %ThetOutDeg so that handles.d is unchanged, which is
                %tantamount to handles.DELsin being unchanged.
                handles.incAngDeg=handles.ThetInDeg;
                set(handles.waveDirectionEdit,'String',num2str(handles.incAngDeg))
                %
                %abs(sinThetOut-sinThetIn)=1/handles.d;
                %2 possibilities
                %1
                %sinThetOut-sinThetIn=1/handles.d;
                %2
                %sinThetOut-sinThetIn=-1/handles.d;
                sinThetIn=sind(handles.ThetInDeg);
                sinThetOutPrev=sind(handles.ThetOutDeg);
                if sinThetOutPrev>sinThetIn
                   sinThetOut=1/handles.d+sinThetIn;
                else
                   sinThetOut=-1/handles.d+sinThetIn;
                end
                handles.ThetOutDeg=asind(sinThetOut);
                %
                % sinThetOut=sind(handles.ThetOutDeg);
                % handles.DELsin=abs(sinThetOut-sinThetIn);
                % %handles.d=handles.WL/handles.DELsin;
                % %In this version, the period will not be affected by wavelength
                % %so that we can compute frequency response.
                % handles.d=1/handles.DELsin;
                % set(handles.periodText,'String',num2str(handles.d))
                handles.HankelSum=sumHankel(app,handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
                for jj=1:handles.numMedia-1
                    handles=mgGAMMA(app,handles,jj);
                end
            end   
            if strcmp(varname,'ThetOutDeg')
                sinThetIn=sind(handles.ThetInDeg);
                handles.incAngDeg=handles.ThetInDeg;
                set(handles.waveDirectionEdit,'String',num2str(handles.incAngDeg))
                sinThetOut=sind(handles.ThetOutDeg);
                handles.DELsin=abs(sinThetOut-sinThetIn);
                %handles.d=handles.WL/handles.DELsin;
                %In this version, the period will not be affected by wavelength
                %so that we can compute frequency response.
                handles.d=1/handles.DELsin;
                %set(handles.periodText,'String',num2str(handles.d))
                app.periodEditField.Value=handles.d;
                handles.HankelSum=sumHankel(app,handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
                for ii=1:handles.numMedia-1
                    handles=mgGAMMA(app,handles,ii);
                end
             end   


            if strcmp(varname,'wireStripWidth')
                handles=mgGAMMA(app,handles,handles.mediumNumber);
                set(handles.wireStripWidthEdit,'String',num2str(val))
            end
            if strcmp(varname,'wireDistImped')
                set(handles.wireDistImpedEdit,'String',num2str(val))
                handles=mgGAMMA(app,handles,handles.mediumNumber);
            end
            if strcmp(varname,'wireHorizOffset')
                set(handles.wireHorizOffsetEdit,'String',num2str(val))
                handles=mgGAMMA(app,handles,handles.mediumNumber);
                %If the change in the current value of wireHorizOffset is one which
                %controls other values of wireHorizOffest, then this will be
                %implemented in drawMedia. But if the current value is DEPENDENT on
                %another value, then the distance between it and the other value
                %will be changed. Implement this change.
                layerForCoupling=handles.nCoupledTo(handles.mediumNumber);
                nCurrent=handles.mediumNumber;
                if layerForCoupling~=nCurrent
                    handles.distCoupledTo(nCurrent)=handles.wireHorizOffset(layerForCoupling)-handles.wireHorizOffset(nCurrent);
                end
            end
            if strcmp(varname,'distImpedFac')
                for ii=1:handles.numMedia-1
                    handles=mgGAMMA(app,handles,ii);
                end
            end
            %I'm not sure why these isPossibleCoupling statements were placed here.
            %handles.isPossibleCoupling=true;
            handles=drawMedia(app,handles);
            %handles.isPossibleCoupling=false;
            if strcmp(varname,'ThetInDeg') || strcmp(varname,'ThetOutDeg')
                %This couln't be placed above because the required info is only
                %calculated in drawMedia.
                setFloqAngleText(app,handles)
                if get(handles.propagationDirectionsCheckBox,'Value')
                    handles=PropagationDirections(app,handles);
                end
            end
            guidata(hObject,handles)
            
        end

        % Button pushed function: savePushButton
        function saveTargetModeInfo_callback(app, event)
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            TGmodeNumber=app.modenoSpinner.Value;
            handles = saveTargetModeInfo(app,handles,TGmodeNumber);
            guidata(hObject,handles)

        end

        % Button pushed function: undefinePushButton
        function undefinePushButtonCallback(app, event)
            app.NomodesSpinner.Value=1;
            app.modenoSpinner.Value=1;
            app.undefinedLabel.Text='undefined';
            app.targetOptimModeSpinner.Value=0;
            app.TGMpropModeNumber=[];
            app.TGMmodeIndex=[];
            app.TGMwireHorizOffset=[];
            app.TGMwireDistImped=[];
            app.TGMhOverWL=[];
            app.TGMnCoupledTo=[];
            app.TGMdistCoupledTo=[];
            app.TGMincludeInOptim=[];
            app.TGMisPossibleCoupling=[];
            app.TGMdefined=0;
            app.TGMincludeLayerThicknessInOptim=[];
            app.TGMincludeWireOffsetInOptim=[];
            app.TGMincludeWireReactanceInOptim=[];
            app.TGMefficiency=[];

        end

        % Button pushed function: AutoCouplingButton
        function AutoCouplingButton_Callback(app, event)
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            % hObject    handle to coupleMedium2Edit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            handles.isPossibleCoupling=false;
            nCurrent=1;
            while nCurrent<handles.numMedia
                if handles.isWire(nCurrent)==1
                    %Determine to which layer the current wire is to be coupled.
                    layerForCoupling=nCurrent;
                    nCurrent=handles.numMedia; %In case the following for 
                    % loop doesn't "break".
                    ndielec=0;
                    for ii=layerForCoupling:handles.numMedia-1
                        %keep going until air is reached or a second dielectric 
                        % is reached.
                        if handles.isWire(ii)==3    %Air?
                            nCurrent=ii+1;
                            break
                        end
                        if handles.isWire(ii)>1    %Since it is not air, 
                            % it is a dielectric.
                            ndielec=ndielec+1;
                            if ndielec==2
                                break
                            end
                        end
                        if handles.isWire(ii)==1
                            handles.nCoupledTo(ii)=layerForCoupling;
                            handles.distCoupledTo(ii)=handles.wireHorizOffset(layerForCoupling)-handles.wireHorizOffset(ii);
                            if layerForCoupling~=ii
                                handles.isPossibleCoupling=true;
                                handles.includeInOptim(ii)=false;
                            end
                        end
                    end   %for ii
                else
                    nCurrent=nCurrent+1;
                end    %if handles.isWire(nCurrent)==1
            end    %while nCurrent<handles.numMedia
            set(handles.includeInOptimizationCheckBox,'Value',handles.includeInOptim(handles.mediumNumber))
            guidata(hObject,handles)
        end

        % Value changed function: NoperiodsSpinner
        function NoperiodsSpinner_callback(app, event)
            val = app.NoperiodsSpinner.Value;
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to NPeriodsHorizEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of NPeriodsHorizEdit as text
            %        str2double(get(hObject,'String')) returns contents of NPeriodsHorizEdit as a double
            handles.NPeriodsHoriz=val;
            if get(handles.DisplayWaveImageCheckBox,'Value')
                if get(handles.animateWaveCheckBox,'Value')
                    %We have to stop the animation before deleting the image.
                    msgbox('Please turn off animation before changing the display')
                else
                    delete(handles.hWaveImage)
                    handles=drawMedia(app, handles);
                end
            else
                handles=drawMedia(app, handles);
            end
            guidata(hObject,handles);
        end

        % Value changed function: symmetricCheckBox
        function symmetricCheckBox_Callback(app, event)
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            value = app.symmetricCheckBox.Value;
            if value
                wiresTopBotDielectric(app,handles)
            end
        end

        % Value changed function: currentFloqmdSpinner
        function currentFloqmdSpinner_Callback(app, event)
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            value = app.currentFloqmdSpinner.Value;
            nFloqModes=app.NoFloqmdsSpinner.Value;
            maxMode=fix(nFloqModes/2);
            if value>=-maxMode && value<=maxMode
                %value is within bounds
                app.currentFloqMode=value;
                setFloqAngleText(app, handles)
                if get(handles.FloquetCheckBox,'Value')
                    handles=drawMedia(app, handles);
                    guidata(hObject,handles);
                end
            else
                %invalid value.  Return to previous state.
                app.currentFloqmdSpinner.Value=app.currentFloqMode;
            end
            
        end

        % Value changed function: NoFloqmdsSpinner
        function NoFloqmdsSpinner_Callback(app, event)
            val = app.NoFloqmdsSpinner.Value;
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            %Make sure it is odd number. If not, add 1.
            if val/2==fix(val/2)
                val=val+1;
                app.NoFloqmdsSpinner.Value=val;
            end
            app.currentFloqMode=0;
            app.currentFloqmdSpinner.Value=app.currentFloqMode;
            if get(handles.FloquetCheckBox,'Value')
                if get(handles.metagratingCheckBox,'Value')
                    if val==1
                        handles.incAngDegFloq=0;
                    end
                    %swm added Dec 2024. Hope its right.
                    %In order to call incidentWaves, we have to first
                    %define incDegFloq: swm Dec 2024
                    nTermsFQ=val;
                    maxMode=fix(nTermsFQ/2);
                    nVec=-maxMode:maxMode;
                    k0=handles.k0;
                    kxq=k0*sind(handles.incAngDeg)+(2*pi/handles.d)*nVec;
                    kyq=sqrt((k0-kxq).*(k0+kxq));
                    handles.incAngDegFloq=NaN(nTermsFQ,1);
                    indexImagkyq0=find(imag(kyq)==0);
                    handles.incAngDegFloq(indexImagkyq0)=asind(kxq(indexImagkyq0)/k0);
                    handles=incidentWaves(app,handles);
                    %
                    nTermsFQ=val;
                    handles.GAMMAMGReflect=NaN(nTermsFQ,nTermsFQ,handles.numMedia-1);
                    handles.GAMMAMGTransmit=NaN(nTermsFQ,nTermsFQ,handles.numMedia-1);
                    handles.inductDiff=zeros(handles.numMedia-1,1);
                    for ii=1:handles.numMedia-1
                        handles=mgGAMMA(app, handles,ii);
                    end
                end
                handles=drawMedia(app, handles);
                guidata(hObject,handles);
            end  
        end

        % Value changed function: tiltAngleEditNumeric
        function tiltAngleEditNumeric_Callback(app, event)
            val = app.tiltAngleEditNumeric.Value;
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            %minmaxval=app.Slider.Limits;
            %minval=minmaxval(1);
            %maxval=minmaxval(2);
            %handles.distCoupledTo=zeros(size(handles.wireHorizOffset));
            nParamToControl=handles.nParamToControl;
            varname=handles.nameParamToControl(nParamToControl,:);
            varname=deblank(varname);
        
            if nParamToControl>1 && nParamToControl<8
                %The parameter is one that depends on the current medium number
                 %estring=['handles.' varname '(' num2str(handles.mediumNumber) ')' '=' get(hObject,'String') ';'];
                 estring=['handles.' varname '(' num2str(handles.mediumNumber) ')' '=' num2str(val) ';'];
            else
                 estring=['handles.' varname '=' num2str(val) ';'];
            end
            eval(estring)
        
            handles.valParamToControl(nParamToControl)=val;
            app.Slider.Value=val;
            if strcmp(varname,'freqGHz')
                newFreq=handles.freqGHz;
                handles=changeFreq(app,handles,newFreq);
           end
            if strcmp(varname,'incAngDeg')
                set(handles.waveDirectionEdit,'String',num2str(handles.incAngDeg))
                for ii=1:handles.numMedia-1
                    handles=mgGAMMA(app, handles,ii);
                end
            end
            if strcmp(varname,'n')
                set(handles.nText,'String',num2str(val))
                handles.eps(handles.mediumNumber)=val*val;
                set(handles.epsEdit,'String',num2str(handles.eps(handles.mediumNumber)))
                if handles.mediumNumber==1
                    handles.HankelSum=sumHankel(app, handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
                    for ii=1:handles.numMedia-1
                        handles=mgGAMMA(app, handles,ii);
                    end
                end
            end
            if strcmp(varname,'hOverWL')
                set(handles.thickEdit,'String',num2str(val))
            end
            if strcmp(varname,'conductivity')
                set(handles.conductivityEdit,'String',num2str(val))
            end
            if strcmp(varname,'ThetInDeg') 
                %It is assumed ThetInDeg is being varied. Then also
                %vary incAngDeg so it equals ThetInDeg, and also vary
                %ThetOutDeg so that handles.d is unchanged, which is
                %tantamount to handles.DELsin being unchanged.
                handles.incAngDeg=handles.ThetInDeg;
                set(handles.waveDirectionEdit,'String',num2str(handles.incAngDeg))
                %
                %abs(sinThetOut-sinThetIn)=1/handles.d;
                %2 possibilities
                %1
                %sinThetOut-sinThetIn=1/handles.d;
                %2
                %sinThetOut-sinThetIn=-1/handles.d;
                sinThetIn=sind(handles.ThetInDeg);
                sinThetOutPrev=sind(handles.ThetOutDeg);
                if sinThetOutPrev>sinThetIn
                   sinThetOut=1/handles.d+sinThetIn;
                else
                   sinThetOut=-1/handles.d+sinThetIn;
                end
                handles.ThetOutDeg=asind(sinThetOut);
                %
                % sinThetOut=sind(handles.ThetOutDeg);
                % handles.DELsin=abs(sinThetOut-sinThetIn);
                % %handles.d=handles.WL/handles.DELsin;
                % %In this version, the period will not be affected by wavelength
                % %so that we can compute frequency response.
                % handles.d=1/handles.DELsin;
                % set(handles.periodText,'String',num2str(handles.d))
                handles.HankelSum=sumHankel(app,handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
                for jj=1:handles.numMedia-1
                    handles=mgGAMMA(app,handles,jj);
                end
            end   
            if strcmp(varname,'ThetOutDeg')
                sinThetIn=sind(handles.ThetInDeg);
                handles.incAngDeg=handles.ThetInDeg;
                set(handles.waveDirectionEdit,'String',num2str(handles.incAngDeg))
                sinThetOut=sind(handles.ThetOutDeg);
                handles.DELsin=abs(sinThetOut-sinThetIn);
                %handles.d=handles.WL/handles.DELsin;
                %In this version, the period will not be affected by wavelength
                %so that we can compute frequency response.
                handles.d=1/handles.DELsin;
                %set(handles.periodText,'String',num2str(handles.d))
                app.periodEditField.Value=handles.d;
                handles.HankelSum=sumHankel(app,handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
                for ii=1:handles.numMedia-1
                    handles=mgGAMMA(app,handles,ii);
                end
             end   
            if strcmp(varname,'wireStripWidth')
                handles=mgGAMMA(app, handles,handles.mediumNumber);
                set(handles.wireStripWidthEdit,'String',num2str(val))
            end
            if strcmp(varname,'wireDistImped')
                set(handles.wireDistImpedEdit,'String',num2str(val))
                handles=mgGAMMA(app, handles,handles.mediumNumber);
            end
            if strcmp(varname,'wireHorizOffset')
                set(handles.wireHorizOffsetEdit,'String',num2str(val))
                handles=mgGAMMA(app, handles,handles.mediumNumber);
                %If the change in the current value of wireHorizOffset is one which
                %controls other values of wireHorizOffest, then this will be
                %implemented in drawMedia. But if the current value is DEPENDENT on
                %another value, then the distance between it and the other value
                %will be changed. Implement this change.
                layerForCoupling=handles.nCoupledTo(handles.mediumNumber);
                nCurrent=handles.mediumNumber;
                if layerForCoupling~=nCurrent
                    handles.distCoupledTo(nCurrent)=handles.wireHorizOffset(layerForCoupling)-handles.wireHorizOffset(nCurrent);
                end
            end
            if strcmp(varname,'distImpedFac')
                for ii=1:handles.numMedia-1
                    handles=mgGAMMA(app, handles,ii);
                end
            end
            %I'm not sure why these isPossibleCoupling statements were placed here.
            %handles.isPossibleCoupling=true;
            handles=drawMedia(app, handles);
            %handles.isPossibleCoupling=false;
            if strcmp(varname,'ThetInDeg') || strcmp(varname,'ThetOutDeg')
                %This couln't be placed above because the required info is only
                %calculated in drawMedia.
                setFloqAngleText(app, handles)
                if get(handles.propagationDirectionsCheckBox,'Value')
                    handles=PropagationDirections(app, handles);
                end
            end
            guidata(hObject,handles)            
        end

        % Button pushed function: sliderStepUpPushButton
        function sliderStepUpPushButton_Callback(app, event)
            oldValue=app.tiltAngleEditNumeric.Value;
            newValue=oldValue+app.sliderStep;
            if newValue<app.tiltAngleEditNumeric.Limits(2)
                app.tiltAngleEditNumeric.Value=newValue;
                %I don't know if this will work since event of pushbutton
                %is different from event of edit box.
                tiltAngleEditNumeric_Callback(app, event)
            end
        end

        % Button pushed function: sliderStepDownPushButton
        function sliderStepDownPushButton_Callback(app, event)
            oldValue=app.tiltAngleEditNumeric.Value;
            newValue=oldValue-app.sliderStep;
            if newValue>app.tiltAngleEditNumeric.Limits(1)
                app.tiltAngleEditNumeric.Value=newValue;
                %I don't know if this will work since event of pushbutton
                %is different from event of edit box.
                tiltAngleEditNumeric_Callback(app, event)
            end            
        end

        % Button pushed function: uncoupleButton
        function uncoupleButton_callback(app, event)
            %This button undoes any coupling between wires.
            %This was taken from function readDataFile.
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            handles.distCoupledTo=zeros(size(handles.wireHorizOffset));
            handles.nCoupledTo=1:handles.numMedia-1;
            handles.isPossibleCoupling=false;
            handles.includeInOptim=ones(handles.numMedia-1,1);
            %Turn off includeInOptim for media with 0 width except for wires.
            zeroWidthInd=find(handles.hOverWL==0);
            %wireInd=find(handles.isWire);
            wireInd=find(handles.isWire==1);
            removeFromOptimInd=setdiff(zeroWidthInd,wireInd);
            handles.includeInOptim(removeFromOptimInd)=0;
            guidata(hObject,handles)                        
        end

        % Button pushed function: BargraphButton
        function BargraphButton_Callback(app, event)
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            %Get the initial status of the modes in order to return to it
            %later.
            appmodenoSpinnerValue=app.modenoSpinner.Value;
            appoptimizeReflectionCheckBoxValue=app.optimizeReflectionCheckBox.Value;
            apptargetOptimMode1EditValue=app.targetOptimModeSpinner.Value;
            %Get the efficiencies.
            nModes=length(handles.modeNumberPropagating);
            nModesTarget=app.NomodesSpinner.Value;
            a=zeros(nModesTarget,2*nModes);
            for jj=1:nModesTarget
                %Place system in mode jj.
                app.modenoSpinner.Value=jj;
                % optimModeSeqNumEdit_Callback(app, event)
                handles=optimModeSeqNumEdit_Function(app,handles);
                %First, refracted modes.
                app.optimizeReflectionCheckBox.Value=false;
                for ii=1:nModes
                    handles.modesForOptimization(1)=handles.modeNumberPropagating(ii);
                    handles=drawMedia(app, handles);
                    str=get(handles.targetOptimEfficiency1Text,'String');
                    a(jj,ii)=str2double(str);
                    %guidata(hObject,handles)
                end
                %Now reflected modes.
                app.optimizeReflectionCheckBox.Value=true;
                for ii=1:nModes
                    handles.modesForOptimization(1)=handles.modeNumberPropagating(ii);
                    handles=drawMedia(app, handles);
                    str=get(handles.targetOptimEfficiency1Text,'String');
                    a(jj,ii+nModes)=str2double(str);
                    %guidata(hObject,handles)
                end
            end
            %
            %Return the controls to their original configuration.
            app.targetOptimModeSpinner.Value=apptargetOptimMode1EditValue;
            handles.modesForOptimization(1)=apptargetOptimMode1EditValue;
            app.optimizeReflectionCheckBox.Value=appoptimizeReflectionCheckBoxValue;
            app.modenoSpinner.Value=appmodenoSpinnerValue;
            handles=optimModeSeqNumEdit_Function(app,handles);
            handles=drawMedia(app, handles);
            %It could be that since we are returning the handles structure
            %to its original state, there is no need for guidata.
            %guidata(hObject,handles)
            %
            %targetMode=-1:0;
            %xaxismodes=[-1:0 -1:0];
            targetMode=handles.modeNumberPropagating;
            xaxismodes=[targetMode targetMode];
            lenxaxismodes=length(xaxismodes);
            tickLabels=cell(lenxaxismodes,1);
            for ii=1:lenxaxismodes
                tickLabels(ii)={num2str(xaxismodes(ii))};
            end    
            %for ii=1:2
            for ii=1:nModesTarget
                powersum=sum(a(ii,:));
                targmdstr=num2str(targetMode(ii));
                figure
                bar(a(ii,:)*100)
                set(gca,'ylim',[0 100])
                %set(gca,'ylim',[0 2])
                set(gca,'XTickLabel',tickLabels,'fontsize',12)
                title(['Refraction to Mode No. ' targmdstr ', absorbed power =' num2str((1-powersum)*100) '%'])
                xlabel('transmission modes                  reflection modes')
                ylabel('\eta_m (%)')
                grid
                %
                figure
                bar(a(ii,:)/powersum*100)
                set(gca,'ylim',[0 100])
                %set(gca,'ylim',[0 2])
                set(gca,'XTickLabel',tickLabels,'fontsize',12)
                title(['Refraction to Mode No. ' targmdstr ' relative to power scattered (%)'])
                xlabel('transmission modes                  reflection modes')
                ylabel('\eta_m (%)')
                grid
            end
        end

        % Button pushed function: combineButton
        function combineWires_Callback(app, event)
            %Make sure that the medium numbers are filled in.
            wire1Medium=app.wire1CombineEdit.Value;
            wire2Medium=app.wire2CombineEdit.Value;
            if wire1Medium <= 0 || wire2Medium <= 0 
                msgbox('Medium number must be greater than 0.')
                return
            end
            if wire1Medium == wire2Medium 
                msgbox('Medium are the same.')
                return
            end
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            if wire1Medium>handles.numMedia-1
                msgbox('Medium 1 is out of range.')
                return
            end
             if wire2Medium>handles.numMedia-1
                msgbox('Medium 2 is out of range.')
                return
            end
           %Make sure that the media are on the same line. (I.e. no
            %dielectric or airgap between them.
            TGMpropModeNumberSave=app.TGMpropModeNumber;
            minWireMedium=min(wire1Medium,wire2Medium);
            maxWireMedium=max(wire1Medium,wire2Medium);
            mediaBetween=minWireMedium:maxWireMedium;
            indisWireBetween=handles.isWire(mediaBetween);
            isInterference=find(indisWireBetween>1);
            if ~isempty(isInterference)
                msgbox('Chosen wires are not along the same line.')
                return
            end
            %The two chosen wires are legitimate.
            %
            nModes=app.NomodesSpinner.Value;
            for ii=1:nModes
                %Consider each mode separately. 
                offsetCombine1=app.TGMwireHorizOffset(ii,wire1Medium);
                offsetCombine2=app.TGMwireHorizOffset(ii,wire2Medium);
                %Get new offset. Remember that they are in region [0 1].
                minOffset=min(offsetCombine1,offsetCombine2);
                maxOffset=max(offsetCombine1,offsetCombine2);
                diffminmax=maxOffset-minOffset;
                if diffminmax>0.5
                    newOffsetCombine=0.5*(minOffset+maxOffset-1);
                    if newOffsetCombine<0 
                        newOffsetCombine=newOffsetCombine+1;
                    end
                else
                    newOffsetCombine=0.5*(offsetCombine1+offsetCombine2);
                end
                impedCombine1=app.TGMwireDistImped(ii,wire1Medium);
                impedCombine2=app.TGMwireDistImped(ii,wire2Medium);
                newImpedCombine=impedCombine1*impedCombine2/(impedCombine1+impedCombine2);
                %For each mode:
                %Put system into mode ii.
                %Write the file (to out.dat)
                %Change the name of the file to combine_ii.
                %Change the file to implement the combining.
                % 
                %Put system into mode ii.
                app.modenoSpinner.Value=ii;
                handles=optimModeSeqNumEdit_Function(app,handles);
                %Write the file (to out.dat)
                C=WriteData(app, handles);
                Ctranspose=C.';
                %Implement the combining by changing Ctranspose.
                %We want to change medium number maxWireMedium, and then
                %remove medium minWireMedium and the virtual medium after
                %it. Column 5 is the impedance, column 6 is the offset. The
                %first row of Ctranspose is a header.
                Ctranspose(maxWireMedium+1,5)=newImpedCombine;
                Ctranspose(maxWireMedium+1,6)=newOffsetCombine;
                newCtranspose=[Ctranspose(1:minWireMedium,:);Ctranspose(minWireMedium+3:end,:)];
                outfileii=['combine_' num2str(ii) '.dat'];
                save(outfileii,'newCtranspose','-ascii')
            end
            %Undefine all optimization modes
            %Set one of the "include in optimization" params (e.g. wire
            %offset checkbox).
            undefinePushButtonCallback(app);
            app.wireOffsetCheckBox.Value=1;
            for ii=1:nModes
                %Read in the file combine_ii.
                FileName=['combine_' num2str(ii) '.dat'];
                set(handles.dataFileText,'String',FileName)
                handles=readDataFile(app, handles);
                %Set the mode number of this mode (-1,0,1,etc.)
                mdnum=TGMpropModeNumberSave(ii);
                app.targetOptimModeSpinner.Value=mdnum;
                handles=getModesForOptimization(app, handles);
                handles=drawMedia(app, handles);
                %Set the number of modes to ii (spinner)
                app.NomodesSpinner.Value=ii;
                numOptimModesEdit_Callback(app);
                %Set the mode number spinner to ii.
                app.modenoSpinner.Value=ii;
                handles=optimModeSeqNumEdit_Function(app, handles);
                %Implement save pushbutton.
                handles = saveTargetModeInfo(app,handles,ii);
                %break
            end
            guidata(hObject,handles)            

        end

        % Value changed function: FloqincwavesCheckBox
        function FloqIncWavesCallback(app, event)
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            if app.arrowsCheckBox.Value
                if app.FloqincwavesCheckBox.Value
                    if abs(handles.incAngDeg)>1.e-3
                        msgbox('incAngDeg must be 0 to use this option.')
                        app.FloqincwavesCheckBox.Value=0;
                    end
                end
                %handles=drawIncArrow(app,handles);
                handles=drawMedia(app, handles);
                guidata(hObject,handles);
            end
        end

        % Value changed function: targetOptimModeSpinner
        function targetOptimModeSpinnerCallback(app, event)
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            handles=getModesForOptimization(app, handles);
            handles=drawMedia(app, handles);
            guidata(hObject,handles)
            %value = app.targetOptimModeSpinner.Value;            
        end

        % Menu selected function: fileMenuReadOptFileItem
        function fileMenuReadOptFileItem_Callback(app, event)
            [FileName,PathName]=uigetfile('*.opt','Select the data file');
            figure(app.figure1); 
            %Because of bug in Matlab that causes the window to the back.
            if PathName~=0
                [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
                set(handles.dataFileText,'String',FileName)
                %handles=readDataFile(handles,0);
                handles=readOptFile(app, handles);
                guidata(hObject,handles)
            end            
        end

        % Value changing function: incWaveSlider1, incWaveSlider2, 
        % ...and 5 other components
        function incWaveSliderValueChanging(app, event)
            val=event.Value;
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            %It would be preferable to use tag to identify which slider was
            %chosen. But for some reason, if tag is defined for the slider,
            %this callback isn't triggered. This is not a general bug, only
            %in this program. So instead, use the Tooltip.
            %tag=event.Source.Tag;
            %incWaveNumberStr=tag(3);
            c=event.Source.Tooltip;  %cell array
            cc=c{1};      %String
            incWaveNumberStr=cc(1);  %Assuming first character of tooltip is what we want.
            incWaveNumber=str2double(incWaveNumberStr);
            switch incWaveNumber
                case 1
                    app.incWave1EditNumeric.Value=val;
                case 2
                    app.incWave2EditNumeric.Value=val;
                case 3
                    app.incWave3EditNumeric.Value=val;
                case 4
                    app.incWave4EditNumeric.Value=val;
                case 5
                    app.incWave5EditNumeric.Value=val;
                case 6
                    app.incWave6EditNumeric.Value=val;
                case 7
                    app.incWave7EditNumeric.Value=val;
            end
            %PincMag=handles.PincMag;
            handles.PincMag(incWaveNumber)=val;
            %
            incAngDegFloq=handles.incAngDegFloq;
            isPropagating=~isnan(incAngDegFloq);
            nPropagating=find(isPropagating);
            thetaIncDegDim=incAngDegFloq(nPropagating);
            nFloq=length(incAngDegFloq);
            handles=manipIncWaves(app,handles.PincMag,handles.PincPhaseDeg,thetaIncDegDim,nFloq,nPropagating,handles);
            nPropagatingWaves=length(thetaIncDegDim);
            handles=drawIncArrow(app, handles);
            guidata(hObject, handles);
        end

        % Value changed function: incWave1EditNumeric, 
        % ...and 6 other components
        function incWaveEditNumericCallback(app, event)
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            tag=event.Source.Tag;
            incWaveNumberStr=tag(3);
            incWaveNumber=str2double(incWaveNumberStr);
            switch incWaveNumber
                case 1
                    val=app.incWave1EditNumeric.Value;
                    app.incWaveSlider1.Value=val;
                case 2
                    val=app.incWave2EditNumeric.Value;
                    app.incWaveSlider2.Value=val;
                case 3
                    val=app.incWave3EditNumeric.Value;
                    app.incWaveSlider3.Value=val;
                case 4
                    val=app.incWave4EditNumeric.Value;
                    app.incWaveSlider4.Value=val;
                case 5
                    val=app.incWave5EditNumeric.Value;
                    app.incWaveSlider5.Value=val;
                case 6
                    val=app.incWave6EditNumeric.Value;
                    app.incWaveSlider6.Value=val;
                case 7
                    val=app.incWave7EditNumeric.Value;
                    app.incWaveSlider7.Value=val;
            end
            %PincMag=handles.PincMag;
            handles.PincMag(incWaveNumber)=val;
            %
            incAngDegFloq=handles.incAngDegFloq;
            isPropagating=~isnan(incAngDegFloq);
            nPropagating=find(isPropagating);
            thetaIncDegDim=incAngDegFloq(nPropagating);
            nFloq=length(incAngDegFloq);
            handles=manipIncWaves(app,handles.PincMag,handles.PincPhaseDeg,thetaIncDegDim,nFloq,nPropagating,handles);
            nPropagatingWaves=length(thetaIncDegDim);
            if app.FloqincwavesCheckBox.Value
                handles=drawMedia(app, handles);
                %handles=drawIncArrow(app, handles);
            end
            guidata(hObject, handles);
            
        end

        % Value changed function: incWave1EditPhase, incWave2EditPhase, 
        % ...and 5 other components
        function incWaveEditPhaseCallback(app, event)
            val=app.incWave1EditPhase.Value;
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            tag=event.Source.Tag;
            incWaveNumberStr=tag(3);
            incWaveNumber=str2double(incWaveNumberStr);
            val=event.Value;
            handles.PincPhaseDeg(incWaveNumber)=val;
            %
            incAngDegFloq=handles.incAngDegFloq;
            isPropagating=~isnan(incAngDegFloq);
            nPropagating=find(isPropagating);
            thetaIncDegDim=incAngDegFloq(nPropagating);
            nFloq=length(incAngDegFloq);
            handles=manipIncWaves(app,handles.PincMag,handles.PincPhaseDeg,thetaIncDegDim,nFloq,nPropagating,handles);
            nPropagatingWaves=length(thetaIncDegDim);
            if app.FloqincwavesCheckBox.Value
                handles=drawMedia(app, handles);
                %handles=drawIncArrow(app, handles);
            end
            guidata(hObject, handles);
            
        end

        % Value changed function: incWaveSlider1, incWaveSlider2, 
        % ...and 5 other components
        function incWaveSliderValueChanged(app, event)
            if app.FloqincwavesCheckBox.Value
                [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
                handles=drawMedia(app, handles);
                guidata(hObject,handles)
            end
        end

        % Menu selected function: ReadXMTfileMenu
        function ReadXMTfileMenuSelected(app, event)
            %Get the efficiencies and the phases.  First efficiencies.
            [FileName,PathName]=uigetfile('*.xmt','Select the transmitted waves file');
            figure(app.figure1); 
            %Because of bug in Matlab that causes the window to the back.
            if PathName~=0
                [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
                handles=readxmtFile(app,handles,FileName);
                guidata(hObject,handles)
            end
            
        end

        % Menu selected function: WriteXMTfileMenu
        function WriteXMTfileMenuSelected(app, event)
            %The XMT file contains the transmitted waves for each target
            %propagating target mode. This includes the efficiency and the
            %phase.  The phase is relative to the origin. Remember, the
            %origin will generally be different for surface that will
            %utilize these transmitted waves as incident waves on a
            %different surface.
            %Since this is in the optimization section, make sure an
            %optimization checkbox is set. We can set it back later.
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            wireOffsetOrigValue=app.wireOffsetCheckBox.Value;
            app.wireOffsetCheckBox.Value=1;
            nModes=app.NomodesSpinner.Value;
            app.modenoSpinner.Limits=[1,nModes];
            app.optimizeReflectionCheckBox.Value=0; %Make sure these are transmitted waves.
            mWaves=length(handles.modeNumberPropagating);
            PincMag=zeros(mWaves,nModes);
            PincPhaseDeg=zeros(mWaves,nModes);
            cosdInc=cosd(handles.incAngDeg);
            optFac=cosd(handles.incAngDegFloqDraw)/cosdInc;
            for n=1:nModes
                app.modenoSpinner.Value=n;
                handles=optimModeSeqNumEdit_Function(app, handles);
                %For each target mode, get the efficiency for each of the
                %propagating wave directions.The results for all these
                %directions are computed in a single call to drawMedia.
                app.targetOptimModeSpinner.Value=handles.modeNumberPropagating(1);
                handles=getModesForOptimization(app, handles);
                handles=drawMedia(app, handles);
                %The following is taken from fillInResults.
                tauFloqPropagating=handles.tauFloq(handles.nPropagating);
                tauOptimize=abs(tauFloqPropagating.');  %row vector to column vector
                eff=tauOptimize.*tauOptimize.*optFac;
                PincMag(:,n)=eff;
                phsDeg=angle(tauFloqPropagating)*180/pi;
                PincPhaseDeg(:,n)=phsDeg;
            end
            app.wireOffsetCheckBox.Value=wireOffsetOrigValue;
            %no guidata statement is employed because we are not interested
            %in changing parameters, only writing results.
            %
            %Write results to file out.xmt
            save('out.xmt','PincMag','PincPhaseDeg','-ascii')
        end

        % Value changed function: periodEditField
        function periodEditFieldCallback(app, event)
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            value = app.periodEditField.Value;
            handles.d=value;
            handles.HankelSum=sumHankel(app,handles.d,handles.ThetInDeg,handles.eps(1),handles.WL);
            for ii=1:handles.numMedia-1
                handles=mgGAMMA(app,handles,ii);
            end
            handles=drawMedia(app, handles);
            guidata(hObject,handles)
        end

        % Value changed function: RaviCheckBox
        function RaviCheckBoxCallback(app, event)
            value = app.RaviCheckBox.Value;
            if value
                if app.WkCheckBox.Value
                    msgbox('Ravi cannot be checked when Wk is checked.')
                    app.RaviCheckBox.Value=0;
                    return
                end
                msgbox('Make sure the period is properly defined.')
            else
                %empty the contents of T so that the optimization won't be
                %performed on T instead of on a mode. If you wnat T, enter
                %it manually.
                app.realT0Edit.Value=0;
                app.ImagT0Edit.Value=0;
            end
        end

        % Menu selected function: ChooseRavitxtfileMenu
        function ChooseRavitxtfileMenuCallback(app, event)
            [FileName,PathName]=uigetfile('*.txt','Select the CST transmission Ravi file');
            figure(app.figure1); 
            %Because of bug in Matlab that causes the window to the back.
            if PathName~=0
                app.TCoefFileEdit.Value=FileName;
            end

        end

        % Value changed function: WkCheckBox
        function WkCheckboxCallback(app, event)
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            value = app.WkCheckBox.Value;
            if value
                if app.RaviCheckBox.Value
                    msgbox('Wk cannot be checked when Ravi is checked.')
                    app.WkCheckBox.Value=0;
                    return
                end
                %empty the contents of T so that the optimization won't be
                %performed on T instead of on a mode. If you want T, enter
                %it manually or programmatically.
                app.realT0Edit.Value=0;
                app.ImagT0Edit.Value=0;
                msgbox('Make sure the period is properly defined.')
                %Define the switch case expressions in Wk2Z.
                switchCaseExpressions(app,handles.isWire);
                getWkmax(app);
            else
                %empty the contents of T so that the optimization won't be
                %performed on T instead of on a mode. If you want T, enter
                %it manually or programmatically.
                app.realT0Edit.Value=0;
                app.ImagT0Edit.Value=0;
                %Reset the TGM variables.
                TGmodeNumber=app.modenoSpinner.Value;
                handles = saveTargetModeInfo(app,handles,TGmodeNumber);
                %Define the new metal losses.
                handles=getRealZTilde(app, handles);
                handles=drawMedia(app, handles);
                guidata(hObject,handles);
            end
            if isfield(handles,'Wk')
                handles=rmfield(handles,'Wk');
                app.wireWkmilEdit.Value=' ';
                app.realZLabel.Text=' ';
                guidata(hObject,handles)
            end

        end

        % Value changed function: wireWkmilEdit
        function wireWkmilEditCallback(app, event)
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            
            % hObject    handle to wireDistImpedEdit (see GCBO)
            % eventdata  reserved - to be defined in a future version of MATLAB
            % handles    structure with handles and user data (see GUIDATA)
            
            % Hints: get(hObject,'String') returns contents of wireDistImpedEdit as text
            %        str2double(get(hObject,'String')) returns contents of wireDistImpedEdit as a double
            val=str2double(app.wireWkmilEdit.Value);
            isWk=app.WkCheckBox.Value;
            if isnan(val) || ~isWk
                if ~isWk
                    app.wireWkmilEdit.Value=' ';
                else
                    app.wireWkmilEdit.Value=num2str(handles.Wk(handles.mediumNumber));
                end
            else
                eta=376.730313668;
                handles.Wk(handles.mediumNumber)=val;
                Z=Wk2Z(app,handles.mediumNumber,val);
                imagZ=imag(Z);
                realZ=real(Z);
                app.wireDistImpedEdit.Value=num2str(imagZ);
                app.realZLabel.Text=num2str(realZ,3);
                handles.realZtilde=realZ*eta/handles.WL;
                handles.wireDistImped(handles.mediumNumber)=imagZ;
                handles=mgGAMMA(app, handles,handles.mediumNumber);
                handles=drawMedia(app, handles);
                guidata(hObject,handles)
            end
            
        end

        % Menu selected function: ReadoptfileHMSMenu
        function ReadoptfileHMSMenuCallback(app, event)
            [FileName,PathName]=uigetfile('*.opt','Select the data file');
            figure(app.figure1); 
            %Because of bug in Matlab that causes the window to the back.
            if PathName~=0
                [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
                set(handles.dataFileText,'String',FileName)
                %handles=readDataFile(handles,0);
                handles=readOptFileHMS(app, handles);
                guidata(hObject,handles)
            end            

        end

        % Value changed function: LUTCheckBox
        function LUTcheckboxCallback(app, event)
            value = app.LUTCheckBox.Value;
            if value
                if app.RaviCheckBox.Value
                    %The Ravi checkbox and the LUT checkbox cannot be
                    %checked at the same time because running optimization
                    %for ravi is different from running optimization for
                    %LUT.
                    app.RaviCheckBox.Value=0;
                end
                [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
                %Implement the "save" button in the "optimization for
                %target modes" frame. This is necessary here in order to
                %utilize the the "choose points" button in the LUTapp.
                TGmodeNumber=1;
                app.modenoSpinner.Value=TGmodeNumber;
                handles = saveTargetModeInfo(app,handles,TGmodeNumber);
                guidata(hObject,handles)
                %
                app.LUTCheckBox.Enable="off";
                frqGHz=str2double(app.lossFreqEdit.Value);
                dOverLambda=app.periodEditField.Value;
                totalThicknessOverLambda=str2double(app.optimTotalThicknessText.Text);
                %wmil=str2double(app.wireWidthMilEdit.Value); %wire width in mils
                app.LUTappRef=LUTapp(app,handles,app.LUTmaxtimes,...
                    app.LUTminEff,app.NLUTangles,app.LUTang1,app.LUTang2,...
                    app.NLUTmags,app.LUTtargetTMagnitude,...
                    app.LUTtargetTMagnitude2,frqGHz,dOverLambda,totalThicknessOverLambda);
            end    
            
        end

        % Value changed function: ImageCheckBox
        function ImageCheclboxCallback(app, event)
            value = app.ImageCheckBox.Value;
            if value
                app.childImages.Visible='on';
            else
                children=app.prismAxes.Children;
                app.childImages=findall(children,'type','image');
                app.childImages.Visible='off';
            end
        end

        % Value changed function: WkSymCheckBox
        function WkSymCallback(app, event)
            [hObject, eventdata, handles] = convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            if app.WkCheckBox.Value && isfield(handles,'Wk')
                %Set up "include in optimization" and others so that
                %optimization can be performed with only the upper
                %wires, and the lower ones will be gleaned from
                %symmetry. %Get the layer numbers to turn off or turn on.
                handles=WkSymFunc(app,handles);
                guidata(hObject,handles)
            end
        end

        % Value changed function: magT0Edit, phaseT0Edit
        function magPhaseT0EditCallback(app, event)
            T0mag = app.magT0Edit.Value;
            T0phase=app.phaseT0Edit.Value;
            reT0=T0mag*cosd(T0phase);
            imT0=T0mag*sind(T0phase);
            app.realT0Edit.Value=reT0;
            app.ImagT0Edit.Value=imT0;

        end

        % Button pushed function: lsqnonlin2PushButton
        function lsqnonlin2PushButton_Callback(app, event)
            % --- Executes on button press in lsqnonlinPushButton.
            
            % Create GUIDE-style callback args - Added by Migration Tool
            [hObject,eventdata,handles]=convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            handles=lsqnonlin2PushButton_Function(app,handles,hObject);
            guidata(hObject,handles)
            
        end

        % Button pushed function: ExhaustiveButton
        function exhaustivePushbuttonCallback(app, event)
            [hObject,eventdata,handles]=convertToGUIDECallbackArguments(app, event); %#ok<ASGLU>
            WkExhaustiveSearch(app,handles);            
        end

        % Close request function: figure1
        function figure1CloseRequest(app, event)
            delete(app.LUTappRef)
            delete(app)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create figure1 and hide until all components are created
            app.figure1 = uifigure('Visible', 'off');
            colormap(app.figure1, 'parula');
            app.figure1.Position = [520 -96 1110 909];
            app.figure1.Name = 'layers';
            app.figure1.Resize = 'off';
            app.figure1.CloseRequestFcn = createCallbackFcn(app, @figure1CloseRequest, true);
            app.figure1.Tag = 'figure1';

            % Create Untitled_1
            app.Untitled_1 = uimenu(app.figure1);
            app.Untitled_1.Text = 'File';
            app.Untitled_1.Tag = 'Untitled_1';

            % Create fileMenuReadDataFileItem
            app.fileMenuReadDataFileItem = uimenu(app.Untitled_1);
            app.fileMenuReadDataFileItem.MenuSelectedFcn = createCallbackFcn(app, @fileMenuReadDataFileItem_Callback, true);
            app.fileMenuReadDataFileItem.Text = 'Read data file';
            app.fileMenuReadDataFileItem.Tag = 'fileMenuReadDataFileItem';

            % Create fileMenuWriteDataFileItem
            app.fileMenuWriteDataFileItem = uimenu(app.Untitled_1);
            app.fileMenuWriteDataFileItem.MenuSelectedFcn = createCallbackFcn(app, @fileMenuWriteDataFileItem_Callback, true);
            app.fileMenuWriteDataFileItem.Text = 'Write data file';
            app.fileMenuWriteDataFileItem.Tag = 'fileMenuWriteDataFileItem';

            % Create fileMenuReadGamaFileItem
            app.fileMenuReadGamaFileItem = uimenu(app.Untitled_1);
            app.fileMenuReadGamaFileItem.MenuSelectedFcn = createCallbackFcn(app, @fileMenuReadGamaFileItem_Callback, true);
            app.fileMenuReadGamaFileItem.Text = 'Read Gama file';
            app.fileMenuReadGamaFileItem.Tag = 'fileMenuReadGamaFileItem';

            % Create fileMenuReadOptFileItem
            app.fileMenuReadOptFileItem = uimenu(app.Untitled_1);
            app.fileMenuReadOptFileItem.MenuSelectedFcn = createCallbackFcn(app, @fileMenuReadOptFileItem_Callback, true);
            app.fileMenuReadOptFileItem.Tooltip = {'The .opt file contains results from optimization calculations. Use this menu item when the file contains results for different modes.'};
            app.fileMenuReadOptFileItem.Text = 'Read opt file (modes)';

            % Create ReadoptfileHMSMenu
            app.ReadoptfileHMSMenu = uimenu(app.Untitled_1);
            app.ReadoptfileHMSMenu.MenuSelectedFcn = createCallbackFcn(app, @ReadoptfileHMSMenuCallback, true);
            app.ReadoptfileHMSMenu.Tooltip = {'The .opt file contains results from optimization calculations. Use this menu item when the file contains results for different meta-atoms of an HMS...'};
            app.ReadoptfileHMSMenu.Text = 'Read opt file (HMS)';

            % Create ReadXMTfileMenu
            app.ReadXMTfileMenu = uimenu(app.Untitled_1);
            app.ReadXMTfileMenu.MenuSelectedFcn = createCallbackFcn(app, @ReadXMTfileMenuSelected, true);
            app.ReadXMTfileMenu.Text = 'Read XMT file';

            % Create WriteXMTfileMenu
            app.WriteXMTfileMenu = uimenu(app.Untitled_1);
            app.WriteXMTfileMenu.MenuSelectedFcn = createCallbackFcn(app, @WriteXMTfileMenuSelected, true);
            app.WriteXMTfileMenu.Text = 'Write XMT file';

            % Create ChooseRavitxtfileMenu
            app.ChooseRavitxtfileMenu = uimenu(app.Untitled_1);
            app.ChooseRavitxtfileMenu.MenuSelectedFcn = createCallbackFcn(app, @ChooseRavitxtfileMenuCallback, true);
            app.ChooseRavitxtfileMenu.Text = 'Choose Ravi txt file';

            % Create Untitled
            app.Untitled = uimenu(app.figure1);
            app.Untitled.Text = 'Edit';
            app.Untitled.Tag = 'Untitled';

            % Create EditMenuCopyGraphToFigureItem
            app.EditMenuCopyGraphToFigureItem = uimenu(app.Untitled);
            app.EditMenuCopyGraphToFigureItem.MenuSelectedFcn = createCallbackFcn(app, @EditMenuCopyGraphToFigureItem_Callback, true);
            app.EditMenuCopyGraphToFigureItem.Text = 'Copy graph to new figure';
            app.EditMenuCopyGraphToFigureItem.Tag = 'EditMenuCopyGraphToFigureItem';

            % Create EditMenuOpenbffileItem
            app.EditMenuOpenbffileItem = uimenu(app.Untitled);
            app.EditMenuOpenbffileItem.MenuSelectedFcn = createCallbackFcn(app, @EditMenuOpenbffileItem_Callback, true);
            app.EditMenuOpenbffileItem.Text = 'Open bf file for plotting';
            app.EditMenuOpenbffileItem.Tag = 'EditMenuOpenbffileItem';

            % Create prismAxes
            app.prismAxes = uiaxes(app.figure1);
            app.prismAxes.FontSize = 13.3333333333333;
            app.prismAxes.NextPlot = 'replace';
            app.prismAxes.ButtonDownFcn = createCallbackFcn(app, @prismAxes_ButtonDownFcn, true);
            app.prismAxes.Tag = 'prismAxes';
            app.prismAxes.Position = [355 392 432 479];

            % Create frequencyButtonGroup
            app.frequencyButtonGroup = uibuttongroup(app.figure1);
            app.frequencyButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @frequencyButtonGroup_SelectionChangedFcn, true);
            app.frequencyButtonGroup.Tag = 'frequencyButtonGroup';
            app.frequencyButtonGroup.FontSize = 10.6666666666667;
            app.frequencyButtonGroup.Position = [9 841 177 58];

            % Create freqGHzEdit
            app.freqGHzEdit = uieditfield(app.frequencyButtonGroup, 'text');
            app.freqGHzEdit.ValueChangedFcn = createCallbackFcn(app, @freqGHzEdit_Callback, true);
            app.freqGHzEdit.Tag = 'freqGHzEdit';
            app.freqGHzEdit.HorizontalAlignment = 'center';
            app.freqGHzEdit.FontSize = 10.6666666666667;
            app.freqGHzEdit.Position = [53 31 51 22];
            app.freqGHzEdit.Value = '0.2997925';

            % Create text10
            app.text10 = uilabel(app.frequencyButtonGroup);
            app.text10.Tag = 'text10';
            app.text10.HorizontalAlignment = 'center';
            app.text10.VerticalAlignment = 'top';
            app.text10.WordWrap = 'on';
            app.text10.FontSize = 10.6666666666667;
            app.text10.Position = [9 9 26 15];
            app.text10.Text = 'WL=';

            % Create waveLengthText
            app.waveLengthText = uilabel(app.frequencyButtonGroup);
            app.waveLengthText.Tag = 'waveLengthText';
            app.waveLengthText.HorizontalAlignment = 'center';
            app.waveLengthText.VerticalAlignment = 'top';
            app.waveLengthText.WordWrap = 'on';
            app.waveLengthText.FontSize = 10.6666666666667;
            app.waveLengthText.Position = [37 9 48 15];
            app.waveLengthText.Text = '1';

            % Create waveLengthUnitsText
            app.waveLengthUnitsText = uilabel(app.frequencyButtonGroup);
            app.waveLengthUnitsText.Tag = 'waveLengthUnitsText';
            app.waveLengthUnitsText.HorizontalAlignment = 'center';
            app.waveLengthUnitsText.VerticalAlignment = 'top';
            app.waveLengthUnitsText.WordWrap = 'on';
            app.waveLengthUnitsText.FontSize = 10.6666666666667;
            app.waveLengthUnitsText.Position = [89 10 25 15];
            app.waveLengthUnitsText.Text = 'm';

            % Create ghzRadioButton
            app.ghzRadioButton = uiradiobutton(app.frequencyButtonGroup);
            app.ghzRadioButton.Tag = 'ghzRadioButton';
            app.ghzRadioButton.Text = 'GHz';
            app.ghzRadioButton.FontSize = 10.6666666666667;
            app.ghzRadioButton.Position = [119 30 49 23];
            app.ghzRadioButton.Value = true;

            % Create thzRadioButton
            app.thzRadioButton = uiradiobutton(app.frequencyButtonGroup);
            app.thzRadioButton.Tag = 'thzRadioButton';
            app.thzRadioButton.Text = 'THz';
            app.thzRadioButton.FontSize = 10.6666666666667;
            app.thzRadioButton.Position = [119 6 47 23];

            % Create text6
            app.text6 = uilabel(app.figure1);
            app.text6.Tag = 'text6';
            app.text6.HorizontalAlignment = 'center';
            app.text6.VerticalAlignment = 'top';
            app.text6.WordWrap = 'on';
            app.text6.FontSize = 10.6666666666667;
            app.text6.Position = [14 871.000000000001 48 21.9999999999998];
            app.text6.Text = 'freq=';

            % Create mediumPanel
            app.mediumPanel = uibuttongroup(app.figure1);
            app.mediumPanel.SelectionChangedFcn = createCallbackFcn(app, @mediumPanel_SelectionChangeFcn, true);
            app.mediumPanel.Title = 'medium';
            app.mediumPanel.Tag = 'mediumPanel';
            app.mediumPanel.FontSize = 16;
            app.mediumPanel.Position = [15 220 347 360];

            % Create text18
            app.text18 = uilabel(app.mediumPanel);
            app.text18.Tag = 'text18';
            app.text18.HorizontalAlignment = 'center';
            app.text18.VerticalAlignment = 'top';
            app.text18.WordWrap = 'on';
            app.text18.FontSize = 16;
            app.text18.Position = [15 304 28 26.0000000000001];
            app.text18.Text = 'n=';

            % Create nText
            app.nText = uieditfield(app.mediumPanel, 'text');
            app.nText.ValueChangedFcn = createCallbackFcn(app, @nText_Callback, true);
            app.nText.Tag = 'nText';
            app.nText.HorizontalAlignment = 'center';
            app.nText.FontSize = 16;
            app.nText.Position = [42 304 46 26];
            app.nText.Value = '4';

            % Create isBotAirCheckBox
            app.isBotAirCheckBox = uicheckbox(app.mediumPanel);
            app.isBotAirCheckBox.ValueChangedFcn = createCallbackFcn(app, @isBotAirCheckBox_Callback, true);
            app.isBotAirCheckBox.Tag = 'isBotAirCheckBox';
            app.isBotAirCheckBox.Tooltip = 'The bottom medium is air.';
            app.isBotAirCheckBox.Text = 'Bottom air';
            app.isBotAirCheckBox.FontSize = 10.6666666666667;
            app.isBotAirCheckBox.Position = [99 305 87 32];
            app.isBotAirCheckBox.Value = true;

            % Create epsEdit
            app.epsEdit = uieditfield(app.mediumPanel, 'text');
            app.epsEdit.ValueChangedFcn = createCallbackFcn(app, @epsEdit_Callback, true);
            app.epsEdit.Tag = 'epsEdit';
            app.epsEdit.HorizontalAlignment = 'center';
            app.epsEdit.FontSize = 16;
            app.epsEdit.Tooltip = 'The relative permittivity in the non-air medium.  Only used when eps=mu checkbox is not checked.';
            app.epsEdit.Position = [53 271 39 24.9999999999999];
            app.epsEdit.Value = '4';

            % Create epsText
            app.epsText = uilabel(app.mediumPanel);
            app.epsText.Tag = 'epsText';
            app.epsText.HorizontalAlignment = 'center';
            app.epsText.VerticalAlignment = 'top';
            app.epsText.WordWrap = 'on';
            app.epsText.FontSize = 16;
            app.epsText.Position = [6 273 37 22];
            app.epsText.Text = 'eps=';

            % Create epsEqualMuRadioButton
            app.epsEqualMuRadioButton = uiradiobutton(app.mediumPanel);
            app.epsEqualMuRadioButton.Tag = 'epsEqualMuRadioButton';
            app.epsEqualMuRadioButton.Enable = 'off';
            app.epsEqualMuRadioButton.Tooltip = 'Set eps=mu in the material.  Each will equal the index of refraction.';
            app.epsEqualMuRadioButton.Text = 'eps=mu';
            app.epsEqualMuRadioButton.FontSize = 16;
            app.epsEqualMuRadioButton.Position = [100 292 77 23];

            % Create muEqual1RadioButton
            app.muEqual1RadioButton = uiradiobutton(app.mediumPanel);
            app.muEqual1RadioButton.Tag = 'muEqual1RadioButton';
            app.muEqual1RadioButton.Tooltip = 'Set mu=1 in material.  The eps will equal refraction index squared.';
            app.muEqual1RadioButton.Text = 'mu=1';
            app.muEqual1RadioButton.FontSize = 16;
            app.muEqual1RadioButton.Position = [104 258 75 23];
            app.muEqual1RadioButton.Value = true;

            % Create otherRadioButton
            app.otherRadioButton = uiradiobutton(app.mediumPanel);
            app.otherRadioButton.Tag = 'otherRadioButton';
            app.otherRadioButton.Enable = 'off';
            app.otherRadioButton.Tooltip = 'The value of eps will be that given in the eps edit box.  ';
            app.otherRadioButton.Text = 'Other';
            app.otherRadioButton.FontSize = 16;
            app.otherRadioButton.Position = [104 234 87 23];

            % Create text73
            app.text73 = uilabel(app.mediumPanel);
            app.text73.Tag = 'text73';
            app.text73.HorizontalAlignment = 'center';
            app.text73.VerticalAlignment = 'top';
            app.text73.WordWrap = 'on';
            app.text73.FontSize = 16;
            app.text73.Position = [8 192 98 22];
            app.text73.Text = 'thickness/WL';

            % Create thickEdit
            app.thickEdit = uieditfield(app.mediumPanel, 'text');
            app.thickEdit.ValueChangedFcn = createCallbackFcn(app, @thickEdit_Callback, true);
            app.thickEdit.Tag = 'thickEdit';
            app.thickEdit.HorizontalAlignment = 'center';
            app.thickEdit.FontSize = 16;
            app.thickEdit.Tooltip = 'Thickness of the layer relative to the wavelength.';
            app.thickEdit.Position = [109 192 39 25];
            app.thickEdit.Value = '.01';

            % Create text77
            app.text77 = uilabel(app.mediumPanel);
            app.text77.Tag = 'text77';
            app.text77.HorizontalAlignment = 'center';
            app.text77.VerticalAlignment = 'top';
            app.text77.WordWrap = 'on';
            app.text77.FontSize = 16;
            app.text77.Position = [165 191 93 22];
            app.text77.Text = 'conductivity=';

            % Create conductivityEdit
            app.conductivityEdit = uieditfield(app.mediumPanel, 'text');
            app.conductivityEdit.ValueChangedFcn = createCallbackFcn(app, @conductivityEdit_Callback, true);
            app.conductivityEdit.Tag = 'conductivityEdit';
            app.conductivityEdit.HorizontalAlignment = 'center';
            app.conductivityEdit.FontSize = 16;
            app.conductivityEdit.Tooltip = 'The conductivity of medium when top medium is air.';
            app.conductivityEdit.Position = [265 189 64 24.9999999999999];
            app.conductivityEdit.Value = '0';

            % Create includeInOptimizationCheckBox
            app.includeInOptimizationCheckBox = uicheckbox(app.mediumPanel);
            app.includeInOptimizationCheckBox.ValueChangedFcn = createCallbackFcn(app, @includeInOptimizationCheckBox_Callback, true);
            app.includeInOptimizationCheckBox.Tag = 'includeInOptimizationCheckBox';
            app.includeInOptimizationCheckBox.Tooltip = 'If checked, include this medium in optimization';
            app.includeInOptimizationCheckBox.Text = 'incl. optim.';
            app.includeInOptimizationCheckBox.FontSize = 10.6666666666667;
            app.includeInOptimizationCheckBox.Position = [8 242 78 27.0000000000001];
            app.includeInOptimizationCheckBox.Value = true;

            % Create wiresButtonGroup
            app.wiresButtonGroup = uibuttongroup(app.mediumPanel);
            app.wiresButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @wiresButtonGroup_SelectionChangedFcn, true);
            app.wiresButtonGroup.Title = 'Metagrating wires';
            app.wiresButtonGroup.Tag = 'wiresButtonGroup';
            app.wiresButtonGroup.FontSize = 16;
            app.wiresButtonGroup.Position = [11 11 326 177];

            % Create isWireCheckBox
            app.isWireCheckBox = uicheckbox(app.wiresButtonGroup);
            app.isWireCheckBox.ValueChangedFcn = createCallbackFcn(app, @isWireCheckBox_Callback, true);
            app.isWireCheckBox.Tag = 'isWireCheckBox';
            app.isWireCheckBox.Tooltip = 'If checked, the current layer contains wires.';
            app.isWireCheckBox.Text = 'wires';
            app.isWireCheckBox.FontSize = 16;
            app.isWireCheckBox.Position = [8 122 66 31];

            % Create text115
            app.text115 = uilabel(app.wiresButtonGroup);
            app.text115.Tag = 'text115';
            app.text115.HorizontalAlignment = 'center';
            app.text115.VerticalAlignment = 'top';
            app.text115.WordWrap = 'on';
            app.text115.FontSize = 16;
            app.text115.Position = [143 122 63 22];
            app.text115.Text = 'imped=';

            % Create wireDistImpedEdit
            app.wireDistImpedEdit = uieditfield(app.wiresButtonGroup, 'text');
            app.wireDistImpedEdit.ValueChangedFcn = createCallbackFcn(app, @wireDistImpedEdit_Callback, true);
            app.wireDistImpedEdit.Tag = 'wireDistImpedEdit';
            app.wireDistImpedEdit.HorizontalAlignment = 'center';
            app.wireDistImpedEdit.FontSize = 16;
            app.wireDistImpedEdit.Tooltip = {'The imagninary part of the wire impedance per unit length of the wire.'};
            app.wireDistImpedEdit.Position = [264 121 51 22.0000000000001];
            app.wireDistImpedEdit.Value = '0';

            % Create text116
            app.text116 = uilabel(app.wiresButtonGroup);
            app.text116.Tag = 'text116';
            app.text116.HorizontalAlignment = 'center';
            app.text116.VerticalAlignment = 'top';
            app.text116.WordWrap = 'on';
            app.text116.FontSize = 16;
            app.text116.Position = [167 67 101 22];
            app.text116.Text = 'Horiz. Offset=';

            % Create wireHorizOffsetEdit
            app.wireHorizOffsetEdit = uieditfield(app.wiresButtonGroup, 'text');
            app.wireHorizOffsetEdit.ValueChangedFcn = createCallbackFcn(app, @wireHorizOffsetEdit_Callback, true);
            app.wireHorizOffsetEdit.Tag = 'wireHorizOffsetEdit';
            app.wireHorizOffsetEdit.HorizontalAlignment = 'center';
            app.wireHorizOffsetEdit.FontSize = 16;
            app.wireHorizOffsetEdit.Tooltip = 'Horizontal offset of wire (fraction of period).';
            app.wireHorizOffsetEdit.Position = [265 68 51 22];
            app.wireHorizOffsetEdit.Value = '0';

            % Create text117
            app.text117 = uilabel(app.wiresButtonGroup);
            app.text117.Tag = 'text117';
            app.text117.HorizontalAlignment = 'center';
            app.text117.VerticalAlignment = 'top';
            app.text117.WordWrap = 'on';
            app.text117.FontSize = 10;
            app.text117.Position = [237 0 53 25];
            app.text117.Text = 'wire width=';

            % Create wireStripWidthEdit
            app.wireStripWidthEdit = uieditfield(app.wiresButtonGroup, 'text');
            app.wireStripWidthEdit.ValueChangedFcn = createCallbackFcn(app, @wireStripWidthEdit_Callback, true);
            app.wireStripWidthEdit.Tag = 'wireStripWidthEdit';
            app.wireStripWidthEdit.HorizontalAlignment = 'center';
            app.wireStripWidthEdit.FontSize = 10;
            app.wireStripWidthEdit.Tooltip = 'Width of the strip.';
            app.wireStripWidthEdit.Position = [293 10 25 15];
            app.wireStripWidthEdit.Value = '0';

            % Create mirrorWiresPushButton
            app.mirrorWiresPushButton = uibutton(app.wiresButtonGroup, 'push');
            app.mirrorWiresPushButton.ButtonPushedFcn = createCallbackFcn(app, @mirrorWiresPushButton_Callback, true);
            app.mirrorWiresPushButton.Tag = 'mirrorWiresPushButton';
            app.mirrorWiresPushButton.FontSize = 10.6666666666667;
            app.mirrorWiresPushButton.Tooltip = 'Mirror the wires laterally.';
            app.mirrorWiresPushButton.Position = [4 9 68 22];
            app.mirrorWiresPushButton.Text = 'mirror wires';

            % Create normalizeLocPushButton
            app.normalizeLocPushButton = uibutton(app.wiresButtonGroup, 'push');
            app.normalizeLocPushButton.ButtonPushedFcn = createCallbackFcn(app, @normalizeLocPushButton_Callback, true);
            app.normalizeLocPushButton.Tag = 'normalizeLocPushButton';
            app.normalizeLocPushButton.FontSize = 10.6666666666667;
            app.normalizeLocPushButton.Tooltip = 'Mirror the wires laterally.';
            app.normalizeLocPushButton.Position = [74 9 80 22];
            app.normalizeLocPushButton.Text = 'normalize loc.';

            % Create reciprocalPushButton
            app.reciprocalPushButton = uibutton(app.wiresButtonGroup, 'push');
            app.reciprocalPushButton.ButtonPushedFcn = createCallbackFcn(app, @reciprocalPushButton_Callback, true);
            app.reciprocalPushButton.Tag = 'reciprocalPushButton';
            app.reciprocalPushButton.FontSize = 10.6666666666667;
            app.reciprocalPushButton.Tooltip = 'Reverse order of the layers and incidence-output directions';
            app.reciprocalPushButton.Position = [157 9 75 23];
            app.reciprocalPushButton.Text = 'reciprocal';

            % Create copperWireRadioButton
            app.copperWireRadioButton = uiradiobutton(app.wiresButtonGroup);
            app.copperWireRadioButton.Tag = 'copperWireRadioButton';
            app.copperWireRadioButton.Tooltip = 'Etched wires will be copper (i.e. lossy).';
            app.copperWireRadioButton.Text = 'Copper';
            app.copperWireRadioButton.FontSize = 16;
            app.copperWireRadioButton.Position = [69 129 82 23];

            % Create PECWiresRadioButton
            app.PECWiresRadioButton = uiradiobutton(app.wiresButtonGroup);
            app.PECWiresRadioButton.Tag = 'PECWiresRadioButton';
            app.PECWiresRadioButton.Tooltip = 'Etched wires will be PEC (i.e. not lossy).';
            app.PECWiresRadioButton.Text = 'PEC';
            app.PECWiresRadioButton.FontSize = 16;
            app.PECWiresRadioButton.Position = [69 85 61 23];
            app.PECWiresRadioButton.Value = true;

            % Create text129
            app.text129 = uilabel(app.wiresButtonGroup);
            app.text129.Tag = 'text129';
            app.text129.HorizontalAlignment = 'center';
            app.text129.VerticalAlignment = 'top';
            app.text129.WordWrap = 'on';
            app.text129.FontSize = 10.6666666666667;
            app.text129.Position = [11 64 45 14];
            app.text129.Text = 'loss freq';

            % Create lossFreqEdit
            app.lossFreqEdit = uieditfield(app.wiresButtonGroup, 'text');
            app.lossFreqEdit.ValueChangedFcn = createCallbackFcn(app, @lossFreqEdit_Callback, true);
            app.lossFreqEdit.Tag = 'lossFreqEdit';
            app.lossFreqEdit.HorizontalAlignment = 'center';
            app.lossFreqEdit.FontSize = 16;
            app.lossFreqEdit.Tooltip = 'The frequency for conductor loss calculations (GHz)';
            app.lossFreqEdit.Position = [62 58 45 22];
            app.lossFreqEdit.Value = '20';

            % Create text130
            app.text130 = uilabel(app.wiresButtonGroup);
            app.text130.Tag = 'text130';
            app.text130.HorizontalAlignment = 'center';
            app.text130.VerticalAlignment = 'top';
            app.text130.WordWrap = 'on';
            app.text130.FontSize = 10.6666666666667;
            app.text130.Position = [115 64 31 14];
            app.text130.Text = 'GHz';

            % Create text146
            app.text146 = uilabel(app.wiresButtonGroup);
            app.text146.Tag = 'text146';
            app.text146.HorizontalAlignment = 'center';
            app.text146.VerticalAlignment = 'top';
            app.text146.WordWrap = 'on';
            app.text146.FontSize = 10.6666666666667;
            app.text146.Position = [8 37 53 14];
            app.text146.Text = 'wire width';

            % Create wireWidthMilEdit
            app.wireWidthMilEdit = uieditfield(app.wiresButtonGroup, 'text');
            app.wireWidthMilEdit.ValueChangedFcn = createCallbackFcn(app, @wireWidthMilEdit_Callback, true);
            app.wireWidthMilEdit.Tag = 'wireWidthMilEdit';
            app.wireWidthMilEdit.HorizontalAlignment = 'center';
            app.wireWidthMilEdit.FontSize = 16;
            app.wireWidthMilEdit.Tooltip = 'The width of the wires in mil (thousandths of an inch)';
            app.wireWidthMilEdit.Position = [60 33 45 22];
            app.wireWidthMilEdit.Value = '4';

            % Create text147
            app.text147 = uilabel(app.wiresButtonGroup);
            app.text147.Tag = 'text147';
            app.text147.HorizontalAlignment = 'center';
            app.text147.VerticalAlignment = 'top';
            app.text147.WordWrap = 'on';
            app.text147.FontSize = 10.6666666666667;
            app.text147.Position = [113 39 31 14];
            app.text147.Text = 'mil';

            % Create aluminumWireRadioButton
            app.aluminumWireRadioButton = uiradiobutton(app.wiresButtonGroup);
            app.aluminumWireRadioButton.Tag = 'aluminumWireRadioButton';
            app.aluminumWireRadioButton.Tooltip = 'Etched wires will be aluminum (i.e. lossy).';
            app.aluminumWireRadioButton.Text = 'Aluminum';
            app.aluminumWireRadioButton.FontSize = 16;
            app.aluminumWireRadioButton.Position = [69 107 97 23];

            % Create combineButton
            app.combineButton = uibutton(app.wiresButtonGroup, 'push');
            app.combineButton.ButtonPushedFcn = createCallbackFcn(app, @combineWires_Callback, true);
            app.combineButton.Tooltip = {'Combine the wires represented by the medium numbers in the next two edit fields. These wires must be at the same level. If they are defined for more than one mode, then the combinations will be implemented for all modes.'};
            app.combineButton.Position = [157 36 55 23];
            app.combineButton.Text = 'combine';

            % Create wire1CombineEdit
            app.wire1CombineEdit = uieditfield(app.wiresButtonGroup, 'numeric');
            app.wire1CombineEdit.Tooltip = {'The medium number of a wire to be combined with another.'};
            app.wire1CombineEdit.Position = [223 37 32 22];

            % Create wire2CombineEdit
            app.wire2CombineEdit = uieditfield(app.wiresButtonGroup, 'numeric');
            app.wire2CombineEdit.Tooltip = {'The medium number of a wire to be combined with another.'};
            app.wire2CombineEdit.Position = [271 36 32 22];

            % Create text115_2
            app.text115_2 = uilabel(app.wiresButtonGroup);
            app.text115_2.Tag = 'text115';
            app.text115_2.HorizontalAlignment = 'center';
            app.text115_2.VerticalAlignment = 'top';
            app.text115_2.WordWrap = 'on';
            app.text115_2.FontSize = 16;
            app.text115_2.Position = [191 97 71 22];
            app.text115_2.Text = 'Wk(mil)=';

            % Create wireWkmilEdit
            app.wireWkmilEdit = uieditfield(app.wiresButtonGroup, 'text');
            app.wireWkmilEdit.ValueChangedFcn = createCallbackFcn(app, @wireWkmilEditCallback, true);
            app.wireWkmilEdit.Tag = 'wireDistImpedEdit';
            app.wireWkmilEdit.HorizontalAlignment = 'center';
            app.wireWkmilEdit.FontSize = 16;
            app.wireWkmilEdit.Tooltip = {'The width Wk of the capacitor plate in mils, that represents this wire. It is only defined after running optimization when th;e Wk checkbox is checked.'};
            app.wireWkmilEdit.Position = [264 93 51 22.0000000000001];
            app.wireWkmilEdit.Value = '0';

            % Create realZLabel
            app.realZLabel = uilabel(app.wiresButtonGroup);
            app.realZLabel.HorizontalAlignment = 'center';
            app.realZLabel.FontSize = 16;
            app.realZLabel.Tooltip = {'Real part of the wire impedance. Used when Wk is checked.'};
            app.realZLabel.Position = [199 120 64 22];
            app.realZLabel.Text = '0';

            % Create mediumTypeButtonGroup
            app.mediumTypeButtonGroup = uibuttongroup(app.mediumPanel);
            app.mediumTypeButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @mediumTypeButtonGroup_SelectionChangedFcn, true);
            app.mediumTypeButtonGroup.Title = 'Type';
            app.mediumTypeButtonGroup.Tag = 'mediumTypeButtonGroup';
            app.mediumTypeButtonGroup.FontSize = 10.6666666666667;
            app.mediumTypeButtonGroup.Position = [185 241 151 101];

            % Create wireTypeRadioButton
            app.wireTypeRadioButton = uiradiobutton(app.mediumTypeButtonGroup);
            app.wireTypeRadioButton.Tag = 'wireTypeRadioButton';
            app.wireTypeRadioButton.Text = 'wire';
            app.wireTypeRadioButton.FontSize = 10.6666666666667;
            app.wireTypeRadioButton.Position = [87 39 49 23];

            % Create dielectricTypeRadioButton
            app.dielectricTypeRadioButton = uiradiobutton(app.mediumTypeButtonGroup);
            app.dielectricTypeRadioButton.Tag = 'dielectricTypeRadioButton';
            app.dielectricTypeRadioButton.Text = 'dielectric';
            app.dielectricTypeRadioButton.FontSize = 10.6666666666667;
            app.dielectricTypeRadioButton.Position = [6 62 72 23];

            % Create airGapTypeRadioButton
            app.airGapTypeRadioButton = uiradiobutton(app.mediumTypeButtonGroup);
            app.airGapTypeRadioButton.Tag = 'airGapTypeRadioButton';
            app.airGapTypeRadioButton.Tooltip = 'Current medium is air gap';
            app.airGapTypeRadioButton.Text = 'air gap';
            app.airGapTypeRadioButton.FontSize = 10.6666666666667;
            app.airGapTypeRadioButton.Position = [84 63 61 23];

            % Create virtualTypeRadioButton
            app.virtualTypeRadioButton = uiradiobutton(app.mediumTypeButtonGroup);
            app.virtualTypeRadioButton.Tag = 'virtualTypeRadioButton';
            app.virtualTypeRadioButton.Tooltip = 'Current medium is virtual 0 thickness.';
            app.virtualTypeRadioButton.Text = 'virtual';
            app.virtualTypeRadioButton.FontSize = 10.6666666666667;
            app.virtualTypeRadioButton.Position = [7 37 57 23];
            app.virtualTypeRadioButton.Value = true;

            % Create cloneAllPushButton
            app.cloneAllPushButton = uibutton(app.mediumTypeButtonGroup, 'push');
            app.cloneAllPushButton.ButtonPushedFcn = createCallbackFcn(app, @cloneAllPushButton_Callback, true);
            app.cloneAllPushButton.Tag = 'cloneAllPushButton';
            app.cloneAllPushButton.FontSize = 10.6666666666667;
            app.cloneAllPushButton.Tooltip = 'Clone all media of this type with the current values defined for the current medium. This does not include "virtual" and does not include wire impedance and offset. ';
            app.cloneAllPushButton.Position = [31 11 81 22];
            app.cloneAllPushButton.Text = 'Clone all';

            % Create text100
            app.text100 = uilabel(app.mediumPanel);
            app.text100.Tag = 'text100';
            app.text100.HorizontalAlignment = 'center';
            app.text100.VerticalAlignment = 'top';
            app.text100.WordWrap = 'on';
            app.text100.FontSize = 10.6666666666667;
            app.text100.Position = [10 217 71 14];
            app.text100.Text = 'total thickness';

            % Create optimTotalThicknessText
            app.optimTotalThicknessText = uilabel(app.mediumPanel);
            app.optimTotalThicknessText.Tag = 'optimTotalThicknessText';
            app.optimTotalThicknessText.HorizontalAlignment = 'center';
            app.optimTotalThicknessText.VerticalAlignment = 'top';
            app.optimTotalThicknessText.WordWrap = 'on';
            app.optimTotalThicknessText.FontSize = 10.6666666666667;
            app.optimTotalThicknessText.Tooltip = 'Total thickness of all layers for obtaining this efficiency.';
            app.optimTotalThicknessText.Position = [80 213 41 18];
            app.optimTotalThicknessText.Text = '1';

            % Create tiltAnglePanel
            app.tiltAnglePanel = uipanel(app.figure1);
            app.tiltAnglePanel.Title = 'tilt angle (deg)';
            app.tiltAnglePanel.Tag = 'tiltAnglePanel';
            app.tiltAnglePanel.FontSize = 10.6666666666667;
            app.tiltAnglePanel.Position = [5 612 211 62];

            % Create Slider
            app.Slider = uislider(app.tiltAnglePanel);
            app.Slider.ValueChangingFcn = createCallbackFcn(app, @tiltAngleSliderValueChanging, true);
            app.Slider.Position = [27 34 150 3];

            % Create tiltAngleEditNumeric
            app.tiltAngleEditNumeric = uieditfield(app.tiltAnglePanel, 'numeric');
            app.tiltAngleEditNumeric.ValueChangedFcn = createCallbackFcn(app, @tiltAngleEditNumeric_Callback, true);
            app.tiltAngleEditNumeric.Position = [127 37 52 21];

            % Create sliderStepUpPushButton
            app.sliderStepUpPushButton = uibutton(app.tiltAnglePanel, 'push');
            app.sliderStepUpPushButton.ButtonPushedFcn = createCallbackFcn(app, @sliderStepUpPushButton_Callback, true);
            app.sliderStepUpPushButton.FontWeight = 'bold';
            app.sliderStepUpPushButton.Position = [185 8 25 23];
            app.sliderStepUpPushButton.Text = '>';

            % Create sliderStepDownPushButton
            app.sliderStepDownPushButton = uibutton(app.tiltAnglePanel, 'push');
            app.sliderStepDownPushButton.ButtonPushedFcn = createCallbackFcn(app, @sliderStepDownPushButton_Callback, true);
            app.sliderStepDownPushButton.FontWeight = 'bold';
            app.sliderStepDownPushButton.Position = [1 8 25 23];
            app.sliderStepDownPushButton.Text = '<';

            % Create paramsToControlListbox
            app.paramsToControlListbox = uilistbox(app.figure1);
            app.paramsToControlListbox.Items = {'Listbox'};
            app.paramsToControlListbox.ValueChangedFcn = createCallbackFcn(app, @paramsToControlListbox_Callback, true);
            app.paramsToControlListbox.Tag = 'paramsToControlListbox';
            app.paramsToControlListbox.FontSize = 10.6666666666667;
            app.paramsToControlListbox.Position = [225 611 122 89];
            app.paramsToControlListbox.Value = 'Listbox';

            % Create uipanel6
            app.uipanel6 = uibuttongroup(app.figure1);
            app.uipanel6.Title = 'Display';
            app.uipanel6.Tag = 'uipanel6';
            app.uipanel6.FontSize = 16;
            app.uipanel6.Position = [375 19 401 364];

            % Create waveImagePanel
            app.waveImagePanel = uibuttongroup(app.uipanel6);
            app.waveImagePanel.SelectionChangedFcn = createCallbackFcn(app, @waveImagePanel_SelectionChangeFcn, true);
            app.waveImagePanel.Title = 'Wave image';
            app.waveImagePanel.Tag = 'waveImagePanel';
            app.waveImagePanel.FontSize = 16;
            app.waveImagePanel.Position = [11 83 377 248];

            % Create DisplayWaveImageCheckBox
            app.DisplayWaveImageCheckBox = uicheckbox(app.waveImagePanel);
            app.DisplayWaveImageCheckBox.ValueChangedFcn = createCallbackFcn(app, @DisplayWaveImageCheckBox_Callback, true);
            app.DisplayWaveImageCheckBox.Tag = 'DisplayWaveImageCheckBox';
            app.DisplayWaveImageCheckBox.Tooltip = 'Display a color image of the wave';
            app.DisplayWaveImageCheckBox.Text = 'display';
            app.DisplayWaveImageCheckBox.FontSize = 16;
            app.DisplayWaveImageCheckBox.Position = [11 203 78 23];

            % Create animateWaveCheckBox
            app.animateWaveCheckBox = uicheckbox(app.waveImagePanel);
            app.animateWaveCheckBox.ValueChangedFcn = createCallbackFcn(app, @animateWaveCheckBox_Callback, true);
            app.animateWaveCheckBox.Tag = 'animateWaveCheckBox';
            app.animateWaveCheckBox.Tooltip = 'Animate the wave by multiplying it exp(j*omega*t) and taking the real part.';
            app.animateWaveCheckBox.Text = 'animate';
            app.animateWaveCheckBox.FontSize = 16;
            app.animateWaveCheckBox.Position = [100 203 78 23];

            % Create nPtsPerWLEdit
            app.nPtsPerWLEdit = uieditfield(app.waveImagePanel, 'text');
            app.nPtsPerWLEdit.ValueChangedFcn = createCallbackFcn(app, @nPtsPerWLEdit_Callback, true);
            app.nPtsPerWLEdit.Tag = 'nPtsPerWLEdit';
            app.nPtsPerWLEdit.HorizontalAlignment = 'center';
            app.nPtsPerWLEdit.FontSize = 16;
            app.nPtsPerWLEdit.Tooltip = 'Number of points per wave length at which field will be calculated.';
            app.nPtsPerWLEdit.Position = [109 129 37 22];
            app.nPtsPerWLEdit.Value = '100';

            % Create text37
            app.text37 = uilabel(app.waveImagePanel);
            app.text37.Tag = 'text37';
            app.text37.HorizontalAlignment = 'center';
            app.text37.VerticalAlignment = 'top';
            app.text37.WordWrap = 'on';
            app.text37.FontSize = 16;
            app.text37.Position = [8 130 93 22];
            app.text37.Text = 'No. pts. / WL';

            % Create nPtsPerWLUpDownSlider
            app.nPtsPerWLUpDownSlider = uislider(app.waveImagePanel);
            app.nPtsPerWLUpDownSlider.Limits = [0 1];
            app.nPtsPerWLUpDownSlider.MajorTicks = [];
            app.nPtsPerWLUpDownSlider.Orientation = 'vertical';
            app.nPtsPerWLUpDownSlider.ValueChangedFcn = createCallbackFcn(app, @nPtsPerWLUpDownSlider_Callback, true);
            app.nPtsPerWLUpDownSlider.MinorTicks = [];
            app.nPtsPerWLUpDownSlider.FontSize = 16;
            app.nPtsPerWLUpDownSlider.Tag = 'nPtsPerWLUpDownSlider';
            app.nPtsPerWLUpDownSlider.Tooltip = 'Number of points per wave length at which field will be calculated.';
            app.nPtsPerWLUpDownSlider.Position = [152 119 3 38];
            app.nPtsPerWLUpDownSlider.Value = 0.5;

            % Create animationSpeedUpDownSlider
            app.animationSpeedUpDownSlider = uislider(app.waveImagePanel);
            app.animationSpeedUpDownSlider.Limits = [0 1];
            app.animationSpeedUpDownSlider.MajorTicks = [];
            app.animationSpeedUpDownSlider.ValueChangedFcn = createCallbackFcn(app, @animationSpeedUpDownSlider_Callback, true);
            app.animationSpeedUpDownSlider.MinorTicks = [];
            app.animationSpeedUpDownSlider.FontSize = 16;
            app.animationSpeedUpDownSlider.Tag = 'animationSpeedUpDownSlider';
            app.animationSpeedUpDownSlider.Tooltip = 'Speed of animation';
            app.animationSpeedUpDownSlider.Position = [182 206 35 3];
            app.animationSpeedUpDownSlider.Value = 0.5;

            % Create propagatingWavesRadioButton
            app.propagatingWavesRadioButton = uiradiobutton(app.waveImagePanel);
            app.propagatingWavesRadioButton.Tag = 'propagatingWavesRadioButton';
            app.propagatingWavesRadioButton.Text = 'propagating waves';
            app.propagatingWavesRadioButton.FontSize = 16;
            app.propagatingWavesRadioButton.Position = [12 99 164 23];

            % Create evanescentWavesRadioButton
            app.evanescentWavesRadioButton = uiradiobutton(app.waveImagePanel);
            app.evanescentWavesRadioButton.Tag = 'evanescentWavesRadioButton';
            app.evanescentWavesRadioButton.Text = 'evanescent waves';
            app.evanescentWavesRadioButton.FontSize = 16;
            app.evanescentWavesRadioButton.Position = [12 77 164 23];

            % Create allWavesRadioButton
            app.allWavesRadioButton = uiradiobutton(app.waveImagePanel);
            app.allWavesRadioButton.Tag = 'allWavesRadioButton';
            app.allWavesRadioButton.Text = 'all waves';
            app.allWavesRadioButton.FontSize = 16;
            app.allWavesRadioButton.Position = [13 54 93 23];
            app.allWavesRadioButton.Value = true;

            % Create displayBoundaryCheckBox
            app.displayBoundaryCheckBox = uicheckbox(app.waveImagePanel);
            app.displayBoundaryCheckBox.ValueChangedFcn = createCallbackFcn(app, @displayBoundaryCheckBox_Callback, true);
            app.displayBoundaryCheckBox.Tag = 'displayBoundaryCheckBox';
            app.displayBoundaryCheckBox.Tooltip = 'Display boundary between the media.';
            app.displayBoundaryCheckBox.Text = 'boundary';
            app.displayBoundaryCheckBox.FontSize = 16;
            app.displayBoundaryCheckBox.Position = [207 -1 93 23];
            app.displayBoundaryCheckBox.Value = true;

            % Create singleWaveButtonGroup
            app.singleWaveButtonGroup = uibuttongroup(app.waveImagePanel);
            app.singleWaveButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @singleWaveButtonGroup_SelectionChangeFcn, true);
            app.singleWaveButtonGroup.Title = 'Single wave';
            app.singleWaveButtonGroup.Tag = 'singleWaveButtonGroup';
            app.singleWaveButtonGroup.FontSize = 16;
            app.singleWaveButtonGroup.Position = [182 70 183 98];

            % Create singleWaveDisplayCheckBox
            app.singleWaveDisplayCheckBox = uicheckbox(app.singleWaveButtonGroup);
            app.singleWaveDisplayCheckBox.ValueChangedFcn = createCallbackFcn(app, @singleWaveDisplayCheckBox_Callback, true);
            app.singleWaveDisplayCheckBox.Tag = 'singleWaveDisplayCheckBox';
            app.singleWaveDisplayCheckBox.Tooltip = 'Display only a single wave, the index of which is shown in the edit box in the Results panel.';
            app.singleWaveDisplayCheckBox.Text = '1 wave';
            app.singleWaveDisplayCheckBox.FontSize = 16;
            app.singleWaveDisplayCheckBox.Position = [6 54 76 23];

            % Create upwardRadioButton
            app.upwardRadioButton = uiradiobutton(app.singleWaveButtonGroup);
            app.upwardRadioButton.Tag = 'upwardRadioButton';
            app.upwardRadioButton.Text = 'upward';
            app.upwardRadioButton.FontSize = 16;
            app.upwardRadioButton.Position = [75 54 80 23];

            % Create downwardRadioButton
            app.downwardRadioButton = uiradiobutton(app.singleWaveButtonGroup);
            app.downwardRadioButton.Tag = 'downwardRadioButton';
            app.downwardRadioButton.Text = 'downward';
            app.downwardRadioButton.FontSize = 16;
            app.downwardRadioButton.Position = [75 34 101 23];

            % Create bothRadioButton
            app.bothRadioButton = uiradiobutton(app.singleWaveButtonGroup);
            app.bothRadioButton.Tag = 'bothRadioButton';
            app.bothRadioButton.Text = 'both';
            app.bothRadioButton.FontSize = 16;
            app.bothRadioButton.Position = [76 8 57 31];
            app.bothRadioButton.Value = true;

            % Create makeMoviePushButton
            app.makeMoviePushButton = uibutton(app.waveImagePanel, 'push');
            app.makeMoviePushButton.ButtonPushedFcn = createCallbackFcn(app, @makeMoviePushButton_Callback, true);
            app.makeMoviePushButton.Tag = 'makeMoviePushButton';
            app.makeMoviePushButton.FontSize = 16;
            app.makeMoviePushButton.Enable = 'off';
            app.makeMoviePushButton.Position = [239 197 113 32];
            app.makeMoviePushButton.Text = 'Make movie';

            % Create incidentWaveOnlyCheckBox
            app.incidentWaveOnlyCheckBox = uicheckbox(app.waveImagePanel);
            app.incidentWaveOnlyCheckBox.ValueChangedFcn = createCallbackFcn(app, @incidentWaveOnlyCheckBox_Callback, true);
            app.incidentWaveOnlyCheckBox.Tag = 'incidentWaveOnlyCheckBox';
            app.incidentWaveOnlyCheckBox.Tooltip = 'In the incident region, only show the incident wave.';
            app.incidentWaveOnlyCheckBox.Text = 'Incident wave only';
            app.incidentWaveOnlyCheckBox.FontSize = 16;
            app.incidentWaveOnlyCheckBox.Position = [207 20 156 23];

            % Create rotationEdit
            app.rotationEdit = uieditfield(app.waveImagePanel, 'text');
            app.rotationEdit.ValueChangedFcn = createCallbackFcn(app, @rotationEdit_Callback, true);
            app.rotationEdit.Tag = 'rotationEdit';
            app.rotationEdit.HorizontalAlignment = 'center';
            app.rotationEdit.FontSize = 16;
            app.rotationEdit.Tooltip = 'Rotation angle of image (deg)';
            app.rotationEdit.Position = [120 12 37 22];
            app.rotationEdit.Value = '0';

            % Create text78
            app.text78 = uilabel(app.waveImagePanel);
            app.text78.Tag = 'text78';
            app.text78.HorizontalAlignment = 'center';
            app.text78.VerticalAlignment = 'top';
            app.text78.WordWrap = 'on';
            app.text78.FontSize = 16;
            app.text78.Position = [14 13 98 22];
            app.text78.Text = 'rotation (deg)';

            % Create rotationUpDownSlider
            app.rotationUpDownSlider = uislider(app.waveImagePanel);
            app.rotationUpDownSlider.Limits = [0 1];
            app.rotationUpDownSlider.MajorTicks = [];
            app.rotationUpDownSlider.Orientation = 'vertical';
            app.rotationUpDownSlider.ValueChangedFcn = createCallbackFcn(app, @rotationUpDownSlider_Callback, true);
            app.rotationUpDownSlider.MinorTicks = [];
            app.rotationUpDownSlider.FontSize = 16;
            app.rotationUpDownSlider.Tag = 'rotationUpDownSlider';
            app.rotationUpDownSlider.Tooltip = 'rotation angle of image (deg)';
            app.rotationUpDownSlider.Position = [163 2 3 38];
            app.rotationUpDownSlider.Value = 0.5;

            % Create redrawPushButton
            app.redrawPushButton = uibutton(app.waveImagePanel, 'push');
            app.redrawPushButton.ButtonPushedFcn = createCallbackFcn(app, @redrawPushButton_Callback, true);
            app.redrawPushButton.Tag = 'redrawPushButton';
            app.redrawPushButton.FontSize = 10.6666666666667;
            app.redrawPushButton.Position = [103 52 68 22];
            app.redrawPushButton.Text = 'Redraw';

            % Create withoutIncidentWaveCheckBox
            app.withoutIncidentWaveCheckBox = uicheckbox(app.waveImagePanel);
            app.withoutIncidentWaveCheckBox.ValueChangedFcn = createCallbackFcn(app, @withoutIncidentWaveCheckBox_Callback, true);
            app.withoutIncidentWaveCheckBox.Tag = 'withoutIncidentWaveCheckBox';
            app.withoutIncidentWaveCheckBox.Tooltip = 'Do not include the incident wave in the image plot.';
            app.withoutIncidentWaveCheckBox.Text = 'w/o incident wave';
            app.withoutIncidentWaveCheckBox.FontSize = 16;
            app.withoutIncidentWaveCheckBox.Position = [208 40 156 23];

            % Create timephaseEdit
            app.timephaseEdit = uieditfield(app.waveImagePanel, 'text');
            app.timephaseEdit.ValueChangedFcn = createCallbackFcn(app, @timephaseEdit_Callback, true);
            app.timephaseEdit.Tag = 'timephaseEdit';
            app.timephaseEdit.HorizontalAlignment = 'center';
            app.timephaseEdit.FontSize = 10.6666666666667;
            app.timephaseEdit.Tooltip = 'The time phase (deg) of the field image when displayed.';
            app.timephaseEdit.Position = [93 175 53.0000000000001 22];
            app.timephaseEdit.Value = '0';

            % Create text113
            app.text113 = uilabel(app.waveImagePanel);
            app.text113.Tag = 'text113';
            app.text113.HorizontalAlignment = 'center';
            app.text113.VerticalAlignment = 'top';
            app.text113.WordWrap = 'on';
            app.text113.FontSize = 10.6666666666667;
            app.text113.Position = [37 172 53 21];
            app.text113.Text = 'phase';

            % Create ImageCheckBox
            app.ImageCheckBox = uicheckbox(app.waveImagePanel);
            app.ImageCheckBox.ValueChangedFcn = createCallbackFcn(app, @ImageCheclboxCallback, true);
            app.ImageCheckBox.Enable = 'off';
            app.ImageCheckBox.Text = 'Image';
            app.ImageCheckBox.Position = [243 173 55 22];
            app.ImageCheckBox.Value = true;

            % Create arrowsCheckBox
            app.arrowsCheckBox = uicheckbox(app.uipanel6);
            app.arrowsCheckBox.ValueChangedFcn = createCallbackFcn(app, @arrowsCheckBox_Callback, true);
            app.arrowsCheckBox.Tag = 'arrowsCheckBox';
            app.arrowsCheckBox.Tooltip = 'Display the direction and magnitude of each wave component at each surface. Based only on non-evanescent components.';
            app.arrowsCheckBox.Text = 'rays';
            app.arrowsCheckBox.FontSize = 16;
            app.arrowsCheckBox.Position = [191 59 57 23];
            app.arrowsCheckBox.Value = true;

            % Create poyntingVectorsCheckBox
            app.poyntingVectorsCheckBox = uicheckbox(app.uipanel6);
            app.poyntingVectorsCheckBox.ValueChangedFcn = createCallbackFcn(app, @poyntingVectorsCheckBox_Callback, true);
            app.poyntingVectorsCheckBox.Tag = 'poyntingVectorsCheckBox';
            app.poyntingVectorsCheckBox.Enable = 'off';
            app.poyntingVectorsCheckBox.Tooltip = 'Display the total Poynting vector in each region. This only includes non-evanescent waves except in middle section (for 3 media problem), for which it is based on the E and H fields at x=y=0.';
            app.poyntingVectorsCheckBox.Text = 'Poynting vec.';
            app.poyntingVectorsCheckBox.FontSize = 16;
            app.poyntingVectorsCheckBox.Position = [267 61 122 23];

            % Create powerCouplingEff
            app.powerCouplingEff = uicheckbox(app.uipanel6);
            app.powerCouplingEff.ValueChangedFcn = createCallbackFcn(app, @powerCouplingEff_Callback, true);
            app.powerCouplingEff.Tag = 'powerCouplingEff';
            app.powerCouplingEff.Text = 'power coupling eff.';
            app.powerCouplingEff.FontSize = 10.6666666666667;
            app.powerCouplingEff.Position = [25 18 124 23];

            % Create propagationDirectionsCheckBox
            app.propagationDirectionsCheckBox = uicheckbox(app.uipanel6);
            app.propagationDirectionsCheckBox.ValueChangedFcn = createCallbackFcn(app, @propagationDirectionsCheckBox_Callback, true);
            app.propagationDirectionsCheckBox.Tag = 'propagationDirectionsCheckBox';
            app.propagationDirectionsCheckBox.Tooltip = 'display directions of the propagating FB waves.';
            app.propagationDirectionsCheckBox.Text = 'Prop. Direcs.';
            app.propagationDirectionsCheckBox.FontSize = 10.6666666666667;
            app.propagationDirectionsCheckBox.Position = [190 35 91 23];

            % Create NoperiodsSpinnerLabel
            app.NoperiodsSpinnerLabel = uilabel(app.uipanel6);
            app.NoperiodsSpinnerLabel.HorizontalAlignment = 'right';
            app.NoperiodsSpinnerLabel.Position = [31 51 66 22];
            app.NoperiodsSpinnerLabel.Text = 'No. periods';

            % Create NoperiodsSpinner
            app.NoperiodsSpinner = uispinner(app.uipanel6);
            app.NoperiodsSpinner.Limits = [1 Inf];
            app.NoperiodsSpinner.ValueChangedFcn = createCallbackFcn(app, @NoperiodsSpinner_callback, true);
            app.NoperiodsSpinner.Position = [105 51 52 22];
            app.NoperiodsSpinner.Value = 10;

            % Create FloqincwavesCheckBox
            app.FloqincwavesCheckBox = uicheckbox(app.uipanel6);
            app.FloqincwavesCheckBox.ValueChangedFcn = createCallbackFcn(app, @FloqIncWavesCallback, true);
            app.FloqincwavesCheckBox.Tooltip = {'Use multiple incident waves.'};
            app.FloqincwavesCheckBox.Text = 'Floq inc. waves';
            app.FloqincwavesCheckBox.Position = [190 12 105 22];

            % Create resultsButtonGroup
            app.resultsButtonGroup = uibuttongroup(app.figure1);
            app.resultsButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @resultsButtonGroup_SelectionChangeFcn, true);
            app.resultsButtonGroup.Title = 'Results';
            app.resultsButtonGroup.Tag = 'resultsButtonGroup';
            app.resultsButtonGroup.FontSize = 16;
            app.resultsButtonGroup.Position = [6 19 344 202];

            % Create text49
            app.text49 = uilabel(app.resultsButtonGroup);
            app.text49.Tag = 'text49';
            app.text49.HorizontalAlignment = 'center';
            app.text49.VerticalAlignment = 'top';
            app.text49.WordWrap = 'on';
            app.text49.FontSize = 16;
            app.text49.Tooltip = 'The solution for the reflected wave in the upper region.';
            app.text49.Position = [43 135 37 22];
            app.text49.Text = 'rho';

            % Create text50
            app.text50 = uilabel(app.resultsButtonGroup);
            app.text50.Tag = 'text50';
            app.text50.HorizontalAlignment = 'center';
            app.text50.VerticalAlignment = 'top';
            app.text50.WordWrap = 'on';
            app.text50.FontSize = 16;
            app.text50.Tooltip = 'The solution for the downward wave in the middle region.';
            app.text50.Position = [45 109 37 22.0000000000001];
            app.text50.Text = 'sigA';

            % Create text51
            app.text51 = uilabel(app.resultsButtonGroup);
            app.text51.Tag = 'text51';
            app.text51.HorizontalAlignment = 'center';
            app.text51.VerticalAlignment = 'top';
            app.text51.WordWrap = 'on';
            app.text51.FontSize = 16;
            app.text51.Tooltip = 'The solution for the upward wave in the middle region.';
            app.text51.Position = [45 84 37 22];
            app.text51.Text = 'sigB';

            % Create text52
            app.text52 = uilabel(app.resultsButtonGroup);
            app.text52.Tag = 'text52';
            app.text52.HorizontalAlignment = 'center';
            app.text52.VerticalAlignment = 'top';
            app.text52.WordWrap = 'on';
            app.text52.FontSize = 16;
            app.text52.Tooltip = 'The solution for the transmitted wave in the lower region.';
            app.text52.Position = [44 55 37 22];
            app.text52.Text = 'tau';

            % Create text53
            app.text53 = uilabel(app.resultsButtonGroup);
            app.text53.Tag = 'text53';
            app.text53.HorizontalAlignment = 'center';
            app.text53.VerticalAlignment = 'top';
            app.text53.WordWrap = 'on';
            app.text53.FontSize = 16;
            app.text53.Tooltip = 'The modulus of the value.';
            app.text53.Position = [118 158 34 22];
            app.text53.Text = 'abs';

            % Create text54
            app.text54 = uilabel(app.resultsButtonGroup);
            app.text54.Tag = 'text54';
            app.text54.HorizontalAlignment = 'center';
            app.text54.VerticalAlignment = 'top';
            app.text54.WordWrap = 'on';
            app.text54.FontSize = 16;
            app.text54.Tooltip = 'The phase (deg) of the value.';
            app.text54.Position = [193 158 45 22];
            app.text54.Text = 'phase';

            % Create text55
            app.text55 = uilabel(app.resultsButtonGroup);
            app.text55.Tag = 'text55';
            app.text55.HorizontalAlignment = 'center';
            app.text55.VerticalAlignment = 'top';
            app.text55.WordWrap = 'on';
            app.text55.FontSize = 16;
            app.text55.Tooltip = 'The angle (deg) of the wave direction relative to the normal to the surfaces (vertical).';
            app.text55.Position = [278 159 39 22];
            app.text55.Text = 'angle';

            % Create rhoAbsText
            app.rhoAbsText = uilabel(app.resultsButtonGroup);
            app.rhoAbsText.Tag = 'rhoAbsText';
            app.rhoAbsText.BackgroundColor = [0.945098039215686 0.968627450980392 0.949019607843137];
            app.rhoAbsText.HorizontalAlignment = 'center';
            app.rhoAbsText.VerticalAlignment = 'top';
            app.rhoAbsText.WordWrap = 'on';
            app.rhoAbsText.FontSize = 18.6666666666667;
            app.rhoAbsText.Position = [75 134 111 22];
            app.rhoAbsText.Text = '0.10';

            % Create rhoPhaseText
            app.rhoPhaseText = uilabel(app.resultsButtonGroup);
            app.rhoPhaseText.Tag = 'rhoPhaseText';
            app.rhoPhaseText.BackgroundColor = [0.945098039215686 0.968627450980392 0.949019607843137];
            app.rhoPhaseText.HorizontalAlignment = 'center';
            app.rhoPhaseText.VerticalAlignment = 'top';
            app.rhoPhaseText.WordWrap = 'on';
            app.rhoPhaseText.FontSize = 16;
            app.rhoPhaseText.Position = [187 136 51 20];
            app.rhoPhaseText.Text = '20';

            % Create rhoAngleText
            app.rhoAngleText = uilabel(app.resultsButtonGroup);
            app.rhoAngleText.Tag = 'rhoAngleText';
            app.rhoAngleText.BackgroundColor = [0.945098039215686 0.968627450980392 0.949019607843137];
            app.rhoAngleText.HorizontalAlignment = 'center';
            app.rhoAngleText.VerticalAlignment = 'top';
            app.rhoAngleText.WordWrap = 'on';
            app.rhoAngleText.FontSize = 16;
            app.rhoAngleText.Position = [269 138 51 20];
            app.rhoAngleText.Text = '20';

            % Create sigAAbsText
            app.sigAAbsText = uilabel(app.resultsButtonGroup);
            app.sigAAbsText.Tag = 'sigAAbsText';
            app.sigAAbsText.BackgroundColor = [0.945098039215686 0.968627450980392 0.949019607843137];
            app.sigAAbsText.HorizontalAlignment = 'center';
            app.sigAAbsText.VerticalAlignment = 'top';
            app.sigAAbsText.WordWrap = 'on';
            app.sigAAbsText.FontSize = 10.6666666666667;
            app.sigAAbsText.Position = [90 110 73 22.0000000000001];
            app.sigAAbsText.Text = '0.10';

            % Create sigAPhaseText
            app.sigAPhaseText = uilabel(app.resultsButtonGroup);
            app.sigAPhaseText.Tag = 'sigAPhaseText';
            app.sigAPhaseText.BackgroundColor = [0.945098039215686 0.968627450980392 0.949019607843137];
            app.sigAPhaseText.HorizontalAlignment = 'center';
            app.sigAPhaseText.VerticalAlignment = 'top';
            app.sigAPhaseText.WordWrap = 'on';
            app.sigAPhaseText.FontSize = 16;
            app.sigAPhaseText.Position = [187 112 51 20];
            app.sigAPhaseText.Text = '20';

            % Create sigAAngleText
            app.sigAAngleText = uilabel(app.resultsButtonGroup);
            app.sigAAngleText.Tag = 'sigAAngleText';
            app.sigAAngleText.BackgroundColor = [0.945098039215686 0.968627450980392 0.949019607843137];
            app.sigAAngleText.HorizontalAlignment = 'center';
            app.sigAAngleText.VerticalAlignment = 'top';
            app.sigAAngleText.WordWrap = 'on';
            app.sigAAngleText.FontSize = 16;
            app.sigAAngleText.Position = [269 114 51 20];
            app.sigAAngleText.Text = '20';

            % Create sigBAbsText
            app.sigBAbsText = uilabel(app.resultsButtonGroup);
            app.sigBAbsText.Tag = 'sigBAbsText';
            app.sigBAbsText.BackgroundColor = [0.945098039215686 0.968627450980392 0.949019607843137];
            app.sigBAbsText.HorizontalAlignment = 'center';
            app.sigBAbsText.VerticalAlignment = 'top';
            app.sigBAbsText.WordWrap = 'on';
            app.sigBAbsText.FontSize = 10.6666666666667;
            app.sigBAbsText.Position = [91 85 72 22];
            app.sigBAbsText.Text = '0.10';

            % Create sigBPhaseText
            app.sigBPhaseText = uilabel(app.resultsButtonGroup);
            app.sigBPhaseText.Tag = 'sigBPhaseText';
            app.sigBPhaseText.BackgroundColor = [0.945098039215686 0.968627450980392 0.949019607843137];
            app.sigBPhaseText.HorizontalAlignment = 'center';
            app.sigBPhaseText.VerticalAlignment = 'top';
            app.sigBPhaseText.WordWrap = 'on';
            app.sigBPhaseText.FontSize = 16;
            app.sigBPhaseText.Position = [187 87 51 20];
            app.sigBPhaseText.Text = '20';

            % Create sigBAngleText
            app.sigBAngleText = uilabel(app.resultsButtonGroup);
            app.sigBAngleText.Tag = 'sigBAngleText';
            app.sigBAngleText.BackgroundColor = [0.945098039215686 0.968627450980392 0.949019607843137];
            app.sigBAngleText.HorizontalAlignment = 'center';
            app.sigBAngleText.VerticalAlignment = 'top';
            app.sigBAngleText.WordWrap = 'on';
            app.sigBAngleText.FontSize = 16;
            app.sigBAngleText.Position = [269 89 51 20];
            app.sigBAngleText.Text = '20';

            % Create tauAbsText
            app.tauAbsText = uilabel(app.resultsButtonGroup);
            app.tauAbsText.Tag = 'tauAbsText';
            app.tauAbsText.BackgroundColor = [0.945098039215686 0.968627450980392 0.949019607843137];
            app.tauAbsText.HorizontalAlignment = 'center';
            app.tauAbsText.VerticalAlignment = 'top';
            app.tauAbsText.WordWrap = 'on';
            app.tauAbsText.FontSize = 18.6666666666667;
            app.tauAbsText.Position = [76 57 100 22];
            app.tauAbsText.Text = '0.10';

            % Create tauPhaseText
            app.tauPhaseText = uilabel(app.resultsButtonGroup);
            app.tauPhaseText.Tag = 'tauPhaseText';
            app.tauPhaseText.BackgroundColor = [0.945098039215686 0.968627450980392 0.949019607843137];
            app.tauPhaseText.HorizontalAlignment = 'center';
            app.tauPhaseText.VerticalAlignment = 'top';
            app.tauPhaseText.WordWrap = 'on';
            app.tauPhaseText.FontSize = 16;
            app.tauPhaseText.Position = [187 59 51 20];
            app.tauPhaseText.Text = '20';

            % Create tauAngleText
            app.tauAngleText = uilabel(app.resultsButtonGroup);
            app.tauAngleText.Tag = 'tauAngleText';
            app.tauAngleText.BackgroundColor = [0.945098039215686 0.968627450980392 0.949019607843137];
            app.tauAngleText.HorizontalAlignment = 'center';
            app.tauAngleText.VerticalAlignment = 'top';
            app.tauAngleText.WordWrap = 'on';
            app.tauAngleText.FontSize = 16;
            app.tauAngleText.Position = [269 61 51 20];
            app.tauAngleText.Text = '20';

            % Create pltVshPushButton
            app.pltVshPushButton = uibutton(app.resultsButtonGroup, 'push');
            app.pltVshPushButton.ButtonPushedFcn = createCallbackFcn(app, @pltVshPushButton_Callback, true);
            app.pltVshPushButton.Tag = 'pltVshPushButton';
            app.pltVshPushButton.FontSize = 10.6666666666667;
            app.pltVshPushButton.Position = [17 30 68 22];
            app.pltVshPushButton.Text = 'Plot vs. h';

            % Create rhoRadioButton
            app.rhoRadioButton = uiradiobutton(app.resultsButtonGroup);
            app.rhoRadioButton.Tag = 'rhoRadioButton';
            app.rhoRadioButton.Tooltip = 'The dependent variable which will be plotted when pressing the plot button.';
            app.rhoRadioButton.Text = '';
            app.rhoRadioButton.FontSize = 10.6666666666667;
            app.rhoRadioButton.Position = [10 136 22 23];

            % Create sigmaARadioButton
            app.sigmaARadioButton = uiradiobutton(app.resultsButtonGroup);
            app.sigmaARadioButton.Tag = 'sigmaARadioButton';
            app.sigmaARadioButton.Tooltip = 'The dependent variable which will be plotted when pressing the plot button.';
            app.sigmaARadioButton.Text = '';
            app.sigmaARadioButton.FontSize = 10.6666666666667;
            app.sigmaARadioButton.Position = [11 109 22 23];
            app.sigmaARadioButton.Value = true;

            % Create sigmaBRadioButton
            app.sigmaBRadioButton = uiradiobutton(app.resultsButtonGroup);
            app.sigmaBRadioButton.Tag = 'sigmaBRadioButton';
            app.sigmaBRadioButton.Tooltip = 'The dependent variable which will be plotted when pressing the plot button.';
            app.sigmaBRadioButton.Text = '';
            app.sigmaBRadioButton.FontSize = 10.6666666666667;
            app.sigmaBRadioButton.Position = [11 83 22 23];

            % Create tauRadioButton
            app.tauRadioButton = uiradiobutton(app.resultsButtonGroup);
            app.tauRadioButton.Tag = 'tauRadioButton';
            app.tauRadioButton.Tooltip = 'The dependent variable which will be plotted when pressing the plot button.';
            app.tauRadioButton.Text = '';
            app.tauRadioButton.FontSize = 10.6666666666667;
            app.tauRadioButton.Position = [12 56 22 23];

            % Create maxPlotValueEdit
            app.maxPlotValueEdit = uieditfield(app.resultsButtonGroup, 'text');
            app.maxPlotValueEdit.Tag = 'maxPlotValueEdit';
            app.maxPlotValueEdit.HorizontalAlignment = 'center';
            app.maxPlotValueEdit.FontSize = 16;
            app.maxPlotValueEdit.Tooltip = 'The maximum value of the independent variable for plotting.';
            app.maxPlotValueEdit.Position = [111 33 69 19];
            app.maxPlotValueEdit.Value = '2';

            % Create text69
            app.text69 = uilabel(app.resultsButtonGroup);
            app.text69.Tag = 'text69';
            app.text69.HorizontalAlignment = 'center';
            app.text69.VerticalAlignment = 'top';
            app.text69.WordWrap = 'on';
            app.text69.FontSize = 10.6666666666667;
            app.text69.Position = [118 11 50 16];
            app.text69.Text = 'max value';

            % Create numPlotPointsEdit
            app.numPlotPointsEdit = uieditfield(app.resultsButtonGroup, 'text');
            app.numPlotPointsEdit.Tag = 'numPlotPointsEdit';
            app.numPlotPointsEdit.HorizontalAlignment = 'center';
            app.numPlotPointsEdit.FontSize = 16;
            app.numPlotPointsEdit.Tooltip = 'The maximum value of the independent variable for plotting.';
            app.numPlotPointsEdit.Position = [192 34 69 19];
            app.numPlotPointsEdit.Value = '200';

            % Create text70
            app.text70 = uilabel(app.resultsButtonGroup);
            app.text70.Tag = 'text70';
            app.text70.HorizontalAlignment = 'center';
            app.text70.VerticalAlignment = 'top';
            app.text70.WordWrap = 'on';
            app.text70.FontSize = 10.6666666666667;
            app.text70.Position = [199 12 50 16];
            app.text70.Text = 'No. points';

            % Create currentNumberText
            app.currentNumberText = uilabel(app.resultsButtonGroup);
            app.currentNumberText.Tag = 'currentNumberText';
            app.currentNumberText.HorizontalAlignment = 'center';
            app.currentNumberText.VerticalAlignment = 'top';
            app.currentNumberText.WordWrap = 'on';
            app.currentNumberText.FontSize = 16;
            app.currentNumberText.Position = [271 32 57 21];
            app.currentNumberText.Text = '0';

            % Create text72
            app.text72 = uilabel(app.resultsButtonGroup);
            app.text72.Tag = 'text72';
            app.text72.HorizontalAlignment = 'center';
            app.text72.VerticalAlignment = 'top';
            app.text72.WordWrap = 'on';
            app.text72.FontSize = 10.6666666666667;
            app.text72.Position = [277 15 51 14];
            app.text72.Text = 'current';

            % Create powerConsText
            app.powerConsText = uilabel(app.resultsButtonGroup);
            app.powerConsText.Tag = 'powerConsText';
            app.powerConsText.HorizontalAlignment = 'center';
            app.powerConsText.VerticalAlignment = 'top';
            app.powerConsText.WordWrap = 'on';
            app.powerConsText.FontSize = 10.6666666666667;
            app.powerConsText.Tooltip = 'Power conservation. Should be near 1.';
            app.powerConsText.Position = [13 8 83 16];
            app.powerConsText.Text = '1';

            % Create waveDirectionEdit
            app.waveDirectionEdit = uieditfield(app.figure1, 'text');
            app.waveDirectionEdit.ValueChangedFcn = createCallbackFcn(app, @waveDirectionEdit_Callback, true);
            app.waveDirectionEdit.Tag = 'waveDirectionEdit';
            app.waveDirectionEdit.HorizontalAlignment = 'center';
            app.waveDirectionEdit.FontSize = 16;
            app.waveDirectionEdit.Position = [1229 437 51 21.9999999999999];
            app.waveDirectionEdit.Value = '0';

            % Create text79
            app.text79 = uilabel(app.figure1);
            app.text79.Tag = 'text79';
            app.text79.HorizontalAlignment = 'center';
            app.text79.VerticalAlignment = 'top';
            app.text79.WordWrap = 'on';
            app.text79.FontSize = 16;
            app.text79.Position = [1150 437 65 21.9999999999999];
            app.text79.Text = 'inc.angle';

            % Create uibuttongroup3
            app.uibuttongroup3 = uibuttongroup(app.figure1);
            app.uibuttongroup3.Title = 'Optimization';
            app.uibuttongroup3.Tag = 'uibuttongroup3';
            app.uibuttongroup3.FontSize = 16;
            app.uibuttongroup3.Position = [809 19 290 726];

            % Create uibuttongroup10
            app.uibuttongroup10 = uibuttongroup(app.uibuttongroup3);
            app.uibuttongroup10.Title = 'Include In Optimization';
            app.uibuttongroup10.Tag = 'uibuttongroup10';
            app.uibuttongroup10.FontSize = 10.6666666666667;
            app.uibuttongroup10.Position = [20 309 254 213];

            % Create layerThicknessCheckBox
            app.layerThicknessCheckBox = uicheckbox(app.uibuttongroup10);
            app.layerThicknessCheckBox.Tag = 'layerThicknessCheckBox';
            app.layerThicknessCheckBox.Tooltip = 'The thickness of the dielectric layers.';
            app.layerThicknessCheckBox.Text = 'Layer thickness';
            app.layerThicknessCheckBox.FontSize = 10.6666666666667;
            app.layerThicknessCheckBox.Position = [11 156 106 23];

            % Create wireOffsetCheckBox
            app.wireOffsetCheckBox = uicheckbox(app.uibuttongroup10);
            app.wireOffsetCheckBox.Tag = 'wireOffsetCheckBox';
            app.wireOffsetCheckBox.Tooltip = 'The offset of each wire in the array relative to the period.';
            app.wireOffsetCheckBox.Text = 'Wire offset';
            app.wireOffsetCheckBox.FontSize = 10.6666666666667;
            app.wireOffsetCheckBox.Position = [12 137 89 23];

            % Create wireReactanceCheckBox
            app.wireReactanceCheckBox = uicheckbox(app.uibuttongroup10);
            app.wireReactanceCheckBox.Tag = 'wireReactanceCheckBox';
            app.wireReactanceCheckBox.Tooltip = 'The reactance per unit length of each wire in the array.';
            app.wireReactanceCheckBox.Text = 'Wire reactance';
            app.wireReactanceCheckBox.FontSize = 10.6666666666667;
            app.wireReactanceCheckBox.Position = [13 118 103 23];

            % Create text141
            app.text141 = uilabel(app.uibuttongroup10);
            app.text141.Tag = 'text141';
            app.text141.HorizontalAlignment = 'center';
            app.text141.VerticalAlignment = 'top';
            app.text141.WordWrap = 'on';
            app.text141.FontSize = 10.6666666666667;
            app.text141.Position = [172 182 22 14];
            app.text141.Text = 'min';

            % Create text142
            app.text142 = uilabel(app.uibuttongroup10);
            app.text142.Tag = 'text142';
            app.text142.HorizontalAlignment = 'center';
            app.text142.VerticalAlignment = 'top';
            app.text142.WordWrap = 'on';
            app.text142.FontSize = 10.6666666666667;
            app.text142.Position = [217 181 22 14];
            app.text142.Text = 'max';

            % Create groupingCheckBox
            app.groupingCheckBox = uicheckbox(app.uibuttongroup10);
            app.groupingCheckBox.ValueChangedFcn = createCallbackFcn(app, @groupingCheckBox_Callback, true);
            app.groupingCheckBox.Tag = 'groupingCheckBox';
            app.groupingCheckBox.Text = 'groupings/constraints';
            app.groupingCheckBox.FontSize = 10.6666666666667;
            app.groupingCheckBox.Position = [97 70 137 23];

            % Create symmetricCheckBox
            app.symmetricCheckBox = uicheckbox(app.uibuttongroup10);
            app.symmetricCheckBox.ValueChangedFcn = createCallbackFcn(app, @symmetricCheckBox_Callback, true);
            app.symmetricCheckBox.Tag = 'symmetricCheckBox';
            app.symmetricCheckBox.Text = 'symmetric';
            app.symmetricCheckBox.FontSize = 10.6666666666667;
            app.symmetricCheckBox.Position = [13 70 75 23];

            % Create constantThicknessCheckBox
            app.constantThicknessCheckBox = uicheckbox(app.uibuttongroup10);
            app.constantThicknessCheckBox.Tag = 'constantThicknessCheckBox';
            app.constantThicknessCheckBox.Text = 'constant thickness';
            app.constantThicknessCheckBox.FontSize = 10.6666666666667;
            app.constantThicknessCheckBox.Position = [14 48 122 23];

            % Create constraint1CheckBox
            app.constraint1CheckBox = uicheckbox(app.uibuttongroup10);
            app.constraint1CheckBox.Tag = 'constraint1CheckBox';
            app.constraint1CheckBox.Tooltip = 'Use special constrain in the text in optVar2ModelVar.';
            app.constraint1CheckBox.Text = 'constraint1';
            app.constraint1CheckBox.FontSize = 10.6666666666667;
            app.constraint1CheckBox.Position = [143 50 75 23];

            % Create EditFieldlbLayerThickness
            app.EditFieldlbLayerThickness = uieditfield(app.uibuttongroup10, 'numeric');
            app.EditFieldlbLayerThickness.Limits = [0 Inf];
            app.EditFieldlbLayerThickness.HorizontalAlignment = 'center';
            app.EditFieldlbLayerThickness.Position = [169 161 28 17];

            % Create EditFieldubLayerThickness
            app.EditFieldubLayerThickness = uieditfield(app.uibuttongroup10, 'numeric');
            app.EditFieldubLayerThickness.Limits = [0 Inf];
            app.EditFieldubLayerThickness.HorizontalAlignment = 'center';
            app.EditFieldubLayerThickness.Position = [213 161 28 17];
            app.EditFieldubLayerThickness.Value = 0.2;

            % Create EditFieldlbWireOffset
            app.EditFieldlbWireOffset = uieditfield(app.uibuttongroup10, 'numeric');
            app.EditFieldlbWireOffset.HorizontalAlignment = 'center';
            app.EditFieldlbWireOffset.Position = [172 140 28 17];

            % Create EditFieldubWireOffset
            app.EditFieldubWireOffset = uieditfield(app.uibuttongroup10, 'numeric');
            app.EditFieldubWireOffset.Limits = [0 Inf];
            app.EditFieldubWireOffset.HorizontalAlignment = 'center';
            app.EditFieldubWireOffset.Position = [213 140 28 17];
            app.EditFieldubWireOffset.Value = 1;

            % Create EditFieldlbWireReactance
            app.EditFieldlbWireReactance = uieditfield(app.uibuttongroup10, 'numeric');
            app.EditFieldlbWireReactance.HorizontalAlignment = 'center';
            app.EditFieldlbWireReactance.Position = [175 120 28 17];
            app.EditFieldlbWireReactance.Value = 3.3;

            % Create EditFieldubWireReactance
            app.EditFieldubWireReactance = uieditfield(app.uibuttongroup10, 'numeric');
            app.EditFieldubWireReactance.Limits = [0 Inf];
            app.EditFieldubWireReactance.HorizontalAlignment = 'center';
            app.EditFieldubWireReactance.Position = [217 119 28 17];
            app.EditFieldubWireReactance.Value = 10;

            % Create NoreflectionCheckBox
            app.NoreflectionCheckBox = uicheckbox(app.uibuttongroup10);
            app.NoreflectionCheckBox.Tooltip = {'Optimize such that there will be no propagating reflected waves.'};
            app.NoreflectionCheckBox.Text = 'No reflection';
            app.NoreflectionCheckBox.Position = [14 27 89 22];

            % Create NotransmissionCheckBox
            app.NotransmissionCheckBox = uicheckbox(app.uibuttongroup10);
            app.NotransmissionCheckBox.Tooltip = {'Optimize such that there will be no propagating transmitted waves.'};
            app.NotransmissionCheckBox.Text = 'No transmission';
            app.NotransmissionCheckBox.Position = [144 29 108 22];

            % Create reflectedPowerLabel
            app.reflectedPowerLabel = uilabel(app.uibuttongroup10);
            app.reflectedPowerLabel.Tooltip = {'The total power reflected averaged over all target modes during optimization. When not during optimization, the total propagating power reflected.'};
            app.reflectedPowerLabel.Position = [28 4 50 22];
            app.reflectedPowerLabel.Text = '.000';

            % Create transmittedPowerLabel
            app.transmittedPowerLabel = uilabel(app.uibuttongroup10);
            app.transmittedPowerLabel.Tooltip = {'The total power transmitted averaged over all target modes during optimization.'};
            app.transmittedPowerLabel.Position = [184 4 50 22];
            app.transmittedPowerLabel.Text = '.000';

            % Create target0Label
            app.target0Label = uilabel(app.uibuttongroup10);
            app.target0Label.Tooltip = {'The target is to make this 0 during optimization.'};
            app.target0Label.Position = [106 4 50 22];
            app.target0Label.Text = '.000';

            % Create EditFieldlbWk
            app.EditFieldlbWk = uieditfield(app.uibuttongroup10, 'numeric');
            app.EditFieldlbWk.Limits = [0 Inf];
            app.EditFieldlbWk.HorizontalAlignment = 'center';
            app.EditFieldlbWk.Tooltip = {'Lower bound of Wk (in mil) when the Wk checkbox is checked.'};
            app.EditFieldlbWk.Position = [175 100 28 17];

            % Create EditFieldubWk
            app.EditFieldubWk = uieditfield(app.uibuttongroup10, 'numeric');
            app.EditFieldubWk.Limits = [0 Inf];
            app.EditFieldubWk.HorizontalAlignment = 'center';
            app.EditFieldubWk.Tooltip = {'Upperbound of Wk (in mil) when the Wk checkbox is checked.'};
            app.EditFieldubWk.Position = [217 99 28 17];
            app.EditFieldubWk.Value = 120;

            % Create WkLabel
            app.WkLabel = uilabel(app.uibuttongroup10);
            app.WkLabel.Position = [144 96 25 22];
            app.WkLabel.Text = 'Wk';

            % Create ExhaustiveButton
            app.ExhaustiveButton = uibutton(app.uibuttongroup10, 'push');
            app.ExhaustiveButton.ButtonPushedFcn = createCallbackFcn(app, @exhaustivePushbuttonCallback, true);
            app.ExhaustiveButton.Tooltip = {'Perform an exhaustive search instead of optimization. The length of each Wk will be incrmented by dmil.'};
            app.ExhaustiveButton.Position = [7 94 66 27];
            app.ExhaustiveButton.Text = 'Exhaustive';

            % Create dmilnumEdit
            app.dmilnumEdit = uieditfield(app.uibuttongroup10, 'numeric');
            app.dmilnumEdit.Limits = [0.0001 Inf];
            app.dmilnumEdit.Tooltip = {'The increment in mil for the exhaustive search.'};
            app.dmilnumEdit.Position = [83 97 39 21];
            app.dmilnumEdit.Value = 3;

            % Create distributeRandomlyPushButton
            app.distributeRandomlyPushButton = uibutton(app.uibuttongroup3, 'push');
            app.distributeRandomlyPushButton.ButtonPushedFcn = createCallbackFcn(app, @distributeRandomlyPushButton_Callback, true);
            app.distributeRandomlyPushButton.Tag = 'distributeRandomlyPushButton';
            app.distributeRandomlyPushButton.FontSize = 16;
            app.distributeRandomlyPushButton.Tooltip = 'Randomly distribute the parameters included in optimization';
            app.distributeRandomlyPushButton.Position = [10 661 150 30];
            app.distributeRandomlyPushButton.Text = 'distribute randomly';

            % Create targetModeOptimizationButtonGroup
            app.targetModeOptimizationButtonGroup = uibuttongroup(app.uibuttongroup3);
            app.targetModeOptimizationButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @targetModeOptimizationButtonGroup_SelectionChangedFcn, true);
            app.targetModeOptimizationButtonGroup.Title = 'Optimization for Target Modes';
            app.targetModeOptimizationButtonGroup.Tag = 'targetModeOptimizationButtonGroup';
            app.targetModeOptimizationButtonGroup.FontSize = 10.6666666666667;
            app.targetModeOptimizationButtonGroup.Position = [18 120 258 178];

            % Create targetOptimAngle1text
            app.targetOptimAngle1text = uilabel(app.targetModeOptimizationButtonGroup);
            app.targetOptimAngle1text.Tag = 'targetOptimAngle1text';
            app.targetOptimAngle1text.HorizontalAlignment = 'center';
            app.targetOptimAngle1text.VerticalAlignment = 'top';
            app.targetOptimAngle1text.WordWrap = 'on';
            app.targetOptimAngle1text.FontSize = 16;
            app.targetOptimAngle1text.Tooltip = 'The beam angle (deg) for this mode.';
            app.targetOptimAngle1text.Position = [63 62 48 24];
            app.targetOptimAngle1text.Text = '-12';

            % Create targetOptimEfficiency1Text
            app.targetOptimEfficiency1Text = uilabel(app.targetModeOptimizationButtonGroup);
            app.targetOptimEfficiency1Text.Tag = 'targetOptimEfficiency1Text';
            app.targetOptimEfficiency1Text.HorizontalAlignment = 'center';
            app.targetOptimEfficiency1Text.VerticalAlignment = 'top';
            app.targetOptimEfficiency1Text.WordWrap = 'on';
            app.targetOptimEfficiency1Text.FontSize = 16;
            app.targetOptimEfficiency1Text.Position = [116 62 62 24];
            app.targetOptimEfficiency1Text.Text = '.000';

            % Create text133
            app.text133 = uilabel(app.targetModeOptimizationButtonGroup);
            app.text133.Tag = 'text133';
            app.text133.HorizontalAlignment = 'center';
            app.text133.VerticalAlignment = 'top';
            app.text133.WordWrap = 'on';
            app.text133.FontSize = 10.6666666666667;
            app.text133.Position = [7 88 54 15];
            app.text133.Text = 'mode no.';

            % Create text134
            app.text134 = uilabel(app.targetModeOptimizationButtonGroup);
            app.text134.Tag = 'text134';
            app.text134.HorizontalAlignment = 'center';
            app.text134.VerticalAlignment = 'top';
            app.text134.WordWrap = 'on';
            app.text134.FontSize = 10.6666666666667;
            app.text134.Position = [66 88 33 14];
            app.text134.Text = 'angle';

            % Create text135
            app.text135 = uilabel(app.targetModeOptimizationButtonGroup);
            app.text135.Tag = 'text135';
            app.text135.HorizontalAlignment = 'center';
            app.text135.VerticalAlignment = 'top';
            app.text135.WordWrap = 'on';
            app.text135.FontSize = 10.6666666666667;
            app.text135.Position = [116 88 53 15];
            app.text135.Text = 'efficiency';

            % Create mode2EfficiencyText
            app.mode2EfficiencyText = uilabel(app.targetModeOptimizationButtonGroup);
            app.mode2EfficiencyText.Tag = 'mode2EfficiencyText';
            app.mode2EfficiencyText.HorizontalAlignment = 'center';
            app.mode2EfficiencyText.VerticalAlignment = 'top';
            app.mode2EfficiencyText.WordWrap = 'on';
            app.mode2EfficiencyText.FontSize = 16;
            app.mode2EfficiencyText.Position = [128 25 75 24];
            app.mode2EfficiencyText.Text = '';

            % Create modenoSpinnerLabel
            app.modenoSpinnerLabel = uilabel(app.targetModeOptimizationButtonGroup);
            app.modenoSpinnerLabel.HorizontalAlignment = 'right';
            app.modenoSpinnerLabel.Position = [11 128 55 22];
            app.modenoSpinnerLabel.Text = 'mode no.';

            % Create modenoSpinner
            app.modenoSpinner = uispinner(app.targetModeOptimizationButtonGroup);
            app.modenoSpinner.Limits = [1 1];
            app.modenoSpinner.ValueChangedFcn = createCallbackFcn(app, @optimModeSeqNumEdit_Callback, true);
            app.modenoSpinner.Position = [70 128 52 22];
            app.modenoSpinner.Value = 1;

            % Create NomodesSpinnerLabel
            app.NomodesSpinnerLabel = uilabel(app.targetModeOptimizationButtonGroup);
            app.NomodesSpinnerLabel.HorizontalAlignment = 'right';
            app.NomodesSpinnerLabel.Position = [134 126 63 22];
            app.NomodesSpinnerLabel.Text = 'No. modes';

            % Create NomodesSpinner
            app.NomodesSpinner = uispinner(app.targetModeOptimizationButtonGroup);
            app.NomodesSpinner.Limits = [1 Inf];
            app.NomodesSpinner.ValueChangedFcn = createCallbackFcn(app, @numOptimModesEdit_Callback, true);
            app.NomodesSpinner.Position = [200 126 51 24];
            app.NomodesSpinner.Value = 1;

            % Create savePushButton
            app.savePushButton = uibutton(app.targetModeOptimizationButtonGroup, 'push');
            app.savePushButton.ButtonPushedFcn = createCallbackFcn(app, @saveTargetModeInfo_callback, true);
            app.savePushButton.Tag = 'savePushButton';
            app.savePushButton.FontSize = 10.6666666666667;
            app.savePushButton.Position = [178 94 69 22.9999999999999];
            app.savePushButton.Text = 'Save';

            % Create undefinedLabel
            app.undefinedLabel = uilabel(app.targetModeOptimizationButtonGroup);
            app.undefinedLabel.Tooltip = {'Specifies whether parameters for this mode have been defined.'};
            app.undefinedLabel.Position = [104 106 58 15];
            app.undefinedLabel.Text = 'undefined';

            % Create mode2EffiencyLabel
            app.mode2EffiencyLabel = uilabel(app.targetModeOptimizationButtonGroup);
            app.mode2EffiencyLabel.HorizontalAlignment = 'center';
            app.mode2EffiencyLabel.Tooltip = {'The efficiencies of modes other than the first during optimization.'};
            app.mode2EffiencyLabel.Position = [12 34 38 22];
            app.mode2EffiencyLabel.Text = '.000';

            % Create mode3EffiencyLabel
            app.mode3EffiencyLabel = uilabel(app.targetModeOptimizationButtonGroup);
            app.mode3EffiencyLabel.HorizontalAlignment = 'center';
            app.mode3EffiencyLabel.Tooltip = {'The efficiencies of modes other than the first during optimization.'};
            app.mode3EffiencyLabel.Position = [57 34 38 22];
            app.mode3EffiencyLabel.Text = '.000';

            % Create mode4EffiencyLabel
            app.mode4EffiencyLabel = uilabel(app.targetModeOptimizationButtonGroup);
            app.mode4EffiencyLabel.HorizontalAlignment = 'center';
            app.mode4EffiencyLabel.Tooltip = {'The efficiencies of modes other than the first during optimization.'};
            app.mode4EffiencyLabel.Position = [102 34 38 22];
            app.mode4EffiencyLabel.Text = '.000';

            % Create mode5EffiencyLabel
            app.mode5EffiencyLabel = uilabel(app.targetModeOptimizationButtonGroup);
            app.mode5EffiencyLabel.HorizontalAlignment = 'center';
            app.mode5EffiencyLabel.Tooltip = {'The efficiencies of modes other than the first during optimization.'};
            app.mode5EffiencyLabel.Position = [151 34 38 22];
            app.mode5EffiencyLabel.Text = '.000';

            % Create mode6EffiencyLabel
            app.mode6EffiencyLabel = uilabel(app.targetModeOptimizationButtonGroup);
            app.mode6EffiencyLabel.HorizontalAlignment = 'center';
            app.mode6EffiencyLabel.Tooltip = {'The efficiencies of modes other than the first during optimization.'};
            app.mode6EffiencyLabel.Position = [201 34 38 22];
            app.mode6EffiencyLabel.Text = '.000';

            % Create undefinePushButton
            app.undefinePushButton = uibutton(app.targetModeOptimizationButtonGroup, 'push');
            app.undefinePushButton.ButtonPushedFcn = createCallbackFcn(app, @undefinePushButtonCallback, true);
            app.undefinePushButton.Tag = 'savePushButton';
            app.undefinePushButton.FontSize = 10.6666666666667;
            app.undefinePushButton.Position = [178 67 69 23];
            app.undefinePushButton.Text = 'Undefine';

            % Create incrementdisplayCheckBox
            app.incrementdisplayCheckBox = uicheckbox(app.targetModeOptimizationButtonGroup);
            app.incrementdisplayCheckBox.Tooltip = {'For documentation or presentation purposes this allows the display to be  shown in increments when going from one mode to another using the "mode no." spinner.'};
            app.incrementdisplayCheckBox.Text = 'increment display';
            app.incrementdisplayCheckBox.Position = [8 9 115 22];

            % Create NoincrSpinnerLabel
            app.NoincrSpinnerLabel = uilabel(app.targetModeOptimizationButtonGroup);
            app.NoincrSpinnerLabel.HorizontalAlignment = 'right';
            app.NoincrSpinnerLabel.Position = [139 10 49 22];
            app.NoincrSpinnerLabel.Text = 'No. incr.';

            % Create NoincrSpinner
            app.NoincrSpinner = uispinner(app.targetModeOptimizationButtonGroup);
            app.NoincrSpinner.Limits = [1 Inf];
            app.NoincrSpinner.Position = [194 10 52 22];
            app.NoincrSpinner.Value = 1;

            % Create WtEditFieldLabel
            app.WtEditFieldLabel = uilabel(app.targetModeOptimizationButtonGroup);
            app.WtEditFieldLabel.HorizontalAlignment = 'right';
            app.WtEditFieldLabel.Position = [5 109 23 22];
            app.WtEditFieldLabel.Text = 'Wt';

            % Create WtEditField
            app.WtEditField = uieditfield(app.targetModeOptimizationButtonGroup, 'numeric');
            app.WtEditField.Limits = [0 Inf];
            app.WtEditField.Tooltip = {'The weight given to this mode in the optimization. Default: 1.'};
            app.WtEditField.Position = [38 111 27 17];
            app.WtEditField.Value = 1;

            % Create lsqnonlin2PushButton
            app.lsqnonlin2PushButton = uibutton(app.uibuttongroup3, 'push');
            app.lsqnonlin2PushButton.ButtonPushedFcn = createCallbackFcn(app, @lsqnonlin2PushButton_Callback, true);
            app.lsqnonlin2PushButton.Tag = 'lsqnonlin2PushButton';
            app.lsqnonlin2PushButton.FontSize = 16;
            app.lsqnonlin2PushButton.Tooltip = 'Perform optimization using lsqnonlin for 1 beam.';
            app.lsqnonlin2PushButton.Position = [16 626 150 26];
            app.lsqnonlin2PushButton.Text = 'lsqnonlin (1 beam)';

            % Create quitOptimCheckBox
            app.quitOptimCheckBox = uicheckbox(app.uibuttongroup3);
            app.quitOptimCheckBox.ValueChangedFcn = createCallbackFcn(app, @quitOptimCheckBox_Callback, true);
            app.quitOptimCheckBox.Tag = 'quitOptimCheckBox';
            app.quitOptimCheckBox.Enable = 'off';
            app.quitOptimCheckBox.Tooltip = 'Click to stop current optimization.';
            app.quitOptimCheckBox.Text = 'quit';
            app.quitOptimCheckBox.FontSize = 16;
            app.quitOptimCheckBox.Position = [200 672 53 23];

            % Create compareLocCheckBox
            app.compareLocCheckBox = uicheckbox(app.uibuttongroup3);
            app.compareLocCheckBox.ValueChangedFcn = createCallbackFcn(app, @compareLocCheckBox_Callback, true);
            app.compareLocCheckBox.Tag = 'compareLocCheckBox';
            app.compareLocCheckBox.Tooltip = 'Compare the wire locations of next data file with the current locations. This will only be done if the number of media is the same. ';
            app.compareLocCheckBox.Text = 'Compare Loc.';
            app.compareLocCheckBox.FontSize = 10.6666666666667;
            app.compareLocCheckBox.Position = [27 94 95 27];

            % Create avgLocDif
            app.avgLocDif = uilabel(app.uibuttongroup3);
            app.avgLocDif.Tag = 'avgLocDif';
            app.avgLocDif.HorizontalAlignment = 'center';
            app.avgLocDif.VerticalAlignment = 'top';
            app.avgLocDif.WordWrap = 'on';
            app.avgLocDif.FontSize = 10.6666666666667;
            app.avgLocDif.Tooltip = 'When Compare Loc is checked, the average location difference per wire per period.';
            app.avgLocDif.Position = [127 -36 68 20];
            app.avgLocDif.Text = '';

            % Create text153
            app.text153 = uilabel(app.uibuttongroup3);
            app.text153.Tag = 'text153';
            app.text153.HorizontalAlignment = 'center';
            app.text153.VerticalAlignment = 'top';
            app.text153.WordWrap = 'on';
            app.text153.FontSize = 10.6666666666667;
            app.text153.Position = [129 98 82 19];
            app.text153.Text = 'Avg. Loc. Diff.';

            % Create uibuttongroup14
            app.uibuttongroup14 = uibuttongroup(app.uibuttongroup3);
            app.uibuttongroup14.Title = 'MonteCarlo';
            app.uibuttongroup14.Tag = 'uibuttongroup14';
            app.uibuttongroup14.FontSize = 10.6666666666667;
            app.uibuttongroup14.Position = [19 8 265 88];

            % Create text155
            app.text155 = uilabel(app.uibuttongroup14);
            app.text155.Tag = 'text155';
            app.text155.HorizontalAlignment = 'center';
            app.text155.VerticalAlignment = 'top';
            app.text155.WordWrap = 'on';
            app.text155.FontSize = 10.6666666666667;
            app.text155.Position = [10 19 50 19];
            app.text155.Text = 'Std. Dev.';

            % Create stdDevEdit
            app.stdDevEdit = uieditfield(app.uibuttongroup14, 'text');
            app.stdDevEdit.Tag = 'stdDevEdit';
            app.stdDevEdit.HorizontalAlignment = 'center';
            app.stdDevEdit.FontSize = 10.6666666666667;
            app.stdDevEdit.Tooltip = 'standard deviation for Monte Carlo.';
            app.stdDevEdit.Position = [11 39 51 22];
            app.stdDevEdit.Value = '0.01';

            % Create text156
            app.text156 = uilabel(app.uibuttongroup14);
            app.text156.Tag = 'text156';
            app.text156.HorizontalAlignment = 'center';
            app.text156.VerticalAlignment = 'top';
            app.text156.WordWrap = 'on';
            app.text156.FontSize = 10.6666666666667;
            app.text156.Position = [73 19 57 18];
            app.text156.Text = 'N Samples';

            % Create NsamplesEdit
            app.NsamplesEdit = uieditfield(app.uibuttongroup14, 'text');
            app.NsamplesEdit.Tag = 'NsamplesEdit';
            app.NsamplesEdit.HorizontalAlignment = 'center';
            app.NsamplesEdit.FontSize = 10.6666666666667;
            app.NsamplesEdit.Tooltip = 'Number of samples for Monte Carlo';
            app.NsamplesEdit.Position = [74 39 51 22];
            app.NsamplesEdit.Value = '100';

            % Create startMonteCarloPushButton
            app.startMonteCarloPushButton = uibutton(app.uibuttongroup14, 'push');
            app.startMonteCarloPushButton.ButtonPushedFcn = createCallbackFcn(app, @startMonteCarloPushButton_Callback, true);
            app.startMonteCarloPushButton.Tag = 'startMonteCarloPushButton';
            app.startMonteCarloPushButton.FontSize = 10.6666666666667;
            app.startMonteCarloPushButton.Tooltip = 'Start Monte Carlo Calculations';
            app.startMonteCarloPushButton.Position = [203 40 51 24];
            app.startMonteCarloPushButton.Text = 'start';

            % Create MonteCarloCancelCheckBox
            app.MonteCarloCancelCheckBox = uicheckbox(app.uibuttongroup14);
            app.MonteCarloCancelCheckBox.Tag = 'MonteCarloCancelCheckBox';
            app.MonteCarloCancelCheckBox.Text = 'Cancel';
            app.MonteCarloCancelCheckBox.FontSize = 10.6666666666667;
            app.MonteCarloCancelCheckBox.Position = [197 16 61 23];

            % Create MonteCarloCurrentSampleText
            app.MonteCarloCurrentSampleText = uilabel(app.uibuttongroup14);
            app.MonteCarloCurrentSampleText.Tag = 'MonteCarloCurrentSampleText';
            app.MonteCarloCurrentSampleText.HorizontalAlignment = 'center';
            app.MonteCarloCurrentSampleText.VerticalAlignment = 'top';
            app.MonteCarloCurrentSampleText.WordWrap = 'on';
            app.MonteCarloCurrentSampleText.FontSize = 10.6666666666667;
            app.MonteCarloCurrentSampleText.Tooltip = 'The current sample number being worked on.';
            app.MonteCarloCurrentSampleText.Position = [144 44 53 16];
            app.MonteCarloCurrentSampleText.Text = '0';

            % Create texttt
            app.texttt = uilabel(app.uibuttongroup14);
            app.texttt.Tag = 'texttt';
            app.texttt.HorizontalAlignment = 'center';
            app.texttt.VerticalAlignment = 'top';
            app.texttt.WordWrap = 'on';
            app.texttt.FontSize = 10.6666666666667;
            app.texttt.Position = [137 21 54 15];
            app.texttt.Text = 'cur. samp.';

            % Create offsetRadioButton
            app.offsetRadioButton = uiradiobutton(app.uibuttongroup14);
            app.offsetRadioButton.Tag = 'offsetRadioButton';
            app.offsetRadioButton.Tooltip = {'The deviation will be of the offset of the wire.'};
            app.offsetRadioButton.Text = 'offset';
            app.offsetRadioButton.FontSize = 10.6666666666667;
            app.offsetRadioButton.Position = [28 0 61 23];
            app.offsetRadioButton.Value = true;

            % Create airWidthRadioButton
            app.airWidthRadioButton = uiradiobutton(app.uibuttongroup14);
            app.airWidthRadioButton.Tag = 'airWidthRadioButton';
            app.airWidthRadioButton.Tooltip = {'The deviation will be of the width of the air layers (if present).'};
            app.airWidthRadioButton.Text = 'air width';
            app.airWidthRadioButton.FontSize = 10.6666666666667;
            app.airWidthRadioButton.Position = [85 1 62 23];

            % Create stopOptimLoopCheckBox
            app.stopOptimLoopCheckBox = uicheckbox(app.uibuttongroup3);
            app.stopOptimLoopCheckBox.Tag = 'stopOptimLoopCheckBox';
            app.stopOptimLoopCheckBox.Enable = 'off';
            app.stopOptimLoopCheckBox.Tooltip = 'Click to stop multiple loop.';
            app.stopOptimLoopCheckBox.Text = 'stop';
            app.stopOptimLoopCheckBox.FontSize = 16;
            app.stopOptimLoopCheckBox.Position = [202 646 57 31];

            % Create multipleTimesCheckBox
            app.multipleTimesCheckBox = uicheckbox(app.uibuttongroup3);
            app.multipleTimesCheckBox.Tag = 'multipleTimesCheckBox';
            app.multipleTimesCheckBox.Tooltip = 'Perform the multiple optim methods multiple times, each time distributing the variables randomly.';
            app.multipleTimesCheckBox.Text = 'multiple times';
            app.multipleTimesCheckBox.FontSize = 16;
            app.multipleTimesCheckBox.Position = [23 595 115 31];

            % Create minEffEdit
            app.minEffEdit = uieditfield(app.uibuttongroup3, 'text');
            app.minEffEdit.Tag = 'minEffEdit';
            app.minEffEdit.HorizontalAlignment = 'center';
            app.minEffEdit.FontSize = 16;
            app.minEffEdit.Tooltip = 'For writing data after optimization. The minimum efficiency result below which do not write data.';
            app.minEffEdit.Position = [13 577 45 22];
            app.minEffEdit.Value = '0';

            % Create text144
            app.text144 = uilabel(app.uibuttongroup3);
            app.text144.Tag = 'text144';
            app.text144.HorizontalAlignment = 'center';
            app.text144.VerticalAlignment = 'top';
            app.text144.WordWrap = 'on';
            app.text144.FontSize = 10.6666666666667;
            app.text144.Position = [9 557 59 18];
            app.text144.Text = 'min. eff.';

            % Create maxEffEdit
            app.maxEffEdit = uieditfield(app.uibuttongroup3, 'text');
            app.maxEffEdit.Tag = 'maxEffEdit';
            app.maxEffEdit.HorizontalAlignment = 'center';
            app.maxEffEdit.FontSize = 16;
            app.maxEffEdit.Tooltip = 'For writing data after optimization. The maximum efficiency result above which always write data.';
            app.maxEffEdit.Position = [67 577 41 22];
            app.maxEffEdit.Value = '1';

            % Create text145
            app.text145 = uilabel(app.uibuttongroup3);
            app.text145.Tag = 'text145';
            app.text145.HorizontalAlignment = 'center';
            app.text145.VerticalAlignment = 'top';
            app.text145.WordWrap = 'on';
            app.text145.FontSize = 10.6666666666667;
            app.text145.Position = [75 557 45 18];
            app.text145.Text = 'max. eff.';

            % Create numTimesLabel
            app.numTimesLabel = uilabel(app.uibuttongroup3);
            app.numTimesLabel.Tooltip = {'when "multiple times" is chosen, the number of times this optimization has been run since the "lsqnonlin" button has been pressed.'};
            app.numTimesLabel.Position = [144 600 28 22];
            app.numTimesLabel.Text = '.000';

            % Create realT0Edit
            app.realT0Edit = uieditfield(app.uibuttongroup3, 'numeric');
            app.realT0Edit.Tooltip = {'Usually the efficiency is optimized as given in the "optimzation for target modes" frame. But instead of the efficiency (power), the field can bee used. That is, the configuration will be optimized to provide a transmitted field = Re(T0)+iIm(T0).'};
            app.realT0Edit.Position = [184 579 45 16];

            % Create text144_2
            app.text144_2 = uilabel(app.uibuttongroup3);
            app.text144_2.Tag = 'text144';
            app.text144_2.HorizontalAlignment = 'center';
            app.text144_2.VerticalAlignment = 'top';
            app.text144_2.WordWrap = 'on';
            app.text144_2.FontSize = 10.6666666666667;
            app.text144_2.Position = [186 563 44 16];
            app.text144_2.Text = 'Re(T0)';

            % Create ImagT0Edit
            app.ImagT0Edit = uieditfield(app.uibuttongroup3, 'numeric');
            app.ImagT0Edit.Tooltip = {'Usually the efficiency is optimized as given in the "optimzation for target modes" frame. But instead of the efficiency (power), the field can bee used. That is, the configuration will be optimized to provide a transmitted field = Re(T0)+iIm(T0).'};
            app.ImagT0Edit.Position = [237 578 45 16];

            % Create text144_3
            app.text144_3 = uilabel(app.uibuttongroup3);
            app.text144_3.Tag = 'text144';
            app.text144_3.HorizontalAlignment = 'center';
            app.text144_3.VerticalAlignment = 'top';
            app.text144_3.WordWrap = 'on';
            app.text144_3.FontSize = 10.6666666666667;
            app.text144_3.Position = [239 563 44 15];
            app.text144_3.Text = 'Im(T0)';

            % Create realZEdit
            app.realZEdit = uieditfield(app.uibuttongroup3, 'numeric');
            app.realZEdit.Tooltip = {'-999 is NaN.'};
            app.realZEdit.Position = [171 541 45 16];

            % Create text144_4
            app.text144_4 = uilabel(app.uibuttongroup3);
            app.text144_4.Tag = 'text144';
            app.text144_4.HorizontalAlignment = 'center';
            app.text144_4.VerticalAlignment = 'top';
            app.text144_4.WordWrap = 'on';
            app.text144_4.FontSize = 10.6666666666667;
            app.text144_4.Position = [173 517 44 22];
            app.text144_4.Text = 'Re(Z)';

            % Create ImagZEdit
            app.ImagZEdit = uieditfield(app.uibuttongroup3, 'numeric');
            app.ImagZEdit.Tooltip = {'-999 is NaN.'};
            app.ImagZEdit.Position = [234 540 45 16];

            % Create text144_5
            app.text144_5 = uilabel(app.uibuttongroup3);
            app.text144_5.Tag = 'text144';
            app.text144_5.HorizontalAlignment = 'center';
            app.text144_5.VerticalAlignment = 'top';
            app.text144_5.WordWrap = 'on';
            app.text144_5.FontSize = 10.6666666666667;
            app.text144_5.Position = [236 516 44 22];
            app.text144_5.Text = 'Im(Z)';

            % Create RaviCheckBox
            app.RaviCheckBox = uicheckbox(app.uibuttongroup3);
            app.RaviCheckBox.ValueChangedFcn = createCallbackFcn(app, @RaviCheckBoxCallback, true);
            app.RaviCheckBox.Tooltip = {'Turn on the option to use optimization to find the real and imag values of impedance Z for values of capcitor width Wk given as a function of field transmission T0 in a file from CST given in "T file name". If this  file is not defined, then the values Re(T0) and Im(T0) will be used.'};
            app.RaviCheckBox.Text = 'Ravi';
            app.RaviCheckBox.Position = [238 631 46 22];

            % Create TCoefFileEdit
            app.TCoefFileEdit = uieditfield(app.uibuttongroup3, 'text');
            app.TCoefFileEdit.Tooltip = {'Name of file containing the transmission coefficient T values obtained from CST. If blank, the values of T0 listed will be used. This may be defined from the file menu by choosing a .txt file.'};
            app.TCoefFileEdit.Position = [21 543 140 17];

            % Create text144_6
            app.text144_6 = uilabel(app.uibuttongroup3);
            app.text144_6.Tag = 'text144';
            app.text144_6.HorizontalAlignment = 'center';
            app.text144_6.VerticalAlignment = 'top';
            app.text144_6.WordWrap = 'on';
            app.text144_6.FontSize = 10.6666666666667;
            app.text144_6.Position = [75 514 62 26];
            app.text144_6.Text = 'T file name';

            % Create WkCheckBox
            app.WkCheckBox = uicheckbox(app.uibuttongroup3);
            app.WkCheckBox.ValueChangedFcn = createCallbackFcn(app, @WkCheckboxCallback, true);
            app.WkCheckBox.Tooltip = {'During optimization, use Wk instead of Z. To use this, Z must be defined as a function of Wk in a function Z=Wk2Z(n,Wk).'};
            app.WkCheckBox.Text = 'Wk';
            app.WkCheckBox.Position = [186 631 39 22];

            % Create LUTCheckBox
            app.LUTCheckBox = uicheckbox(app.uibuttongroup3);
            app.LUTCheckBox.ValueChangedFcn = createCallbackFcn(app, @LUTcheckboxCallback, true);
            app.LUTCheckBox.Tooltip = {'Create a Look-Up_Table when running optimization. This will require that Wk and multiple times be checked. During optimization, RE(t0) and Im(T0) will be filled in.'};
            app.LUTCheckBox.Text = 'LUT';
            app.LUTCheckBox.Position = [126 576 45 22];

            % Create magT0Edit
            app.magT0Edit = uieditfield(app.uibuttongroup3, 'numeric');
            app.magT0Edit.ValueChangedFcn = createCallbackFcn(app, @magPhaseT0EditCallback, true);
            app.magT0Edit.Tooltip = {'Usually the efficiency is optimized as given in the "optimzation for target modes" frame. But instead of the efficiency (power), the field can bee used. That is, the configuration will be optimized to provide a transmitted field = Re(T0)+iIm(T0).'};
            app.magT0Edit.Position = [186 614 45 16];

            % Create text144_7
            app.text144_7 = uilabel(app.uibuttongroup3);
            app.text144_7.Tag = 'text144';
            app.text144_7.HorizontalAlignment = 'center';
            app.text144_7.VerticalAlignment = 'top';
            app.text144_7.WordWrap = 'on';
            app.text144_7.FontSize = 10.6666666666667;
            app.text144_7.Position = [188 592 44 22];
            app.text144_7.Text = '|T0|';

            % Create phaseT0Edit
            app.phaseT0Edit = uieditfield(app.uibuttongroup3, 'numeric');
            app.phaseT0Edit.ValueChangedFcn = createCallbackFcn(app, @magPhaseT0EditCallback, true);
            app.phaseT0Edit.Tooltip = {'Usually the efficiency is optimized as given in the "optimzation for target modes" frame. But instead of the efficiency (power), the field can bee used. That is, the configuration will be optimized to provide a transmitted field = Re(T0)+iIm(T0).'};
            app.phaseT0Edit.Position = [239 613 45 16];

            % Create text144_8
            app.text144_8 = uilabel(app.uibuttongroup3);
            app.text144_8.Tag = 'text144';
            app.text144_8.HorizontalAlignment = 'center';
            app.text144_8.VerticalAlignment = 'top';
            app.text144_8.WordWrap = 'on';
            app.text144_8.FontSize = 10.6666666666667;
            app.text144_8.Position = [241 591 44 22];
            app.text144_8.Text = '∠(T0)';

            % Create coupleMedium2Edit
            app.coupleMedium2Edit = uieditfield(app.figure1, 'text');
            app.coupleMedium2Edit.ValueChangedFcn = createCallbackFcn(app, @coupleMedium2Edit_Callback, true);
            app.coupleMedium2Edit.Tag = 'coupleMedium2Edit';
            app.coupleMedium2Edit.HorizontalAlignment = 'center';
            app.coupleMedium2Edit.FontSize = 16;
            app.coupleMedium2Edit.Position = [113 731 38 22];
            app.coupleMedium2Edit.Value = '1';

            % Create freezeAxisCheckBox
            app.freezeAxisCheckBox = uicheckbox(app.figure1);
            app.freezeAxisCheckBox.ValueChangedFcn = createCallbackFcn(app, @freezeAxisCheckBox_Callback, true);
            app.freezeAxisCheckBox.Tag = 'freezeAxisCheckBox';
            app.freezeAxisCheckBox.Tooltip = 'When checked, the vertical scale of the axis will remain fixed.';
            app.freezeAxisCheckBox.Text = 'Freeze axis';
            app.freezeAxisCheckBox.FontSize = 10.6666666666667;
            app.freezeAxisCheckBox.Position = [231 714 87 23];

            % Create chooseFiguresPushButton
            app.chooseFiguresPushButton = uibutton(app.figure1, 'push');
            app.chooseFiguresPushButton.ButtonPushedFcn = createCallbackFcn(app, @chooseFiguresPushButton_Callback, true);
            app.chooseFiguresPushButton.Tag = 'chooseFiguresPushButton';
            app.chooseFiguresPushButton.FontSize = 10.6666666666667;
            app.chooseFiguresPushButton.Position = [1118 310 89 24];
            app.chooseFiguresPushButton.Text = 'Choose figures';

            % Create dataFileText
            app.dataFileText = uilabel(app.figure1);
            app.dataFileText.Tag = 'dataFileText';
            app.dataFileText.HorizontalAlignment = 'center';
            app.dataFileText.VerticalAlignment = 'top';
            app.dataFileText.WordWrap = 'on';
            app.dataFileText.FontSize = 10.6666666666667;
            app.dataFileText.Position = [11 821 114 16];
            app.dataFileText.Text = 'out.dat';

            % Create plotLayersPushButton
            app.plotLayersPushButton = uibutton(app.figure1, 'push');
            app.plotLayersPushButton.ButtonPushedFcn = createCallbackFcn(app, @plotLayersPushButton_Callback, true);
            app.plotLayersPushButton.Tag = 'plotLayersPushButton';
            app.plotLayersPushButton.FontSize = 16;
            app.plotLayersPushButton.Position = [1116 269 88 30];
            app.plotLayersPushButton.Text = 'Plot layers';

            % Create text82
            app.text82 = uilabel(app.figure1);
            app.text82.Tag = 'text82';
            app.text82.HorizontalAlignment = 'center';
            app.text82.VerticalAlignment = 'top';
            app.text82.WordWrap = 'on';
            app.text82.FontSize = 16;
            app.text82.Position = [1120 409 133 22.9999999999999];
            app.text82.Text = 'transmission amp.';

            % Create tauMagEdit
            app.tauMagEdit = uieditfield(app.figure1, 'text');
            app.tauMagEdit.Tag = 'tauMagEdit';
            app.tauMagEdit.HorizontalAlignment = 'center';
            app.tauMagEdit.FontSize = 16;
            app.tauMagEdit.Position = [1122 387 52 22];
            app.tauMagEdit.Value = '0.85';

            % Create tauPhaseIniEdit
            app.tauPhaseIniEdit = uieditfield(app.figure1, 'text');
            app.tauPhaseIniEdit.Tag = 'tauPhaseIniEdit';
            app.tauPhaseIniEdit.HorizontalAlignment = 'center';
            app.tauPhaseIniEdit.FontSize = 16;
            app.tauPhaseIniEdit.Position = [1190 387 35 22];
            app.tauPhaseIniEdit.Value = '5';

            % Create tauPhaseFinEdit
            app.tauPhaseFinEdit = uieditfield(app.figure1, 'text');
            app.tauPhaseFinEdit.Tag = 'tauPhaseFinEdit';
            app.tauPhaseFinEdit.HorizontalAlignment = 'center';
            app.tauPhaseFinEdit.FontSize = 16;
            app.tauPhaseFinEdit.Position = [1235 387 35 22];
            app.tauPhaseFinEdit.Value = '5';

            % Create text83
            app.text83 = uilabel(app.figure1);
            app.text83.Tag = 'text83';
            app.text83.HorizontalAlignment = 'center';
            app.text83.VerticalAlignment = 'top';
            app.text83.WordWrap = 'on';
            app.text83.FontSize = 16;
            app.text83.Position = [1128 361 41 22];
            app.text83.Text = 'mag';

            % Create text84
            app.text84 = uilabel(app.figure1);
            app.text84.Tag = 'text84';
            app.text84.HorizontalAlignment = 'center';
            app.text84.VerticalAlignment = 'top';
            app.text84.WordWrap = 'on';
            app.text84.FontSize = 10.6666666666667;
            app.text84.Position = [1199 369 16 16];
            app.text84.Text = 'ini';

            % Create text85
            app.text85 = uilabel(app.figure1);
            app.text85.Tag = 'text85';
            app.text85.HorizontalAlignment = 'center';
            app.text85.VerticalAlignment = 'top';
            app.text85.WordWrap = 'on';
            app.text85.FontSize = 10.6666666666667;
            app.text85.Position = [1243 369 21 16];
            app.text85.Text = 'fin';

            % Create text87
            app.text87 = uilabel(app.figure1);
            app.text87.Tag = 'text87';
            app.text87.HorizontalAlignment = 'center';
            app.text87.VerticalAlignment = 'top';
            app.text87.WordWrap = 'on';
            app.text87.FontSize = 10.6666666666667;
            app.text87.Position = [1319 363 21 16];
            app.text87.Text = 'cur';

            % Create tauCurText
            app.tauCurText = uilabel(app.figure1);
            app.tauCurText.Tag = 'tauCurText';
            app.tauCurText.HorizontalAlignment = 'center';
            app.tauCurText.VerticalAlignment = 'top';
            app.tauCurText.WordWrap = 'on';
            app.tauCurText.FontSize = 16;
            app.tauCurText.Position = [1312 382 33 22];
            app.tauCurText.Text = '5';

            % Create tauPhaseDelEdit
            app.tauPhaseDelEdit = uieditfield(app.figure1, 'text');
            app.tauPhaseDelEdit.Tag = 'tauPhaseDelEdit';
            app.tauPhaseDelEdit.HorizontalAlignment = 'center';
            app.tauPhaseDelEdit.FontSize = 16;
            app.tauPhaseDelEdit.Position = [1278 387 34.9999999999998 22];
            app.tauPhaseDelEdit.Value = '5';

            % Create text89
            app.text89 = uilabel(app.figure1);
            app.text89.Tag = 'text89';
            app.text89.HorizontalAlignment = 'center';
            app.text89.VerticalAlignment = 'top';
            app.text89.WordWrap = 'on';
            app.text89.FontSize = 10.6666666666667;
            app.text89.Position = [1286 368 21 16];
            app.text89.Text = 'del';

            % Create text86
            app.text86 = uilabel(app.figure1);
            app.text86.Tag = 'text86';
            app.text86.HorizontalAlignment = 'center';
            app.text86.VerticalAlignment = 'top';
            app.text86.WordWrap = 'on';
            app.text86.FontSize = 10.6666666666667;
            app.text86.Position = [1209 354 81 15];
            app.text86.Text = 'phase(deg)';

            % Create solvePushButton
            app.solvePushButton = uibutton(app.figure1, 'push');
            app.solvePushButton.ButtonPushedFcn = createCallbackFcn(app, @solvePushButton_Callback, true);
            app.solvePushButton.Tag = 'solvePushButton';
            app.solvePushButton.FontSize = 16;
            app.solvePushButton.Position = [1256 314 68 22];
            app.solvePushButton.Text = 'Solve';

            % Create methodButtonGroup
            app.methodButtonGroup = uibuttongroup(app.figure1);
            app.methodButtonGroup.Title = 'Method';
            app.methodButtonGroup.Tag = 'methodButtonGroup';
            app.methodButtonGroup.FontSize = 10.6666666666667;
            app.methodButtonGroup.Position = [1158 201 157 51];

            % Create method2RadioButton
            app.method2RadioButton = uiradiobutton(app.methodButtonGroup);
            app.method2RadioButton.Tag = 'method2RadioButton';
            app.method2RadioButton.Tooltip = 'To obtain an anti-reflective coating for the current incident angle,  thicknesses of layer 1 and 3 are equal.';
            app.method2RadioButton.Text = '2';
            app.method2RadioButton.FontSize = 10.6666666666667;
            app.method2RadioButton.Position = [56 11 32 23];
            app.method2RadioButton.Value = true;

            % Create method1RadioButton
            app.method1RadioButton = uiradiobutton(app.methodButtonGroup);
            app.method1RadioButton.Tag = 'method1RadioButton';
            app.method1RadioButton.Tooltip = 'To obtain the transmission amplitude and phase listed in this frame, thicknesses of layer 1 and 3 are equal.';
            app.method1RadioButton.Text = '1';
            app.method1RadioButton.FontSize = 10.6666666666667;
            app.method1RadioButton.Position = [9 10 32 23];

            % Create method3RadioButton
            app.method3RadioButton = uiradiobutton(app.methodButtonGroup);
            app.method3RadioButton.Tag = 'method3RadioButton';
            app.method3RadioButton.Tooltip = 'To obtain an anti-reflective coating for the current incident angle,  each layer thickness is independent of the others.';
            app.method3RadioButton.Text = '3';
            app.method3RadioButton.FontSize = 10.6666666666667;
            app.method3RadioButton.Position = [104 11 32 23];

            % Create gamFileNameText
            app.gamFileNameText = uilabel(app.figure1);
            app.gamFileNameText.Tag = 'gamFileNameText';
            app.gamFileNameText.HorizontalAlignment = 'center';
            app.gamFileNameText.VerticalAlignment = 'top';
            app.gamFileNameText.WordWrap = 'on';
            app.gamFileNameText.FontSize = 10.6666666666667;
            app.gamFileNameText.Tooltip = 'Name of the Gam file';
            app.gamFileNameText.Position = [187 848 123 17.0000000000002];
            app.gamFileNameText.Text = 'gamfile.gam';

            % Create uibuttongroup7
            app.uibuttongroup7 = uibuttongroup(app.figure1);
            app.uibuttongroup7.Title = 'Brute force optimization';
            app.uibuttongroup7.Tag = 'uibuttongroup7';
            app.uibuttongroup7.FontSize = 10.6666666666667;
            app.uibuttongroup7.Position = [1135 577 265 282];

            % Create text107
            app.text107 = uilabel(app.uibuttongroup7);
            app.text107.Tag = 'text107';
            app.text107.HorizontalAlignment = 'center';
            app.text107.VerticalAlignment = 'top';
            app.text107.WordWrap = 'on';
            app.text107.FontSize = 16;
            app.text107.Position = [13 132 146 21];
            app.text107.Text = 'max total thickness';

            % Create text106
            app.text106 = uilabel(app.uibuttongroup7);
            app.text106.Tag = 'text106';
            app.text106.HorizontalAlignment = 'center';
            app.text106.VerticalAlignment = 'top';
            app.text106.WordWrap = 'on';
            app.text106.FontSize = 16;
            app.text106.Position = [8 180 161 21];
            app.text106.Text = 'max single thickness';

            % Create text105
            app.text105 = uilabel(app.uibuttongroup7);
            app.text105.Tag = 'text105';
            app.text105.HorizontalAlignment = 'center';
            app.text105.VerticalAlignment = 'top';
            app.text105.WordWrap = 'on';
            app.text105.FontSize = 16;
            app.text105.Position = [28 205 71 21];
            app.text105.Text = 'del';

            % Create bruteForceMaxTotalEdit
            app.bruteForceMaxTotalEdit = uieditfield(app.uibuttongroup7, 'text');
            app.bruteForceMaxTotalEdit.Tag = 'bruteForceMaxTotalEdit';
            app.bruteForceMaxTotalEdit.HorizontalAlignment = 'center';
            app.bruteForceMaxTotalEdit.FontSize = 16;
            app.bruteForceMaxTotalEdit.Tooltip = 'The maximum total thickness.';
            app.bruteForceMaxTotalEdit.Position = [183 134 67 22];
            app.bruteForceMaxTotalEdit.Value = '1';

            % Create bruteForceMaxSingleEdit
            app.bruteForceMaxSingleEdit = uieditfield(app.uibuttongroup7, 'text');
            app.bruteForceMaxSingleEdit.Tag = 'bruteForceMaxSingleEdit';
            app.bruteForceMaxSingleEdit.HorizontalAlignment = 'center';
            app.bruteForceMaxSingleEdit.FontSize = 16;
            app.bruteForceMaxSingleEdit.Tooltip = 'The maximum single-layer thickness.';
            app.bruteForceMaxSingleEdit.Position = [183 184 67 22];
            app.bruteForceMaxSingleEdit.Value = '.3';

            % Create bruteForceDelEdit
            app.bruteForceDelEdit = uieditfield(app.uibuttongroup7, 'text');
            app.bruteForceDelEdit.Tag = 'bruteForceDelEdit';
            app.bruteForceDelEdit.HorizontalAlignment = 'center';
            app.bruteForceDelEdit.FontSize = 16;
            app.bruteForceDelEdit.Tooltip = 'The thickness by which each layer will be incremented.';
            app.bruteForceDelEdit.Position = [183 209 67 22];
            app.bruteForceDelEdit.Value = '.1';

            % Create bruteForcePushButton
            app.bruteForcePushButton = uibutton(app.uibuttongroup7, 'push');
            app.bruteForcePushButton.ButtonPushedFcn = createCallbackFcn(app, @bruteForcePushButton_Callback, true);
            app.bruteForcePushButton.Tag = 'bruteForcePushButton';
            app.bruteForcePushButton.FontSize = 16;
            app.bruteForcePushButton.Position = [17 237 90 26];
            app.bruteForcePushButton.Text = 'brute force';

            % Create bruteForceEtaThresholdEdit
            app.bruteForceEtaThresholdEdit = uieditfield(app.uibuttongroup7, 'text');
            app.bruteForceEtaThresholdEdit.Tag = 'bruteForceEtaThresholdEdit';
            app.bruteForceEtaThresholdEdit.HorizontalAlignment = 'center';
            app.bruteForceEtaThresholdEdit.FontSize = 16;
            app.bruteForceEtaThresholdEdit.Tooltip = 'The maximum total thickness.';
            app.bruteForceEtaThresholdEdit.Position = [183 109 67 22];
            app.bruteForceEtaThresholdEdit.Value = '.7';

            % Create text108
            app.text108 = uilabel(app.uibuttongroup7);
            app.text108.Tag = 'text108';
            app.text108.HorizontalAlignment = 'center';
            app.text108.VerticalAlignment = 'top';
            app.text108.WordWrap = 'on';
            app.text108.FontSize = 16;
            app.text108.Tooltip = 'The minimum eta that will be considered.';
            app.text108.Position = [13 107 146 21];
            app.text108.Text = 'Eta threshold';

            % Create text109
            app.text109 = uilabel(app.uibuttongroup7);
            app.text109.Tag = 'text109';
            app.text109.HorizontalAlignment = 'center';
            app.text109.VerticalAlignment = 'top';
            app.text109.WordWrap = 'on';
            app.text109.FontSize = 16;
            app.text109.Tooltip = 'The minimum eta that will be considered.';
            app.text109.Position = [20 52 131 21];
            app.text109.Text = 'Solutions found';

            % Create bruteForceNumSolsFoundText
            app.bruteForceNumSolsFoundText = uilabel(app.uibuttongroup7);
            app.bruteForceNumSolsFoundText.Tag = 'bruteForceNumSolsFoundText';
            app.bruteForceNumSolsFoundText.HorizontalAlignment = 'center';
            app.bruteForceNumSolsFoundText.VerticalAlignment = 'top';
            app.bruteForceNumSolsFoundText.WordWrap = 'on';
            app.bruteForceNumSolsFoundText.FontSize = 16;
            app.bruteForceNumSolsFoundText.Position = [176 52 76 21];
            app.bruteForceNumSolsFoundText.Text = '0';

            % Create bruteForceCancelCheckbox
            app.bruteForceCancelCheckbox = uicheckbox(app.uibuttongroup7);
            app.bruteForceCancelCheckbox.Tag = 'bruteForceCancelCheckbox';
            app.bruteForceCancelCheckbox.Visible = 'off';
            app.bruteForceCancelCheckbox.Text = 'Check to cancel';
            app.bruteForceCancelCheckbox.FontSize = 16;
            app.bruteForceCancelCheckbox.Position = [57 18 143 23];

            % Create bruteForceMinTotalEdit
            app.bruteForceMinTotalEdit = uieditfield(app.uibuttongroup7, 'text');
            app.bruteForceMinTotalEdit.Tag = 'bruteForceMinTotalEdit';
            app.bruteForceMinTotalEdit.HorizontalAlignment = 'center';
            app.bruteForceMinTotalEdit.FontSize = 16;
            app.bruteForceMinTotalEdit.Tooltip = 'The minimum total thickness.';
            app.bruteForceMinTotalEdit.Position = [183 160 67 22];
            app.bruteForceMinTotalEdit.Value = '0';

            % Create text112
            app.text112 = uilabel(app.uibuttongroup7);
            app.text112.Tag = 'text112';
            app.text112.HorizontalAlignment = 'center';
            app.text112.VerticalAlignment = 'top';
            app.text112.WordWrap = 'on';
            app.text112.FontSize = 16;
            app.text112.Position = [13 158 146 21];
            app.text112.Text = 'min total thickness';

            % Create removeLayerPushButton
            app.removeLayerPushButton = uibutton(app.figure1, 'push');
            app.removeLayerPushButton.ButtonPushedFcn = createCallbackFcn(app, @removeLayerPushButton_Callback, true);
            app.removeLayerPushButton.Tag = 'removeLayerPushButton';
            app.removeLayerPushButton.FontSize = 10.6666666666667;
            app.removeLayerPushButton.Tooltip = 'Delete the current layer. If the layers bounding the removed layer, they will be combined into a single layer.';
            app.removeLayerPushButton.Position = [24 677 43 24];
            app.removeLayerPushButton.Text = 'DEL';

            % Create insertAbovePushButton
            app.insertAbovePushButton = uibutton(app.figure1, 'push');
            app.insertAbovePushButton.ButtonPushedFcn = createCallbackFcn(app, @insertAbovePushButton_Callback, true);
            app.insertAbovePushButton.Tag = 'insertAbovePushButton';
            app.insertAbovePushButton.FontSize = 10.6666666666667;
            app.insertAbovePushButton.Tooltip = 'Insert a new air layer above the current layer. That is, the index of the new layer will be one less than the index of the current layer.';
            app.insertAbovePushButton.Position = [77 677 43 24];
            app.insertAbovePushButton.Text = 'INS ↑';

            % Create insertBelowPushButton
            app.insertBelowPushButton = uibutton(app.figure1, 'push');
            app.insertBelowPushButton.ButtonPushedFcn = createCallbackFcn(app, @insertBelowPushButton_Callback, true);
            app.insertBelowPushButton.Tag = 'insertBelowPushButton';
            app.insertBelowPushButton.FontSize = 10.6666666666667;
            app.insertBelowPushButton.Tooltip = 'Insert a new air layer below the current layer. ';
            app.insertBelowPushButton.Position = [132 677 43 24];
            app.insertBelowPushButton.Text = 'INS ↓';

            % Create FloqAngleText
            app.FloqAngleText = uilabel(app.figure1);
            app.FloqAngleText.Tag = 'FloqAngleText';
            app.FloqAngleText.HorizontalAlignment = 'center';
            app.FloqAngleText.VerticalAlignment = 'top';
            app.FloqAngleText.WordWrap = 'on';
            app.FloqAngleText.FontSize = 16;
            app.FloqAngleText.Position = [231 804 74.9999999999999 22];
            app.FloqAngleText.Text = '0';

            % Create text121
            app.text121 = uilabel(app.figure1);
            app.text121.Tag = 'text121';
            app.text121.HorizontalAlignment = 'center';
            app.text121.VerticalAlignment = 'top';
            app.text121.WordWrap = 'on';
            app.text121.FontSize = 16;
            app.text121.Position = [80 578 22 26];
            app.text121.Text = 'λ';

            % Create text122
            app.text122 = uilabel(app.figure1);
            app.text122.Tag = 'text122';
            app.text122.HorizontalAlignment = 'center';
            app.text122.VerticalAlignment = 'top';
            app.text122.WordWrap = 'on';
            app.text122.FontSize = 10.6666666666667;
            app.text122.Position = [107 579 65 22];
            app.text122.Text = 'cond. loss';

            % Create conductorLossText
            app.conductorLossText = uilabel(app.figure1);
            app.conductorLossText.Tag = 'conductorLossText';
            app.conductorLossText.HorizontalAlignment = 'center';
            app.conductorLossText.VerticalAlignment = 'top';
            app.conductorLossText.WordWrap = 'on';
            app.conductorLossText.FontSize = 16;
            app.conductorLossText.Tooltip = 'The total power lost (%) due to the finite conductivity of the wires relative to the incident power.';
            app.conductorLossText.Position = [169 581 42 22];
            app.conductorLossText.Text = '0.001';

            % Create text128
            app.text128 = uilabel(app.figure1);
            app.text128.Tag = 'text128';
            app.text128.HorizontalAlignment = 'center';
            app.text128.VerticalAlignment = 'top';
            app.text128.WordWrap = 'on';
            app.text128.FontSize = 10.6666666666667;
            app.text128.Position = [199 808 30 14];
            app.text128.Text = 'angle:';

            % Create multibeamsButtonGroup
            app.multibeamsButtonGroup = uibuttongroup(app.figure1);
            app.multibeamsButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @multibeamsButtonGroup_SelectionChangedFcn, true);
            app.multibeamsButtonGroup.Title = 'Multi-beams';
            app.multibeamsButtonGroup.Tag = 'multibeamsButtonGroup';
            app.multibeamsButtonGroup.FontSize = 16;
            app.multibeamsButtonGroup.Position = [1138 89 262 93];

            % Create addBeamPushButton
            app.addBeamPushButton = uibutton(app.multibeamsButtonGroup, 'push');
            app.addBeamPushButton.ButtonPushedFcn = createCallbackFcn(app, @addBeamPushButton_Callback, true);
            app.addBeamPushButton.Tag = 'addBeamPushButton';
            app.addBeamPushButton.FontSize = 16;
            app.addBeamPushButton.Tooltip = 'Add an air layer to existing configuration to cause the beam to radiate in the non-anomalous direction.';
            app.addBeamPushButton.Position = [11 39 89 22];
            app.addBeamPushButton.Text = 'Add beam 2';

            % Create multibeamConfig1RadioButton
            app.multibeamConfig1RadioButton = uiradiobutton(app.multibeamsButtonGroup);
            app.multibeamConfig1RadioButton.Tag = 'multibeamConfig1RadioButton';
            app.multibeamConfig1RadioButton.Tooltip = 'Choose configuration to display: 1 is configuration for beam in the anomalous direction, 2 is for beam in the non-anomalous direction';
            app.multibeamConfig1RadioButton.Text = '1';
            app.multibeamConfig1RadioButton.FontSize = 16;
            app.multibeamConfig1RadioButton.Position = [138 41 34 29];
            app.multibeamConfig1RadioButton.Value = true;

            % Create multibeamConfig2RadioButton
            app.multibeamConfig2RadioButton = uiradiobutton(app.multibeamsButtonGroup);
            app.multibeamConfig2RadioButton.Tag = 'multibeamConfig2RadioButton';
            app.multibeamConfig2RadioButton.Text = '2';
            app.multibeamConfig2RadioButton.FontSize = 16;
            app.multibeamConfig2RadioButton.Position = [181 41 34 29];

            % Create text114
            app.text114 = uilabel(app.multibeamsButtonGroup);
            app.text114.Tag = 'text114';
            app.text114.HorizontalAlignment = 'center';
            app.text114.VerticalAlignment = 'top';
            app.text114.WordWrap = 'on';
            app.text114.FontSize = 16;
            app.text114.Position = [105 13 134 29];
            app.text114.Text = 'Configuration';

            % Create FloquestModeToOptimizeButtonGroup
            app.FloquestModeToOptimizeButtonGroup = uibuttongroup(app.figure1);
            app.FloquestModeToOptimizeButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @FloquestModeToOptimizeButtonGroup_SelectionChangedFcn, true);
            app.FloquestModeToOptimizeButtonGroup.Title = 'Floquet mode to optimize';
            app.FloquestModeToOptimizeButtonGroup.Tag = 'FloquestModeToOptimizeButtonGroup';
            app.FloquestModeToOptimizeButtonGroup.FontSize = 10.6666666666667;
            app.FloquestModeToOptimizeButtonGroup.Position = [1164 496 146 64];

            % Create p1FloqModeToOptimize
            app.p1FloqModeToOptimize = uiradiobutton(app.FloquestModeToOptimizeButtonGroup);
            app.p1FloqModeToOptimize.Tag = 'p1FloqModeToOptimize';
            app.p1FloqModeToOptimize.Text = '+1';
            app.p1FloqModeToOptimize.FontSize = 10.6666666666667;
            app.p1FloqModeToOptimize.Position = [100 24 36 23];
            app.p1FloqModeToOptimize.Value = true;

            % Create zeroFloqModeToOptimize
            app.zeroFloqModeToOptimize = uiradiobutton(app.FloquestModeToOptimizeButtonGroup);
            app.zeroFloqModeToOptimize.Tag = 'zeroFloqModeToOptimize';
            app.zeroFloqModeToOptimize.Text = '0';
            app.zeroFloqModeToOptimize.FontSize = 10.6666666666667;
            app.zeroFloqModeToOptimize.Position = [53 25 36 23];

            % Create m1FloqModeToOptimize
            app.m1FloqModeToOptimize = uiradiobutton(app.FloquestModeToOptimizeButtonGroup);
            app.m1FloqModeToOptimize.Tag = 'm1FloqModeToOptimize';
            app.m1FloqModeToOptimize.Text = '-1';
            app.m1FloqModeToOptimize.FontSize = 10.6666666666667;
            app.m1FloqModeToOptimize.Position = [9 25 36 23];

            % Create text101
            app.text101 = uilabel(app.figure1);
            app.text101.Tag = 'text101';
            app.text101.HorizontalAlignment = 'center';
            app.text101.VerticalAlignment = 'top';
            app.text101.WordWrap = 'on';
            app.text101.FontSize = 16;
            app.text101.Position = [1159 469 68 22];
            app.text101.Text = 'efficiency';

            % Create optimEfficiencyText
            app.optimEfficiencyText = uilabel(app.figure1);
            app.optimEfficiencyText.Tag = 'optimEfficiencyText';
            app.optimEfficiencyText.HorizontalAlignment = 'center';
            app.optimEfficiencyText.VerticalAlignment = 'top';
            app.optimEfficiencyText.WordWrap = 'on';
            app.optimEfficiencyText.FontSize = 16;
            app.optimEfficiencyText.Tooltip = 'Coupling efficiency to the Floquet mode that is being optimized.';
            app.optimEfficiencyText.Position = [1228 473 40 18.0000000000001];
            app.optimEfficiencyText.Text = '0.9';

            % Create computeCheckBox
            app.computeCheckBox = uicheckbox(app.figure1);
            app.computeCheckBox.Tag = 'computeCheckBox';
            app.computeCheckBox.Text = 'compute';
            app.computeCheckBox.FontSize = 16;
            app.computeCheckBox.Position = [254 580 89 23];
            app.computeCheckBox.Value = true;

            % Create polarizationButtonGroup
            app.polarizationButtonGroup = uibuttongroup(app.figure1);
            app.polarizationButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @polarizationButtonGroup_SelectionChangedFcn, true);
            app.polarizationButtonGroup.Title = 'Polarization';
            app.polarizationButtonGroup.Tag = 'polarizationButtonGroup';
            app.polarizationButtonGroup.FontSize = 10.6666666666667;
            app.polarizationButtonGroup.Position = [189 736 74 66];

            % Create TMRadioButton
            app.TMRadioButton = uiradiobutton(app.polarizationButtonGroup);
            app.TMRadioButton.Tag = 'TMRadioButton';
            app.TMRadioButton.Text = 'TM';
            app.TMRadioButton.FontSize = 10.6666666666667;
            app.TMRadioButton.Position = [18 8 39 23];
            app.TMRadioButton.Value = true;

            % Create TERadioButton
            app.TERadioButton = uiradiobutton(app.polarizationButtonGroup);
            app.TERadioButton.Tag = 'TERadioButton';
            app.TERadioButton.Text = 'TE';
            app.TERadioButton.FontSize = 10.6666666666667;
            app.TERadioButton.Position = [18 29 39 23];

            % Create FloquetCheckBox
            app.FloquetCheckBox = uicheckbox(app.figure1);
            app.FloquetCheckBox.ValueChangedFcn = createCallbackFcn(app, @FloquetCheckBox_Callback, true);
            app.FloquetCheckBox.Tag = 'FloquetCheckBox';
            app.FloquetCheckBox.Tooltip = 'The bottom is a periodic metasurface that scatters the wave into a discrete spectrum of directions.';
            app.FloquetCheckBox.Text = 'Floquet';
            app.FloquetCheckBox.FontSize = 10.6666666666667;
            app.FloquetCheckBox.Position = [269 765 75 23];

            % Create metagratingCheckBox
            app.metagratingCheckBox = uicheckbox(app.figure1);
            app.metagratingCheckBox.ValueChangedFcn = createCallbackFcn(app, @metagratingCheckBox_Callback, true);
            app.metagratingCheckBox.Tag = 'metagratingCheckBox';
            app.metagratingCheckBox.Tooltip = 'Scattering will occur by wire arrays. TE assumed.';
            app.metagratingCheckBox.Text = 'metagrating';
            app.metagratingCheckBox.FontSize = 10.6666666666667;
            app.metagratingCheckBox.Position = [267 742 85 23];
            app.metagratingCheckBox.Value = true;

            % Create text159
            app.text159 = uilabel(app.figure1);
            app.text159.Tag = 'text159';
            app.text159.HorizontalAlignment = 'center';
            app.text159.VerticalAlignment = 'top';
            app.text159.WordWrap = 'on';
            app.text159.FontSize = 16;
            app.text159.Position = [7 731 104 22];
            app.text159.Text = 'Coupled with';

            % Create NoofmediaSpinnerLabel
            app.NoofmediaSpinnerLabel = uilabel(app.figure1);
            app.NoofmediaSpinnerLabel.HorizontalAlignment = 'right';
            app.NoofmediaSpinnerLabel.Position = [20 798 73 22];
            app.NoofmediaSpinnerLabel.Text = 'No. of media';

            % Create NoofmediaSpinner
            app.NoofmediaSpinner = uispinner(app.figure1);
            app.NoofmediaSpinner.Limits = [1 Inf];
            app.NoofmediaSpinner.ValueChangedFcn = createCallbackFcn(app, @numMediaEdit_Callback, true);
            app.NoofmediaSpinner.Tag = 'numMediaEdit';
            app.NoofmediaSpinner.HorizontalAlignment = 'center';
            app.NoofmediaSpinner.Enable = 'off';
            app.NoofmediaSpinner.Tooltip = {'Number of terms in the Floquet mode series for the unknowns rho and tau.'};
            app.NoofmediaSpinner.Position = [109 798 58 22];
            app.NoofmediaSpinner.Value = 2;

            % Create MediumnoSpinnerLabel
            app.MediumnoSpinnerLabel = uilabel(app.figure1);
            app.MediumnoSpinnerLabel.HorizontalAlignment = 'right';
            app.MediumnoSpinnerLabel.FontSize = 14;
            app.MediumnoSpinnerLabel.Position = [19 766 78 22];
            app.MediumnoSpinnerLabel.Text = 'Medium no.';

            % Create MediumnoSpinner
            app.MediumnoSpinner = uispinner(app.figure1);
            app.MediumnoSpinner.ValueChangedFcn = createCallbackFcn(app, @mediumNumberEdit_Callback, true);
            app.MediumnoSpinner.FontSize = 14;
            app.MediumnoSpinner.Tooltip = {'Number of terms in the Floquet mode series for the unknowns rho and tau.'};
            app.MediumnoSpinner.Position = [109 766 56 22];
            app.MediumnoSpinner.Value = 1;

            % Create AutoCouplingButton
            app.AutoCouplingButton = uibutton(app.figure1, 'push');
            app.AutoCouplingButton.ButtonPushedFcn = createCallbackFcn(app, @AutoCouplingButton_Callback, true);
            app.AutoCouplingButton.Tooltip = {'Automatically couple together all wires not separated by a dielectric or air.'};
            app.AutoCouplingButton.Position = [119 705 41 23];
            app.AutoCouplingButton.Text = 'Auto';

            % Create currentFloqmdSpinnerLabel
            app.currentFloqmdSpinnerLabel = uilabel(app.figure1);
            app.currentFloqmdSpinnerLabel.HorizontalAlignment = 'right';
            app.currentFloqmdSpinnerLabel.Position = [184 827 89 22];
            app.currentFloqmdSpinnerLabel.Text = 'current Floq md';

            % Create currentFloqmdSpinner
            app.currentFloqmdSpinner = uispinner(app.figure1);
            app.currentFloqmdSpinner.ValueChangedFcn = createCallbackFcn(app, @currentFloqmdSpinner_Callback, true);
            app.currentFloqmdSpinner.Position = [284 822 49 32];

            % Create NoFloqmdsSpinnerLabel
            app.NoFloqmdsSpinnerLabel = uilabel(app.figure1);
            app.NoFloqmdsSpinnerLabel.HorizontalAlignment = 'right';
            app.NoFloqmdsSpinnerLabel.Position = [198 872 76 22];
            app.NoFloqmdsSpinnerLabel.Text = 'No. Floq mds';

            % Create NoFloqmdsSpinner
            app.NoFloqmdsSpinner = uispinner(app.figure1);
            app.NoFloqmdsSpinner.Step = 2;
            app.NoFloqmdsSpinner.Limits = [1 Inf];
            app.NoFloqmdsSpinner.RoundFractionalValues = 'on';
            app.NoFloqmdsSpinner.ValueChangedFcn = createCallbackFcn(app, @NoFloqmdsSpinner_Callback, true);
            app.NoFloqmdsSpinner.Tooltip = {'The total number of Floquet modes in the field expansion.'};
            app.NoFloqmdsSpinner.Position = [288 872 50 22];
            app.NoFloqmdsSpinner.Value = 5;

            % Create uncoupleButton
            app.uncoupleButton = uibutton(app.figure1, 'push');
            app.uncoupleButton.ButtonPushedFcn = createCallbackFcn(app, @uncoupleButton_callback, true);
            app.uncoupleButton.Tooltip = {'Undo all coupling between wires. (That is, return the situation wo what it was before the "auto" button was pressed.'};
            app.uncoupleButton.Position = [34 704 58 23];
            app.uncoupleButton.Text = 'uncouple';

            % Create workingText
            app.workingText = uilabel(app.figure1);
            app.workingText.Tag = 'workingText';
            app.workingText.HorizontalAlignment = 'center';
            app.workingText.VerticalAlignment = 'top';
            app.workingText.WordWrap = 'on';
            app.workingText.FontSize = 16;
            app.workingText.FontColor = [1 0 0];
            app.workingText.Visible = 'off';
            app.workingText.Position = [714 878 60 21];
            app.workingText.Text = 'Working';

            % Create BargraphButton
            app.BargraphButton = uibutton(app.figure1, 'push');
            app.BargraphButton.ButtonPushedFcn = createCallbackFcn(app, @BargraphButton_Callback, true);
            app.BargraphButton.Tooltip = {'Produce a bar graph of the efficiencies of all propagating Floquet components, both refraction and reflection.'};
            app.BargraphButton.Position = [850 755 58 23];
            app.BargraphButton.Text = 'Bar graph';

            % Create CSTfilePushButton
            app.CSTfilePushButton = uibutton(app.figure1, 'push');
            app.CSTfilePushButton.ButtonPushedFcn = createCallbackFcn(app, @CSTfilePushButton_Callback, true);
            app.CSTfilePushButton.Tag = 'CSTfilePushButton';
            app.CSTfilePushButton.Tooltip = 'Prepare a file with wire data for CST. Its name will be that of the last data file with a suffix FWS (full wave solver).';
            app.CSTfilePushButton.Position = [912 756 55 23];
            app.CSTfilePushButton.Text = 'CST file';

            % Create optimizeReflectionCheckBox
            app.optimizeReflectionCheckBox = uicheckbox(app.figure1);
            app.optimizeReflectionCheckBox.ValueChangedFcn = createCallbackFcn(app, @optimizeReflectionCheckBox_Callback, true);
            app.optimizeReflectionCheckBox.Tag = 'optimizeReflectionCheckBox';
            app.optimizeReflectionCheckBox.Enable = 'off';
            app.optimizeReflectionCheckBox.Tooltip = 'Optimize reflected component even though the problem includes refraction.';
            app.optimizeReflectionCheckBox.Text = 'reflected';
            app.optimizeReflectionCheckBox.FontSize = 10.6666666666667;
            app.optimizeReflectionCheckBox.Position = [784 758 64 23];

            % Create isBeamsplitCheckBox
            app.isBeamsplitCheckBox = uicheckbox(app.figure1);
            app.isBeamsplitCheckBox.Tag = 'isBeamsplitCheckBox';
            app.isBeamsplitCheckBox.Tooltip = 'When the 0 readio button is chosen, the 0-component should be minimum.  Otherwise, maximum.';
            app.isBeamsplitCheckBox.Text = '0 is beamsplit';
            app.isBeamsplitCheckBox.FontSize = 10.6666666666667;
            app.isBeamsplitCheckBox.Position = [1334 527 91 23];

            % Create uibuttongroup13
            app.uibuttongroup13 = uibuttongroup(app.figure1);
            app.uibuttongroup13.Title = 'For design';
            app.uibuttongroup13.Tag = 'uibuttongroup13';
            app.uibuttongroup13.FontSize = 10.6666666666667;
            app.uibuttongroup13.Position = [1005 807 100 98];

            % Create designFilePushButton
            app.designFilePushButton = uibutton(app.uibuttongroup13, 'push');
            app.designFilePushButton.ButtonPushedFcn = createCallbackFcn(app, @designFilePushButton_Callback, true);
            app.designFilePushButton.Tag = 'designFilePushButton';
            app.designFilePushButton.FontSize = 10.6666666666667;
            app.designFilePushButton.Position = [5 51 69 24];
            app.designFilePushButton.Text = 'Design file';

            % Create freqGHzForDesignEdit
            app.freqGHzForDesignEdit = uieditfield(app.uibuttongroup13, 'text');
            app.freqGHzForDesignEdit.Tag = 'freqGHzForDesignEdit';
            app.freqGHzForDesignEdit.HorizontalAlignment = 'center';
            app.freqGHzForDesignEdit.FontSize = 10.6666666666667;
            app.freqGHzForDesignEdit.Tooltip = 'The frequency for the design data.';
            app.freqGHzForDesignEdit.Position = [10 24 33 22];
            app.freqGHzForDesignEdit.Value = '20';

            % Create text150
            app.text150 = uilabel(app.uibuttongroup13);
            app.text150.Tag = 'text150';
            app.text150.HorizontalAlignment = 'center';
            app.text150.VerticalAlignment = 'top';
            app.text150.WordWrap = 'on';
            app.text150.FontSize = 10.6666666666667;
            app.text150.Position = [6 6 61 16];
            app.text150.Text = 'freq (GHz)';

            % Create KcorrEdit
            app.KcorrEdit = uieditfield(app.uibuttongroup13, 'text');
            app.KcorrEdit.Tag = 'KcorrEdit';
            app.KcorrEdit.HorizontalAlignment = 'center';
            app.KcorrEdit.FontSize = 10.6666666666667;
            app.KcorrEdit.Tooltip = 'The value of Kcorr on whicb the capacitor width is based';
            app.KcorrEdit.Position = [57 25 38 22];
            app.KcorrEdit.Value = '1';

            % Create text151
            app.text151 = uilabel(app.uibuttongroup13);
            app.text151.Tag = 'text151';
            app.text151.HorizontalAlignment = 'center';
            app.text151.VerticalAlignment = 'top';
            app.text151.WordWrap = 'on';
            app.text151.FontSize = 10.6666666666667;
            app.text151.Position = [63 7 29 16];
            app.text151.Text = 'Kcorr';

            % Create targetOptimModeSpinner
            app.targetOptimModeSpinner = uispinner(app.figure1);
            app.targetOptimModeSpinner.ValueChangedFcn = createCallbackFcn(app, @targetOptimModeSpinnerCallback, true);
            app.targetOptimModeSpinner.FontSize = 16;
            app.targetOptimModeSpinner.Position = [839 202 49 22];

            % Create incWaveSlider1
            app.incWaveSlider1 = uislider(app.figure1);
            app.incWaveSlider1.Limits = [0 1];
            app.incWaveSlider1.MajorTicks = [];
            app.incWaveSlider1.MajorTickLabels = {''};
            app.incWaveSlider1.Orientation = 'vertical';
            app.incWaveSlider1.ValueChangedFcn = createCallbackFcn(app, @incWaveSliderValueChanged, true);
            app.incWaveSlider1.ValueChangingFcn = createCallbackFcn(app, @incWaveSliderValueChanging, true);
            app.incWaveSlider1.MinorTicks = [];
            app.incWaveSlider1.Tag = 'aaa';
            app.incWaveSlider1.Tooltip = {'1Incident wave Floquet component relative power magnitude.'};
            app.incWaveSlider1.Position = [798 829 3 48];

            % Create incWave1EditNumeric
            app.incWave1EditNumeric = uieditfield(app.figure1, 'numeric');
            app.incWave1EditNumeric.Limits = [0 1];
            app.incWave1EditNumeric.ValueChangedFcn = createCallbackFcn(app, @incWaveEditNumericCallback, true);
            app.incWave1EditNumeric.Tag = 'IW1';
            app.incWave1EditNumeric.Tooltip = {'Incident wave Floquet component relative power magnitude.'};
            app.incWave1EditNumeric.Position = [785 885 26 21];
            app.incWave1EditNumeric.Value = 0.3;

            % Create incWaveSlider2
            app.incWaveSlider2 = uislider(app.figure1);
            app.incWaveSlider2.Limits = [0 1];
            app.incWaveSlider2.MajorTicks = [];
            app.incWaveSlider2.MajorTickLabels = {''};
            app.incWaveSlider2.Orientation = 'vertical';
            app.incWaveSlider2.ValueChangedFcn = createCallbackFcn(app, @incWaveSliderValueChanged, true);
            app.incWaveSlider2.ValueChangingFcn = createCallbackFcn(app, @incWaveSliderValueChanging, true);
            app.incWaveSlider2.MinorTicks = [];
            app.incWaveSlider2.Tooltip = {'2Incident wave Floquet component relative power magnitude.'};
            app.incWaveSlider2.Position = [828 829 3 48];

            % Create incWave2EditNumeric
            app.incWave2EditNumeric = uieditfield(app.figure1, 'numeric');
            app.incWave2EditNumeric.Limits = [0 1];
            app.incWave2EditNumeric.ValueChangedFcn = createCallbackFcn(app, @incWaveEditNumericCallback, true);
            app.incWave2EditNumeric.Tag = 'IW2';
            app.incWave2EditNumeric.Tooltip = {'Incident wave Floquet component relative power magnitude.'};
            app.incWave2EditNumeric.Position = [815 885 26 21];

            % Create incWaveSlider3
            app.incWaveSlider3 = uislider(app.figure1);
            app.incWaveSlider3.Limits = [0 1];
            app.incWaveSlider3.MajorTicks = [];
            app.incWaveSlider3.MajorTickLabels = {''};
            app.incWaveSlider3.Orientation = 'vertical';
            app.incWaveSlider3.ValueChangedFcn = createCallbackFcn(app, @incWaveSliderValueChanged, true);
            app.incWaveSlider3.ValueChangingFcn = createCallbackFcn(app, @incWaveSliderValueChanging, true);
            app.incWaveSlider3.MinorTicks = [];
            app.incWaveSlider3.Tooltip = {'3Incident wave Floquet component relative power magnitude.'};
            app.incWaveSlider3.Position = [858 829 3 48];

            % Create incWave3EditNumeric
            app.incWave3EditNumeric = uieditfield(app.figure1, 'numeric');
            app.incWave3EditNumeric.Limits = [0 1];
            app.incWave3EditNumeric.ValueChangedFcn = createCallbackFcn(app, @incWaveEditNumericCallback, true);
            app.incWave3EditNumeric.Tag = 'IW3';
            app.incWave3EditNumeric.Tooltip = {'Incident wave Floquet component relative power magnitude.'};
            app.incWave3EditNumeric.Position = [845 885 26 21];

            % Create incWaveSlider4
            app.incWaveSlider4 = uislider(app.figure1);
            app.incWaveSlider4.Limits = [0 1];
            app.incWaveSlider4.MajorTicks = [];
            app.incWaveSlider4.MajorTickLabels = {''};
            app.incWaveSlider4.Orientation = 'vertical';
            app.incWaveSlider4.ValueChangedFcn = createCallbackFcn(app, @incWaveSliderValueChanged, true);
            app.incWaveSlider4.ValueChangingFcn = createCallbackFcn(app, @incWaveSliderValueChanging, true);
            app.incWaveSlider4.MinorTicks = [];
            app.incWaveSlider4.Tooltip = {'4Incident wave Floquet component relative power magnitude.'};
            app.incWaveSlider4.Position = [887 829 3 48];

            % Create incWave4EditNumeric
            app.incWave4EditNumeric = uieditfield(app.figure1, 'numeric');
            app.incWave4EditNumeric.Limits = [0 1];
            app.incWave4EditNumeric.ValueChangedFcn = createCallbackFcn(app, @incWaveEditNumericCallback, true);
            app.incWave4EditNumeric.Tag = 'IW4';
            app.incWave4EditNumeric.Tooltip = {'Incident wave Floquet component relative power magnitude.'};
            app.incWave4EditNumeric.Position = [874 885 26 21];

            % Create incWaveSlider5
            app.incWaveSlider5 = uislider(app.figure1);
            app.incWaveSlider5.Limits = [0 1];
            app.incWaveSlider5.MajorTicks = [];
            app.incWaveSlider5.MajorTickLabels = {''};
            app.incWaveSlider5.Orientation = 'vertical';
            app.incWaveSlider5.ValueChangedFcn = createCallbackFcn(app, @incWaveSliderValueChanged, true);
            app.incWaveSlider5.ValueChangingFcn = createCallbackFcn(app, @incWaveSliderValueChanging, true);
            app.incWaveSlider5.MinorTicks = [];
            app.incWaveSlider5.Tooltip = {'5Incident wave Floquet component relative power magnitude.'};
            app.incWaveSlider5.Position = [917 829 3 48];

            % Create incWave5EditNumeric
            app.incWave5EditNumeric = uieditfield(app.figure1, 'numeric');
            app.incWave5EditNumeric.Limits = [0 1];
            app.incWave5EditNumeric.ValueChangedFcn = createCallbackFcn(app, @incWaveEditNumericCallback, true);
            app.incWave5EditNumeric.Tag = 'IW5';
            app.incWave5EditNumeric.Tooltip = {'Incident wave Floquet component relative power magnitude.'};
            app.incWave5EditNumeric.Position = [904 885 26 21];

            % Create incWaveSlider6
            app.incWaveSlider6 = uislider(app.figure1);
            app.incWaveSlider6.Limits = [0 1];
            app.incWaveSlider6.MajorTicks = [];
            app.incWaveSlider6.MajorTickLabels = {''};
            app.incWaveSlider6.Orientation = 'vertical';
            app.incWaveSlider6.ValueChangedFcn = createCallbackFcn(app, @incWaveSliderValueChanged, true);
            app.incWaveSlider6.ValueChangingFcn = createCallbackFcn(app, @incWaveSliderValueChanging, true);
            app.incWaveSlider6.MinorTicks = [];
            app.incWaveSlider6.Tooltip = {'6Incident wave Floquet component relative power magnitude.'};
            app.incWaveSlider6.Position = [948 830 3 48];

            % Create incWave6EditNumeric
            app.incWave6EditNumeric = uieditfield(app.figure1, 'numeric');
            app.incWave6EditNumeric.Limits = [0 1];
            app.incWave6EditNumeric.ValueChangedFcn = createCallbackFcn(app, @incWaveEditNumericCallback, true);
            app.incWave6EditNumeric.Tag = 'IW6';
            app.incWave6EditNumeric.Tooltip = {'Incident wave Floquet component relative power magnitude.'};
            app.incWave6EditNumeric.Position = [935 885 26 21];

            % Create incWaveSlider7
            app.incWaveSlider7 = uislider(app.figure1);
            app.incWaveSlider7.Limits = [0 1];
            app.incWaveSlider7.MajorTicks = [];
            app.incWaveSlider7.MajorTickLabels = {''};
            app.incWaveSlider7.Orientation = 'vertical';
            app.incWaveSlider7.ValueChangedFcn = createCallbackFcn(app, @incWaveSliderValueChanged, true);
            app.incWaveSlider7.ValueChangingFcn = createCallbackFcn(app, @incWaveSliderValueChanging, true);
            app.incWaveSlider7.MinorTicks = [];
            app.incWaveSlider7.Tooltip = {'7Incident wave Floquet component relative power magnitude.'};
            app.incWaveSlider7.Position = [980 830 3 48];

            % Create incWave7EditNumeric
            app.incWave7EditNumeric = uieditfield(app.figure1, 'numeric');
            app.incWave7EditNumeric.Limits = [0 1];
            app.incWave7EditNumeric.ValueChangedFcn = createCallbackFcn(app, @incWaveEditNumericCallback, true);
            app.incWave7EditNumeric.Tag = 'IW7';
            app.incWave7EditNumeric.Tooltip = {'Incident wave Floquet component relative power magnitude.'};
            app.incWave7EditNumeric.Position = [967 884 26 21];

            % Create Label_1
            app.Label_1 = uilabel(app.figure1);
            app.Label_1.HorizontalAlignment = 'center';
            app.Label_1.Position = [785 801 25 22];
            app.Label_1.Text = '1';

            % Create Label_2
            app.Label_2 = uilabel(app.figure1);
            app.Label_2.HorizontalAlignment = 'center';
            app.Label_2.Position = [817 802 25 22];
            app.Label_2.Text = '2';

            % Create Label_3
            app.Label_3 = uilabel(app.figure1);
            app.Label_3.HorizontalAlignment = 'center';
            app.Label_3.Position = [847 802 25 22];
            app.Label_3.Text = '3';

            % Create Label_4
            app.Label_4 = uilabel(app.figure1);
            app.Label_4.HorizontalAlignment = 'center';
            app.Label_4.Position = [875 803 25 22];
            app.Label_4.Text = '4';

            % Create Label_5
            app.Label_5 = uilabel(app.figure1);
            app.Label_5.HorizontalAlignment = 'center';
            app.Label_5.Position = [907 804 25 22];
            app.Label_5.Text = '5';

            % Create Label_6
            app.Label_6 = uilabel(app.figure1);
            app.Label_6.HorizontalAlignment = 'center';
            app.Label_6.Position = [937 804 25 22];
            app.Label_6.Text = '6';

            % Create Label_7
            app.Label_7 = uilabel(app.figure1);
            app.Label_7.HorizontalAlignment = 'center';
            app.Label_7.Position = [967 803 25 22];
            app.Label_7.Text = '7';

            % Create incWave1EditPhase
            app.incWave1EditPhase = uieditfield(app.figure1, 'numeric');
            app.incWave1EditPhase.ValueChangedFcn = createCallbackFcn(app, @incWaveEditPhaseCallback, true);
            app.incWave1EditPhase.Tag = 'IW1';
            app.incWave1EditPhase.Tooltip = {'Incident wave Floquet component relative power phase..'};
            app.incWave1EditPhase.Position = [785 782 26 21];

            % Create incWave2EditPhase
            app.incWave2EditPhase = uieditfield(app.figure1, 'numeric');
            app.incWave2EditPhase.ValueChangedFcn = createCallbackFcn(app, @incWaveEditPhaseCallback, true);
            app.incWave2EditPhase.Tag = 'IW2';
            app.incWave2EditPhase.Tooltip = {'Incident wave Floquet component relative power phase..'};
            app.incWave2EditPhase.Position = [815 782 26 21];

            % Create incWave3EditPhase
            app.incWave3EditPhase = uieditfield(app.figure1, 'numeric');
            app.incWave3EditPhase.ValueChangedFcn = createCallbackFcn(app, @incWaveEditPhaseCallback, true);
            app.incWave3EditPhase.Tag = 'IW3';
            app.incWave3EditPhase.Tooltip = {'Incident wave Floquet component relative power phase..'};
            app.incWave3EditPhase.Position = [845 782 26 21];

            % Create incWave4EditPhase
            app.incWave4EditPhase = uieditfield(app.figure1, 'numeric');
            app.incWave4EditPhase.ValueChangedFcn = createCallbackFcn(app, @incWaveEditPhaseCallback, true);
            app.incWave4EditPhase.Tag = 'IW4';
            app.incWave4EditPhase.Tooltip = {'Incident wave Floquet component relative power phase..'};
            app.incWave4EditPhase.Position = [874 782 26 21];

            % Create incWave5EditPhase
            app.incWave5EditPhase = uieditfield(app.figure1, 'numeric');
            app.incWave5EditPhase.ValueChangedFcn = createCallbackFcn(app, @incWaveEditPhaseCallback, true);
            app.incWave5EditPhase.Tag = 'IW5';
            app.incWave5EditPhase.Tooltip = {'Incident wave Floquet component relative power phase..'};
            app.incWave5EditPhase.Position = [904 782 26 21];

            % Create incWave6EditPhase
            app.incWave6EditPhase = uieditfield(app.figure1, 'numeric');
            app.incWave6EditPhase.ValueChangedFcn = createCallbackFcn(app, @incWaveEditPhaseCallback, true);
            app.incWave6EditPhase.Tag = 'IW6';
            app.incWave6EditPhase.Tooltip = {'Incident wave Floquet component relative power phase..'};
            app.incWave6EditPhase.Position = [935 782 26 21];

            % Create incWave7EditPhase
            app.incWave7EditPhase = uieditfield(app.figure1, 'numeric');
            app.incWave7EditPhase.ValueChangedFcn = createCallbackFcn(app, @incWaveEditPhaseCallback, true);
            app.incWave7EditPhase.Tag = 'IW7';
            app.incWave7EditPhase.Tooltip = {'Incident wave Floquet component relative power phase..'};
            app.incWave7EditPhase.Position = [967 781 26 21];

            % Create periodEditFieldLabel
            app.periodEditFieldLabel = uilabel(app.figure1);
            app.periodEditFieldLabel.HorizontalAlignment = 'right';
            app.periodEditFieldLabel.Position = [-1 583 38 22];
            app.periodEditFieldLabel.Text = 'period';

            % Create periodEditField
            app.periodEditField = uieditfield(app.figure1, 'numeric');
            app.periodEditField.Limits = [0 Inf];
            app.periodEditField.ValueChangedFcn = createCallbackFcn(app, @periodEditFieldCallback, true);
            app.periodEditField.Tooltip = {'The period is generally derermined by the out angle. If it is edited here, this is the period that will be used, and not that obtained from the out angle. This allows periods less than WL.'};
            app.periodEditField.Position = [43 585 40 23];
            app.periodEditField.Value = 1;

            % Create WkSymCheckBox
            app.WkSymCheckBox = uicheckbox(app.figure1);
            app.WkSymCheckBox.ValueChangedFcn = createCallbackFcn(app, @WkSymCallback, true);
            app.WkSymCheckBox.Tooltip = {'When checkced and Wk is checked, the Wk will be forced to be symmetric. I.e. The last=first, next-to-last = second, etc. This should have been implemented using coupling, but wasn''t.'};
            app.WkSymCheckBox.Text = 'WkSym';
            app.WkSymCheckBox.Position = [1007 759 63 22];

            % Create multipleOptimPushButton
            app.multipleOptimPushButton = uibutton(app.figure1, 'push');
            app.multipleOptimPushButton.Tag = 'multipleOptimPushButton';
            app.multipleOptimPushButton.FontSize = 10.6666666666667;
            app.multipleOptimPushButton.Tooltip = 'Randomly distribute the parameters included in optimization and perform optimization, both for multiple cases.';
            app.multipleOptimPushButton.Position = [1298 464 124 23];
            app.multipleOptimPushButton.Text = 'multiple optim methods';

            % Show the figure after all components are created
            app.figure1.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = layers_App_exported(varargin)

            runningApp = getRunningApp(app);

            % Check for running singleton app
            if isempty(runningApp)

                % Create UIFigure and components
                createComponents(app)

                % Register the app with App Designer
                registerApp(app, app.figure1)

                % Execute the startup function
                runStartupFcn(app, @(app)layers_OpeningFcn(app, varargin{:}))
            else

                % Focus the running singleton app
                figure(runningApp.figure1)

                app = runningApp;
            end

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.figure1)
        end
    end
end