function xk1 = sysfunc(xk,wk,wk2)
% SYSFUNC System function of the harmonic system.
    arguments
        xk {mustBeFinite,mustBeNumeric,mustBeVector}
        wk {mustBeFinite,mustBeNumeric,mustBeVector} = zeros(size(xk,1),1)
        wk2 {mustBeFinite,mustBeNumeric} = diag(ones(size(xk,1),1))
    end

    % Check if the state vector is a column vector, is not empty, and is a
    % multiple of 2
    if ~isequal(size(xk,2),1)
        error('State vector is not a column vector.');
    elseif isequal(size(xk,1),0)
        error('Empty state vector.');
    elseif isequal(mod(size(xk,1),2),0)
        xk1 = wk2*xk + wk;
    else
        error('Number of states is not a multiple of 2.');
    end
end