function plot_err(errors,  method_name, function_name)
figure;
lw = 3;
plot(errors, 'LineWidth', lw);
title(method_name + ": Errors on " +function_name);
xlabel("Iterations");
ylabel("Errors: |f(k) - f(k-1)|");
figpath = '../plots/' + method_name + ' ' + function_name + '.png';
saveas(gcf, figpath);
fprintf('Optimization Plot written to %s \n \n', figpath);
end
