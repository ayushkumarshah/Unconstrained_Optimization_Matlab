% Main file

% Arguments for gradient descent
%f = @f_quadratic;
f = @fun3; % Adding fun3
g = @g_quadratic;
% x = [50; 50]; % for quadratic 
x = [2; 1]; % for exp
N = 1000;
delta = 1e-3;

% call gradeint descent
grad_descent(f, g, x, N, delta);


% Arguments for Newton
% f = @f_quadratic;
% g = @g_quadratic;
H = @h_quadratic;
% x = [50; 50]; for quadratic 
% x = [2; 1]; for exp
% N = 1000;
% delta = 1e-3;

% call newton
% newton(f, g, H, x, N, delta)

