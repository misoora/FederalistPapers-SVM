[train,tune,test,dataDim] = getFederalistData();
features = 1:70;
mu = [0 .001 .01 .1 1 10 100 100000];

for i=1:size(mu,2)
    [w,gam,objective] = separateQP(train,features,mu(i));
    [correct_Train,wrong_Train] = discrim(w,gam,train,features);
    [correct_Tune,wrong_Tune] = discrim(w,gam,tune,features);
    disp(['%%%%%%%%%%%%%% MU = ' num2str(mu(i))]); 
    disp(['Optimal Objective: ' num2str(objective)]);
    disp(['Gamma: ' num2str(gam)]);
    disp(['||w|| = ' num2str(norm(w))]);
    fprintf('Train Correct Classification: %d\n',correct_Train);
    fprintf('Train Wrong Classification: %d\n\n',wrong_Train);
    fprintf('Tune Correct Classification: %d\n',correct_Tune);
    fprintf('Tune Wrong Classification: %d\n\n',wrong_Tune);
    
    predictAuthorship(w,gam,test,features);
end
