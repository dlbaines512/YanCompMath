function rk4=rk4(a,b,n,alpha)
rk4=zeros(1,n+1);
t=zeros(1,n+1);
rk4(1)=alpha;
h=(b-a)/n;
ti(1)=a;
for i=1:n
  t(i+1)=t(i)+h;
  k1=h*f(t(i),rk4(i));
  k2=h*f(t(i)+0.5*h,rk4(i)+0.5*k1);
  k3=h*f(t(i)+0.5*h,rk4(i)+0.5*k2);
  k4=h*f(t(i+1),rk4(i)+k3);
  rk4(i+1)=rk4(i)+(k1+k2+k3+k4)/6;
end 
disp(rk4);
plot(t,rk4);
end