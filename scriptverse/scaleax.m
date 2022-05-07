function scaleax(varargin)
%SCALEAX scales data and axis limits after data have been plotted.  This
%may be helpful if you've plotted several data sets then decided, "the y
%axis labels should be in nanometers instead of meters." 
% 
% 
%% Syntax 
% 
%  scaleax(ScaleFactor)
%  scaleax(axis_h,ScaleFactor)
%  scaleax('axis',ScaleFactor)
%  scaleax(axis_h,'axis',ScaleFactor)
% 
%% Description
% 
% scaleax(ScaleFactor) scales the x, y, and z data of the current
% axes by a scalar ScaleFactor value. 
%
% scaleax(axis_h,ScaleFactor) specifies an axis handle on which to
% perform scaleax. If no axis handle is declared, axis_h = gca. 
%
% scaleax('axis',ScaleFactor) specifies which data to scale, where
% 'axis' can be 'x', 'y', 'z', or 'all'.  If 'axis' is not
% specified, 'all' is assumed. 
%
% scaleax(axis_h,'axis',ScaleFactor) scales 'axis' data on axis_h by
% ScaleFactor.  
% 
%% Example
% You drove a thousand kilometers, logging some measurement every kilometer
% along the way. Your measurement device records a tiny (order of tens of
% nanovolt) signals in units of volts. 
% 
% x = 0:1000:1000000;                     % meters traveled
% y = 3e-8*(sin(x/1e5)+.1*rand(size(x))); % measured volts
% 
% plot(x,y)
% xlabel('distance traveled (m)')
% ylabel('measured potential (V)')
%
% Don't make your audience mentally convert nine-times-ten-to-the-fifth
% meters to kilometers or two-times-ten-to-the-minus-eight volts into
% nanovolts.  Scale those axes! 
% 
% scaleax('x',1/1000)
% xlabel('distance traveled (km)') 
% 
% scaleax('y',1e9)
% ylabel('measured potential (nV)') 
% 
%% Author Info
% This function was written by Chad A. Greene of the University of Texas at
% Austin's Institute for Geophysics, October 7, 2014. Stop on by
% http://www.chadagreene.com sometime and say hi. 
% 
% See also xlim, ylim, gca. 
    assert(nargin>0,'scaleax requires at least one input.')
    assert(nargin<4,'scaleax cannot have more than 3 inputs.') 
    % Set Defaults: 
    opaxis = 'all'; % operate on x, y, and z by default
    ax = gca;       % use current axes by default
    switch nargin 
        case 1
            ScaleFactor = varargin; 
        case 2 
            tmp = strcmpi(varargin,'x')|strcmpi(varargin,'y')|strcmpi(varargin,'z')|strcmpi(varargin,'all'); 
            if any(tmp)  
                % If only one input is numeric, assume it's the ScaleFactor: 
                opaxis = varargin{tmp}; 
                ScaleFactor = varargin{~tmp}; 

            else
                % If two inputs are numeric, assume the first one is an axis handle and the second is ScaleFactor:
                ax = varargin{1}; 
                ScaleFactor = varargin{2}; 
            end

        case 3
            % For three inputs, assume the first numeric input is an axis handle and the second numeric input is ScaleFactor 
            tmp = strcmpi(varargin,'x')|strcmpi(varargin,'y')|strcmpi(varargin,'z')|strcmpi(varargin,'all'); 
            assert(any(tmp)==1,'If you enter three inputs into scaleax, one of the inputs must be ''x'', ''y'', ''z'', or ''all''.') 
            opaxis = varargin{tmp}; 
            varargin = varargin(~tmp); % removes opaxis from varargin. 
            ax = varargin{1}; 
            ScaleFactor = varargin{2}; 

        otherwise
            error('How''d you get here? I believe I already asserted that scalex has 1, 2, or 3 inputs.')   
    end
    assert(isscalar(ScaleFactor)==1,'ScaleFactor must be a scalar.') 
    assert(isnumeric(ScaleFactor)==1,'ScaleFactor must be a scalar.') 
    assert(ishandle(ax)==1,'Unrecognized axis handle.') 
    if strcmpi(opaxis,'x')||strcmpi(opaxis,'all')
        if verLessThan('matlab','8.4.0')
            xlim0 = get(ax,'XLim'); 
            ch = get(ax,'Children'); 
            for k = 1:length(ch)
                try
                    xdata = get(ch(k),'XData'); 
                    set(ch(k),'XData',ScaleFactor*xdata); 
                end
            end
        else % R2014b and beyond: 
            xlim0 = ax.XLim; 
            ch = ax.Children; 
            for k = 1:length(ch); 
                try
                    ch(k).XData = ScaleFactor*ch(k).XData; 
                end
            end
        end

        xlim(ScaleFactor*xlim0);      
    end

    if strcmpi(opaxis,'y')||strcmpi(opaxis,'all')
        if verLessThan('matlab','8.4.0')
            ylim0 = get(ax,'YLim'); 
            ch = get(ax,'Children'); 
            for k = 1:length(ch)
                try
                    ydata = get(ch(k),'YData'); 
                    set(ch(k),'YData',ScaleFactor*ydata); 
                end
            end
        else % R2014b and beyond: 
            ylim0 = ax.YLim; 
            ch = ax.Children; 
            for k = 1:length(ch); 
                try
                    ch(k).YData = ScaleFactor*ch(k).YData; 
                end
            end
        end
        ylim(ScaleFactor*ylim0); 
    end

    if strcmpi(opaxis,'z')||strcmpi(opaxis,'all')
        if verLessThan('matlab','8.4.0')
            zlim0 = get(ax,'ZLim'); 
            ch = get(ax,'Children'); 
            for k = 1:length(ch)
                try
                    zdata = get(ch(k),'ZData'); 
                    set(ch(k),'ZData',ScaleFactor*zdata); 
                end
            end
        else % R2014b and beyond: 
            zlim0 = ax.ZLim; 
            ch = ax.Children; 
            for k = 1:length(ch); 
                try
                    ch(k).ZData = ScaleFactor*ch(k).ZData; 
                end
            end
        end
        zlim(ScaleFactor*zlim0); 
    end
end