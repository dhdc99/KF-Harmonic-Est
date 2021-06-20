% Output a matrix with columns being sigma points
function sigmapoints = sigmaselect(xk_est,pk,alpha,kappa)
    L = size(xk_est,1);
    sigmanum = 2*L+1;
    lambda = (alpha^2)*(L+kappa) - L;
    mat = chol((L+lambda)*pk,'lower');
    
%     sigmapoints1 = zeros(L,sigmanum);
%     sigmapoints1(:,1) = xk_est;
%     for index = 2:1:(L+1)
%         sigmapoints1(:,index) = xk_est + mat(:,index-1);
%     end
%     for index = (L+2):1:(2*L+1)
%         sigmapoints1(:,index) = xk_est - mat(:,index-L-1);
%     end

%     sigmapoints1 = repmat(xk_est,1,sigmanum);
%     sigmapoints1(:,2:(L+1)) = xk_est + mat;
%     sigmapoints1(:,(L+2):(sigmanum)) = xk_est - mat;

    sigmapoints = [xk_est, xk_est + mat, xk_est - mat];
end