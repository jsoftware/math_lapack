doc=: 0 : 0
Lapack provides access to lapack routines.

The lapack routines are compiled from C source available from the
netlib web site. The C source is built by automatic conversion from
the original Fortran. All double and complexdouble routines are in
jlapack.dll. Double routines start with d and doublecomplex routines
start with z.

The routines are called with the J dll call mechanism as documented
in User Manual chapter "Dll's and Memory Management".

Script covers have been written for a few routines. It is easy add
them by reading the documentation and following the pattern in the
exising ones. Please pass back any you do so we can start to build
up the library.

lapack.ijs defines common things. The interface to an lapack routine
is defined in a script with the name of the routine. For example,
routines dgeev and zgeev are defined in geev.ijs.

Attention needs to be paid to the Fortran column-major order vs the
J row-major order. Also, work areas and result areas could be
handled with mema for better performance.
)
