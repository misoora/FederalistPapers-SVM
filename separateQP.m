function [w,gam,objective] = separateQP(dataMat,features,mu)
%separateQP Solves the problem
%   Detailed explanation goes here

[H,M] = parsePapers(dataMat,features);
[h,n] = size(H);
m = size(M,1);
e_h = ones(h,1);
e_m = ones(m,1);
cvx_begin quiet
    variables w(n) gam y(m) z(h)
    minimize (((1/m)*e_m'*y + (1/h)*e_h'*z) + (mu/2)*(w'*w))
    subject to
        M*w - e_m*gam + y >= e_m;
        -H*w + e_h*gam + z >= e_h;
        y >= 0;
        z >= 0;
cvx_end
objective = cvx_optval;

end

