x0=41/12;
tol=0.00000001;
err=1;
x1=0;
while err<tol
    x1=2*(x0*x0*x0*x0+25)/x0/sqrt(x0*x0*x0*x0-25);
    err=abs(x1-x0);
    x0=x1;
end
x1