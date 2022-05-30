%% Danny Hong ECE 210 HW 4 
%% Part C
%projects the input vector on an orthonormal basis. 
function [proj] = orthoProj(orthoColumns, vector)

[x, y] = size(orthoColumns);
dotProduct = repmat(vector(:, 1), 1, y);
dotProduct = sum(dotProduct(:, 1: end).* conj(orthoColumns(:, 1: end)), 1);
proj = sum(dotProduct(1, 1: end).* orthoColumns(:, 1: end), 2);

end
