function [points] = predictAuthorship(w,gam,test,features)
%predictAuthorship Summary of this function goes here
%   Detailed explanation goes here

points = [];
[numPapers,n] = size(test);
for i=1:numPapers
  x = test(i,features)';
  margin = (w'*x - gam);
  if (margin > 0) % madison paper
    points = vertcat(points,x');
    disp(['Paper #' num2str(i) '   Predicted Author: Madison   Margin: ' num2str(margin)]);
  elseif (margin <= 0) % hamilton paper 
    points = vertcat(points,x');
    disp(['Paper #' num2str(i) '   Predicted Author: Hamilton   Margin: ' num2str(margin)]);
  end

end
fprintf('\n');
end

