function exp = optimize(varargin)
% Run optimization experiments
% Eg run : exp = optimize("fun1", "fun2", "fun3");

fun_names = strings(nargin);
for i=1:nargin
    fun_names(i) = varargin{i};
end

method_names = ["Gradient Descent Method", "Newton's method", "Quasi-Newton's Method"];

% Define parameters for the 3 functions
exp.fun1 = struct('grid_search', true, 'functions', {{@fun1, @g_fun1, @H_fun1}}, ...
                   'extra_params', {{'f_star', 0}}, 'N', 1000, 'delta', 1e-4, ...
                   'x', ones(100, 1) * 50);
exp.fun2 = struct('grid_search', false, 'functions', {{@fun2, @g_fun2, @H_fun2}}, ...
                   'extra_params', {{'check_domain', 1}}, 'N', 300, 'delta', 1e-2, ...
                   'x', ones(100, 1) * 0.1);
               
exp.fun3 = struct('grid_search', true, 'functions', {{@fun3, @g_fun3, @H_fun3}}, ...
                   'extra_params', {{'check_domain', 0}}, 'N', 1000, 'delta', 1e-4, ...
                   'x', [50;50]);               
               
% Default Parameters
default_params = {1, 0.1, 0.5};

% Defining range of line search parameters for grid search
alpha_i = linspace(0.1, 1, 5);
c = linspace(0.1, 0.9, 6);
rho = linspace(0.1, 0.9, 6);

% Create grid for line search parameters
grid_params = create_grid(alpha_i, c, rho);

% Perform optimization for the given functions
for i=1:length(fun_names)
    % Gradient descent
    fprintf('%s on %s\n', method_names(1), fun_names(i));
    % % Grid search
    if exp.(fun_names(i)).grid_search
        method_args = {exp.(fun_names(i)).functions{[1:2]}, exp.(fun_names(i)).x, ...
                        exp.(fun_names(i)).N, exp.(fun_names(i)).delta, exp.(fun_names(i)).extra_params{:}};
        [~, best_params, errors_df] = grid_search(grid_params, @grad_descent, method_args, fun_names(i), method_names(1));
        params = best_params;
        exp.(fun_names(i)).grid_search_summary = errors_df;
    else
        params = default_params;
    end
    tic;
    [x_opt, f_opt, errors, x_list] = grad_descent(exp.(fun_names(i)).functions{[1:2]}, ...
                                     exp.(fun_names(i)).x, exp.(fun_names(i)).N,...
                                     exp.(fun_names(i)).delta, params{:}, exp.(fun_names(i)).extra_params{:});
    time = toc;
    exp.(fun_names(i)).grad_descent.params = params;
    exp.(fun_names(i)).grad_descent.outputs = {x_opt, f_opt, errors, length(errors), errors(length(errors)), x_list};
    fprintf('Parameters:\nalpha_i = %f \tc=%f \trho=%f\n\n',params{1}, params{2}, params{3});
    fprintf('Results:\nf_opt = %f\tsteps=%d\tfinal error=%f \ntotal time=%f sec \ttime per iteration=%f sec\n\n',...
             f_opt, length(errors), errors(length(errors)), time, time/length(errors));
    plot_err(errors, method_names(1), fun_names(i), exp.(fun_names(i)).extra_params{1});

    % Newton's method
    fprintf('%s on %s\n\n', method_names(2), fun_names(i));
    params = default_params;
    tic;
    [x_opt, f_opt, errors, x_list] = newton(exp.(fun_names(i)).functions{:}, ...
                                     exp.(fun_names(i)).x, exp.(fun_names(i)).N,...
                                     exp.(fun_names(i)).delta, exp.(fun_names(i)).extra_params{:});
    time = toc;
    exp.(fun_names(i)).newton.params = params;
    exp.(fun_names(i)).newton.outputs = {x_opt, f_opt, errors, length(errors), errors(length(errors)), x_list};
    fprintf('Parameters:\nalpha_i = %f\tc=%f\trho=%f\n\n', params{1}, params{2}, params{3});
    fprintf('Results:\nf_opt = %f\tsteps=%d\tfinal error=%f \ntotal time=%f sec \ttime per iteration=%f sec\n\n',f_opt, length(errors), errors(length(errors)), time, time/length(errors));
    plot_err(errors, method_names(2), fun_names(i), exp.(fun_names(i)).extra_params{1});

    % Quasi-Newton's method
    fprintf('%s on %s\n\n',method_names(3), fun_names(i));
    % % Grid search
    if exp.(fun_names(i)).grid_search
        method_args = {exp.(fun_names(i)).functions{[1:2]}, exp.(fun_names(i)).x, ...
                       exp.(fun_names(i)).N, exp.(fun_names(i)).delta, exp.(fun_names(i)).extra_params{:}};
        [~, best_params, errors_df] = grid_search(grid_params, @q_newton, method_args, fun_names(i), method_names(3));
        params = best_params;
        exp.(fun_names(i)).grid_search_summary = errors_df;
    else
        params = default_params;
    end
    tic;
    [x_opt, f_opt, errors, x_list] = q_newton(exp.(fun_names(i)).functions{[1:2]}, ...
                                     exp.(fun_names(i)).x, exp.(fun_names(i)).N,...
                                     exp.(fun_names(i)).delta, params{:}, exp.(fun_names(i)).extra_params{:});
    time = toc;
    exp.(fun_names(i)).q_newton.params = params;
    exp.(fun_names(i)).q_newton.outputs = {x_opt, f_opt, errors, length(errors), errors(length(errors)), x_list};
    fprintf('Parameters:\nalpha_i = %f\tc=%f\trho=%f\n\n',params{1}, params{2}, params{3});
    fprintf('Results:\nf_opt = %f\tsteps=%d\tfinal error=%f \ntotal time=%f sec \ttime per iteration=%f sec\n\n',f_opt, length(errors), errors(length(errors)), time, time/length(errors));
    plot_err(errors, method_names(3), fun_names(i), exp.(fun_names(i)).extra_params{1});
end

% Create steps plot for function 3 since 2 dimensional input
if any(fun_names(:) == "fun3")
    plot_steps(exp.fun3.grad_descent.outputs{6}, method_names(1), "fun3");
    plot_steps(exp.fun3.newton.outputs{6}, method_names(2), "fun3");
    plot_steps(exp.fun3.q_newton.outputs{6}, method_names(3), "fun3");
end