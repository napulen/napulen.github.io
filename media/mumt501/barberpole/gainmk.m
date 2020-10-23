function gainmk = gainmk(m, k, M, K, lmin, lmax)
    lc = lcmk(m, k, M, K, lmin, lmax);
    gainmk = 10^(lc/20);
end
