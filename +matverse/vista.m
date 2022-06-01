%% ENTER THE MATVERSE
%
% >> matverse.vista($path)
%
% To peak at the MATVERSE whose entrance it's at $path,
% if you happen to omit it would be the default...
%
% If you are thrilled by the view: matverse.enter() ❖

function vista(folder)

    if nargin < 1
        self   = true;
        folder = erase(fileparts(mfilename('fullpath')),'+matverse');
        % > Default: MATVERSE introspects itself
    else
        self = false;
        CUSTOMVERSE = split(folder,filesep);
        if isempty(CUSTOMVERSE{end})
            CUSTOMVERSE = CUSTOMVERSE{end-1};
        else
            CUSTOMVERSE = CUSTOMVERSE{end};
        end
        % > User-defined CUSTOMVERSE to spy..
    end 
    
    if exist('__octave_config_info__','builtin')
        p = genpath(folder);
        disp(strsplit(p,pathsep));
    else
        xpathshow(folder); % Finer MATLAB option
    end
    
    % Would the user decide to enter... promote it!
    fprintf('\n')
    if self
        fprintf('↑↑↑ THIS IS THE MATVERSE ↑↑↑\n')
    else
        fprintf('↑↑↑ THIS IS THE %sVERSE ↑↑↑\n',CUSTOMVERSE)
    end
    fprintf('\n')
    fprintf('  > If you are thrilled: matverse.enter() ❖ \n')
    fprintf('\n')

end