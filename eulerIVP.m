n=20;
a=0;
b=1;
y0=0.5;
h=(b-a)/n;
y=zeros(1,n+1);
t=zeros(1,n+1);
t(1)=a;
y(1)=y0;
for i=1:n
    t(i+1)=t(i)+h;
    y(i+1)=y(i)+h*ef(t(i),y(i));
end
y
plot(t,y)
