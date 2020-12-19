function gridsearch=gridsearch(x0,x1,y0,y1,m,n)
  x=zeros(m,n);
  y=zeros(m,n);
  xm=0;
  ym=0;
  dx=(x1-x0)/(m-1);
  dy=(y1-y0)/(n-1);
  for i=1:m
    for j=1:n
      x(i,j)=x0+j*dx;
      y(i,j)=y0+i*dy;
    endfor
  endfor
  minff=f2(x(1,1),y(1,1));
  for i=1:m
    for j=1:n
      if (minff > f2(x(i,j),y(i,j)))
        minff=f2(x(i,j),y(i,j));
        xm=x(i,j);
        ym=y(i,j);
      endif
    endfor
  endfor
  disp(minff);
  disp(xm);
  disp(ym);
endfunction
