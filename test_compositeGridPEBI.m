% % Multiple fractures. From Fung et.al 15.
% close all
% x = 0.2:0.05:0.8;
% l = {[0.65,0.1;0.65,0.926],...
%      [0.2,0.175; 0.875,0.875], ...
%      [0.2,0.925; 0.9,0.125], ...
%      [0.45,0.15; 0.83, 0.35]};
% 
% Gp = compositeGridPEBI([30,30], [1, 1], 'fracLines', l, 'padding', 1);
% 
% plotGrid(Gp, 'faceColor', 'none')
% axis equal tight
% hold on
% plotFault(Gp)
% for i = 1:numel(l)
%   line = l{i};
%   plot(line(:, 1), line(:, 2),'r');
% end



% %close all
% x = 0.2:0.05:0.8;
% l = {[0.65,0.1;0.65,0.926],...
%      [0.2,0.175; 0.875,0.875], ...
%      [0.2,0.925; 0.9,0.125], ...
%      [0.45,0.15; 0.83, 0.35]};
% 
% Gp = compositeGridPEBI([30,30], [1, 1], 'fracLines', l, 'padding', 1);
% 
% 
% plotGrid(Gp, 'faceColor', 'none')
% axis equal tight
% hold on
% plotFault(Gp)
% for i = 1:numel(l)
%   line = l{i};
%   %plot(line(:, 1), line(:, 2),'r');
% end


%%
%%Close up on one iregular fracture.
% %close all
% x = [.114, 0.1432, 0.2341, 0.3477, 0.4795, 0.6205, 0.7705, 0.8695, 0.9014];
% y = [0.0991, 0.1050, 0.1574, 0.2391, 0.35048, 0.4006, 0.3956, 0.3786, 0.3515];
% l = {[x',y']};    
% 
% Gp = compositeGridPEBI([20,10], [1, 0.5], 'fracLines', l, 'padding', 1,...
%                        'fullFaultEdge', 0, 'circleFactor', 0.6);
% 
% figure
% plotGrid(Gp, 'faceColor', 'none')
% axis equal tight off
% hold on
% plotFault(Gp)
%close all

% %% Showing sufficient condition for fault edge with circle factor 0.6
% close all
% x = [3, 6, 9, 12, 15];
% y = [7.075, 8, 8.925, 8, 7.075];
% l = {[x',y']};    
% 
% Gp = compositeGridPEBI([9,7], [18, 15.74], 'fracLines', l, 'padding', 1,...
%                        'fullFaultEdge', 0, 'circleFactor', 0.6, ...
%                        'fracGridSize', 4);
% 
% 
% plotGrid(Gp, 'faceColor', 'none')
% 
% axis  equal tight off
% hold on
% plotFault(Gp)
% for i = 1:numel(l)
%   line = l{i};
%   %plot(line(:, 1), line(:, 2),'r');
% end

%%Close up on one iregular fracture.
%close all

x1 = linspace(0.35,0.2,10);
y1 = [0.2,0.25,0.3,0.34,0.40,0.5,0.6,0.65,0.7,0.8];
x2 = linspace(0.2,0.7,10);
y2 = [0.45,0.4,0.4,0.38,0.35,0.35,0.4,0.5,0.6,0.73];
x3 = linspace(0.1,0.9,10);
y3 = [0.8,0.85,0.85,0.9,0.9,0.85,0.8,0.70,0.7,0.8];
x4 = linspace(0.8,0.55,10);
y4 = [0.2,0.25,0.3,0.34,0.40,0.5,0.6,0.65,0.7,0.8];
x5 = linspace(0.2,0.7,10);
y5 = [0.6,0.57,0.56,0.52,0.50,0.5,0.53,0.57,0.59,0.63];


l = {[x2',y2'], [x3',y3'],  [x5',y5'],[x1',y1'],[x4',y4']};    

%l = {[0.4,0.2;0.8,0.8],[0.5,0.25;0.6,0.9],[0.4,0.7;0.8,0.65]};    

Gp = compositeGridPEBI([30,30], [1, 1], 'fracLines', l, 'padding', 0,...
                        'fullFaultEdge', 1, 'circleFactor', 0.6);

plotGrid(Gp, 'faceColor', 'none')
axis equal tight
hold on
plotFault(Gp)

for i = 1:1%numel(l)
  line = l{i};
  plot(line(:, 1), line(:, 2),'b');
end

% % Multiple fractures. From Fung et.al 15. huge frac gird size
% close all
% x = 0.2:0.05:0.8;
% l = {[0.65,0.1;0.65,0.926],...
%      [0.2,0.175; 0.875,0.875], ...
%      [0.2,0.925; 0.9,0.125], ...
%      [0.45,0.15; 0.83, 0.35]};
% 
% figure()
% hold on
% Gp = compositeGridPEBI([30,30], [1, 1], 'lines', l, 'padding', 1,...
%                        'fracGridSize', 0.05, 'circleFactor', 0.55);
% 
% plotGrid(Gp, 'faceColor', 'none')
% axis equal tight
% hold on
% plotFault(Gp)
% %for i = 1:numel(l)
% %   line = l{i};
% %   plot(line(:, 1), line(:, 2),'r');
% %end
% 
% %%
% % Test of well grid points
% close all
% 
% x = linspace(0.2,0.8);
% wellLine = {%[0.2,0.8], ...
%             %[0.5,0.2;0.5,0.8]}%,...;            
%             [x', 0.5*sin(pi*x)'+0.2]};%, ...
%             %[0.3,0.3;0.7,0.8]}
%             
% 
% Gp = compositeGridPEBI([10,10], [1, 1], 'wellLines', wellLine, 'padding', 1, ...
%                         'wellGridSize',0.02, 'mlqtMaxLevel', 2, ...
%                         'mlqtLevelSteps',[0.12,0.06]');
% 
% figure()
% hold on
% plotGrid(Gp, 'faceColor', 'none')
% axis equal tight
% hold on
% plotFault(Gp)
% plotWells(Gp)


%%Test of well grid points and fractures
% close all
% 
% wellLine = {%[0.2,0.8], ...
%             %[0.5,0.2;0.5,0.8]}%,...;            
%             [0.3,0.3;0.7,0.8]};
%         
% fracture = {[0.2,0.8;0.8,0.2],...
%             [0.45,0.15;0.55,0.85]};
%       
% Gp = compositeGridPEBI([10,10], [1, 1], 'wellLines', wellLine,'fracLines',fracture,...
%                         'fracGridSize', 0.05, 'padding', 1,...
%                         'wellGridSize',0.008, 'mlqtMaxLevel', 3, ...
%                         'mlqtLevelSteps',[0.12,0.06,0.04]');
% 
% figure()
% hold on
% plotGrid(Gp, 'faceColor', 'none')
% axis equal tight
% hold on
% plotFault(Gp)
% plotWells(Gp)
% 
% 
% 





