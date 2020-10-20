function [x_opt, f_opt, errors] = newton(f, g, H, x, N, delta, varargin)
% Newton optimization method with line search
% Example call: newton(@f_exp, @g_exp, @h_exp, [2;1], 1000, 1e-3);

diff = Inf;
errors = [];
n = 0;
x_opt = x;
if nargin == 9
    alpha_i = varargin{1};
    c = varargin{2};
    rho = varargin{3};
elseif nargin == 10
    alpha_i = varargin{2};
    c = varargin{3};
    rho = varargin{4};
end
while n < N && diff > delta 
    n = n + 1;    
    p = H(x_opt) \ (-g(x_opt));
    if nargin >= 9
        alpha = back_track_line(f, g, p, x_opt, alpha_i, c, rho);    
    else
        alpha = back_track_line(f, g, p, x_opt);
    end
    x = x_opt + alpha * p;
    if nargin == 7 || nargin == 10
        diff = abs(f(x) - f(varargin{1}));
    else
        diff = abs(f(x) - f(x_opt));
    end
    errors(n) = diff;
    x_opt = x;  
end
f_opt = f(x_opt);
end


