function [A, b, c] = read_coeff_fun2()

m = 500;
n = 100;

fid = fopen('../data/fun2_A.txt', 'r');
A = fscanf(fid,'%e ',[m, n]);
fclose(fid);

fid = fopen('../data/fun2_b.txt', 'r');
b = fscanf(fid,'%e ',[m, 1]);
fclose(fid);

fid = fopen('../data/fun2_c.txt', 'r');
c = fscanf(fid,'%e ',[n, 1]);
fclose(fid);