function [ d ] = minkowskyDim( X, min )
%minkowskyDim compute minkowsky dimension

Neps = zeros(1, min); 
eps = zeros(1, min);
box = 1 / 2^10;
i = 1;
while i <= min
    Neps(i) = boxcount(X, box);
    eps(i) = box;
    box = box / 2;
    i = i + 1;
end
Neps
eps

Neps = log10(Neps);
eps = -log10(eps);

a = Neps ./ eps

n = length(Neps);

%metoda najmniejszych kwadratow
Sx = sum(eps);
Sy = sum(Neps);
Sxx = sumsqr(eps);
Sxy = sum(Neps*eps');

d = (Sx*Sy-Sxy*n)/(Sx^2-Sxx*n);
end

