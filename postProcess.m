function w = postProcess(w)
%postProcess 
%   This function will set some indices of w to 0

for i=1:size(w,1)
   if (abs(w(i)) <= (10^-6 * max(norm(w,1),1)))
      w(i) = 0; 
   end
end


end

