function eulerode=eulerode(alpha,a,b,n)
  h=(b-a)/n
  t=zeros(1,n+1);
  y=zeros(1,n+1);
  t(1)=a;
  for i=2:n+1
    t(i)=t(1)+(i-1)*h
  endfor
  y(1)=alpha;
  for i=1:n
    y(i+1)=y(i)+h*f(t(i),y(i))
  endfor
  disp(y);
  plot(t,y);
endfunction
