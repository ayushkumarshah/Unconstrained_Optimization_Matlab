function params = create_grid(alpha_i, c, rho)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
params={};
count = 1;
for i=1:length(alpha_i)
    for j=1:length(c)
        for k=1:length(rho)
            params{count} = {alpha_i(i), c(j), rho(k)};
            count = count + 1;
        end
    end
end
end
