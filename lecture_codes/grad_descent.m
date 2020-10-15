function [x_opt, f_opt, errors] = grad_descent(f, g, x, N, delta, varargin)
% Gradient Descent optimization with line search
% grad_descent(@f_quadratic, @g_quadratic, [50;50], 1000, 1e-3)

% f = @f_quadratic;
% g = @g_quadratic;
% x = [50; 50]; for quadratic 
% x = [2; 1]; for exp
% N = 1000;
% delta = 1e-3;

diff = Inf;
errors = [];
n = 0;
x_opt = x;

while n < N && diff > delta 
    n = n + 1;    
    p = -g(x_opt);
    alpha = back_track_line(f, g, p, x_opt);
    x = x_opt + alpha * p;
    if nargin > 6
        diff = abs(f(x) - f(varargin{7}));
    else
        diff = abs(f(x) - f(x_opt));
    end
    errors(n) = diff;
    line(vertcat(x_opt(1), x(1)), vertcat(x_opt(2), x(2)));
    hold on;
    plot(x(1), x(2), 'o');
    hold on;
    x_opt = x;  
end
f_opt = f(x_opt);
figure;
plot(errors);
% end

