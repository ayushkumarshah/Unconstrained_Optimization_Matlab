function isin_domain = isin_domain(x)
[A,b] = read_coeff_fun2();
difference = b - A * x;
isin_domain = all(difference >= 0); 
end

