function [best_results, best_params, errors_df] = grid_search(grid_params, method, method_args)
grid_outputs = {};
fprintf('\nPerforming grid search ...\n')
for i=1:length(grid_params)
    params = grid_params{i};
    [x_opt, f_opt, errors, x_list] = method(method_args{[1:length(method_args)-2]}, ...
                                     params{:}, method_args{[length(method_args)-1:length(method_args)]});
    grid_outputs{i} = {x_opt, f_opt, errors, length(errors), errors(length(errors)), x_list};
end
[best_results, best_params, errors_df] = get_best_results(grid_params, grid_outputs);

end