function H = fndHessian_withG(f,g,x,order, varargin)

H = zeros(numel(x),numel(x));
if nargin == 4
    e = sqrt(eps)*(1+norm(g(x),inf));
else
    e = varargin{1};
end
g0 = g(x);

if order == 1
    
    for j=1:length(x)
        x1 = x;
        x1(j) = x(j) + e;
        g1 = g(x1);  
        g2 = g(x);
        H(:,j) = (g1(:) - g2(:))./e;
    end
else

%for i=1:length(x)
    for j=1:length(x)
        x1 = x;
        x1(j) = x(j) + e;
        g1 = g(x1);  
        x2 = x;
        x2(j) = x(j) - e;
        g2 = g(x2);
        H(:,j) = (g1(:) - g2(:))./e/2;
    end
%end
        
end