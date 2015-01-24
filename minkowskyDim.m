function [ d ] = minkowskyDim( Neps, eps )
%minkowskyDim compute minkowsky dimension

Neps = log10(Neps)
eps = -log10(eps)
n = length(Neps)

Sx = sum(eps)
Sy = sum(Neps)
Sxx = sumsqr(eps)
Sxy = sum(Neps*eps')

d = (Sx*Sy-Sxy*n)/(Sx^2-Sxx*n);
end

