n=10;
a=0;
b=1000;
dx=0.1;
h=dx;
rbg=zeros(n,n);
for i=1:n
  disp(i);
  rbg(i,1)=trapzr(a,b,h);
  h=h/2;
end

for j=2:n
  for i=j:n
    rbg(i,j)=(2^i*rbg(i,j-1)-rbg(i-1,j-1))/(2^i-1);    
  end
end

disp(rbg(n,n));
disp(dx^(2*n));