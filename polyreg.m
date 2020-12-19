function polyreg=polyreg(x,y,m)
% regression of polynomial model
% x,y - x and y coordinates
% m - degree of the polynomial
  n=size(x)(2);
  A=zeros(m+1,m+1);
  b=zeros(1,m+1);
  polyreg=zeros(m+1,1);
  for i=1:m+1
    for j=1:n
      b(1,i)=b(1,i)+x(j)^(i-1)*y(j);
    endfor
  endfor
  for i=1:m+1
    for j=1:m+1
      for k=1:n
        A(i,j)=A(i,j)+x(k)^(i+j-2);
      endfor
    endfor
  endfor
  polyreg=inv(A)*b';
  
endfunction
