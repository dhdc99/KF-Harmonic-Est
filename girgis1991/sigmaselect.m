% Output a matrix with columns being sigma points
function sigmapoints = sigmaselect(xk_est,pk,alpha,kappa)
    L = size(xk_est,1);
    lambda = (alpha^2)*(L+kappa) - L;
    sigmapoints = zeros(L,2*L+1);
    sigmapoints(:,1) = xk_est;
    mat = chol((L+lambda)*pk,'lower');
    for index = 2:1:(L+1)
        if mod(index,4) == 0
            sigmapoints(:,index) = xk_est;
        else
            sigmapoints(:,index) = xk_est + mat(:,index-1);
        end
    end
    for index = (L+2):1:(2*L+1)
        if mod(index,4) == 0
            sigmapoints(:,index) = xk_est;
        else
            sigmapoints(:,index) = xk_est - mat(:,index-L-1);
        end
    end
end