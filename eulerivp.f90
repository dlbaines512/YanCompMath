program eulerivp
integer,parameter :: n=40
real h,a,b,t(0:n),y(0:n)
y(0)=0.5
a=0.0
b=2.0
h=(b-a)/n
do i=0,n
	t(i)=a+i*h
enddo
do i=0,n-1
	y(i+1)=y(i)+h*f(t(i),y(i))
enddo
print *, y
open(10,file="euler_result.dat")
do i=0,n
	write(10,*) t(i),y(i)
enddo
close(10)
end program

real function f(t,y)
f=y-t**2+1
end function

