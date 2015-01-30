function [  ] = compute_fbm_Davies_Harte( m, n, H, T, it, p)

[X, t] = fbm_Davies_Harte(m, n, H, T);

[dim, exitflag, maxit] = minkowskiDim( X, it, p );
display(dim);

if exitflag ~= 0
    display(exitflag);
    display(maxit);
end

if m < 4
    brownian_motion_display(m, n, X');
end

end

