function trim_fig(inFig)
% TRIM the white borders of the given figure before exporting to PDF
% 2020 © Matteo Seclì
%
% >> trim_fig([handle]), [if ungiven expands to gcf]
%
% See also export_fig
if nargin < 1
    inFig = gcf;
end
set(inFig,'PaperPositionMode','auto');
figpos = get(inFig,'PaperPosition');
set(inFig,'PaperSize',[figpos(3) figpos(4)]);
end

