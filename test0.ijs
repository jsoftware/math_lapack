NB. examples

dbg 1
NB. dbstops'need'
dbstops''

mp=: +/ . *

need_jlapack_ 'dgeev dgesv dgesvd dgetrf dpotrf dgeqrf zgeev'

dgeev=: dgeev_jlapack_
dgesv=: dgesv_jlapack_
dgesvd=: dgesvd_jlapack_
dgetrf=: dgetrf_jlapack_
dpotrf=: dpotrf_jlapack_
dgeqrf=: dgeqrf_jlapack_
zgeev=: zgeev_jlapack_

m=: ?.4 4$100
m1=: ?.4 3$30
m2=. ?.4 6$100

smoutput dgeev m            NB. eigenvalues of double array
smoutput zgeev 1j3+m        NB. eigenvalues of complex array
smoutput dgesvd m           NB. SVD
smoutput dpotrf m mp |: m   NB. Cholesky decomposition
smoutput dgeqrf m           NB. QR factorization
smoutput dgesv m;m1         NB. solves m * x = m1
smoutput dgetrf m           NB. LU decomposition
