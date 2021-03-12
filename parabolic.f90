program parabolic
integer, parameter:: m=1000, n=100
real T(0:m, 0:n) ! T(tj, xi)
real TL,TR,TI,dx,dt,lambda,alpha,L,Time
TL=100
TR=25
TI=20
L=0.05
Time=9
alpha=1

dx=L/n
dt=Time/m
lambda=alpha*dt/dx/dx
T(0,:)=TI
T(:,0)=TL
T(:,n)=TR

do j=1,m    ! loop for time steps, starting from t=t1
do i=1,n-1  ! loop for position, starting from x=x1, internal pts only
	T(j,i)=T(j-1,i)+lambda*(T(j-1,i+1)-2*T(j-1,i)+T(j-1,i-1))
enddo
enddo

open(10,file="parabolic_result.dat")     ! Tecplot format
write(10,*) "variables=x,y,T"
write(10,*)  "zone ", "i= ", n+1, " j= ", m+1
do j=0,m
	do i=0,n
		write(10,*) i*dx,j*dt,T(j,i)
	enddo
enddo
close(10)
print *, "done!"
end program
