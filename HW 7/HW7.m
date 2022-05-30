%% Danny Hong ECE 210 HW 7

clc;
clear;
close all; 
%% Question 1: Generating the Signal

frequency = 1e3:50e3;
time = 0:1e-3:2;
[T, F] = meshgrid(time, frequency);
x = sin(2 * pi .*F .*T);
x = sum(x);
%% Question 2: Creating a Butterworth Low Pass Filter

%%Sampling Frequency (in Hz)
Fs = 100e3; 
%%Passband Frequency (in Hz)
Fpass = 10e3;
%%Stopband Frequency (in Hz)
Fstop = 20e3;
%%Passband Attenuation (in dB)
Apass = 5;
%%Stopband Attenuation (in dB)
Astop = 50;

%%Normalizing to get the Nyquist Frequency
Wpass = Fpass / (Fs / 2);
Wstop = Fstop / (Fs / 2);
%%Minimum order (m) for an analog Butterworth filter
m = buttord(Wpass, Wstop, Apass, Astop);
%%Coefiicients of the transfer function
[b, a] = butter(m, Wpass, "low");
%Converting into a singleton filter
Hd = dfilt.df2(b, a);

[h, f] = freqz(Hd, 1024, 100000);

%Magnitude response (in dB)
MagnitudeResponse = 20 * log10(abs(h));
%Phase response (in degrees)
PhaseResponse = rad2deg(unwrap(angle(h)));

figure;
subplot(2, 1, 1);
plot(f, MagnitudeResponse);
title("Butterworth Lowpass Filter Magnitude Response");
xlabel("f in kHz");
xlim([0 50000]);
xticks(0: 10000: 50000);
xticklabels({'0', '10', '20', '30', '40', '50'});
ylabel("|H(f)| in dB");

subplot(2, 1, 2);
plot(f, PhaseResponse);
title("Butterworth Lowpass Filter Phase Response");
xlabel("f in kHz");
xlim([0 50000]);
xticks(0: 10000: 50000);
xticklabels({'0', '10', '20', '30', '40', '50'});
ylabel("\phi(f) in degrees")

%%Filtering the orignal signal
y = filter(b, a, x);

n = 2^15;
z = (fftshift(abs(fft(y, n)))) / n;
f = Fs .* (-n / 2:(n / 2) - 1) / n;

figure;
plot(f, z);
title("Butterworth Lowpass Filter");
xlabel("Frequency in Hz");
ylabel("Magnitude in dB");
%% Question 3: Creating a Chebyshev Type 1 High Pass Filter

%%Sampling Frequency (in Hz)
Fs1 = 100e3; 
%%Passband Frequency (in Hz)
Fpass1 = 35e3;
%%Stopband Frequency (in Hz)
Fstop1 = 15e3;
%%Passband Attenuation (in dB)
Apass1 = 2;
%%Stopband Attenuation (in dB)
Astop1 = 40;

%%Normalizing to get the Nyquist Frequency
Wpass1 = Fpass1 / (Fs1 / 2);
Wstop1 = Fstop1 / (Fs1 / 2);
%%Minimum order (m1) for an analog Butterworth filter
m1 = cheb1ord(Wpass1, Wstop1, Apass1, Astop1);
%%Coefiicients of the transfer function
[b1, a1] = cheby1(m1, Apass1, Wpass1, "high");
%Converting into a singleton filter
Hd1 = dfilt.df2(b1, a1);

[h1, f1] = freqz(Hd1, 1024, 100000);

%Magnitude response (in dB)
MagnitudeResponse1 = 20 * log10(abs(h1));
%Phase response (in degrees)
PhaseResponse1 = rad2deg(unwrap(angle(h1)));

figure;
subplot(2, 1, 1);
plot(f1, MagnitudeResponse1);
title("Chebychev I High Pass Filter Magnitude Response");
xlabel("f in kHz");
xlim([0 50000]);
xticks(0: 10000: 50000);
xticklabels({'0', '10', '20', '30', '40', '50'});
ylabel("|H(f)| in dB");

subplot(2, 1, 2);
plot(f1, PhaseResponse1);
title("Chebychev I High Pass Filter Phase Response");
xlabel("f in kHz");
xlim([0 50000]);
xticks(0: 10000: 50000);
xticklabels({'0', '10', '20', '30', '40', '50'});
ylabel("\phi(f) in degrees")

%%Filtering the orignal signal
y1 = filter(b1, a1, x);

n1 = 2^15;
z1 = (fftshift(abs(fft(y1, n1)))) / n1;
f1 = Fs1 .* (-n1 / 2:(n1 / 2) - 1) / n1;

figure;
plot(f1, z1);
title("Chebychev I High Pass Filter");
xlabel("Frequency in Hz");
ylabel("Magnitude in dB");
%% Question 4: Creating a Chebyshev Type 2 Bandstop Filter

