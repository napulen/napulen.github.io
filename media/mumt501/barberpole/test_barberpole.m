M = 10;
p = 0.1;
f0 = 20;
Q = 15;
lmin = -3;
lmax = -20;
Fs = 44100;

%x = audioread('beat.wav');

x = -1 + 2.*rand(Fs*12,1);

%audiowrite('input.wav', x, 44100);

y = barberpole(x, M, p, f0, Q, lmin, lmax, Fs);

%audiowrite('output.wav', y, 44100);