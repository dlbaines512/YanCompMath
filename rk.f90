program rk
real k1,k2,k3,k4,h
integer,parameter:: n=20
integer i
real y(0:n),t(0:n)
h=1.0/n
y(0)=0.2
t(0)=0.0
do i=1,n
	t(i)=t(i-1)+h
enddo
do i=0,n-1
	k1=h*f(t(i),y(i))
	k2=h*f(t(i)+h/2,y(i)+0.5*k1)
	k3=h*f(t(i)+h/2,y(i)+0.5*k2)
	k4=h*f(t(i+1),y(i)+k3)
	y(i+1)=y(i)+1.0/6*(k1+k2+k3+k4)
enddo
open(10,file="results.txt")
do i=0,n
	write(10,*) t(i),y(i)
enddo
close(10)
end program

real function f(ti,yi)
	f=yi+ti
end function