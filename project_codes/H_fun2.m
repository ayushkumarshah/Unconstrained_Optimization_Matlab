function H = H_fun2(x)
% Hessian of function 2

[A, b] = read_coeff_fun2();
H = A' * diag(1 ./ ((b - A * x) .^ 2)) * A;

end