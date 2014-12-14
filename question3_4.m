[train,tune,test,dataDim] = getFederalistData();
load('federalData.mat');
features = 1:70;
mu = .1;

[feats,w,gam,numWrong] = bestFeatures(train,tune,features,mu);
fprintf('\n');
fprintf('Optimal Classifier:\n');
disp('Optimal w = ');
disp(w);
disp('Optimal gamma = ');
disp(gam);
fprintf('Words Used: %s\t%s\n',wordlist{feats(1)},wordlist{feats(2)});

disp('Disputed Papers: ');
predictAuthorship(w,gam,test,feats);