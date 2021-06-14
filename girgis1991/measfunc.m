function yk = measfunc(xk,vk)
    arguments
        xk {mustBeFinite,mustBeNumeric,mustBeVector}
        vk {mustBeFinite,mustBeNumeric} = 0;
    end
    
    % Check if the state vector is a column vector, is not empty, and is a multiple of 4
    if ~isequal(size(xk,2),1)
        error('State vector is not a column vector.');
    elseif isequal(size(xk,1),0)
        error('Empty state vector.');
    elseif isequal(mod(size(xk,1),4),0)
        yk = 0;
        
        % Measure output amplitude
        for xindex = 1:4:size(xk,1)
            yk = yk + xk(xindex).*xk(xindex+3);
        end
        
        yk = yk +vk;
    else
        error('Number of states is not a multiple of 4.');
    end
end