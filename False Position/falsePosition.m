function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
% The function needs two guesses (xl and xu) that bracket the root
%es = stopping criteria
%Maxit = maximum interations
% Outputs the root, the functions value at the root, the error, and the
% number of iterations it took to get to the root
if nargin < 3
    error('the function needs a input function and a guess that brackets the root')
end
if nargin < 4
    es = 0.0001;
end
if nargin < 5
    maxit = 200;
end
if func(xl)*func(xu) > 0 %makes sure that the guesses are opposite signs
    error('upper and lower guesses do not bracket the root.')
end
iter = 0;
xr = xl;
ea = 100;

while ea > es && iter < maxit
    iter = iter + 1;
    xrold = xr;
    xr = xu - (func(xu)*(xl - xu))/(func(xl) - func(xu));
    if xr ~= 0
        ea = abs ((xr - xrold)/xr)*100;
    end
    if func(xr)*func(xl) < 0 %if fxr * fxl are less than zero, they are correct to replace xu with xr
        xu = xr;
    else 
        xl = xr;
    end
    
end
root = xr;
fx = func(xr);
iter = iter - 1;
end
