function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set

%check if x and y are same size
if length(x) ~= length(y);
    error('The length of x must equal y');
end

%sort data
[sorted_y, sort_idx] = sort(y);
sorted_x = x(sort_idx);

 % Compute quartiles and IQR
n = length(y);
Q1_idx = floor(0.25*n) + 1;
Q3_idx = floor(0.75*n) + 1;
Q1 = sorted_y(Q1_idx);
Q3 = sorted_y(Q3_idx);
IQR = Q3 - Q1;

%remove the outliers
lower_threshold = Q1 - 1.5*IQR;
upper_threshold = Q3 + 1.5*IQR;
outlier_mask = (sorted_y < lower_threshold) | (sorted_y > upper_threshold);
fX = sorted_x(~outlier_mask);
fY = sorted_y(~outlier_mask);




% Compute linear regression
x_mean = mean(fX);
y_mean = mean(fY);
Sxx = sum((fX - x_mean).^2);
Sxy = sum((fX - x_mean).*(fY - y_mean));
m = Sxy/Sxx; 
b = y_mean - m*x_mean;

% Compute r-squared value
y_pred = m*fX + b;
SS_res = sum((fY - y_pred).^2);
SS_tot = sum((fY - y_mean).^2);
Rsquared = 1 - SS_res/SS_tot;

intercept = b;
slope = m;

end
