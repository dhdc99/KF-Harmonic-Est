function yk = measfunc(xk,omega,k,Ts,vk)
    arguments
        xk {mustBeFinite,mustBeNumeric,mustBeVector}
        omega {mustBeFinite,mustBeNumeric}
        k {mustBeFinite,mustBeNumeric}
        Ts {mustBeFinite,mustBeNumeric}
        vk {mustBeFinite,mustBeNumeric} = 0
    end
    
    % Check if the state vector is a column vector, is not empty, and is a
    % multiple of 2
    if ~isequal(size(xk,2),1)
        error('State vector is not a column vector.');
    elseif isequal(size(xk,1),0)
        error('Empty state vector.');
    elseif isequal(mod(size(xk,1),2),0)
        yk = 0;
        
        % Measure output amplitude
        for index = 1:2:size(xk,1)
            yk = yk + cos(index.*omega.*k.*Ts).*xk(index) - sin(index.*omega.*k.*Ts).*xk(index+1);
        end
        
        yk = yk +vk;
    else
        error('Number of states is not a multiple of 2.');
    end
end