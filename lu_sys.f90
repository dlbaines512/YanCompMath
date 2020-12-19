program lu_sys
integer n
real,pointer :: A(:,:),L(:,:),U(:,:),x(:),y(:),b(:)
real sgm
open(10,file="linear_system.dat")
read(10,*) n
allocate(A(n,n))
allocate(L(n,n))
allocate(U(n,n))
allocate(x(n))
allocate(y(n))
allocate(b(n))
do i=1,n
	read(10,*) (A(i,j),j=1,n)
enddo
read(10,*) (b(j),j=1,n)
close(10)

call lu(A,L,U,n)
do i=1,n
	sgm=0.0
	do j=1,i-1
		sgm=sgm+L(i,j)*y(j)
	enddo
	y(i)=b(i)-sgm
enddo
do i=n,1,-1
	sgm=0.0
	do j=i+1,n
		sgm=sgm+U(i,j)*x(j)
	enddo
	x(i)=(y(i)-sgm)/U(i,i)
enddo
print *, (x(i),i=1,n)
open(10,file="LU_results.dat")
write(10,*) (x(i),i=1,n)
close(10)
print *,"done!"
end program

subroutine lu(A,L,U,n)
integer p
real A(n,n),L(n,n),U(n,n),sgm
do k=1,n
	do j=k,n
		sgm=0.0
		do p=1,k-1
			sgm=sgm+L(k,p)*U(p,j)
		enddo
		U(k,j)=A(k,j)-sgm
	enddo
	
	do i=k+1,n
		sgm=0.0
		do p=1,k-1
			sgm=sgm+L(i,p)*U(p,k)
		enddo
		L(i,k)=(A(i,k)-sgm)/U(k,k)
	enddo
enddo
end subroutine