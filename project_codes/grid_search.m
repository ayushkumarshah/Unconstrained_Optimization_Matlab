function [best_results, best_params, errors_df] = grid_search(grid_params, method, method_args, fun_name, method_name)
grid_outputs = {};
fprintf('Performing grid search ...\n')
for i=1:length(grid_params)
    params = grid_params{i};
    [x_opt, f_opt, errors, x_list] = method(method_args{[1:length(method_args)-2]}, ...
                                     params{:}, method_args{[length(method_args)-1:length(method_args)]});
    grid_outputs{i} = {x_opt, f_opt, errors, length(errors), errors(length(errors)), x_list};
end
[best_results, best_params, errors_df, errors_df_unsorted] = get_best_results(grid_params, grid_outputs);
file_path = '../grid_search_results/';
writetable(errors_df, file_path+fun_name+'_'+method_name+'.csv','Delimiter',',')
writetable(errors_df_unsorted, file_path+fun_name+'_'+method_name+'_unsorted.csv','Delimiter',',')
end