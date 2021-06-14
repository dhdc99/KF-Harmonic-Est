clc
clear variables
close all

L = 40;
xk = 20*rand(L,1);
xk_est = xk + normrnd(0,1,L,1);
noise= xk - xk_est;
alpha=0.5;
kappa=0;
b=2;
lambda = (alpha^2)*(L+kappa) - L;

pk = ecm(xk,xk_est);

sig = sigmaselect(xk_est,pk,alpha,kappa);

newsig=sigmaupdate(sig);

[wm,wc] = sigmaweights(L,alpha,kappa,b);

[x_prior,p_prior] = priorstatesest(newsig,wm,wc);

[y_prior,pyk,pxkyk] = priormeasest(x_prior,newsig,wm,wc,0)