function [x_opt, f_opt, errors] = grad_descent(f, g, x, N, delta, figname, varargin)
% Gradient Descent optimization with line search
% Example call: grad_descent(@f_quadratic, @g_quadratic, [50;50], 1000, 1e-3, "quad")

diff = Inf;
errors = [];
n = 0;
x_opt = x;

set(gcf, 'Position',  [100, 100, 1400, 600]);
subplot(1, 2, 1);
while n < N && diff > delta 
    n = n + 1;    
    p = -g(x_opt);
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
    x_opt = x;  
end
f_opt = f(x_opt);
title("Gradient descent method steps");
subplot(1, 2, 2);
plot(errors);
title("Gradient descent method errors");
xlabel("Iterations");
ylabel("Errors: |f(k) - f(k-1)|");
if figname ~= "None"
    figpath = '../plots/grad_descent_' + figname + '.png';
    saveas(gcf, figpath);
    fprintf('Optimization Plot written to %s \n \n', figpath);
end


% end

