x0=1;
x1=1.5;
tol=0.00000001;
n=1;
x2=x1-f(x1)*(x1-x0)/(f(x1)-f(x0));
while abs(f(x2))>tol
  x0=x1;
  x1=x2;
  x2=x1-f(x1)*(x1-x0)/(f(x1)-f(x0));
  n=n+1;
endwhile
x1
n