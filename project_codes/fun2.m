function y = fun2(x)
% function 2: Reads coefficients A, b, c from fun2_A.txt, fun2_b.txt and 
% fun2_c.txt respectively

[A, b, c] = read_coeff_fun2();
y = c' * x - sum(log(b - A * x));
end