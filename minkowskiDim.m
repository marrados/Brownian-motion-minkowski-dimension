function [ d ] = minkowskiDim( X, start, it )
%Count Minkowski dimension of n-dimension Brownian motion
%Parameters:
%   X - matrix with points of Brownian motion positions
%   start - starting box length, 
%       in each iteration box length is divided by 2
%   it - number of iterations

Neps = zeros(1, it); 
eps = zeros(1, it);
box = 1 / start;
for i = 1 : it
    Neps(i) = boxcount(X, box);
    eps(i) = box;
    box = box / 2;
end

%print for check results
Neps;
eps;
a = Neps ./ eps;

d = leastSquares(log10(Neps), -log10(eps));

end

