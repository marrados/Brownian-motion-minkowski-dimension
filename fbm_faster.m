%http://en.wikipedia.org/wiki/Normal_distribution#Standard_normal_distribution
%http://www2.isye.gatech.edu/~adieker3/fbm/thesisold.pdf
%parameters
n = 1000;
m = 3;
T = 1;
t = T/n:T/(n + 1):T;
H = 0.5;
%variance-covariance matrix
gamma = zeros(n,n);
for j=1:n
    for k = 1:n
        gamma(j,k) = (t(k)^(2 * H) + t(j) ^ (2 * H) - abs(t(j) - t(k)) ^ (2 * H)) / 2;
    end
end
%cholesky decomposition
%L - standard deviation matrix
L = chol(gamma, 'lower');
%n values of standard Gaussian distribution
P = normrnd(0,1,n,m);
%quite randomly, from the second link
L1 = L * P;
X = cumsum ( L1(1:n,1:m), 2 );
plot(t,X);
brownian_motion_display(m,n,X');