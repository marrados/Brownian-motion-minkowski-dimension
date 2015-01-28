function [ a ] = leastSquares( x, y)
%The method of least squares

n = length(x);
Sx = sum(x);
Sy = sum(y);
Sxx = sumsqr(x);
Sxy = sum(x*y');

a = (Sx*Sy - Sxy*n) / (Sx^2 - Sxx*n);
b = (Sx*Sxy - Sxx*Sy) / (Sx*Sx - Sxx*n);
hold on
plot(x, y, 'b*');
plot(x, a*x+b, 'r');
%plotregression(y, x,'Regression');
hold off

end

