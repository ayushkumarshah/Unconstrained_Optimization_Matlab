% Run experiments
fun_names = ["fun1", "fun2", "fun3"];
method_names = ["Gradient Descent Method", "Newton's method", "Quasi-Newton's Method"];

% Default Parameters
N = [1000, 300, 1000];
delta = [1e-4, 1e-2, 1e-4];
x1 = ones(100, 1) * 50; 
x2 = ones(100, 1) * 0.1; 
x3 = [50; 50];
default_params = {1, 0.1, 0.5};

% Defining range of line search parameters for grid search
alpha_i = linspace(0.1, 1, 5);
c = linspace(0.1, 0.9, 6);
rho = linspace(0.1, 0.9, 6);

% Create grid for line search parameters
grid_params = create_grid(alpha_i, c, rho);

% Function 1

% Gradient descent
fprintf('%s on %s\n', method_names(1), fun_names(1));
% Grid search
for i=1:length(grid_params)
    params = grid_params{i};
    [x_opt, f_opt, errors, x_list] = grad_descent(@fun1, @g_fun1, x1, N(1), delta(1), 0, params{:});
    exp.fun1.grad_desc(i).params = params;
    exp.fun1.grad_desc(i).outputs = {x_opt, f_opt, errors, length(errors), errors(length(errors)), x_list};
end
[best_results, best_params, errors_df] = get_best_results(exp.fun1.grad_desc);
fprintf('Best parameters:\nalpha_i = %f\tc=%f\trho=%f\n\n',best_params{1}, best_params{2}, best_params{3});
fprintf('Best results:\nf_opt = %f\tsteps=%d\tfinal error=%f\n\n',best_results{2}, best_results{4}, best_results{5});
plot_err(best_results{3}, method_names(1), fun_names(1));

% Newton's method
[x_opt, f_opt, errors, x_list] = newton(@fun1, @g_fun1, @H_fun1, x1, N(1), delta(1), 0);
exp.fun1.newton.params = default_params;
exp.fun1.newton.outputs = {x_opt, f_opt, errors, length(errors), errors(length(errors))};
fprintf('%s on %s\n\n', method_names(2), fun_names(1));
fprintf('Parameters:\nalpha_i = %f\tc=%f\trho=%f\n\n',default_params{1}, default_params{2}, default_params{3});
fprintf('Results:\nf_opt = %f\tsteps=%d\tfinal error=%f\n\n',f_opt, length(errors), errors(length(errors)));
plot_err(errors, method_names(2), fun_names(1));

% Quasi-Newton's method
[x_opt, f_opt, errors, x_list] = q_newton(@fun1, @g_fun1, x1, N(1), delta(1), 0);
exp.fun1.q_newton.params = default_params;
exp.fun1.q_newton.outputs = {x_opt, f_opt, errors, length(errors), errors(length(errors))};
fprintf('%s on %s\n\n',method_names(3), fun_names(1));
fprintf('Parameters:\nalpha_i = %f\tc=%f\trho=%f\n\n',default_params{1}, default_params{2}, default_params{3});
fprintf('Results:\nf_opt = %f\tsteps=%d \tfinal error=%f\n\n',f_opt, length(errors), errors(length(errors)));
plot_err(errors, method_names(3), fun_names(1));

% Function 2
% Gradient descent
% [x_opt, f_opt, errors] = grad_descent(@fun2, @g_fun2, x2, N(2), delta(2));
% exp.fun2.grad_descent.params = default_params;
% exp.fun2.grad_descent.outputs = {x_opt, f_opt, errors, length(errors), errors(length(errors))};
% plot_err(errors, method_names(1), fun_names(2));
% 
% % Newton's method
% [x_opt, f_opt, errors] = newton(@fun2, @g_fun2, @H_fun2, x2, N(2), delta(2));
% % exp.fun2.grad_descent.params = params;
% exp.fun2.newton.outputs = {x_opt, f_opt, errors, length(errors), errors(length(errors))};
% plot_err(errors, method_names(2), fun_names(2));
% 
% % Quasi-Newton's method
% [x_opt, f_opt, errors] = q_newton(@fun2, @g_fun2, x2, N(2), delta(2));
% % exp.fun2.grad_descent.params = params;
% exp.fun2.q_newton.outputs = {x_opt, f_opt, errors, length(errors), errors(length(errors))};
% plot_err(errors, method_names(3), fun_names(2));

% Function 3

% Gradient descent
fprintf('%s on %s\n', method_names(1), fun_names(3));
% Grid search
for i=1:length(grid_params)
    params = grid_params{i};
    [x_opt, f_opt, errors, x_list] = grad_descent(@fun3, @g_fun3, x3, N(3), delta(3), params{:});
    exp.fun3.grad_desc(i).params = params;
    exp.fun3.grad_desc(i).outputs = {x_opt, f_opt, errors, length(errors), errors(length(errors)), x_list};
end
[best_results, best_params, errors_df] = get_best_results(exp.fun3.grad_desc);
fprintf('Best parameters:\nalpha_i = %f\tc=%f\trho=%f\n\n',best_params{1}, best_params{2}, best_params{3});
fprintf('Best results:\nf_opt = %f\tsteps=%d\tfinal error=%f\n\n',best_results{2}, best_results{4}, best_results{5});
plot_err(best_results{3}, method_names(1), fun_names(3));
plot_steps(best_results{6}, method_names(1), fun_names(3));

% Newton's method
[x_opt, f_opt, errors, x_list] = newton(@fun3, @g_fun3, @H_fun3, x3, N(3), delta(3));
exp.fun3.newton.params = default_params;
exp.fun3.newton.outputs = {x_opt, f_opt, errors, length(errors), errors(length(errors))};
fprintf('%s on %s\n\n', method_names(2), fun_names(3));
fprintf('Parameters:\nalpha_i = %f\tc=%f\trho=%f\n\n',default_params{1}, default_params{2}, default_params{3});
fprintf('Results:\nf_opt = %f\tsteps=%d\tfinal error=%f\n\n',f_opt, length(errors), errors(length(errors)));
plot_err(errors, method_names(2), fun_names(3));
plot_steps(x_list, method_names(2), fun_names(3));

% Quasi-Newton's method
[x_opt, f_opt, errors, x_list] = q_newton(@fun3, @g_fun3, x3, N(3), delta(3));
exp.fun3.q_newton.params = default_params;
exp.fun3.q_newton.outputs = {x_opt, f_opt, errors, length(errors), errors(length(errors))};
fprintf('%s on %s\n\n',method_names(3), fun_names(3));
fprintf('Parameters:\nalpha_i = %f\tc=%f\trho=%f\n\n',default_params{1}, default_params{2}, default_params{3});
fprintf('Results:\nf_opt = %f\tsteps=%d \tfinal error=%f\n\n',f_opt, length(errors), errors(length(errors)));
plot_err(errors, method_names(3), fun_names(3));
plot_steps(x_list, method_names(3), fun_names(3));


