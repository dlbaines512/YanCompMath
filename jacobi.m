A=[10 1 0 0 0;1 11 2 0 0;0 3 12 4 0;0 0 5 13 6;0 0 0  7 14];
n=5;
c=[99 1025 76 82 33];
tol=0.00001;
tt=0;
nn=0;
x=zeros(1,n);
ig=[1 1 1 1 1]; %initial guesses
x0=ig;
for k=1:10000
    tt=0;
    for i=1:n
        x(i)=c(i);
        for j=1:n
            if j==i
            else
              x(i)=x(i)-A(i,j)*x(j);
            end  
        end
        x(i)=x(i)/A(i,i);
    end
  
end
x
nn