function y = fun3(x)
% Function 3
y = 100 * (x(2,:) - x(1,:).^2).^2 + (1 - x(1,:)).^2;
