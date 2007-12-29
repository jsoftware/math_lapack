NB. examples

dbg 1
NB. dbstops'need'
dbstops''

mp=: +/ . *

need_jlapack_ 'dgees dgeev dgeqrf dgerqf dgesv dgesvd dgetrf dpotrf dtrtrs zgees zgeev zgeqrf zgerqf zgesv zpotrf ztrtrs'

dgees=: dgees_jlapack__
dgeev=: dgeev_jlapack_
dgeqrf=: dgeqrf_jlapack_
dgerqf=: dgerqf_jlapack__
dgesv=: dgesv_jlapack_
dgesvd=: dgesvd_jlapack_
dgetrf=: dgetrf_jlapack_
dpotrf=: dpotrf_jlapack_
dtrtrs=: dtrtrs_jlapack__
zgees=: zgees_jlapack__
zgeev=: zgeev_jlapack_
zgeqrf=: zgeqrf_jlapack__
zgerqf=: zgerqf_jlapack__
zgesv=: zgesv_jlapack__
zpotrf=: zpotrf_jlapack__
ztrtrs=: ztrtrs_jlapack__

m=: ?.4 4$100
m1=: ?.4 3$30
mz=: 1j3+?.4 4$100
m1z=: 1j3+?.4 3$100
m2=: utri_jlapack_ m1
v=: ?.4 4$100
vz=: 1j3+?.4$100 

smoutput dgees m               NB. real Schur factorization of double array
smoutput zgees mz              NB. Schur factorization of complex array
smoutput dgeev m               NB. eigenvalues of double array
smoutput zgeev mz              NB. eigenvalues of complex array
smoutput dgeqrf m1             NB. QR factorization of double array
smoutput zgeqrf m1z            NB. QR factorization of complex array
smoutput dgerqf m1             NB. RQ factorization of double array
smoutput zgerqf m1z            NB. RQ factorization of complex array
smoutput dgesvd m              NB. SVD
smoutput dpotrf m mp |: m      NB. Cholesky decomposition of double array
smoutput zpotrf mz mp +|: mz   NB. Cholesky decomposition of complex array
smoutput dgesv m;m1            NB. solves m * x = m1
smoutput dgetrf m              NB. LU decomposition
smoutput dtrtrs m;v            NB. solves double triangular m * x = m1
smoutput ztrtrs mz;vz          NB. solves complex triangular m * x = m1
