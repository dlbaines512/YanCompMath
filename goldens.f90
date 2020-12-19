program goldenss
real xl,xu,x1,x2,tol,d,phi
integer i
tol=0.00001
xl=0
xu=3.14159266/2
phi=(sqrt(5.0)-1)/2.0

d=phi*(xu-xl)
x1=xl+d
x2=xu-d
i=1
do while((x1-x2)> tol)
	if (f(x1)<f(x2)) then
		xu=x1
		x1=x2
		x2=xu-phi*(xu-xl)
	else
		xl=x2
		x2=x1
		x1=xl+phi*(xu-xl)
	endif
	i=i+1
	print *, "x1=",x1,"x2=",x2
enddo
print *, (xu+xl)/2, "max=",f((xu+xl)/2)
print *, "i=",i
end program

real function f(x)
real x
f=4*sin(x)*(1+cos(x))
end function
