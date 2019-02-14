clear all;
x = 1:24;
y = [75,77,76,73,69,68,63,59,57,55,54,52,50,50,49,49,49,50,54,56,59,63,67,72];
plot(x,y);
xlabel('Hours since 1pm');
ylabel('temperature');
hold on;
%2b
%finding variables 
xi2 = x.^2;
F_quad = [xi2; x; ones(size(xi2))];
A_quad = F_quad*F_quad';
b_quad = F_quad*y';
an_quad = A_quad\b_quad;
%plotting quadradic fit
plot(x,(0.1849*x.^2 -5.2642*x+88.2955));

%calculating error
sum = 0;
for j = 1:length(x)
    temp = abs((0.1849*x(j)^(2)-5.2642*x(j)+88.2955) - y(j));
    sum = sum + temp^(2);
end    
error_quad = sqrt(sum/length(x));

%2c
%finding variables
xi3 = x.^3;
F_cub = [xi3; xi2;x;ones(size(x))];
A_cub = F_cub*F_cub';
b_cub = F_cub*y';
ans_cub = A_cub\b_cub;
hold on;
%plotting
plot(x,0.0092*x.^3 - 0.1595*x.^2 - 1.7489*x + 80.2352);
%calculating error
sum = 0;
for j = 1:length(x)
    temp = abs((0.0092*x(j)^3 - 0.1595*x(j)^2 - 1.7489*x(j) + 80.2352) - y(j));
    sum = sum + temp^(2);
end    
error_cub = sqrt(sum/length(x));


