function [ X,t ] = fbm_Davies_Harte ( m, n, H, T )
%http://www2.isye.gatech.edu/~adieker3/fbm/thesis.pdf
%Davis & Harte method
t = T/n:T/(n + 1):T;
%variance-covariance matrix


r=nan(n+1,1); r(1) = 1;
for k=1:n
    r(k+1) = 0.5*((k+1)^(2*H) - 2*k^(2*H) + (k-1)^(2*H));
end
r=[r; r(end-1:-1:2)]; % first rwo of circulant matrix
lambda=real(fft(r))/(2*n); % eigenvalues
W=fft(repmat(sqrt(lambda),1,m).*complex(randn(2*n,m),randn(2*n,m)));
X = n^(-H)*cumsum(real(W(1:n,1:m))); % rescale

display('Compute points ended...');
end
