program jacobi
integer,parameter:: n=3
integer m
real A(n,n+1),x(n),x_old(n)
real error,tol,er(n)
A=reshape((/12,1,3,3,5,7,-5,3,13,1,28,76/),shape(A))
tol=0.00001
error=tol+1
x_old=(/1,0,1/)
m=0
do while (error>tol)
	do i=1,n
		x(i)=A(i,n+1)
		do j=1,n
			if (j/=i) then
				x(i)=x(i)-A(i,j)*x_old(j)
			endif
		enddo
		x(i)=x(i)/A(i,i)
		if (x(i)/=0) then
			er(i)=abs((x(i)-x_old(i))/x(i))
		else
			er(i)=0.0
		endif
		error=maxval(er)
	enddo
	x_old=x
	m=m+1
	print *, "iterarion #:",m, "error=",error
	print *, (x(i),i=1,n)
	print *, "====================================================="
enddo
end program