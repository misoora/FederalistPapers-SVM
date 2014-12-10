function [] = predictAuthorship(w,gam,test,features)
%predictAuthorship Summary of this function goes here
%   Detailed explanation goes here

[numPapers,n] = size(test);
for i=1:numPapers
  x = test(i,1:n)';
  margin = (w'*x - gam);
  if (margin > 0) % madison paper
  fprintf('Paper #%d\tPredicted Author: Madison\tMargin: %d\n',i,margin);
  elseif (margin <= 0) % hamilton paper    
  fprintf('Paper #%d\tPredicted Author: Hamilton\tMargin: %d\n',i,margin);
  end

end
fprintf('\n');
end

