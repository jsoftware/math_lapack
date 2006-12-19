NB. dgeev   eigenvalues and eigenvectors of real square matrix

coclass 'jlapack'

NB. =========================================================
NB.*dgeev v eigenvalues and eigenvectors of real square matrix
NB.
NB. form: dgeev mat
NB.
NB. returns: left eigenvectors; eigenvalues; right eigenvectors
NB.
NB. if:
NB.       'L V R' =. dgeev m
NB. then
NB.        m mp R      is   V *"1 R
NB.       (+|:L) mp m  is   V * +|:L

dgeev=: 3 : 0

NB. validation -----------------------------------
vsquare y

NB. use complex routine if required --------------
if. iscomplex y do.
  need 'zgeev'
  zgeev y
  return.
end.

NB. define variables needed for DLL call ---------
s=. $y
n=. lda=. ldvl=. ldvr=. #y
a=. dzero + |: y
wr=. wi=. n$dzero
jobvl=. jobvr=. 'V'
vl=. vr=. a * dzero
lwork=. 10*n
work=. lwork$dzero
info=. izero

arg=. 'jobvl;jobvr;n;a;lda;wr;wi;vl;ldvl;vr;ldvr;work;lwork;info'

NB. call DLL, reassign variables -----------------
(cutarg arg)=. 'dgeev' call ".arg

NB. define result variables ----------------------
val=. wr
lvec=. |:s$vl
rvec=. |:s$vr

if. 1 e. wi ~: 0 do.
  val=. val + j. wi
  cx=. I. wi ~: 0
  lvec=. cx cxpair lvec
  rvec=. cx cxpair rvec
end.

lvec;val;rvec

)

NB. =========================================================
NB. tests

NB. =========================================================
NB.*tdgeev v test dgeev       single test
tdgeev=: 3 : 0
match=. matchclean;;
smoutput 'L V R'=. dgeev y
smoutput a=. (y mp R) match V *"1 R
smoutput b=. ((+|:L) mp y) match V * +|:L
(0 pick a) *. 0 pick b
)

NB. =========================================================
NB.*testdgeev v testdgeev     test samples
testdgeev=: 3 : 0

NB. real eigenvalues 2 0.5
m0=: 8 %~ 2 2$13 9 3 7

NB. real eigenvalues 0 3
m1=: 2 2$2 _2 _1 1

NB. complex eigenvalues:
m2=: 2 2$1 _1 1 1

*./ tdgeev &> m0;m1;m2
)
