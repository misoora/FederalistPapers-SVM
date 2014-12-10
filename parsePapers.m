function [H,M] = parsePapers(dataMat,features)
%parsePapers A function to return sets M and H
%   Takes in a data matrix (presumably train set)
%   and returns subsets M and H depending on first entry
%   of each paper

H = [];
M = [];
[m,n] = size(dataMat);
features = features + 1;

for i=1:m
   if  (dataMat(i,1) == 1)
       H = vertcat(H,dataMat(i,features));
   elseif (dataMat(i,1) == 2)
       M = vertcat(M,dataMat(i,features));    
   end
end


end

