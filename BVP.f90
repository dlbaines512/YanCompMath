program shooting
integer,parameter :: n=100
real, parameter :: a=0.0,b=1.0, alpha=0.0,beta=2.0, tol=0.0000001
! u(a)=alpha,  u(b)=beta ---- the boundary conditions
real t(0:n),un(2,0:n),uL(2)
real u0(2),unL,u1,u2,u3,u1L,u2L
real h
h=(b-a)/n
do i=0,n
	t(i)=a+i*h
enddo
u0(1)=alpha
unL=beta
un(1,0)=alpha

u1=0.0
u2=0.1
u3=u2+1.0
do while (abs(u3-u2)>tol)
	u2=u3
	u0(2)=u1
	call rk4(t,n,h,u0,uL)
	u1L=uL(1)
	u0(2)=u2
	call rk4(t,n,h,u0,uL)
	u2L=uL(1)
	u3=u1+(u2-u1)*(unL-u1L)/(u2L-u1L)
enddo
u0(2)=u3
un(2,0)=u3
call rk4_pts(t,n,h,un)
open(10, file="results.dat")
do i=0,n
	write(10,*) t(i),un(1,i),un(2,i)
enddo
close(10)
print *,"done!"
end program

subroutine rk4(t,n,h,u0,un)
integer n
real t(0:n)
real h,u0(2),ut(2),un(2)
real k1(2),k2(2),k3(2),k4(2)
ut=u0
do i=1,n
	call getf(t(i),ut,k1)
	call getf(t(i)+0.5*h,ut+0.5*k1,k2)
	call getf(t(i)+0.5*h,ut+0.5*k2,k3)
	call getf(t(i)+h,ut+k3,k4)
	un=ut+h*(k1+k2+k3+k4)/6.0
	ut=un
enddo
end subroutine

subroutine rk4_pts(t,n,h,un)
integer n
real t(0:n)
real h,u0(2),un(2,0:n),ut(2)
real k1(2),k2(2),k3(2),k4(2)
ut(1)=un(1,0)
ut(2)=un(2,0)
do i=1,n
	call getf(t(i),ut,k1)
	call getf(t(i)+0.5*h,ut+0.5*k1,k2)
	call getf(t(i)+0.5*h,ut+0.5*k2,k3)
	call getf(t(i)+h,ut+k3,k4)
	un(1,i)=ut(1)+h*(k1(1)+k2(1)+k3(1)+k4(1))/6.0
	un(2,i)=ut(2)+h*(k1(2)+k2(2)+k3(2)+k4(2))/6.0
	ut(1)=un(1,i)
	ut(2)=un(2,i)
enddo
end subroutine

subroutine getf(t,y,k)
real t,y(2),k(2)
k(1)=f1(t,y(1),y(2))
k(2)=f2(t,y(1),y(2))
end subroutine

real function f1(t,y1,y2)
real t,y1,y2
f1=y2
end function

real function f2(t,y1,y2)
real t,y1,y2
f2=4*y1-4*t
end function