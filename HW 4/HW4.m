%% Danny Hong ECE 210 HW 4

clc 
clear 
close all
%% Part D

vector1 = (4 * rand(10, 5)) + (9j * rand(10, 5));
gramSchmidt1 = gramSchmidt(vector1);
orthoCheck1 = isOrthonormal(gramSchmidt1);
testProj1 = (3 * rand(10, 1)) + (4j * rand(10, 1));
proj1 = orthoProj(gramSchmidt1, testProj1);
projError1 = abs(testProj1 - proj1);

vector2 = (7 * rand(75, 75)) + (11j * rand(75, 75));
gramSchmidt2 = gramSchmidt(vector2);
orthoCheck2 = isOrthonormal(gramSchmidt2);
testProj2 = (3 * rand(75, 1)) + (4j * rand(75, 1));
proj2 = orthoProj(gramSchmidt2, testProj2);
projError2 = abs(testProj2 - proj2);
%% Part E

x = linspace(0, 2 * pi, 360);
y = sin(x);
[a, b] = ndgrid(x, linspace(0, 2 * pi, 5));
gauss = (1 / sqrt(2 * pi)) * (exp(-(a - b).^2));
orthoGauss = gramSchmidt(gauss);
estimateSine = orthoProj(orthoGauss, y.');

plot(x, y);
hold on
plot(x, gauss);
xlabel('x');
ylabel('y');
title('Graph of Sinusoid and Gaussians');
grid on;
axis([0 2*pi -1.5 1.5]);
xticks([0, pi/2, pi, (3*pi)/2, 2*pi]);
xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})
hold off

figure
subplot(2, 1, 1);
plot(x, y);
hold on
plot(x, estimateSine);
xlabel('x');
ylabel('y');
title('Graph of Sinusoid and Estimated Sinusoid from Gaussians');
grid on;
axis([0 2*pi -2 2]);
xticks([0, pi/2, pi, (3*pi)/2, 2*pi]);
xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
hold off;

subplot(2, 1, 2);
plot(x, orthoGauss);
xlabel('x');
ylabel('y');
title('Orthonormal Basis Functions');  
grid on;  
axis([0 2*pi -0.5 0.5]);
xticks([0, pi/2, pi, (3*pi)/2, 2*pi]);
xticklabels({'0','\pi/2','\pi','3\?/2','2\?'})
hold off



