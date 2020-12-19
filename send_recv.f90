program send_recv
	use mpi
	integer myid, ierr,numprocs
  
  
  
        call MPI_Comm_rank( MPI_COMM_WORLD, myid, ierr )
  
	if (myid ==0) then
        	buffer=5678
   		Call MPI_Send(buffer,1, MPI_INTEGER,1,0, MPI_COMM_WORLD, ierr)
        	write(*,*) "myid=",myid,"I have sent the number",buffer
	else
         	Call MPI_Recv(buffer,1, MPI_INTEGER,0,0, MPI_COMM_WORLD, status,ierr)

	endif
	call MPI_Finalize(ierr)
end program