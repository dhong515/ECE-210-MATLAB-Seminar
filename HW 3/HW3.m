%% Danny Hong ECE 210 HW 3

clc
clear 
close all

%% Question 1
A = ones(100, 100);
B = ones(100, 100);
C = ones(100, 100);

i = 1:100;
j = 1:100;
[i, j] = meshgrid(i, j);

A = logical(sqrt((i-25).^2 + (j-75).^2) > 10 & sqrt((i-75).^2 + (j-25).^2) > 10);
B = logical(sqrt((i-25).^2 + (j-25).^2) > 10 & sqrt((i-75).^2 + (j-75).^2) > 10);
C = logical(sqrt((i-50).^2 + (j-50).^2) < 10);

figure;
imshow(~C);

figure;
imshow(A);

figure;
imshow(A & ~C);
figure;
imshow(A & B);
figure;
imshow(A & B & ~C);
%% Question 2
[val, ind] = findClosest(sin(linspace(0, 5, 100)) + 1, 3/2);
%% Question 3
x = linspace(-3, 3, 10000);
y = (x.^5) - (8*(x.^3)) + (10*x) + 6;
critPts(x, y);