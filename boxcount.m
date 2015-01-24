function [ n ] = boxcount( X, box )
% Params:
%   X NxM - matrix of N M-dimensional vectors
%   box - size of M-dimensional hipercube
%
% Returns:
%   number of box between vectors

n = 0;
[N, M] = size(X);

for i = 1:1:N-1
  p1 = X(i,:);
  p2 = X(i+1,:);
  b = mandist(p1, p2');
  n = n + b/box;
end

end
