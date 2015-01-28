%example
n = 100;
T = 1;
dH = 0.3;
for m=1:5
    for H=0.1:dH:0.9
        [x1,t] = fbm_Cholesky_handmade(m,n,H,T);
        x2 = fbm_Cholesky(m,n,H,T);
        x3 = fbm_Davies_Harte(m,n,H,T);
        figure;
        plot(t,x1);
        figure;
        plot(t,x2);
        figure;
        plot(t,x3);
    end
end
[x1,t] = fbm_Cholesky(3,n,0.3,T);
brownian_motion_display(3,n,x1');