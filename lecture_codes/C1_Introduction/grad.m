function [grad_f] = grad(f, x, order, varargin)
% Calculate gradient of the function f by finite differences
% Test call: grad_f = grad(@f_quadratic, [1;2], 1, 1e-4)
% Arguments:
% f: function handle to the input function
% x: the value of x at which gradient of f is to be evaluated
% order: the order of finite difference gradient to be used
% varargin: value of step size, if not provided, use the default step size
% defined in the code

% f = @(x) (x(1)^2) + 10*(x(2)^2);
% x = [1; 2];
% order = 1;
% h = 1e-4;
% h = sqrt(eps) * (1 + norm(x(:), inf));

if nargin < 3
    order = 2;
end
if nargin < 4
    h = sqrt(eps) * (1 + norm(x(:), inf));
else
    h = varargin{1};
end

n = length(x);
e = eye(n);
grad_f = zeros(size(x));
f_x = f(x);
f_x_plus_h = zeros(size(x));
f_x_minus_h = zeros(size(x));
f_x_plus_2h = zeros(size(x));
f_x_minus_2h = zeros(size(x));

if order == 1
    for i=1: n
        f_x_plus_h(i) = f(x + h * e(:,i));  
    end
    grad_f = (f_x_plus_h - f_x) ./ h;
elseif order == 2
    for i=1: n
        f_x_plus_h(i) = f(x + h * e(:,i));
        f_x_minus_h(i) = f(x - h * e(:,i));
    end
    grad_f = (f_x_plus_h - f_x_minus_h) ./ (2 * h);
elseif order == 4
    for i=1: n
        f_x_plus_h(i) = f(x + h * e(:,i));
        f_x_minus_h(i) = f(x - h * e(:,i));
        f_x_plus_2h(i) = f(x + 2 * h * e(:,i));
        f_x_minus_2h(i) = f(x - 2 * h * e(:,i));
    end
    grad_f = (- f_x_plus_2h + 8 .* f_x_plus_h - 8 .* f_x_minus_h + ... 
                f_x_minus_2h) ./ (12 * h);
end
end

