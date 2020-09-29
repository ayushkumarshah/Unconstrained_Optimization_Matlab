function y = f_quadratic(x)
%quadratic function y = x1^2 + 10x2^2
%input x should be in 2 by N form

y = x(1,:).^2 + 10.*x(2,:).^2;

