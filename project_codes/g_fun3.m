function dy = g_fun3(x)
% gradient of polynomial function
dy = [-400 * x(1,:) .* (x(2,:) - x(1,:).^2) - (2 * (1 - x(1,:))); 
      200 * (x(2,:) - x(1,:).^2) ];


