function dy = g_fun3(x)
% gradient of polynomial function

dy = [400.*x(1,:) + 400.*x(1,:)*x(2,:) + 2.*x(1,:) - 2 ; -200.*x(1,:).^2 + 200.*x(2,:)]; % 2x1 metrix


