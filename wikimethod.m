n = 100;
t = 1/n:1/(n + 1):1;
H = 0.3;
gamma = zeros(n,n);
for j=1:n
    for k = 1:n
        gamma(j,k) = (t(k)^(2 * H) + t(j) ^ (2 * H) - abs(t(j) - t(k)) ^ (2 * H)) / 2;
    end
end