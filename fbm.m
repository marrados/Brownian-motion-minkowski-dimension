%http://en.wikipedia.org/wiki/Normal_distribution#Standard_normal_distribution
%http://www2.isye.gatech.edu/~adieker3/fbm/thesisold.pdf
%parameters
n = 100;
T = 1;
t = T/n:T/(n + 1):T;
H = 0.75;
%variance-covariance matrix
gamma = zeros(n,n);
for j=1:n
    for k = 1:n
        gamma(j,k) = (t(k)^(2 * H) + t(j) ^ (2 * H) - abs(t(j) - t(k)) ^ (2 * H)) / 2;
    end
end
%cholesky decomposition
%L - standard deviation matrix
[L,U] = Cholesky(gamma);
%n values of standard Gaussian distribution
gaussLimit = 3;
x = -gaussLimit : 2 * gaussLimit / n : gaussLimit;
P = normpdf(x,0,1);
%quite randomly, from the second link
X = zeros(n,1);
for j=1:n
    for k = 1:n
        X(j) = X(j) + L(j,k) * P(k); 
    end
end
plot(t,X);