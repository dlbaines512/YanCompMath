program lid_cavity
integer, parameter :: m=100, n=100
real Re, L,T, dx,dy,dt, tol, errr
real w(0:m,0:n), f(0:m,0:n),u(0:m,0:n), v(0:m,0:n)

tol=0.001
errr=1.0
Re=400
L=1.0
dx=L/m
dy=L/n
dt=0.00001
f=0.0
u=0.0
v=0.1
w=0.0
u(:,n)=1.0
w(0,:)= v(1,:)/dx
w(:,0)= -u(:,1)/dy
w(m,:)= -v(m-1,:)/dx
w(:,n)= -1/dy + u(:,n-1)/dy












do nn=1,10000
errr=1.0
do i=1,m-1
do j=1,n-1
	w(i,j)= w(i,j)+ dt*(-u(i,j)*(w(i+1,j)-w(i-1,j))/2/dx-v(i,j)*(w(i,j+1)-w(i,j-1))/2/dy  &
	+1/Re*( (w(i+1,j)-2*w(i,j)+w(i-1,j))/dx/dx + (w(i+1,j)-2*w(i,j)+w(i,j-1))/dy/dy))
enddo
enddo

do while (errr>tol)
	errr=0.0
	do i=1,m-1
	do j=1,n-1
	temp= ((f(i+1,j)+f(i-1,j))/dx/dx+(f(i,j+1) +f(i,j-1))/dy/dy+w(i,j))/(2/dx/dx+2/dy/dy)
	errr=max(errr,abs(f(i,j)-temp))
	f(i,j)=temp
	enddo
	enddo
enddo


	do i=1,m-1
	do j=1,n-1
	u(i,j)= (f(i,j+1)-f(i,j-1))/2/dy
	v(i,j)= (f(i+1,j)-f(i-1,j))/2/dx
	enddo
	enddo
	w(0,:)= v(1,:)/dx
	w(:,0)= -u(:,1)/dy
	w(m,:)= -v(m-1,:)/dx
	w(:,n)= -1.0/dy + u(:,n-1)/dy
enddo

open(10,file="results.txt")
	do j=0,n
	write(10,*) (u(i,j),i=0,m)
	enddo
close(10)
end program