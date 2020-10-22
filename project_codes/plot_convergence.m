function plot_convergence(f_list)
% Plots steps in the optimization
figure;
lw = 3;
n = length(f_list);
% f_star = fun1(zeros(100, 1));
for i=1:n-1
    line(vertcat(i, i+1), vertcat(f_list(i), f_list(i+1)), 'LineWidth', lw);
    hold on;
    plot(i, f_list(i), 'o');
%     plot(i, f_star, '*');
end
plot(n, f_list(n), 'o');
% xlabel("Iterations");
% ylabel("Errors: |f(k) - f(k-1)|");

