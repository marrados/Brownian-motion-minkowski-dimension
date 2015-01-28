function [ n ] = boxcount( X, box, m )
% Params:
%   X - matrix of N M-dimensional vectors
%   box - size of M-dimensional hipercube
%
% Returns:
%   number of box between vectors


n = 0; 
[N, M] = size(X);
indexes = zeros(10000, M);
for i = 1 : N-1
    p1 = X(i, :);
    p2 = X(i+1, :);
    for j = 1/m : 1/m : 1
        p = (1-j).*p1 + j.*p2;
        index = ceil(p / box);
        indexes(i, :) = index;
    end
end
index = ceil(X(N, :) / box);
indexes(1, :) = index;
        
indexes = unique(indexes, 'rows');
[n, ~] = size(indexes);
n = n - 1;

end
