function xk1 = sysfunc(xk,wk)
% SYSFUNC System function of the harmonic system.
    arguments
        xk {mustBeFinite,mustBeNumeric,mustBeVector}
        wk {mustBeFinite,mustBeNumeric,mustBeVector} = zeros(size(xk,1),1)
    end

    % Check if the state vector is a column vector, is not empty, and is a multiple of 4
    if ~isequal(size(xk,2),1)
        error('State vector is not a column vector.');
    elseif isequal(size(xk,1),0)
        error('Empty state vector.');
    elseif isequal(mod(size(xk,1),4),0)
        % Preallocate memory
        xk1 = zeros(size(xk,1),1);
        
        % Update state vector
        for index = 1:4:size(xk,1)
            xk1(index) = xk(index).*cos(xk(index+2)) - xk(index+1).*sin(xk(index+2));
            xk1(index+1) = xk(index).*sin(xk(index+2)) + xk(index+1).*cos(xk(index+2));
            xk1(index+2) = xk(index+2);
            xk1(index+3) = xk(index+3);
        end
        
        xk1 = xk1 + wk;
    else
        error('Number of states is not a multiple of 4.');
    end
end