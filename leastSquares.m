function [ a ] = leastSquares( x, y)
%The method of least squares

n = length(x);
Sx = sum(x);
Sy = sum(y);
Sxx = sumsqr(x);
Sxy = sum(x*y');

a = (Sx*Sy - Sxy*n) / (Sx^2 - Sxx*n);
b = (Sx*Sxy - Sxx*Sy) / (Sx*Sx - Sxx*n);

figure;
hold on
title(['dim= ',num2str(a)])
plot(x, y, 'b*');
plot(x, a*x+b, 'r');
hold off

end

