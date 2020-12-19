function quadraticsearch=quadraticsearch(xl,xu,tol)
  quadraticsearch=zeros(1,2);
  x1=xl;
  x2=xu;
  x3=(x1+x2)/2;
  f1=f(x1);
  f2=f(x2);
  f3=f(x3);
  err=tol+1;
  while (err>tol)
    x21=x2-x1;
    x23=x2-x3;
    f23=f2-f3;
    f21=f2-f1;
    x4=x2-0.5*((x21**2*f23-x23**2*f21)/(x21*f23-x23*f21));
    x41=abs(x4-x1);
    x42=abs(x4-x2);
    x43=abs(x4-x3);
    if (x41*x42*x43<tol) 
      break;
    endif
    maxv=max(max(x41,x42),x43);
    if (x41==maxv)
      x1=x4;
      f1=f(x1);
    elseif (x42==maxv)
      x2=x4;
      f2=f(x2);
    else
      x3=x4;
      f3=f(x3);
    endif
    err=maxv;
  endwhile
  quadraticsearch(1)=x4
  quadraticsearch(2)=f(x4)
endfunction
