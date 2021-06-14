% Compute prior state and covariance estimations
function [x_prior,p_prior] = priorstatesest(newsig,wm,wc,Q)
    x_prior = zeros(size(newsig,1),1);
    p_prior = zeros(size(newsig,1),size(newsig,1));
    for index = 1:1:(size(newsig,2))
        if ~((mod(index,4)) == 0)
            x_prior = x_prior + wm(index).*newsig(:,index);
        end
    end
    
    for index = 1:1:(size(newsig,2))
        if ~((mod(index,4)) == 0)
            p_prior = p_prior + wc(index).*(ecm(newsig(:,index),x_prior));
        end
    end
    
    p_prior = p_prior + Q;
end