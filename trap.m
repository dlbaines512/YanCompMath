function trap=trap(a,b,h)
n=(b-a)/h+1;
x=linspace(a,b,n);
y=sin(x);
trap=y(1)/2+y(n)/2;
for j=1:n-2
   trap=trap+y(j+1); 
end
trap=h*trap;
end