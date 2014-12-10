[train,tune,test,dataDim] = getFederalistData();
features = 1:70;
mu = .1;

bestFeatures(train,tune,features,mu);