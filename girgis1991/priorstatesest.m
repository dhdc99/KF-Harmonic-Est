% Compute prior state and covariance estimations
function [x_prior,p_prior] = priorstatesest(sigmas,wm,wc,Q)
    x_prior = zeros(size(sigmas,1),1);
    p_prior = zeros(size(sigmas,1),size(sigmas,1));
    
    for index = 1:1:(size(sigmas,2))
        x_prior = x_prior + wm(index).*sigmas(:,index);
    end
    
    ptemp = sigmas - x_prior;
    ptempt = ptemp.';
    for index = 1:(size(sigmas,2))
        p_prior = p_prior + wc(index).*(ptemp(:,index)*ptempt(index,:));
    end
    p_prior = p_prior + Q;
end