% Compute prior measurement estimations and covariances
function [y_prior,pyk,pxkyk] = priormeasest(x_prior,newsig,wm,wc,R)
    y_prior = 0;
    Y = zeros(size(newsig,2),1);
    pyk = 0;
    pxkyk = zeros(size(newsig,1),1);
    for index = 1:1:size(newsig,2)
        Y(index) = measfunc(newsig(:,index));
    end
    
    for index = 1:1:size(newsig,2)
        y_prior = y_prior + wm(index).*Y(index);
    end
    
    for index = 1:1:size(newsig,2)
        pyk = pyk + wc(index).*((Y(index)-y_prior).^2);
    end
    
    pyk = pyk +R;
    
    for index = 1:1:size(newsig,2)
        pxkyk = pxkyk + wc(index).* ((newsig(:,index)-x_prior)*((Y(index)-y_prior)'));
    end
end