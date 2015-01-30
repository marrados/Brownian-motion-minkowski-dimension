function [X,t] = fbm_Cholesky_handmade ( m, n, H, T )
%http://en.wikipedia.org/wiki/Fractional_Brownian_motion
%http://www2.isye.gatech.edu/~adieker3/fbm/thesisold.pdf
%Cholesky method
t = T/n:T/(n + 1):T;
%variance-covariance matrix
gamma = zeros(n,n);
for j=1:n
    for k = 1:n
        gamma(j,k) = (t(k)^(2 * H) + t(j) ^ (2 * H) - abs(t(j) - t(k)) ^ (2 * H)) / 2;
    end
end
%cholesky decomposition
%L - standard deviation matrix
[L] = Cholesky(gamma);
%n values of standard Gaussian distribution
P = normrnd(0,1,n,m);
%quite randomly, from the second link
X = zeros(n,m);
for l=1:m
    for j=1:n
        for k = 1:n
            X(j,l) = X(j,l) + L(j,k) * P(k,l); 
        end
    end
end

display('Compute points ended...');
end
