NB. lapack manifest

CAPTION=: 'LAPACK'

DESCRIPTION=: 0 : 0
LAPACK (Linear Algebra Package) is a set of routines for solving systems of simultaneous linear equations, least-squares solutions of linear systems of equations, eigenvalue problems, and singular value problems. The associated matrix factorizations (LU, Cholesky, QR, SVD, Schur, generalized Schur) are also provided, as are related computations such as reordering of the Schur factorizations and estimating condition numbers.

Binary for Linux, install liblapack3 (or similar) from your distro repository.
For 64-bit windows, it needs 5 dll files,
libblas.dll liblapack.dll : from http://icl.cs.utk.edu/lapack-for-windows/lapack/#libraries
libgcc_s_sjlj-1.dll libgfortran-3.dll libquadmath-0.dll : runtime dll files from mingw
)

VERSION=: '1.1.31'

RELEASE=: 'j801'

LABCATEGORY=: 'Math'

FILES=: 0 : 0
doc/
dgees.ijs
dgeev.ijs
dgeqrf.ijs
dgerqf.ijs
dgesv.ijs
dgesvd.ijs
dgetrf.ijs
dpotrf.ijs
dtrtrs.ijs
gebal.ijs
gees.ijs
geev.ijs
gehrd.ijs
gelqf.ijs
gels.ijs
gelss.ijs
geqlf.ijs
geqrf.ijs
gerqf.ijs
gesv.ijs
gesvd.ijs
gesvx.ijs
getrf.ijs
heev.ijs
lapack.ijs
lapack.ijt
lapack.txt
lartg.ijs
potrf.ijs
trtrs.ijs
zgees.ijs
zgeev.ijs
zgeqrf.ijs
zgerqf.ijs
zgesv.ijs
zpotrf.ijs
ztrtrs.ijs
test0.ijs
test.ijs
tests.ijs
history.txt
)

PLATFORMS=: ''

FILESWIN=: 'jlapack.dll'
