%% LEAVE THE MATVERSE
%
% >> matverse.leave($path)
%
% To leave the MATVERSE whose entrance it's at $path,
% if you happen to omit it would be the default...
%
% Then, after leaving, and realizing it's gone:
%
%   > if you wish to go away permanently: savepath()           ☠
%   > if you happen to desire a way back: matverse.enter()     ☮ 
%   > in the case something has went bad: restoredefaultpath() ⚕ 

function leave(folder)

    if nargin < 1
        self   = true;
        folder = erase(fileparts(mfilename('fullpath')),'+matverse');
        % > Default: MATVERSE destroys itself
    else
        self = false;
        CUSTOMVERSE = split(folder,filesep);
        if isempty(CUSTOMVERSE{end})
            CUSTOMVERSE = CUSTOMVERSE{end-1};
        else
            CUSTOMVERSE = CUSTOMVERSE{end};
        end
        % > User-defined CUSTOMVERSE to init..
    end 
    
    MATVERSE = xgenpath(folder,'**/*.git');
    oldpath = rmpath(MATVERSE);
    addpath(userpath); % Safety-measure
    printflag = not(isequal(oldpath,path));
    
    % Final greetings!
    if printflag
        fprintf('\n')
        if self
            fprintf('☄☄☄ MATVERSE DESTROYED ☄☄☄ \n')
        else
            fprintf('☄☄☄ %sVERSE DESTROYED ☄☄☄\n',CUSTOMVERSE)
        end
        fprintf('\n')
        fprintf('  > if you wish to go away permanently: savepath()           ☠ \n')
        fprintf('  > if you happen to desire a way back: matverse.enter()     ☮ \n')
        fprintf('  > in the case something has went bad: restoredefaultpath() ⚕ \n')
        fprintf('  \n                                                           \n')
    end
end
