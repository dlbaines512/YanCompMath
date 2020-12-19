function newtondd=newtondd(xn,yn,x)
  n=size(xn)(2);
  tt=zeros(n,n);
  tt(:,1)=yn';
  for j=2:n
    for i=j:n
      tt(i,j)=(tt(i,j-1)-tt(i-1,j-1))/(xn(i)-xn(i-j+1));
    end
  end
  newtondd=tt(1,1);
  for i=1:n-1
    tmp=1;
    for j=1:i
      tmp=tmp*(x-xn(j));
    endfor
    newtondd=newtondd+tt(i+1,i+1)*tmp;
  endfor
endfunction
