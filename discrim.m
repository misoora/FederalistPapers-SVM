function [correct,numWrong] = discrim(w,gam,dataMat,features)
%discrim This function calculates (w_i * x_i - gamma)
%   
correct = 0;
numWrong = 0;
[numPapers,n] = size(dataMat);
for i=1:numPapers
    x = dataMat(i,2:n)';
    plane = (w'*x - gam);
    if (plane > 0 && dataMat(i,1) == 2)
        correct = correct + 1;
    elseif (plane <= 0 && dataMat(i,1) == 1)    
        correct = correct + 1;
    else
        numWrong = numWrong + 1;
    end

end

