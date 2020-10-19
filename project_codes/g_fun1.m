function dy = g_fun1(x)
% Gradient of quadratic function: y = sum (i * x_i ^ 2) for i = 1 to n
% Argument: 
% x: Dimensions must be 100 by n  

n = 100;
dy = zeros(n, 1);
for i=1:n
    dy(i) = 2 * i * x(i, :);
end
