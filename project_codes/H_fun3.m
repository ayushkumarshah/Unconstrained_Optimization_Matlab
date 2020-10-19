function H = H_fun3(x)
% hessian of poloynomial function

H = [402+400.*x(2,:) 400.*x(1,:); -400.*x(1,:) 200]; % 2x2 metrix
