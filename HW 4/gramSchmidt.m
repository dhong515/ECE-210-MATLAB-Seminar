%% Danny Hong ECE 210 HW 4 
%% Part A
function [phi] = gramSchmidt(array)

% x and y represent the rows and columns of the array respectively.%
[x, y] = size(array); 

%error checking to make sure input is valid.
if y == 1  
    fprintf('Error: the input must be a 2D-Array.');
    
else
    phi = zeros(x, y);
    phi(:, 1) = array(:, 1) / norm(array(:, 1));
    
    %dot product vector
    dotProduct = zeros(x, y-1);
    %vector of the sum of inner products * orthonormal
    innerProduct = zeros(x, y-1); 

    %gram-schmidt orthogonalization
    for i = 2: y
        innerProduct(:, 1: i-1) = repmat(array(:, i), 1, i-1);
        dotProduct(1, 1: i-1) = sum(innerProduct(:, 1: i-1).* conj(phi(:, 1: i-1)), 1);
        innerProduct(:, 1: i-1) = phi(:, 1: i-1) .* dotProduct(1, 1: i-1);
        psi = array(:, i) - sum(innerProduct, 2);
        phi(:, i) = psi / norm(psi);
    end   
end

end