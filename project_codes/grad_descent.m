function [x_opt, f_opt, errors] = grad_descent(f, g, x, N, delta, varargin)
% Gradient Descent optimization with line search
% Example call: grad_descent(@f_quadratic, @g_quadratic, [50;50], 1000, 1e-3)

diff = Inf;
errors = [];
n = 0;
x_opt = x;

while n < N && diff > delta 
    n = n + 1;    
    p = -g(x_opt);
    alpha = back_track_line(f, g, p, x_opt);
    x = x_opt + alpha * p;
    if nargin > 5
        diff = abs(f(x) - f(varargin{1}));
    else
        diff = abs(f(x) - f(x_opt));
    end
    errors(n) = diff;
    x_opt = x;  
end
f_opt = f(x_opt);
end

