clc; clear all; close all

% set boundary
boundary = [-1,-1,-1;  ...
             1,-1,-1;  ...
             1, 1,-1;  ...
            -1, 1,-1;  ...
            -1,-1, 1;  ...
             1,-1, 1;  ...
             1, 1, 1;  ...
            -1, 1, 1]; ...
%             
% boundary = [-1, 0, -1/sqrt(2);...
%              1, 0, -1/sqrt(2);...
%              0,-1,  1/sqrt(2);...
%              0, 1,  1/sqrt(2)]; ...
%              
face = [-1,-1;-1,1;1,-1;1,1];
face = delaunayTriangulation(face);
faceDt.Points = [face.Points,zeros(size(face.Points,1),1)];
faceDt.ConnectivityList = face.ConnectivityList;

% initilize random points
n = 50;

pts = rand(n,3);
pts(:,1) = pts(:,1)*(max(boundary(:,1))-min(boundary(:,1))) + min(boundary(:,1));
pts(:,2) = pts(:,2)*(max(boundary(:,2))-min(boundary(:,2))) + min(boundary(:,2));
pts(:,3) = pts(:,3)*(max(boundary(:,3))-min(boundary(:,3))) + min(boundary(:,3));

%[G,optPts,f,g] = optiVoronoi3D(pts,boundary);
%plotGrid(G)
%figure()
boundary = delaunayTriangulation(boundary);
[Gc,optPtsc,fc,gc] = optiVoronoi3DClip(pts,boundary,'fault', faceDt);

plotGrid(G)

%save('unitSquare200')
    