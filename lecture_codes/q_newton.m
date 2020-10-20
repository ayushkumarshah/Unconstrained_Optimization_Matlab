function [x_opt, f_opt, errors] = q_newton(f, g, x, N, delta, varargin)
% Quasi-Newton optimization method with line search
% q_newton(@f_exp, @g_exp, @h_exp, [2;1], 1000, 1e-3);

diff = Inf;
errors = [];
n = 0;
x_opt = x;
F = eye(length(x));

while n < N && diff > delta 
    n = n + 1;
    p = - F * g(x_opt);
    alpha = back_track_line(f, g, p, x_opt);
    x = x_opt + alpha * p;
    if nargin > 6
        diff = abs(f(x) - f(varargin{1}));
    else
        diff = abs(f(x) - f(x_opt));
    end
    errors(n) = diff;
    line(vertcat(x_opt(1), x(1)), vertcat(x_opt(2), x(2)));
    hold on;
    plot(x(1), x(2), 'o');
    s = x - x_opt;
    y = g(x) - g(x_opt);
    F = F + ((y' * (F * y + s) * s * s') / (y' * s) ^ 2) - ((s * y' * F + F * y * s') / (y' * s));
    x_opt = x;
    
end
f_opt = f(x_opt);
figure;
plot(errors);
% end


