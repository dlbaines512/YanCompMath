program tri_chasing
integer n
real,pointer :: a(:),b(:),c(:),x(:),y(:)

open(10,file="linear_system.dat")
read(10,*) n
allocate(a(n))
allocate(b(n))
allocate(c(n))
allocate(x(n))
allocate(y(n))

read(10,*) (a(j),j=2,n)
read(10,*) (b(j),j=1,n)
read(10,*) (c(j),j=1,n-1)
read(10,*) (y(j),j=1,n)
close(10)

call chasing(a,b,c,y,x,n)

print *, (x(i),i=1,n)
open(10,file="chasing_results.dat")
write(10,*) (x(i),i=1,n)
close(10)
print *,"done!"
deallocate(a,b,c,x,y)
end program

subroutine chasing(a,b,c,y,x,n)
integer n
real a(n),b(n),c(n),y(n),x(n)
real u(n),v(n),tmp
u(1)=y(1)/b(1)
v(1)=c(1)/b(1)
do k=2,n-1
	tmp=b(k)-v(k-1)*a(k)
	u(k)=(y(k)-u(k-1)*a(k))/tmp
	v(k)=c(k)/tmp
enddo
x(n)=(y(n)-u(n-1)*a(n))/(b(n)-v(n-1)*a(n))
! x(n)=u(n)
do k=n-1,1,-1
	x(k)=u(k)-v(k)*x(k+1)
enddo
end subroutine