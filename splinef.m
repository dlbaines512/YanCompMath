function splinef=splinef(x,y)
  n=size(x)(2);
  splinef=zeros(1,n);
  splinef(1)=0;
  splinef(n)=0;
  b=zeros(1,n-2);
  A=zeros(n-2,n-2);
  for i=2:n-3
    di1=x(i+2)-x(i+1);
    di=x(i+1)-x(i);
    b(i)=(y(i+2)-y(i+1))/di1-(y(i+1)-y(i))/di;
    A(i,i)=(di+di1)/3;
    A(i,i-1)=di/6;
    A(i,i+1)=di1/6;
  endfor
  i=1;
  di1=x(i+2)-x(i+1);
  di=x(i+1)-x(i);
  A(1,1)=(di+di1)/3;
  A(1,2)=di1/6;
  b(i)=(y(i+2)-y(i+1))/di1-(y(i+1)-y(i))/di;
  i=n-2;
  di1=x(i+2)-x(i+1);
  di=x(i+1)-x(i);
  A(n-2,n-2)=(di+di1)/3;
  A(n-2,n-3)=di/6;
  b(i)=(y(i+2)-y(i+1))/di1-(y(i+1)-y(i))/di;
  splinef(2:n-1)=inv(A)*b';
  endfunction

