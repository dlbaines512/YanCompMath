program lax_Fredrich
integer, parameter:: m=100,n=10000
real dt,dx
real u(0:m), u1(0:m), x(0:m)
dt=0.0001
dx=1.0/m
do i=0,m
	x(i)=i*dx
	u(i)=sin(x(i))
enddo
u1=u
do j=1,n
do i=1,m-1
	u1(i)=(u(i+1)+u(i-1))/2-dt/dx*(u(i+1)-u(i-1))
enddo	
u1(m)=u1(m-1)
u=u1
enddo

open(10,file="result.dat")
do i=0,m
	write(10,*) u1(i)
enddo
close(10)

print *,"done!!!"
end