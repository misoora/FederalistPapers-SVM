[train,tune,test,dataDim] = getFederalistData();
features = 1:70;
mu = .1;


[w,gam,objective] = separateQP(train,features,mu);
w = postProcess(w);
[correct_Train,wrong_Train] = discrim(w,gam,train,features);
[correct_Tune,wrong_Tune] = discrim(w,gam,tune,features);
fprintf('%%%%%%%%%%%%%% MU = %d\n',mu);
fprintf('Optimal Objective: %d\n',objective);
fprintf('Gamma: %d\n',gam);
fprintf('2-Norm of w: %d\n',norm(w));
fprintf('Train Correct Classification: %d\n',correct_Train);
fprintf('Train Wrong Classification: %d\n\n',wrong_Train);
fprintf('Tune Correct Classification: %d\n',correct_Tune);
fprintf('Train Wrong Classification: %d\n\n',wrong_Tune);

predictAuthorship(w,gam,test,features);