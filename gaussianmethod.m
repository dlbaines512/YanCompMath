A=[1 1 0 3; 1 2 1 6; 1 2 -1 0];
n=3;
x=zeros(1,n);
for k=1:n-1
    for l=(k+1):n 
        m=-A(l,k)/A(k,k);
        for p=k+1:n+1
           A(l,p)=A(l,p)+A(k,p)*m;
        end 
    end
end

for i=n:(-1):1
    x(i)=A(i,n+1);
    for j=n:(-1):i+1
        x(i)=x(i)-A(i,j)*x(j);
    end 
    x(i)=x(i)/A(i,i);
end
x