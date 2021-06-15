% Error covariance matrix
function pk = ecm(xk,xk_est)
    pk = (xk-xk_est)*((xk-xk_est)');
end