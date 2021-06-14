clc
clear variables
close all

Ts = 1/4000;
fs = 4000;
omega = 2*pi*60;
harmonicnumbers = 10;
L= harmonicnumbers*4;
x_est = zeros(L,1);
harm = 1;
alpha = 1;
kappa= 0;
b = 2;
for index = 1:4:(4*harmonicnumbers)
    x_est(index+2) = omega*Ts*harm;
    harm = harm+2;
end
p_est = 10*ones(L,L);

sigmas_init = sigmaselect(x_est,p_est,alpha,kappa);

sigmas = sigmaupdate(sigmas_init);

[wm,wc] = sigmaweights(L,alpha,kappa,b);

[x_prior,p_prior] = priorstatesest(sigmas,wm,wc);

[y_prior,pyk,pxkyk] = priormeasest(x_prior,sigmas,wm,wc,0);

yk = 20;

[x_post,p_post,K] = UKFupdate(x_prior,y_prior,p_prior,yk,pyk,pxkyk);