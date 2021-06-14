function [output,p] = ukfsample(input,f0,Ts,harmnum,alpha,kappa,b,pnoisecov,mnoisecov)
    
    L= harmnum*4;
    omega = 2*pi*f0;
    xk = zeros(L,1);
    output = zeros(harmnum*4,length(input));
    %
    %     harmindex = 1;
    %     for index = 1:4:(4*harmnum)
    %         xk(index+2) = omega*Ts*harmindex;
    %         harmindex = harmindex+2;
    %     end
    
    
    for index = 1:4:(4*harmnum)
        xk(index+2) = omega*Ts;
    end
    
    pk = diag(0.1.*ones(L,1));
    
    [wm,wc] = sigmaweights(L,alpha,kappa,b);
    
    for signalindex = 1:1:length(input)
        sigmas = sigmaselect(xk,pk,alpha,kappa);
        
        sigmas = sigmaupdate(sigmas);
        
        Q = diag(pnoisecov.*rand(40,1));
        
        [x_prior,p_prior] = priorstatesest(sigmas,wm,wc,Q);
        
        R = normrnd(0,sqrt(mnoisecov));
        
        [y_prior,pyk,pxkyk] = priormeasest(x_prior,sigmas,wm,wc,R);
        
        yk = input(signalindex);
        
        [x_post,p_post,K] = UKFupdate(x_prior,y_prior,p_prior,yk,pyk,pxkyk);
        
        output(:,signalindex) = x_post;
        
        xk = x_post;
        
        pk = p_post;
        
        p=p_post;
        
        for index = 1:4:(4*harmnum)
            xk(index+2) = omega*Ts;
        end
        
    end
end