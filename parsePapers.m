function [H,M] = parsePapers(dataMat)
%parsePapers A function to return sets M and H
%   Takes in a data matrix (presumably train set)
%   and returns subsets M and H depending on first entry
%   of each paper

H = [];
M = [];
[m,n] = size(dataMat);

for i=1:m
   if  (dataMat(i,1) == 1)
       H = vertcat(H,dataMat(i,2:n));
   elseif (dataMat(i,1) == 2)
       M = vertcat(M,dataMat(i,2:n));    
   end
end


end

