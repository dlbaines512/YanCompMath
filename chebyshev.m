function chebyshev=chebyshev(n)
  xk=zeros(1,n);
  ci=zeros(1,n);
  fxk=zeros(1,n);
  
  for k=1:n
    xk(k)=cos(pi*(2*k-1)/2/n);
    fxk(k)=f(xk(k));
  endfor
  for i=1:n
    ci(1)=ci(1)+fxk(i);
  endfor
  ci(1)=ci(1)/n;
  for i=2:n
    for k=1:n
      ci(i)=ci(i)+fxk(k)*cos((i-1)*(2*k-1)*pi/2/n);
    endfor
    ci(i)=ci(i)/n*2;
  endfor
  disp(ci);
  
  x=-1:0.1:1;
  num=zeros(1,size(x)(2));
  for i=1:n
    num=num+ci(i)*cos((i-1)*acos(x));
  endfor
  plot(x,f(x),'r',x,num,'b*');
endfunction
