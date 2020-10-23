function beta = getbeta(gain, fc, Fs, Q)
    gainbsq = getgainbsq(gain);
    deltaomega = getdeltaomega(fc, Fs, Q);
    beta0 = sqrt((gainbsq^2 - 1)/(gain^2 - gainbsq^2));
    beta1 = tan(deltaomega/2);
    beta = beta0 * beta1;
end