function [ dim ] = compute_fbm_Cholesky_handmade( m, n, H, T, it, p)

[X, t] = fbm_Cholesky_handmade(m, n, H, T);

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

