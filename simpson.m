n=1000;
a=0;
b=1.0;
dx=(b-a)/n;
xi=dx;
trapzr=0.0;
trapzr=(ftrap(a)+ftrap(b));
for i=1:2:(n-1)
  trapzr=trapzr+4*ftrap(xi)+2*ftrap(xi+dx);
  xi=xi+2*dx;
end
trapzr=trapzr-2*ftrap(b);
trapzr=trapzr*dx/3;
disp(trapzr)
