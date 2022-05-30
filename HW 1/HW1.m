%% Danny Hong ECE 210 HW1

clc
clear
close all
%% Question 1

Var1 = log10(26)
Var2 = 5 * exp(2 * (pi/3) * j)
Var3 = atan(15^(1/2)) + 34
Var4 = (3^(1/2)) * (1/2) + j * (1/2)
y = [Var1; Var2; Var3; Var4]
%% Question 2

Var5 = Var2 * Var4
Var6 = real(Var5)
Var7 = imag(Var5)
Var8 = abs(Var5)
Var9 = angle(Var5)
x = [real(Var5), imag(Var5), abs(Var5), angle(Var5)]
%% Question 3

Mat1 = y * x
yT = transpose(y)
z = yT.* x
Mat2 = repmat(z, 4, 1)
%% Question 4

a = Mat1 + (2*Mat2)
b = Mat1.* Mat2
c = Mat1 - 2
d = Mat1'
%% Question 5

n = rad2deg(Var9)
e = linspace(1, n, 2000)
f = 1: .3: n