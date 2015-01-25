function [ n ] = boxcount( X, box )
% Params:
%   X NxM - matrix of N M-dimensional vectors
%   box - size of M-dimensional hipercube
%
% Returns:
%   number of box between vectors

n = 0;
N = size(X);

for i = 1 : N-1
  p1 = X(i, :);
  p2 = X(i+1, :);
  d = mandist(p1', p2);
  %d = sqrt(sum((p1 - p2) .^ 2));
  b = max(1, d/box);
  n = n + ceil(b);
end

end
