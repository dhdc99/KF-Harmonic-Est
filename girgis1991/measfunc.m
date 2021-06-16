function yk = measfunc(xk,hk)
    
    
    % Check if the state vector is a column vector, is not empty, and is a
    % multiple of 2
    if ~isequal(size(xk,2),1)
        error('State vector is not a column vector.');
    elseif isequal(size(xk,1),0)
        error('Empty state vector.');
    elseif isequal(mod(size(xk,1),2),0)
        yk = hk*xk;
    else
        error('Number of states is not a multiple of 2.');
    end
end