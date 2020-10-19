function H = H_fun1(x)
% Hessian of quadratic function: y = sum (i * x_i ^ 2) for i = 1 to n
% Argument: 
% x: Dimensions must be 100 by n  

n = 100;
i = 1:n;
H = 2 * diag(i);
end
