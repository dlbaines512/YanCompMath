program leapfrog
integer, parameter::n=1000
real t(0:n),y,yi1,yi,yim1,h
yim1=0.5
h=2.0/n
t(0)=0
yi=yim1+h*f(t(0),yim1)
do i=1,n
	t(i)=t(i-1)+h
	yi1=yim1+2*h*f(t(i),yi)
	yim1=yi
	yi=yi1
enddo
print *,yi
end program

real function f(t,y)
real t,y
f=y-t**2+1
end function