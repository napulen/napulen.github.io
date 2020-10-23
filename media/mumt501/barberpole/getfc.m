function fc = getfc(m, k, K, f0)
    exponent = (K*(m-1) + k - 1)/K;
    fc = f0 * 2^exponent;
end