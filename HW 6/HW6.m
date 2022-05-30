%% Danny Hong HW 6 ECE 210

clc;
clear;
close all;
%% Question 1

numerator = [2/5 1/4 1/7];
denominator = [1/3 0 -1/8 3/2];

[z, p, k] = tf2zp(numerator, denominator);
figure;
zplane(z, p); %%Using zplane to plot.
title('Pole-Zero Plot of H(z)'); 

[a, b] = impz(numerator, denominator, 50);
figure;
stem(b, a);
xlabel('n');
ylabel('h[n]');
title('Impulse Response Stem Plot of H(z)');

n = 0:49; %%Assumed n values from 0-49 for this
x = (-4/5) .^(n);
y = filter(numerator, denominator, x);
figure;
subplot(2, 1, 1);
stem(n, x);
xlabel('n');
ylabel('x[n]');
title('x[n] Before Applying Transfer Function using filter'); 
subplot(2, 1, 2);
stem(n, y);
xlabel('n');
ylabel('y[n]');
title('x[n] After Applying Transfer Function using filter'); 

[a1, b1] = impz(numerator, denominator, 50);
y1 = conv(a1, b1);
y1 = y1(1:50);
figure;
stem(b1, y1);
xlabel("b1");
ylabel("y1[b1]");
title("x[n] After Applying Transfer Function using Convolution");
%% Question 2

z1 = [-1; 1];
p1 = [0.9 * exp(1j * (pi/2)); 0.9 * exp(-1j * (pi/2)); 0.95 * exp(1j * (5*pi/12)); 0.95 * exp(-1j * (5*pi/12)); 0.95 * exp(1j * (7*pi/12)); 0.95 * exp(-1j * (7*pi/12))];
k1 = 0.01;

figure;
zplane(z1, p1); %%Using zplane to plot.
title('Pole-Zero Plot of the Filter');

[b2, a2] = zp2tf(z1, p1, k1);
[h, w] = freqz(b2, a2, 1024);

magnitude = 20 * log10(abs(h)); %%magnitude gain in dB
phase = rad2deg(unwrap(angle(h))); %%phase angle in degrees

figure;
plot(w, magnitude);
xlabel('\omega in Radians');
ylabel('|H(\omega)| in dB')
title('Magnitude Response Plot of the Filter');
xticks(0: pi/12: pi);
xlim([0 pi]);
xticklabels({'0', '\pi/12', '\pi/6', '\pi/4', '\pi/3', '5\pi/12', '\pi/2', '7\pi/12', '2\pi/3', '3\pi/4', '5\pi/6', '11\pi/12', '\pi'});

figure
plot(w, phase);
xlabel('\omega in Radians')
ylabel('\phi(\omega) in Degrees');
title('Phase Response Plot of the Filter');
xticks(0: pi/12: pi);
xlim([0 pi]);
xticklabels({'0', '\pi/12', '\pi/6', '\pi/4', '\pi/3', '5\pi/12', '\pi/2', '7\pi/12', '2\pi/3', '3\pi/4', '5\pi/6', '11\pi/12', '\pi'});