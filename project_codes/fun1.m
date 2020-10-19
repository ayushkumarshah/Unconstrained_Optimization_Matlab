function y = fun1(x)
% quadratic function: y = sum (i * x_i ^ 2) for i = 1 to n
% Argument: 
% x: Dimensions must be 100 by n  

n = 100;
i = 1:n;
y = i * x .^ 2;
end

