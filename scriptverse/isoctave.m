function bool = isoctave()
%% ISOCTAVE Determines if you are running under GNU Octave or MATLAB
%   
%       >> isoctave()
%
%       ans = 
%
%           logical
%
%           0 ----> IF running under MATLAB
%           1 ----> IF running under OCTAVE
%
% See also ispc, ismac, isunix, ver
  bool = exist('__octave_config_info__','builtin') == 5;
end

