function dy = g_fun2(x)
% Gradient of function 2

[A, b, c] = read_coeff_fun2();
dy = c + A' * (1 ./ (b - A * x));

end