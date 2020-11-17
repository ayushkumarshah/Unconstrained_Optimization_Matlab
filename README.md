# Unconstrained Optimization MATLAB

## Project 2 - Unconstrained Optimization: <br>CISC 820 Quantitative Foundations

## Running the code:

The codes are included in the `project_codes` directory, which need to be set as
the working directory.

Then the following function can be called in the console.

```matlab
>>> exp = optimize("fun1", "fun2", "fun3");
```

The arguments may contain a specific function or a list of functions.

The detailed results are displayed in the console after running the code.

## Accessing specific results

The `exp` variable is a structure which contains the parameters, results,
grid_search_results, etc of each input function given using each method.
The variable can be used to display any value that we are interested in.

Examples:

```matlab
>>> exp.fun1.grad_descent.params
>>> exp.fun2.newton.outputs
>>> exp.fun3.q_newton.grid_search_summary
```

## Documentation

The report and slides can be found in the `docs` directory.

## Convergence Plots

The convergence plots are generated in the `plots` directory.

## Grid Search Results

The grid search results are generated in the `grid_search_results` directory.
It contains both unsorted and sorted results (by f_min) for functions 1 and 3
using methods Gradient Descent and Quasi_Newton's method.

