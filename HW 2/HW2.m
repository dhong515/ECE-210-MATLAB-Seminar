%% Danny Hong ECE 210 HW 2 

clc
clear
close all

%% Question 1 
a = linspace(0, 2 * pi, 100);
b = linspace(0, 2 * pi, 1000);
c = sin(2 * a);
d = sin(2 * b);

dydx1 = diff(c) ./ diff(a);
dydx2 = diff(d) ./ diff(b);

%%The derivative function is 2 * cos(2 * x).

g = 2 * cos(2 * a(1:end-1));
h = 2 * cos(2 * b(1:end-1));

i = g - dydx1;
j = h - dydx2;

dmax1 = max(i);
dmax2 = max(j);

%%The vector with length 1000 produced better results since it resulted in
%%smaller differences than the vector with length 100. 

int1 = cumsum(c * (2 * pi/100));
int2 = cumtrapz(b, d);
int1 = int1 - 0.5;
int2 = int2 - 0.5;

%%The integral of sin(2x) is -0.5 * cos(2 * x)

m = (-0.5) * cos(2 * a);
n = (-0.5) * cos(2 * b);
o = m - int1;
p = n - int2;

imax1 = max(o);
imax2 = max(p);

%%The vector with length 1000 resulted in closer approximations. 

figure;
plot(b, int2);
title('Graph of the integral of sin(2x)');

%% Question 2 
B = 1:100;
A = reshape(B, 10, 10);
A = flipud(A);
A(3, :) = fliplr(A(3, :));
C = sum(A);
D = prod(A');
D = D(:);
A(6, :) = [];

%% Question 3
tic
for i = 1:300
    for j = 1:500
        B(i, j) = (i^3 + j^3) / (i + j + 2);
    end
end
toc

B1 = zeros(300, 500);

tic
for i = 1:300
    for j = 1:500
        B1(i, j) = (i^3 + j^3) / (i + j + 2);
    end
end
toc

x = 1:500;
y = 1:300;
[X, Y] = meshgrid(x, y);

tic
M = (X.^3 + Y.^3) ./ (X + Y + 2);
toc


