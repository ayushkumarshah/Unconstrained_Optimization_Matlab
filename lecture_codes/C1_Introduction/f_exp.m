function y = f_exp(x)
% sum of exp functions 
% input x should be in 2 by N form

y = exp(x(1,:) + 3.*x(2,:) - 0.1) + exp(x(1,:) - 3.*x(2,:) - 0.1) ...
    + exp(-x(1,:)  - 0.1);