function showpath(folder)
%% SHOW THE PATH IN USER-FRIENDLY WAY
%  -> i.e. splitting the entries and 
%     printing them in reversed order
%
%   >> showpath():        MATLAB PATH
%   >> showpath('here'):  CUSTOM PATH
%
% See also pathshow (which is an alias)
    if nargin < 1
        p = strsplit(path,':');
    else
        p = genpath(folder);
        p = strsplit(p,':');
    end
    for i = length(p):-1:1
        fprintf('\t%s\n\n',p{i})
    end
end