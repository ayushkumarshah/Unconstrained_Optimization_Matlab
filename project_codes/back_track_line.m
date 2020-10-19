function [alpha] = back_track_line(f, g, p, x, varargin)
% Backtracking line search algorithm

if nargin == 7
    alpha_i = varargin{1};
    c = varargin{2};
    rho = varargin{3};
else
    alpha_i = 1;
    c = 0.1;
    rho = 0.5;
end

alpha = alpha_i;
while f(x + alpha * p) > f(x) + c * p' * g(x) * alpha
    alpha = rho * alpha;
end
end