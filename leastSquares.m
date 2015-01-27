function [ a ] = leastSquares( x, y)
%metoda najmniejszych kwadratow

n = length(x);
Sx = sum(y);
Sy = sum(x);
Sxx = sumsqr(y);
Sxy = sum(x*y');

a = (Sx*Sy-Sxy*n)/(Sx^2-Sxx*n);

end

