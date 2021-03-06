clear all
% generates one dimensional fractional Brownian motion 'W' on t in [0,1] using 'n' grid points
% the method used applies FFT to a circulant covariance matrix 


n=2^16;  % grid points
H = 0.75; % Hurst parameter
dim = 2 - H

r=nan(n+1,1); r(1) = 1;
for k=1:n
    r(k+1) = 0.5*((k+1)^(2*H) - 2*k^(2*H) + (k-1)^(2*H));
end
r=[r; r(end-1:-1:2)]; % first rwo of circulant matrix
lambda=real(fft(r))/(2*n); % eigenvalues
W=fft(sqrt(lambda).*complex(randn(2*n,1),randn(2*n,1)));
W = n^(-H)*cumsum(real(W(1:n+1))); % rescale
plot((0:n)/n,W)
