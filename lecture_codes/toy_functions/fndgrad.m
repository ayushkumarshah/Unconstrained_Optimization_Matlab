function g = fndgrad(f,x,order,varargin)
% calculate gradient by finite differences
% f: function handle to the input function
% x: the value of x at which you wish to evaluate gradient of f
% order: the order of finite difference gradient you want to sue
% varargin: value of step size, if no input provided, use the default input
% specified in the code

if nargin < 3
    order = 2;
end
if nargin<4
    e = sqrt(eps)*(1+norm(x(:),inf));
else
    e = varargin{1};%varargin{1}*sqrt(eps)*(1+norm(x(:),inf));
end

f0 = f(x);


if order==1
    f2 = zeros(size(x));
    for i=1:length(x);
        x2 = x;
        x2(i) = x(i) + e;
        f2(i) = f(x2);
    end
    g = (1/e)*(f2-f0);
elseif order==2
    f2 = zeros(size(x));
    f3 = zeros(size(x));
    for i=1:length(x);
        x2 = x;
        x2(i) = x(i) + e;
        f2(i) = f(x2);
        x3 = x;
        x3(i) = x(i) - e;
        f3(i) = f(x3);
    end
    g = (1/e/2)*(f2-f3);
elseif order==4
    f1 = zeros(size(x));
    f2 = zeros(size(x));
    f3 = zeros(size(x));
    f4 = zeros(size(x));
    for i=1:length(x);
        x1 = x;
        x1(i) = x(i) + 2*e;
        f1(i) = f(x1);
        x2 = x;
        x2(i) = x(i) + e;
        f2(i) = f(x2);
        x3 = x;
        x3(i) = x(i) - e;
        f3(i) = f(x3);
        x4 = x;
        x4(i) = x(i) - 2*e;
        f4(i) = f(x4);
    end
    g = (1/e/12)*(-f1+8*f2-8*f3+f4);
% elseif order==-1
%     g  = zeros(size(x));
%     i  = sqrt(-1);
%     for j=1:numel(x)
%         x2 = x;
%         x2(j) = x(j) + e*i;
%         g(j) = imag(f(x2))/e;
%     end
else
    error('order must be 1 or 2 or 4');
end