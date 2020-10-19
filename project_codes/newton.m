function [x_opt, f_opt, errors] = newton(f, g, H, x, N, delta, varargin)
% Newton optimization method with line search
% Example call: newton(@f_exp, @g_exp, @h_exp, [2;1], 1000, 1e-3);

diff = Inf;
errors = [];
n = 0;
x_opt = x;
while n < N && diff > delta 
    n = n + 1;    
    p = H(x_opt) \ (-g(x_opt));
    alpha = back_track_line(f, g, p, x_opt);
    x = x_opt + alpha * p;
    if nargin > 6
        diff = abs(f(x) - f(varargin{1}));
    else
        diff = abs(f(x) - f(x_opt));
    end
    errors(n) = diff;
    x_opt = x;  
end
f_opt = f(x_opt);
end


