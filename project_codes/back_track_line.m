function [alpha] = back_track_line(f, g, p, x, varargin)
% Backtracking line search algorithm

parser = inputParser;
addOptional(parser,'alpha_i', 1);
addOptional(parser,'c', 0.1);
addOptional(parser,'rho', 0.5);
addParameter(parser,'check_domain', 0);
parse(parser, varargin{:});

alpha_i = parser.Results.alpha_i;
c = parser.Results.c;
rho = parser.Results.rho;
check_domain = parser.Results.check_domain;

alpha = alpha_i;
condition = true;
while condition
    if f(x + alpha * p) <= f(x) + c * p' * g(x) * alpha
        condition = false;
        if check_domain
            if ~isin_domain(x + alpha * p)
                condition = true;
            end
        else
            return;
        end
    end
    alpha = rho * alpha;
end
end