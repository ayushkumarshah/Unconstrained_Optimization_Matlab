function H = H_fun3(x)
% hessian of poloynomial function

H = [-400*x(2,:)+1200*x(1,:).^2+2,  -400*x(1,:); 
     -400*x(1,:), 200];
