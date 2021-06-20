% Compute prior state and covariance estimations
function [x_prior,p_prior] = priorstatesest(sigmas,wm,wc,Q)
%     L = size(sigmas,1);
%     sigmanum = size(sigmas,2);
    
    x_prior = (wm'*sigmas')';
    
    
%     ptemp = sigmas - x_prior;
%     for index = 1:(size(sigmas,2))
%         p_prior = p_prior + wc(index).*(ptemp(:,index)*ptemp(:,index).');
%     end
%     p_prior = p_prior + Q;

%     For details, see https://www.mathworks.com/matlabcentral/answers/350720
%     ptemp = sigmas - x_prior;
%     pcols = reshape((wc'.*ptemp),L,1,sigmanum);
%     prows = reshape(ptemp,1,L,sigmanum);
%     out = pcols.*prows;
%     p_prior = sum(out,3) + Q;

%     https://www.mathworks.com/matlabcentral/answers/520966
%     I am confident that it can't get faster than this.
    
    p_prior = (wc'.*(sigmas - x_prior))*(sigmas - x_prior)' + Q;
    
end