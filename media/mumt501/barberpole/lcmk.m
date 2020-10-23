function lcmk = lcmk(m, k, M, K, lmin, lmax)
    theta = thetamk(m, k, M, K);
    l = (lmax-lmin)*(1 - cos(theta))/2;
    lcmk = lmin + l;
end
