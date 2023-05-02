function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
%------------------------------Set up------------------------------------------
[nRow,nCol] = size(A);
if nRow ~= nCol %checks if the number of rows equals the number of coloums
    error('input a square matrix')
end
n = size(A,1);
L = eye(n);%puts 1s in the diagonal of the L matrix
U = A; %u is uqual to input A matrix
P = eye(n); %starts with permutation matrix in order

%--------------------------------LU factorization----------------
for k = 1:n-1 % loop through columns
    [~, pivot] = max(abs(U(k:n,k))); % find the row with the largest abs value in the column k
    pivot = pivot + k - 1; % adjust the row index
    if pivot ~= k % swap rows if needed
        U([k,pivot],k:n) = U([pivot,k],k:n);
        P([k,pivot],:) = P([pivot,k],:);
        if k > 1
            L([k,pivot],1:k-1) = L([pivot,k],1:k-1);
        end
    end
    for i = k+1:n % loop through rows
        L(i,k) = U(i,k) / U(k,k); % calculate the L value for the current row and column
        U(i,k:n) = U(i,k:n) - L(i,k) * U(k,k:n); % update the U matrix
    end
end

end
