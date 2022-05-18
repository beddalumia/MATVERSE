function pathshow(folder)
%% SHOW THE PATH IN USER-FRIENDLY WAY
%  -> i.e. splitting the entries and 
%     printing them in reversed order
%
%   >> pathshow():        MATLAB PATH
%   >> pathshow('here'):  CUSTOM PATH
%
% See also showpath (which is an alias)
    if nargin < 1
        p = strsplit(path,pathsep);
    else
        p = genpath(folder);
        p = strsplit(p,pathsep);
    end
    for i = length(p):-1:1
        fprintf('\t%s\n\n',p{i})
    end
end