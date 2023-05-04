# Simpson's 1/3
Simpson's 1/3 rule is a numerical method used for approximating definite integrals. It involves dividing the area under the curve into a series of trapezoids and parabolas, and then calculating the total area using a weighted sum of these shapes.

Inputs
- x = the vector of equally spaced independent variable
- y = the vector of function values with respect to x

Outputs:
- I = the numerical integral calculated

Given a function, this algorithm will decide if it needs an extra integral(trap rule in this case) is there is an odd number of segments. The image below shows an example of such an integral approximation with even segments (fits a parabola).

![image](https://user-images.githubusercontent.com/130944239/236088355-4137eba6-34a6-43ca-b8cf-a3161820492b.png)
