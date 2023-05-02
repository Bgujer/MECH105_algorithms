function [Root,Iter] = bisect(f,a,b,tol,Max_Iter) % The function definition
fa = f(a); % functional at a
fb = f(b);% functional at b
if(fa>0 && fb <0) % checking fafb <0 or not
    xplus = a;
    xminus = b;
elseif(fa<0&&fb>0)
    xplus = b;
    xminus = a;
else
    error('Not a valid bracketing interval');
end
Iter = 0; % iteration counter
xnew=(xplus+xminus)*0.5; % new point in the intervel
err=abs((xplus-xminus)/(xplus+xminus))*100; % estimated error at new x value
while err>tol && Iter<Max_Iter % iterate loop unitil error < tol or Iter > Max_iter
    fnew=f(xnew); % function evaluating at newly computed x value
    if(fnew>0) % determin the sign of f at new x value
        xplus=xnew; % if f is positive replave x+ with new x
    else
        xminus=xnew; % if f is negative replace x- with new x
    end
    Iter = Iter +1; % Increment Iteration counter
    xnew=(xplus+xminus)*0.5; % new x value
    err=abs((xplus-xminus)/(xplus+xminus))*100; % estimated error at new x value
end
if(Iter>=Max_Iter) % faild to converge
    error('Faild to converge');
else
    Root = xnew; % after the iterations the approximated root will be in xnew
end
end