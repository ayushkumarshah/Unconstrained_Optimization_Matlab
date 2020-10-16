function H = fndHessian(f,x,order,varargin)

H = zeros(numel(x),numel(x));
%g0 = ezgrad(f,x,2);
if nargin==3
    e = sqrt(eps)*(1+norm(fndgrad(f,x,2),inf));
else
    e = varargin{1};
end

if order == 1
    
    for j=1:length(x)
        x1 = x;
        x1(j) = x(j) + e;
        g1 = fndgrad(f,x1,2);  
        g2 = fndgrad(f,x,2);
        H(:,j) = (g1(:) - g2(:))./e;
    end
else


%for i=1:length(x)
    for j=1:length(x)
        x1 = x;
        x1(j) = x(j) + e;
        g1 = fndgrad(f,x1,2);  
        x2 = x;
        x2(j) = x(j) - e;
        g2 = fndgrad(f,x2,2);
        H(:,j) = (g1(:) - g2(:))./e/2;
    end
%end

end
        