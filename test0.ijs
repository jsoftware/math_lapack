NB. examples

dbg 1
NB. dbstops'need'
dbstops''

mp=: +/ .*

need_jlapack_ 'gees geev gels gelss geqrf gerqf gesv gesvd gesvx getrf potrf trtrs'

gees=: gees_jlapack_
geev=: geev_jlapack_
gels=: gels_jlapack_
gelss=: gelss_jlapack_
geqrf=: geqrf_jlapack_
gerqf=: gerqf_jlapack_
gesv=: gesv_jlapack_
gesvd=: gesvd_jlapack_
gesvx=: gesvx_jlapack_
getrf=: getrf_jlapack_
potrf=: potrf_jlapack_
trtrs=: trtrs_jlapack_

m=: ?.4 4$100
m1=: ?.4 3$30
m2=: utri_jlapack_ m1
m3=: ?.4 5$30
mz=: 1j3+?.4 4$100
m1z=: 1j3+?.4 3$100
m2z=: utri_jlapack_ m1z
m3z=: 1j3+?.4 5$100
v=: ?.4 4$100
vz=: 1j3+?.4$100 

smoutput gees m               NB. real Schur factorization of double matrix
smoutput gees mz              NB. Schur factorization of complex matrix
smoutput geev m               NB. eigenvalues of double matrix
smoutput geev mz              NB. eigenvalues of complex matrix
smoutput gels m3;v            NB. solves underdetermined double system m3 * x = v
smoutput gels m3z;vz          NB. solves underdetermined complex system m3z * xz = vz
smoutput gelss m3;v           NB. solves underdetermined double system m3 * x = v via SVD
smoutput gelss m3z;vz         NB. solves underdetermined complex system m3z * xz = vz via SVD
smoutput geqrf m1             NB. QR factorization of double matrix
smoutput geqrf m1z            NB. QR factorization of complex matrix
smoutput gerqf m1             NB. RQ factorization of double matrix
smoutput gerqf m1z            NB. RQ factorization of complex matrix
smoutput gesv m;m1            NB. solves double system m * x = m1
smoutput gesv mz;m1z          NB. solves complex system mz * xz = m1z
smoutput gesvd m              NB. SVD of double matrix
smoutput gesvd mz             NB. SVD of complex matrix
smoutput gesvx m;m1           NB. solves double system m * x = m1
smoutput gesvx mz;m1z         NB. solves complex system mz * xz = m1z
smoutput getrf m              NB. LU decomposition of double matrix
smoutput getrf mz             NB. LU decomposition of complex matrix
smoutput potrf m mp |: m      NB. Cholesky decomposition of symmetric positive definite double matrix
smoutput potrf mz mp +|: mz   NB. Cholesky decomposition of Hermitian positive definite complex matrix
smoutput trtrs m;v            NB. solves double triangular system m * x = v
smoutput trtrs mz;vz          NB. solves complex triangular system mz * xz = vz
