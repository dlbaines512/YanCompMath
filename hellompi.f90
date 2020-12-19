program  hello
use mpi
integer myid, ierr, numprocs
call MPI_Init( ierr)
call MPI_Comm_rank( MPI_COMM_WORLD, myid, ierr)
call MPI_Comm_Size(MPI_COMM_WORLD, numprocs,ierr)
write (*,*) "Hello, this is form core #", myid
call MPI_Finalize(ierr)
end program