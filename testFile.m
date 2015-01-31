
n = 1000;
T = 1;
H = 0.8;
m = 3;
t = 1:100;
x = zeros(100,1);
for j=1:10
    compute_fbm_Cholesky(m,n,H,T,10,5);
end
figure;
plot(x,t);
%figure;
%brownian_motion_display(3,n,x1');