function [output,p] = ukfsample(input,f0,Ts,harmnum,alpha,kappa,b)
    
    L= harmnum*4;
    omega = 2*pi*f0;
    xk = zeros(L,1);
    output = zeros(harmnum,length(input));
    
    harmindex = 1;
    for index = 1:4:(4*harmnum)
        xk(index+2) = omega*Ts*harmindex;
        harmindex = harmindex+2;
    end
    
    pk = diag(0.1.*ones(40,1));
    
    [wm,wc] = sigmaweights(L,alpha,kappa,b);
    
    for signalindex = 1:1:length(input)
        sigmas = sigmaselect(xk,pk,alpha,kappa);
        
        sigmas = sigmaupdate(sigmas);
        
        [x_prior,p_prior] = priorstatesest(sigmas,wm,wc,diag(0.01*ones(40,1)));
        
        [y_prior,pyk,pxkyk] = priormeasest(x_prior,sigmas,wm,wc,1);
        
        yk = input(signalindex);
        
        [x_post,p_post,K] = UKFupdate(x_prior,y_prior,p_prior,yk,pyk,pxkyk);
        
        output(:,signalindex) = measfunc(x_post);
        
        xk = x_post;
        
        pk = p_post;
        
        p=p_post;
        
        harmindex = 1;
        for index = 1:4:(4*harmnum)
            xk(index+2) = omega*Ts*harmindex;
            harmindex = harmindex+2;
        end
        
    end
end