function [output,pk] = ukfsample(input,f0,Ts,harmnum,alpha,kappa,b,Q,R)

L= harmnum*2;
omega = 2*pi*f0;
xk = zeros(L,1);
%xk(1) = 20;
output = zeros(L,length(input));

pk = diag(1.*ones(L,1));

[wm,wc] = sigmaweights(L,alpha,kappa,b);

hk= zeros(1,L);

for k = 1:1:length(input)
    
    
    for index = 1:2:L
        hk(index) = cos(index.*omega.*k.*Ts);
        hk(index+1) = -sin(index.*omega.*k.*Ts);
    end
    
    sigmas = sigmaselect(xk,pk,alpha,kappa);
    
    %sigmas = sigmaupdate(sigmas);
    
    [x_prior,p_prior] = priorstatesest(sigmas,wm,wc,Q);
    
    [y_prior,pyk,pxkyk] = priormeasest(x_prior,sigmas,wm,wc,R,hk);
    
    yk = input(k);
    
    [x_post,p_post,~] = UKFupdate(x_prior,y_prior,p_prior,yk,pyk,pxkyk);
    
    output(:,k) = x_post;
    
    xk = x_post;
    
    pk = p_post;
    
    
end
end