% Compute prior measurement estimations and covariances
function [y_prior,pyk,pxkyk] = priormeasest(x_prior,newsig,wm,wc,R,hk)
    Y = (hk*newsig)';
    
    y_prior = wm'*Y;
    
    pyk = wc'*((Y-y_prior).^2);
    
    pxkyk = wc'.*(newsig-x_prior)*(Y-y_prior);
    
    pyk = pyk +R;
    
end