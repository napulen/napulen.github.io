function b1 = getb1(fc, Fs, beta)
    theta = (2*pi*fc)/Fs;
    num = cos(theta);
    den = 1+beta;
    b1 = 2*(num/den);
end