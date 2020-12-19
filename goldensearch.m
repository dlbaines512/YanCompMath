function goldensearch=goldensearch(xl,xu,tol)
  goldensearch=zeros(1,2);
  phi1=(sqrt(5)-1)*0.5;
  err=tol+1;
  phi1d=phi1*(xu-xl);
  x1=xl+phi1d;
  x2=xu-phi1d;
  f1=f(x1);
  f2=f(x2);
  while (err>tol)
    if (f1<f2)
      xu=x1;
      x1=x2;
      f1=f2;
      phi1d=phi1*(xu-xl);
      x2=xu-phi1d;
      f2=f(x2);
    else
      xl=x2;
      x2=x1;
      f2=f1;
      phi1d=phi1*(xu-xl);
      x1=xl+phi1d;
      f1=f(x1);
    endif
    err=xu-xl;
  endwhile
  goldensearch(1)=(xl+xu)*0.5;
  goldensearch(2)=f(goldensearch(1));
endfunction
