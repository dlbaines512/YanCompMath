xl=0;
xu=0.11;
tol=0.0000001;
xm=(xl+xu)/2;
n=1;
while abs(f(xm))>tol
  if f(xl)*f(xm)<0
    xu=xm;
  else
    xl=xm;
  end
  xm=(xl+xu)/2;
  n=n+1;
end
xm
n
