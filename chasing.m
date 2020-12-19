function x=chasing(A,y)
  n=size(A)(1);
  u=zeros(n);
  v=zeros(n);
  u(1)=y(1)/A(1,1);
  v(1)=A(1,2)/A(1,1);
  for k=2:n-1
    tmp=(A(k,k)-v(k-1)*A(k,k-1));
    u(k)=(y(k)-u(k-1)*A(k,k-1))/tmp;
    v(k)=A(k,k+1)/tmp;
  endfor
   x(n)=(y(n)-u(n-1)*A(n,n-1))/(A(n,n)-v(n-1)*A(n,n-1));
  for k=n-1:(-1):1
    x(k)=u(k)-v(k)*x(k+1);
  endfor
endfunction
