function thetamk = thetamk(m,k,M,K)
    numerator = (m-1)*K + k - 1;
    thetamk = 2*pi*numerator / (M*K);
end