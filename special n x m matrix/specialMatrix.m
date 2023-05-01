function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
%if the number of inputs is less than two, we must throw an error and say that it needs 2 input arguments
if nargin ~= 2
    error('specialMatrix:IncorrectNumberOfInputs', 'This function requires 2 input arguments.');
end

% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n, m);

% Now the real challenge is to fill in the correct values of A
A(1,:) = 1:m; %Filling the first row with column numbers
A(:,1) = 1:n; %Filling the first column with row numbers

% now to fill the rest of the matrix with the sum of the elements above and to the left
for i = 2:n
    for j = 2:m
        A(i,j) = A(i-1,j) + A(i,j-1);
    end
end
end
