% Update posterior estimations from prior
function [x_post,p_post,K] = UKFupdate(x_prior,y_prior,p_prior,yk,pyk,pxkyk)
    K = pxkyk/pyk; %Equivalant to pxkyk*inv(pyk)
    x_post = x_prior + K*(yk - y_prior);
    p_post = p_prior - K*pyk*(K');
end