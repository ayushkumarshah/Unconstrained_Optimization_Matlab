function plot_steps(x_list, method_name, function_name)
% Plots steps in the optimization
figpath = '../plots/' + method_name + ' ' + function_name + '_steps.png';
figure;
lw = 3;
n = length(x_list);
for i=1:n-1
    line(vertcat(x_list(1, i), x_list(1, i+1)), vertcat(x_list(2, i), x_list(2, i+1)), 'LineWidth', lw);
    hold on;
    plot(x_list(1, i), x_list(2, i), 'o');
end
plot(x_list(1, n), x_list(2, n), 'o');
xlabel("x_1");
ylabel("x_2");
title(method_name + ": x steps on " +function_name);
saveas(gcf, figpath);
fprintf('Steps Plot written to %s \n \n', figpath);
