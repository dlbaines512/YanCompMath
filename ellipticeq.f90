program ellipticeq
integer,parameter:: m=100,n=100
real be,bw,bn,bs,tol,errr,tmp
real T(0:m,0:n)

bw=75
bn=300
bs=50
be=100
tol=0.000001
errr=1.0
T(:,:)=0.0
T(0,:)=bw
T(m,:)=be
T(:,0)=bs
T(:,n)=bn

do while ( errr>tol)
	errr=0.0
	do i=1,m-1
		do j=1,n-1
			tmp=(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1))/4
			errr=max(errr,abs(T(i,j)-tmp))
			T(i,j)=tmp
		enddo
	enddo
enddo

open(10,file="result.dat")
do j=0,n
	write(10,*) (T(i,j),i=0,m)
enddo
close(10)


end program