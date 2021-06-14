% Propagate sigma points through the nonlinear function
function sigmanew = sigmaupdate(sigmapoints)
    sigmanew = zeros(size(sigmapoints));
    for index = 1:1:size(sigmapoints,2)
        sigmanew(:,index) = sysfunc(sigmapoints(:,index));
    end
end