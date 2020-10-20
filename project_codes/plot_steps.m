function plot_steps(x_list)
% Plots steps in the optimization
figure;
n = length(x_list);
for i=1:n-1
    line(vertcat(x_list(1, i), x_list(1, i+1)), vertcat(x_list(2, i), x_list(2, i+1)));
    hold on;
    plot(x_list(1, i), x_list(2, i), 'o');
end
plot(x_list(1, n), x_list(2, n), 'o');

