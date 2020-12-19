program lu
integer,parameter:: n=3
integer p
real A(n,n),L(n,n),U(n,n),sgm
A=reshape((/12,1,3,3,5,7,-5,3,13,1,28,76/),shape(A))
L=0.0
U=0.0
do i=1,n
	L(i,i)=1
enddo

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

open(10,file="LU_results.dat")
do i=1,n
	write(10,*) (L(i,j),j=1,n)
enddo
do i=1,n
	write(10,*) (U(i,j),j=1,n)
enddo
close(10)
print *, "done!"
end program