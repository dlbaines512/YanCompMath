program rungekutta
integer, parameter::n=1000
integer j
real t(0:n)
real yi1(2),yi(2),h,k1(2),k2(2),k3(2),k4(2)
yi(1)=0.2
yi(2)=0.5
h=2.0/n
t(0)=0
do i=0,n-1  
	j=1
	t(i+1)=t(i)+h
	k1(j)=h*yi(2)
	k2(j)=h*(yi(2)+k1(j)/2)
	k3(j)=h*(yi(2)+k2(j)/2)
	k4(j)=h*(yi(2)+k3(j))
	yi1(j)=yi(j)+(k1(j)+k2(j)+k3(j)+k4(j))/6
	yi(j)=yi1(j)
	
	j=2
	k1(j)=h*f(t(i),yi(j))
	k2(j)=h*f(t(i)+h/2,yi(j)+k1(j)/2)
	k3(j)=h*f(t(i)+h/2,yi(j)+k2(j)/2)
	k4(j)=h*f(t(i+1),yi(j)+k3(j))
	yi1(j)=yi(j)+(k1(j)+k2(j)+k3(j)+k4(j))/6
	yi(j)=yi1(j)
	
enddo
print *,yi(1),yi(2)
end program

real function f(t,y)
real t,y
f=y+t
end function