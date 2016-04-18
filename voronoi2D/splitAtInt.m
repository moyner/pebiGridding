function [splitL1, L1Cut, L1L2Cut] = splitAtInt(L1, L2)
% Split paths at all intersections. 
%
% SYNOPSIS:
%   [splitL1, fCut, fwCut] = splitAtInt(L1, L2)
%
% PARAMETERS;
%   L1              A cell of arrays. Each nx2 array in the cell contains 
%                   the piecewise linear path. Each path in L1 is split at
%                   all intersections with other paths in L1 and all paths
%                   in L2. The values must be sorted along the path, e.g., 
%                   a  path consisting of two lines 
%                   would be [x1,y1; x2,y2; x3,y3].
%                      .----------.-------------.
%                   (x1,y1)    (x2,y2)       (x3,y3)
%   L2              A cell of arrays. Each nx2 array in the cell contains 
%                   the piecewise linear approximation of a path.  The 
%                   values must be sorted along the line, e.g., a well 
%                   consisting of two lines would be [x1,y1; x2,y2; x3,y3].
%                      .----------.-------------.
%                   (x1,y1)    (x2,y2)       (x3,y3)
%
%                   If an array has length 1 it is considered a point well.
% RETURNS:
%   splitL1         A cell of arrays. The arrays are the cut paths and 
%                   does not contain any intersections with L1 or L2,
%                   except possible at the start and/or end points.
%
%   L1Cut           Array of length equal splitL1. The value of element
%                   i tells if the returned path i has an intersection 
%                   with L1. If the value is 0, the fault has no 
%                   intersections. If the value is 1 it has an intersection 
%                   at the end point. If the value is 2 it has an 
%                   intersection at the start point. If the value is 3 it 
%                   has an intersection at both the start and end point.
%
%   L1L2Cut         Array of length equal splitL1. The value of element
%                   i tells if the returned path i has an intersection 
%                   with L2. If the value is 0, the fault has no 
%                   intersections. If the value is 1 it has an intersection 
%                   at the end point. If the value is 2 it has an 
%                   intersection at the start point. If the value is 3 it 
%                   has an intersection at both the start and end point.
%
% EXAMPLE
%   L1 = {[0.2,0.2;0.8,0.8], [0.2,0.5;0.8,0.5]};
%   L2 = {[0.3,0.8;0.3,0.2]};
%   gS = 0.1;
%   [L1,L1Cut,L1L2Cut] = splitAtInt(L1,L2);
%   figure(); hold on
%   name = {};
%   for i = 1:numel(L1)
%     plot(L1{i}(:,1), L1{i}(:,2))
%     name = [name;num2str(i)];
%   end
%   legend(name);
%   disp(L1Cut)
%   disp(L1L2Cut)
%
% SEE ALSO:
%   splitWells, createFaultGridPoints, compositePebiGrid, pebiGrid

%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (C) 2016 Runar Lie Berge. See COPYRIGHT.TXT for details.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%}
splitL1 = cell(0);
tmpCut    = cell(0);

for i = 1:numel(L1)
  [splitL1{i},~,tmpCut{i}] = splitLines(L1(i),L1([1:i-1,i+1:end]));
end

splitL1 = horzcat(splitL1{:});
tmpCut      = vertcat(tmpCut{:});
[splitL1, cutId,L1L2Cut] = splitLines(splitL1, L2);

L1Cut = [];
for i = 1:size(tmpCut,1)
  switch tmpCut(i)
    case 0
      L1Cut = [L1Cut; zeros(sum(cutId(i,:)),1); 0];
    case 1
      L1Cut = [L1Cut; zeros(sum(cutId(i,:)),1); 1];
    case 2
      L1Cut = [L1Cut; 2; zeros(sum(cutId(i,:)),1)];
    case 3 
      if sum(cutId(i,:))
        L1Cut = [L1Cut; 2; zeros(sum(cutId(i,:)-1),1); 1];
      else
        L1Cut = [L1Cut;3];
      end
  end
end

end