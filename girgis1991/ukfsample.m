function [output,p] = ukfsample(input,f0,Ts,harmnum,alpha,kappa,b,Q,R)
    
    L= harmnum*2;
    omega = 2*pi*f0;
    xk = zeros(L,1);
    xk(1) = 20;
    output = zeros(L,length(input));
    
    pk = diag(1.*ones(L,1));
    
    [wm,wc] = sigmaweights(L,alpha,kappa,b);
    
    for k = 1:1:length(input)
        sigmas = sigmaselect(xk,pk,alpha,kappa);
        
        sigmas = sigmaupdate(sigmas);
        
        [x_prior,p_prior] = priorstatesest(sigmas,wm,wc,Q);
        
        [y_prior,pyk,pxkyk] = priormeasest(x_prior,sigmas,wm,wc,omega,k,Ts,R);
        
        yk = input(k);
        
        [x_post,p_post,K] = UKFupdate(x_prior,y_prior,p_prior,yk,pyk,pxkyk);
        
        output(:,k) = x_post;
        
        xk = x_post;
        
        pk = p_post;
        
        p=p_post;
        
    end
end