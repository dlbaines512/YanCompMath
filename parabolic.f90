program parabolic
integer, parameter:: m=1000, n=100
real T(0:m, 0:n)
real TL,TR,TI,dx,dt,lambda,alpha,L,Time
TL=100
TR=25
TI=20
L=500
Time=9
alpha=1

dx=L/n
dt=Time/m
lambda=alpha*dt/dx/dx
T(0,:)=TI
T(:,0)=TL
T(:,n)=TR

do j=1,m
do i=1,n-1
	T(j,i)=T(j-1,i)+lambda*(T(j-1,i+1)-2*T(j-1,i)+T(j-1,i-1))
enddo
enddo

open(10,file="parabolic_result.dat")
do j=0,m
	write(10,*) (T(j,i),i=0,n)
enddo
close(10)
print *, "done!"
end program