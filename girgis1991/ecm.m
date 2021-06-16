% Error covariance matrix
function pk = ecm(xk,xk_est)
    temp = xk-xk_est;
    pk = temp*temp.';
end