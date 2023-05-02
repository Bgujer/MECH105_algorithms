function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
%-------------------------------------------------------------------------------%
%check size of x and y
[m,X]=size(x);
[m,Y]=size(y);
if X ~= Y
    error('x and y have different lengths');
end

%check for sufficient data
if (X < 2)
    error('input data not have sufficient length');
end

%check for equally spaced data
h = x(2) - x(1);
for i=3:X
    if (x(i)-x(i-1)) ~= h
        error('x data is not equally spaced');
    end
end
%Simpson 1/3 rule
sum = y(1);
for i=2:(X-2)
    if mod(i,2)==0
        sum=sum+4*y(i);
    else
        sum=sum+2*y(i);
    end
end
%use trap rule for the last interval
if mod(X,2) == 0
    warning('Trapezoidal rule is used for last interval');
    sum = sum + y(X-1);
    I = (sum*h/3) + ((y(X) + y(X-1))*h/2);
else
    sum = sum + 4*y(X-1) + y(X);
    I=sum*h/3;
end
