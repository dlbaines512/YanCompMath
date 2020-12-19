function trapzr=trapzr(a,b,dx)
n=(b-a)/dx;
xi=a;
trapzr=0.0;
trapzr=0.5*(ftrap(a)+ftrap(b));
for i=1:(n-1)
  xi=xi+dx;
  trapzr=trapzr+ftrap(xi);
end
trapzr=trapzr*dx;
end
