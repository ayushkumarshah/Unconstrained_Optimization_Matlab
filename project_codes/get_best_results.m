function [best_results, best_params, errors_df, errors_df_unsorted] = get_best_results(grid_params, grid_outputs)
exp_count = length(grid_params);
f_opts = zeros(exp_count, 1);
steps = zeros(exp_count, 1);
final_errors = zeros(exp_count, 1);
alpha_i = zeros(exp_count, 1);
c = zeros(exp_count, 1);
rho = zeros(exp_count, 1);

for i=1:exp_count
    params = grid_params{i};
    [alpha_i(i), c(i), rho(i)] = params{:};
    outputs = grid_outputs{i};
    f_opts(i) = outputs{2};
    steps(i) = outputs{4};
    final_errors(i) = outputs{5};
end        
errors_df_unsorted = table(alpha_i, c, rho, f_opts, steps, final_errors);
errors_df = sortrows(errors_df_unsorted, 'f_opts', 'MissingPlacement','last');
fprintf('\nGrid search results: Top 10 by f_opts\n\n');
disp(errors_df(1:10,:));

% Best results
[~, min_idx] = min(f_opts);
best_results = grid_outputs{min_idx};

% Best parameters
best_params = grid_params{min_idx};