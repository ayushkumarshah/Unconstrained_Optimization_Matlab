function dy = g_quadratic(x)
% gradient of quadratic function y = x1^2 + 10x2^2
% input x should be in 2 by N form

dy = [2.*x(1,:); 20.*x(2,:)];