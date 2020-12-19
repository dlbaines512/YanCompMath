a=1;
b=10;
n=1000;
x=linspace(a,b,n);
y=sin(x);
trap=0;
h=(b-a)/(n-1);
trap=trap+y(1)/2+y(n)/2;
for j=1:n-1
   trap=trap+y(j); 
end
trap=h*trap;
disp(trap)