% Compute prior state and covariance estimations
function [x_prior,p_prior] = priorstatesest(newsig,wm,wc)
    x_prior = zeros(size(newsig,1),1);
    p_prior = zeros(size(newsig,1),size(newsig,1));
    for index = 1:1:(size(newsig,2))
        x_prior = x_prior + wm(index).*newsig(:,index);
    end
    
    for index = 1:1:(size(newsig,2))
        p_prior = p_prior + wc(index).*(ecm(newsig(:,index),x_prior));
    end
end