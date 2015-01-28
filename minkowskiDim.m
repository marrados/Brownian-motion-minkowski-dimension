function [ d, exitflag, maxIt ] = minkowskiDim( X, start, it, diff )
%Count Minkowski dimension of m-dimension Brownian motion
%Parameters:
%   X - matrix with points of Brownian motion positions
%   start - starting box length, 
%       in each iteration box length is divided by 2
%   it - number of iterations

exitflag = 0;
maxIt = 0;

minB = min(X);
%maxB = max(X);
%diffB = abs(maxB - minB);
X = X + ones(size(X))*diag(abs(minB));

Neps = zeros(1, it);
eps = zeros(1, it);
box = start;
for i = 1 : it
    Neps(i) = boxcount(X, box);
    eps(i) = box;
    box = box / diff;
    
    if i > 1 && Neps(i-1) == Neps(i)
        exitflag = -1;
        break;
    end
    i
end

%take only non-zero results
if exitflag == 0
    i = i + 1
end
Neps = Neps(1:i-1);
eps = eps(1:i-1);
maxIt = i - 1;

%a = log10(Neps) ./ -log10(eps)
%d = leastSquares(-log10(eps), log10(Neps));

d = leastSquares(log10(1./eps), log10(Neps));

end

