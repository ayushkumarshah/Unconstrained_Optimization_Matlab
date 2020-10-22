function [best_results, best_params, errors_df] = get_best_results(exp_results)
exp_count = length(exp_results);
f_opts = zeros(exp_count, 1);
steps = zeros(exp_count, 1);
final_errors = zeros(exp_count, 1);
alpha_i = zeros(exp_count, 1);
c = zeros(exp_count, 1);
rho = zeros(exp_count, 1);

for i=1:exp_count
    params = exp_results(i).params;
    [alpha_i(i), c(i), rho(i)] = params{:};
    outputs = exp_results(i).outputs;
    f_opts(i) = outputs{2};
    steps(i) = outputs{4};
    final_errors(i) = outputs{5};
end        
errors_df = table(alpha_i, c, rho, f_opts, steps, final_errors);
errors_df = sortrows(errors_df, 'f_opts', 'MissingPlacement','last');
fprintf('\nGrid search results\n\n');
disp(errors_df(1:10,:));

% Best results
[~, min_idx] = min(f_opts);
best_results = exp_results(min_idx).outputs;

% Best parameters
best_params = exp_results(min_idx).params;