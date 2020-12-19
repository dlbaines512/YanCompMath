program gaussianmethod
integer n
real,pointer :: A(:,:),x(:)
real mik
open(10,file="linear_system.dat")
read(10,*) n
allocate(A(n,n+1))
allocate(x(n))

do i=1,n
	read(10,*) (A(i,j),j=1,n)
enddo
read(10,*) (A(j,n+1),j=1,n)
close(10)

do k=1,n-1
    do i=(k+1),n 
        mik=-A(i,k)/A(k,k)
        do j=k+1,n+1
           A(i,j)=A(i,j)+A(k,j)*mik
        enddo 
    enddo
enddo

do i=n,1,-1
    x(i)=A(i,n+1)
    do j=n,i+1,-1
        x(i)=x(i)-A(i,j)*x(j)
    enddo 
    x(i)=x(i)/A(i,i)
enddo

print *, (x(i),i=1,n)
open(10,file="gauss_results.dat")
write(10,*) (x(i),i=1,n)
close(10)
print *,"done!"
end program