x0=1;
tol=0.01;
n=1;
x1=x0-fp(x0)/fpp(x0);
while abs(fp(x1))>tol
  x0=x1;
  x1=x0-fp(x0)/fpp(x0);
  n=n+1;
endwhile
x1
n
