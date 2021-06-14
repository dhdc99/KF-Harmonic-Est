% Compute prior measurement estimations and covariances
function [y_prior,pyk,pxkyk] = priormeasest(x_prior,newsig,wm,wc,R)
    y_prior = zeros(size(newsig,1)./4,1);
    Y = zeros(size(newsig,1)./4,size(newsig,2));
    pyk = zeros(size(newsig,1)./4);
    pxkyk = zeros(size(newsig,1),size(newsig,1)./4);
    for index = 1:1:size(newsig,2)
        Y(:,index) = measfunc(newsig(:,index));
    end
    
    for index = 1:1:size(newsig,2)
        y_prior = y_prior + wm(index).*Y(:,index);
    end
    
    for index = 1:1:size(newsig,2)
        pyk = pyk + wc(index).*ecm(Y(:,index),y_prior) + R;
    end
    
    for index = 1:1:size(newsig,2)
        pxkyk = pxkyk + wc(index).* ((newsig(:,index)-x_prior)*((Y(:,index)-y_prior)'));
    end
end