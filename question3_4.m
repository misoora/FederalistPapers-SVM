[train,tune,test,dataDim] = getFederalistData();
load('federalData.mat');
features = 1:70;
mu = .1;

[feats,w,gam,numWrong] = bestFeatures(train,tune,features,mu);
fprintf('\n');
fprintf('Optimal Classifier: w = %d\tgamma = %d\n',w,gam);
fprintf('Words Used: %s\t%s\n',wordlist{feats(1)},wordlist{feats(2)});