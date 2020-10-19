function plot_err(errors, method, figname)
figure;
lw = 3;
plot(errors, 'LineWidth', lw);
title(method + ": Errors");
xlabel("Iterations");
ylabel("Errors: |f(k) - f(k-1)|");
if figname ~= "None"
    figpath = '../plots/' + method + ' ' + figname + '.png';
    saveas(gcf, figpath);
    fprintf('Optimization Plot written to %s \n \n', figpath);
end
end

