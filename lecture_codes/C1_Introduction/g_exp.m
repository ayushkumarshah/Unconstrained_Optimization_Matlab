function y = g_exp(x)
% gradients of sum of exp functions 
% input x should be in 2 by N form

y = [exp(x(1,:) + 3.*x(2,:) - 0.1) + exp(x(1,:) - 3.*x(2,:) - 0.1) ...
    - exp(-x(1,:)  - 0.1);
    3.*exp(x(1,:) + 3.*x(2,:) - 0.1) - 3.*exp(x(1,:) - 3.*x(2,:) - 0.1)];