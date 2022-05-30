%% Danny Hong ECE 210 HW 4 
%% Part B
%multiplies matrix with its transpose. if the resulting matrix is the
%identity matrix, the input matrix is an orthonormal matrix. 
function [check] = isOrthonormal(array)

multiplyWithTranspose = array.' * conj(array);
compareWithIdentityMatrix = abs(eye(size(array, 2)) - multiplyWithTranspose);
check = all(compareWithIdentityMatrix < eps, 'all');

end
