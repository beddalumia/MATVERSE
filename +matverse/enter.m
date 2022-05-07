%% ENTER THE MATVERSE
%
% >> matverse.enter($path)
%
% To build the MATVERSE whose entrance it's at $path,
% if you happen to omit it would be the default...
%
% Then, after you enter, a choice shall be made:
%
%     > if you wish to stay permanently: savepath() ☸ 
%     > else enjoy as you want and matverse.leave() ⚚ 
%     > if something went bad: restoredefaultpath() ⚕ 

function enter(folder)

    if nargin < 1
        self   = true;
        folder = userpath;
        % > Default: MATVERSE initiates itself
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
    
    MATVERSE = xgenpath(folder,'\.git');
    addpath(MATVERSE);
    
    % Better to check for duplicates
    find_duplicate(folder);
    
    % Let the user decide if to save or not to save...
    fprintf('\n')
    if self
        fprintf('✦✧✦ WELCOME TO THE MATVERSE ✧✦✧\n')
    else
        fprintf('✦✧✦ WELCOME TO THE %sVERSE ✧✦✧\n',CUSTOMVERSE)
    end
    fprintf('\n')
    fprintf('  > if you wish to stay permanently: savepath() ☸ \n')
    fprintf('  > else enjoy as you want and matverse.leave() ⚚ \n')
    fprintf('  > if something went bad: restoredefaultpath() ⚕ \n')
    fprintf('  \n                                              \n')

end