%%Sampling Frequency (in Hz)
Fs2 = 100e3; 
%%First Passband Frequency (in Hz)
Fpass2_1 = 5e3;
%%Second Passband Frequency (in Hz)
Fpass2_2 = 45e3;
%%First Stopband Frequency (in Hz)
Fstop2_1 = 15e3;
%%Second Stopband Frequency (in Hz)
Fstop2_2 = 35e3;
%%Passband Attenuation (in dB)
Apass2 = 5;
%%Stopband Attenuation (in dB)
Astop2 = 50;
%%Declaration of two-element vectors for Fpass and Fstop
Fpass2 = [Fpass2_1, Fpass2_2];
Fstop2 = [Fstop2_1, Fstop2_2];

%%Normalizing to get the Nyquist Frequency
Wpass2 = Fpass2 / (Fs2 / 2);
Wstop2 = Fstop2 / (Fs2 / 2);
%%Minimum order (m2) for an analog Butterworth filter
m2 = cheb2ord(Wpass2, Wstop2, Apass2, Astop2);
%%Coefiicients of the transfer function
[b2, a2] = cheby2(m2, Apass2, Wstop2, "stop");
%Converting into a singleton filter
Hd2 = dfilt.df2(b2, a2);

[h2, f2] = freqz(Hd2, 1024, 100000);

%Magnitude response (in dB)
MagnitudeResponse2 = 20 * log10(abs(h2));
%Phase response (in degrees)
PhaseResponse2 = rad2deg(unwrap(angle(h2)));

figure;
subplot(2, 1, 1);
plot(f2, MagnitudeResponse2);
title("Chebychev II Bandpass Filter Magnitude Response");
xlabel("f in kHz");
xlim([0 50000]);
xticks(0: 10000: 50000);
xticklabels({'0', '10', '20', '30', '40', '50'});
ylabel("|H(f)| in dB");

subplot(2, 1, 2);
plot(f2, PhaseResponse2);
title("Chebychev II Bandpass Filter Phase Response");
xlabel("f in kHz");
xlim([0 50000]);
xticks(0: 10000: 50000);
xticklabels({'0', '10', '20', '30', '40', '50'});
ylabel("\phi(f) in degrees")

%%Filtering the orignal signal
y2 = filter(b2, a2, x);

n2 = 2^15;
z2 = (fftshift(abs(fft(y2, n2)))) / n2;
f2 = Fs2 .* (-n2 / 2:(n2 / 2) - 1) / n2;

figure;
plot(f2, z2);
title("Chebychev II Bandstop Filter");
xlabel("Frequency in Hz");
ylabel("Magnitude in dB");
%% Question 5: Creating an Elliptic Bandpass Filter

%%Sampling Frequency (in Hz)
Fs3 = 100e3; 
%%First Passband Frequency (in Hz)
Fpass3_1 = 20e3;
%%Second Passband Frequency (in Hz)
Fpass3_2 = 30e3;
%%First Stopband Frequency (in Hz)
Fstop3_1 = 15e3;
%%Second Stopband Frequency (in Hz)
Fstop3_2 = 35e3;
%%Passband Attenuation (in dB)
Apass3 = 5;
%%Stopband Attenuation (in dB)
Astop3 = 50;
%%Declaration of two-element vectors for Fpass and Fstop
Fpass3 = [Fpass3_1, Fpass3_2];
Fstop3 = [Fstop3_1, Fstop3_2];

%%Normalizing to get the Nyquist Frequency
Wpass3 = Fpass3 / (Fs3 / 2);
Wstop3 = Fstop3 / (Fs3 / 2);
%%Minimum order (m3) for an analog Butterworth filter
m3 = ellipord(Wpass3, Wstop3, Apass3, Astop3);
%%Coefiicients of the transfer function
[b3, a3] = ellip(m3, Apass3, Astop3, Wpass3, "bandpass");
%Converting into a singleton filter
Hd3 = dfilt.df2(b3, a3);

[h3, f3] = freqz(Hd3, 1024, 100000);

%Magnitude response (in dB)
MagnitudeResponse3 = 20 * log10(abs(h3));
%Phase response (in degrees)
PhaseResponse3 = rad2deg(unwrap(angle(h3)));

figure;
subplot(2, 1, 1);
plot(f3, MagnitudeResponse3);
title("Elliptical Bandstop Filter Magnitude Response");
xlabel("f in kHz");
xlim([0 50000]);
xticks(0: 10000: 50000);
xticklabels({'0', '10', '20', '30', '40', '50'});
ylabel("|H(f)| in dB");

subplot(2, 1, 2);
plot(f3, PhaseResponse3);
title("Elliptical Bandstop Filter Phase Response");
xlabel("f in kHz");
xlim([0 50000]);
xticks(0: 10000: 50000);
xticklabels({'0', '10', '20', '30', '40', '50'});
ylabel("\phi(f) in degrees")

%%Filtering the orignal signal
y3 = filter(b3, a3, x);

n3 = 2^15;
z3 = (fftshift(abs(fft(y3, n3)))) / n3;
f3 = Fs3 .* (-n3 / 2:(n3 / 2) - 1) / n3;

figure;
plot(f3, z3);
title("Elliptical Bandstop Filter");
xlabel("Frequency in Hz");
ylabel("Magnitude in dB");








