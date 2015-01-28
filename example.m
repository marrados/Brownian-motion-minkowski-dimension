%example
n = 100;
T = 1;
dH = 0.3;
for m=1:5
    for H=0.1:dH:0.9
        [x1,t] = fractional_brownian_motion(m,n,H,T);
        x2 = fractional_brownian_motion(m,n,H,T);
        figure;
        plot(t,x1);
        figure;
        plot(t,x2);
    end
end
[x1,t] = fractional_brownian_motion(3,n,0.3,T);
brownian_motion_display(3,n,x1');