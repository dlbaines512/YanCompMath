program powermethod
! implicit none
integer n
real,pointer :: A(:,:),y(:,:),z(:,:)
real rhok,tol,err1,tmp, norm22
open(10,file="matrixval.dat")
read(10,*) n
allocate(A(n,n))
allocate(y(n,1))
allocate(z(n,1))
do i=1,n
	read(10,*) (A(i,j),j=1,n)
enddo
read(10,*) (y(i,1),i=1,n)
close(10)
tmp=norm22(y,n)
do i=1,n
	y(i,1)=y(i,1)/tmp
enddo
tol=0.001
err1=tol+1
rhok=0.0
do while(err1>=tol)
	z=matmul(A,y)
	tmp=norm22(z,n)
	do i=1,n
		y(i,1)=z(i,1)/tmp
	enddo
	tmp=0.0
	do i=1,n
		tmp=tmp+y(i,1)*z(i,1)
	enddo
	if (tmp /= 0) err1=abs((rhok-tmp)/tmp)
	rhok=tmp
enddo
print *, 'the eigenvalue is:', rhok
print *, 'the eigenvector is:', (y(i,1),i=1,n)
open(10,file="eigenvalue_results.dat")
write(10,*) 'the eigenvalue is:', rhok
write(10,*) 'the eigenvector is:', (y(i,1),i=1,n)
close(10)
print *,"done!"
deallocate(A,y,z)
end program

real function norm22(v,n)
integer n
real v(n,1),tmp
tmp=0.0
do i=1,n
	tmp=tmp+v(i,1)**2
enddo
norm22=sqrt(tmp)
end function

