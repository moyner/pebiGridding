clc; clear; close all


% Sett the convex boundary
boundary = [-1,-1,-1;  ...
             1,-1,-1;  ...
             1, 1,-1;  ...
            -1, 1,-1;  ...
            -1,-1, 1;  ...
             1,-1, 1;  ...
             1, 1, 1;  ...
            -1, 1, 1]; ...

% Generate random seed points
%pts = -1+2*rand(5,3);
pts=    [-0.5443    0.4773    0.2519;...
         -0.0038    0.1720    0.3219;...
          0.8017   -0.5065    0.4595;...
          0.1493    0.3328    0.7815;...
          0.6904   -0.8330    0.9646];...
%pts = [0,0,0;0.5,0.5,0.5];

% Generate voronoi grid
G = voronoi3D(pts, boundary);

str = [];
figure()
hold on
for i = 1:size(pts,1)
   plot3(pts(i,1),pts(i,2),pts(i,3),'.','markersize',30)
   str = [str;num2str(i)];
end
legend(str)

for i = 1:G.cells.num
    plotGrid(G, i, 'edgecolor','r','facealpha',0.2);
end