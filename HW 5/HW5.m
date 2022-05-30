%% Danny Hong HW 5 ECE 210 

clc
clear
close all
%% Question 1 

load fisheriris;

flowerArrayCell = cell(150, 1);
flowerSpeciesDeblank = deblank(string(species));

for i = 1: 150
    flowerArrayCell{i, 1} = ...
        Flower(meas(i, 1), meas(i, 2), meas(i, 3), meas(i, 4), flowerSpeciesDeblank(i));
end

check = getSWidth(flowerArrayCell{30, 1});

if(check ~= meas(30, 3))
    fprintf('Incorrect! The sepal width values do not match. \n');
else
    fprintf('Correct! The sepal width values match. \n');
end
    
report(flowerArrayCell{30, 1});   
