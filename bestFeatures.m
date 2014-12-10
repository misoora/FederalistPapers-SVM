function features = bestFeatures(train,tune,features,mu)
%bestFeatures 
%   returns the best 2 features based on minimizing misclassifications

bestW = []; % will end up being the optimal value of w
bestGam = []; % will end up being the optimal value of gamma
bestAttributes = [];
leastNumWrong = 100000; % set to +inf to start
for i=1:size(features,2)
    [w,gam,objective] = separateQP(train,features(i),mu);
    [correct,numWrong] = discrim(w,gam,tune,features(i));  
    
    if (numWrong <= leastNumWrong)
       if (numWrong < leastNumWrong || norm(w) < norm(bestW))
        fprintf('attributes:\t%d;',features(i));
        fprintf('\tmisclassified:\t%d;',numWrong);
        fprintf('\tnorm(w)= %d\n',norm(w));
        bestW = w;
        bestGam = gam;
        leastNumWrong = numWrong;
        bestAttributes = features(i);
       end
    end
end

%% Greedily run through remaining 69 features to find 2nd best
featuresSubset = find(features(:) ~= bestAttributes)';
currFeatureSet = bestAttributes; %holds bestAttribute + current 2nd Test
for i=featuresSubset
    currFeatureSet = [bestAttributes(1) features(i)];
    [w,gam,objective] = separateQP(train,currFeatureSet,mu);
    [correct,numWrong] = discrim(w,gam,tune,currFeatureSet);  
    
    if (numWrong <= leastNumWrong)
       if (numWrong < leastNumWrong || norm(w) < norm(bestW))
        fprintf('attributes:\t%d %d;',currFeatureSet);
        fprintf('\tmisclassified:\t%d;',numWrong);
        fprintf('\tnorm(w)= %d\n',norm(w));
        bestW = w;
        bestGam = gam;
        leastNumWrong = numWrong;
        bestAttributes = currFeatureSet;
       end
    end
end



end

