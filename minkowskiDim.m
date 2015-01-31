function [ dim, exitflag, maxIt ] = minkowskiDim( X, it, p, show_dim )
%Count Minkowski dimension of m-dimension Brownian motion
%Parameters:
%   X - matrix with points of Brownian motion positions
%   it - max number of iterations
%   p - number of middle-points between points

if nargin < 4
    show_dim = 0;
end

exitflag = 0;
maxIt = 0;

minB = min(X);
X = X + ones(size(X))*diag(abs(minB));

box = max(X(:));

Neps = zeros(1, it);
eps = zeros(1, it);
for i = 1 : it
    box = box / 2;
    Neps(i) = boxcount(X, box, p);
    eps(i) = box;

    
    if show_dim == 1
        dim = leastSquares(-log10(eps(1:i)), log10(Neps(1:i)));
        display(i);
        display(dim);
    end
    
    if i > 1 && Neps(i-1) == Neps(i)
        exitflag = -1;
        break;
    end
end

%take only non-zero results
if exitflag == 0
    i = i + 1;
end
Neps = Neps(1:i-1);
eps = eps(1:i-1);
maxIt = i - 1;

dim = leastSquares(-log10(eps), log10(Neps));

end
