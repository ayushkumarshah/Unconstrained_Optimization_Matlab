function plot_err(errors,  method_name, function_name, varargin)
figure;
lw = 3;
plot(errors, 'LineWidth', lw);
title(method_name + ": Errors on " +function_name);
xlabel("Iterations");
if nargin == 4
    ylabel("Errors: |f(k) - f^*|");
else
    ylabel("Errors: |f(k) - f(k-1)|");
end
figpath = '../plots/' + method_name + ' ' + function_name + '.png';
saveas(gcf, figpath);
fprintf('Optimization Plot written to %s \n \n', figpath);
end
