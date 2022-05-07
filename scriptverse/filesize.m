function s = filesize(filename)
% FILESIZE returns the size of a file as a variable or prints it in the command line. 
% 
%% Syntax
% 
%  filesize 'filename' 
%  s = filesize('filename') 
% 
%% Description 
% 
% filesize 'filename' displays the size of any file in the command window. 
% 
% s = filesize('filename') writes the file size of filename to a variable
% s in the workspace. Output is in bytes. 
% 
%% Command window example: 
% 
% filesize cameraman.tif
% cameraman.tif is 65.24 KB.
% 
%% Variable example: 
% 
% s = filesize('cameraman.tif')
% s =
%        65240
%        
%% Author Info
% This function was written by Chad A. Greene of the University of Texas
% at Austin, and the Institute for Geophysics (UTIG), April 2016. 
% http://www.chadagreene.com 
% 
% See also dir, whos, and which. 

    %% Get file data: 
    % Make sure it's a valid file name: 
    assert(ischar(filename)==1,'Error: filename must be a string.') 
    % Look for the file directory: 
    w = which(filename); 
    % Ensure the file does indeed exist: 
    assert(isempty(w)==0,['Error: cannot find file ',filename,'.'])
    % Get a structure of file data: 
    d = dir(w); 
    % The file size is in the d structure as 'bytes': 
    s = d.bytes; 
    
    %% Package up the output:
    % If the user did not request a variable as an output, print the file
    % size as human-readable in the command window: 
    if nargout==0 

       % Common names for sizes:  
       powers = 1000.^(0:8); 
       units = {'bytes','KB','MB','GB','TB','PB','EB','ZB','YB'}; 

       % Find the correct index to use: 
       ind = find(powers<s,1,'last'); 

       % Print a message in the command window: 
       disp([filename,' is ',num2str(s/powers(ind),'%0.2f'),' ', units{ind},'.'])

       % Clear the variable output: 
       clear s 
    end
    
end