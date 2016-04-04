function [splitLines,cutMat, isCut] = splitLines(L1, L2)
splitLines = cell(0);
isCut      = [];
cutMat     = false(numel(L1), numel(L2));

if numel(L2)==0
  isCut = zeros(numel(L1),1);
  splitLines = L1;
  return
end
for i = 1:numel(L1)
  % Pick lines
  l1      = L1{i};
  l2      = L2;%([1:i-1,i+1:end]);
  linePos = cumsum([1,cellfun(@(c) size(c,1),l2)])';
  keep    = true(linePos(end)-1,1);
  keep(linePos) = false;
  l2      = cell2mat(l2');
  l1      = [l1(1:end-1,:),l1(2:end,  :)];
  l2      = [l2(1:end-1,:),l2(2:end,  :)];
  l2      = l2(keep(2:end-1),:);
  % Compute intersections
  out     = lineSegmentIntersect(l1,l2);
  [k,j]   = find(out.intAdjacencyMatrix');
  if isempty(k)
    splitLines = [splitLines, L1(i)];
    isCut      = [isCut; 0];
    continue
  end
  newPts  = [diag(out.intMatrixX(j,k)), diag(out.intMatrixY(j,k))];
  [~,I]  = sort(sum(bsxfun(@minus, newPts,l1(1:2)).^2,2));
  newPts  = newPts(I,:);
  newPts  = repmat(newPts',2,1);
  newPts  = reshape(newPts(:),2,[])';
  id      = repmat(j',2,1);
  id      = id(:);
  % Remove duplicates
  pts     = insertVec(L1{i},newPts,id+1);
  newLine =  mat2cell(pts,diff([0;j + 2*(1:numel(j))'-1;size(pts,1)]),2)';
  arg     = {'rows';'stable'};
  arg     = repmat(arg,size(newLine));
  [newLine] = cellfun(@unique, newLine,arg(1,:),arg(2,:),'UniformOutput',false);
  numPts  = cellfun(@(c) size(c,1),newLine);
  newLine = newLine(numPts>1);
  startInt = numPts(1)==1;
  endInt   = numPts(end)==1;
 
  % Split line
  splitLines = [splitLines,newLine];
  l2Pos      = linePos - cumsum(ones(size(linePos,1),1)) +1;
  linePos    = repmat(linePos, 1,numel(k));
  [~, kLine] = max(bsxfun(@ge,linePos,k'),[],1);
  cutMat(i,kLine) = true;
  isCut      =[isCut;...
    [ones(numel(newLine)-1,1);endInt]+2*[startInt;ones(numel(newLine)-1,1)]];
  
end
end