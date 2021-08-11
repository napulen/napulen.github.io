function y = barberpole(x, M, p, f0, Q, lmin, lmax, Fs)
K = floor(Fs/p);
xl = length(x);
hl = 120;
yl = xl + hl - 1;
for m=1:M
    y = zeros(yl,1);    
    for n=1:yl        
        if n <= xl
            xn = x(n);
        else
            xn = 0;
        end
        if n-1 >= 1 && n-1 <= xl 
            xnm1 = x(n-1);            
        else
            xnm1 = 0;            
        end
        if n-2 >= 1 && n-2 <= xl
            xnm2 = x(n-2);           
        else
            xnm2 = 0;            
        end
        if n-1 >= 1
            ynm1 = y(n-1);
        else
            ynm1 = 0;
        end
        if n-2 >= 1
            ynm2 = y(n-2);
        else
            ynm2 = 0;
        end            
        k = mod(n,K);    
        fc = getfc(m, k, K, f0);
        G = gainmk(m, k, M, K, lmin, lmax);
        beta = getbeta(G, fc, Fs, Q);    
        b0 = getb0(G, beta);
        b1 = getb1(fc, Fs, beta);
        b2 = getb2(G, beta);
        a1 = geta1(fc, Fs, beta);
        a2 = geta2(beta);
        y(n) = b0*xn - b1*xnm1 + b2*xnm2 + a1*ynm1 - a2*ynm2;        
    end
    x = y;  
    xl = length(y) + hl - 1;
end
end
