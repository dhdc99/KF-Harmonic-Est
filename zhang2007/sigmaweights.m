% Compute weights for each sigma point
function [wm,wc] = sigmaweights(L,alpha,kappa,b)
    wm = zeros(2*L+1,1);
    wc = zeros(2*L+1,1);
    lambda = (alpha^2)*(L+kappa) - L;
    wm(1) = lambda/(L+lambda);
    wc(1) = (lambda/(L+lambda)) + (1-alpha^2 + b);
    temp = 1/(2*(L+lambda));
    for index = 2:1:(2*L+1)

            wm(index) = temp;
            wc(index) = temp;
            

    end
end