NB. lapack manifest

CAPTION=: 'LAPACK'

DESCRIPTION=: 0 : 0
LAPACK (Linear Algebra Package) is a set of routines for solving systems of simultaneous linear equations, least-squares solutions of linear systems of equations, eigenvalue problems, and singular value problems. The associated matrix factorizations (LU, Cholesky, QR, SVD, Schur, generalized Schur) are also provided, as are related computations such as reordering of the Schur factorizations and estimating condition numbers.

Binary for Mac is provided by the veclib framework.

Binary for Linux, install liblapack3 (or similar) from your distro repository. If available, install libopenblas-base or libatlas3-base which provides an optimized version of BLAS.

For 64-bit windows, a prebuilt jlapack64.dll is provided by David Hotham and is included in this addon.  Note that this jlapack64.dll requres a msvc runtime which can be downloaded from http://www.microsoft.com/en-us/download/details.aspx?id=2092 .

For Android, run install_jlapack_'' to install the shared library.

Reference BLAS implementation may be orders of magnitude slower than optimized implementations.
)

VERSION=: '1.1.56'

RELEASE=: 'j804 j807'

FOLDER=: 'math/lapack'

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
FILESWIN64=: 'jlapack64.dll'
