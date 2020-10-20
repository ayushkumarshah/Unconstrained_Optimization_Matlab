% Main file
N = 1000;
N2 = 100;
delta = 1e-3;
delta2 = 1e-1;

x1 = ones(100, 1) * 50; 
x2 = ones(100, 1) * 1; 
x3 = [];

method1 = "Gradient's Descent Method";
method2 = "Newton's Method";
method3 = "Quasi-Newton's Method";

figname1 = "fun1";
figname2 = "fun2";
figname3 = "fun3";

% Function 1
% Gradient descent
[x_opt_fun1_gd, f_opt_fun1_gd, errors_fun1_gd] = grad_descent(@fun1, @g_fun1, x1, N, delta, zeros(100, 1), 1, 0.1, 0.5);
% OR [x_opt_fun1_gd, f_opt_fun1_gd, errors_fun1_gd] = grad_descent(@fun1, @g_fun1, x1, N, delta, zeros(100, 1));
plot_err(errors_fun1_gd, method1, figname1);

% Newton's method
[x_opt_fun1_n, f_opt_fun1_n, errors_fun1_n] = newton(@fun1, @g_fun1, @H_fun1, x1, N, delta, zeros(100, 1));
plot_err(errors_fun1_n, method2, figname1);

% Quasi-Newton's method
[x_opt_fun1_qn, f_opt_fun1_qn, errors_fun1_qn] = q_newton(@fun1, @g_fun1, x1, N, delta, zeros(100, 1));
plot_err(errors_fun1_qn, method3, figname1);

% Function 2
% Gradient descent
[x_opt_fun2_gd, f_opt_fun2_gd, errors_fun2_gd] = grad_descent(@fun2, @g_fun2, x2, N2, delta2);
plot_err(errors_fun2_gd, method1, figname2);

% Newton's method
[x_opt_fun2_n, f_opt_fun2_n, errors_fun2_n] = newton(@fun2, @g_fun2, @H_fun2, x2, N2, delta2);
plot_err(errors_fun2_n, method2, figname2);

% Quasi-Newton's method
[x_opt_fun2_qn, f_opt_fun2_qn, errors_fun2_qn] = q_newton(@fun2, @g_fun2, x2, N2, delta2);
plot_err(errors_fun2_qn, method3, figname2);

% Function 3
% % Gradient descent
% [x_opt_fun3_gd, f_opt_fun3_gd, errors_fun3_gd] = grad_descent(@fun3, @g_fun3, x3, N, delta);
% plot_err(errors_fun3_gd, method1, figname3);

% % Newton's method
% [x_opt_fun3_n, f_opt_fun3_n, errors_fun3_n] = newton(@fun3, @g_fun3, @h_fun3, x3, N, delta);
% plot_err(errors_fun3_n, method2, figname3);
