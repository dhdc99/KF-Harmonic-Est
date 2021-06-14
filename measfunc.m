function yk = measfunc(xk,vk)
    arguments
        xk {mustBeFinite,mustBeNumeric,mustBeVector}
        vk {mustBeFinite,mustBeNumeric,mustBeVector} = zeros(size(xk,1)./4,1)
    end

    % Check if the state vector is a column vector, is not empty, and is a multiple of 4
    if ~isequal(size(xk,2),1)
        error('State vector is not a column vector.');
    elseif isequal(size(xk,1),0)
        error('Empty state vector.');
    elseif isequal(mod(size(xk,1),4),0)
        % Preallocate memory
        yk = zeros(size(xk,1)./4,1);
        
        % Measure output amplitude
        yindex = 1;
        for xindex = 1:4:size(xk,1)
            yk(yindex) = xk(xindex).*xk(xindex+3) + vk(yindex);
            yindex = yindex +1;
        end
    else
        error('Number of states is not a multiple of 4.');
    end
end