function [x_opt, f_opt, errors, x_list] = grad_descent(f, g, x, N, delta, varargin)
% Gradient Descent optimization with line search
% Example call: grad_descent(@f_quadratic, @g_quadratic, [50;50], 1000, 1e-3)

parser = inputParser;
addOptional(parser,'alpha_i', 1);
addOptional(parser,'c', 0.1);
addOptional(parser,'rho', 0.5);
addParameter(parser,'f_star', Inf);
addParameter(parser,'check_domain', 0);
parse(parser, varargin{:});

alpha_i = parser.Results.alpha_i;
c = parser.Results.c;
rho = parser.Results.rho;
f_star = parser.Results.f_star;
check_domain = parser.Results.check_domain;

diff = Inf;
errors = [];
n = 0;
x_opt = x;
x_list = [];
x_list(:,1) = x_opt;
while n < N && diff > delta 
    n = n + 1;    
    p = -g(x_opt);
    alpha = back_track_line(f, g, p, x_opt, alpha_i, c, rho, 'check_domain', check_domain);    
    x = x_opt + alpha * p;
    if f_star ~= Inf
        diff = abs(f(x) - f_star);
    else
        diff = abs(f(x) - f(x_opt));
    end
    errors(n) = diff;
    x_opt = x; 
    x_list(:, n+1) = x_opt;
end
f_opt = f(x_opt);
end

