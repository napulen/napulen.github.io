function deltaomega = getdeltaomega(fc, Fs, Q)
    deltaomega = (2*pi*fc)/(Q*Fs);
end