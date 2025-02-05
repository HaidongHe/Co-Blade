function [state,options,optchanged] = geneticAlgorithmOutput(options, ...
                                                             state, ...
                                                             flag, ...
                                                             SIM, ...
                                                             OPT, ...
                                                             BLADE, ...
                                                             WEB, ...
                                                             AF, ...
                                                             OUT, ...
                                                             z_oub, ...
                                                             z_CP)

%%
persistent fig1 

optchanged = false;

[BestValue,BestIndex] = min(state.Score);
x_current             = state.Population(BestIndex,:);

%%                                    
switch flag
    case 'init'
        if OUT.PLOT_OPT_ITER
            % create the figures
            fig1 = figure('name', 'Current Best Point', ...
                          'color', 'white', ...
                          'units', 'normalized',...
                          'outerposition', [0.1 0.1 0.8 0.8]);
        end
        
    otherwise
    
end

if OPT.WRITE_X_ITER
    % the user has requested to write the design variables to a text file
    fmt = [ repmat('%18.16f  ', 1, numel(x_current)), '\r\n' ];
    fid = fopen([SIM.outputDir filesep SIM.case '_iterX.out'], 'a');
    fprintf(fid, fmt, x_current);       
    fclose(fid);
end 

if OUT.PLOT_OPT_ITER
    plotBestPoint(fig1, x_current, OPT, BLADE, WEB, AF, z_oub, z_CP);      
end

end % function geneticAlgorithmOutput


