program send_recv
	use mpi
	integer myid, ierr,numprocs
        integer psum,fsum,i
        integer status(MPI_STATUS_SIZE)
        call MPI_Init( ierr )
        call MPI_Comm_rank( MPI_COMM_WORLD, myid, ierr )
        call MPI_Comm_size( MPI_COMM_WORLD, numprocs, ierr )
	psum=0
	fsum=0
	if (myid ==0) then 
        	do i=1,5000
			psum=psum+i
		enddo     
   		Call MPI_Send(psum,1, MPI_INTEGER,1,0, MPI_COMM_WORLD, ierr) 
        	write(*,*) "myid=",myid,", I have sent the number",psum  
	else
		do i=5001,10000
			psum=psum+i
		enddo
         	Call MPI_Recv(fsum,1, MPI_INTEGER,0,0, MPI_COMM_WORLD, status,ierr)
         	write(*,*) "myid=",myid,", I got this number:",fsum
		fsum=fsum+psum
		write(*,*) "myid=",myid,", the sum is:",fsum
	endif  
	call MPI_Finalize(ierr)
end program	
