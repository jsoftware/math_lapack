NB. examples

dbg 1
NB. dbstops'need'
dbstops''

mp=: +/ .*

need_jlapack_ 'gebal gees geev gehrd gels gelss geqrf gerqf gesv gesvd gesvx getrf heev lartg potrf trtrs'

gebal=: gebal_jlapack_
gees=: gees_jlapack_
geev=: geev_jlapack_
gehrd=: gehrd_jlapack_
gels=: gels_jlapack_
gelss=: gelss_jlapack_
geqrf=: geqrf_jlapack_
gerqf=: gerqf_jlapack_
gesv=: gesv_jlapack_
gesvd=: gesvd_jlapack_
gesvx=: gesvx_jlapack_
getrf=: getrf_jlapack_
heev=: heev_jlapack_
lartg=: lartg_jlapack_
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
m4=: 7 7 $ 6 0 0 0 0 1 0 0 4 0 0.00025 0.0125 0.02 0.125 1 128 64 0 0 _2 16 0 16384 0 1 _400 256 _4000 _2 _256 0 0.0125 2 2 32 0 0 0 0 0 0 0 0 8 0 0.004 0.125 _0.2 3
m4z=: 6 6 $ 1j1 1j1 0 1j1 1j1 1j1 1j1 1j1 0 1j1 1j1 1j1 1j1 1j1 1j1 1j1 1j1 1j1 0 0 0 1j1 0 0 1j1 1j1 0 1j1 1j1 1j1 1j1 1j1 0 1j1 1j1 1j1
v2=: _2 2
v2z=: _2j_2 2j_2

smoutput gebal m4             NB. balance a general square double matrix
smoutput gebal m4z            NB. balance a general square complex matrix
smoutput gees m               NB. real Schur factorization of a general double matrix
smoutput gees mz              NB. Schur factorization of a general complex matrix
smoutput geev m               NB. eigenvalues of a general double matrix
smoutput geev mz              NB. eigenvalues of a general complex matrix
smoutput gehrd m;1;(#m)       NB. reduce a general square double matrix to upper Hessenberg form
smoutput gehrd mz;1;(#mz)     NB. reduce a general square complex matrix to upper Hessenberg form
smoutput gels m3;v            NB. solves underdetermined double system m3 * x = v
smoutput gels m3z;vz          NB. solves underdetermined complex system m3z * xz = vz
smoutput gelss m3;v           NB. solves underdetermined double system m3 * x = v via SVD
smoutput gelss m3z;vz         NB. solves underdetermined complex system m3z * xz = vz via SVD
smoutput geqrf m1             NB. QR factorization of a general double matrix
smoutput geqrf m1z            NB. QR factorization of a general complex matrix
smoutput gerqf m1             NB. RQ factorization of a general double matrix
smoutput gerqf m1z            NB. RQ factorization of a general complex matrix
smoutput gesv m;m1            NB. solves double system m * x = m1
smoutput gesv mz;m1z          NB. solves complex system mz * xz = m1z
smoutput gesvd m              NB. SVD of a general double matrix
smoutput gesvd mz             NB. SVD of a general complex matrix
smoutput gesvx m;m1           NB. solves double system m * x = m1
smoutput gesvx mz;m1z         NB. solves complex system mz * xz = m1z
smoutput getrf m              NB. LU decomposition of a general double matrix
smoutput getrf mz             NB. LU decomposition of a general complex matrix
NB. the following test failed
NB. smoutput heev m               NB. eigenvalues and eigenvectors of a symmetric double matrix
NB. smoutput heev mz              NB. eigenvalues and eigenvectors of a Hermitian complex matrix
smoutput lartg v2             NB. generates a plane rotation of a double 2-vector
smoutput lartg v2z            NB. generates a plane rotation of a complex 2-vector
smoutput potrf m mp |: m      NB. Cholesky decomposition of symmetric positive definite double matrix
smoutput potrf mz mp +|: mz   NB. Cholesky decomposition of Hermitian positive definite complex matrix
smoutput trtrs m;v            NB. solves double triangular system m * x = v
smoutput trtrs mz;vz          NB. solves complex triangular system mz * xz = vz
