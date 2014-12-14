function [] = graphPapers(test,train,tune,w,gam,features)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here

[points] = predictAuthorship(w,gam,test,features);
disputedX = points(:,1);
disputedY = points(:,2);

[H_train,M_train] = parsePapers(train,features);
[H_tune,M_tune] = parsePapers(tune,features);

H = vertcat(H_train,H_tune);
M = vertcat(M_train,M_tune);

hamX = H(:,1);
hamY = H(:,2);
madX = M(:,1);
madY = M(:,2);

scatter(disputedX,disputedY,'r','*');
hold on
scatter(hamX,hamY,'o');
scatter(madX,madY,'k','+');

x1 = -1:.01:4;
x2 = (gam - w(1)*x1) / w(2);
plot(x1,x2);
end

