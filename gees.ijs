NB. gees   Schur factorization of a square matrix

coclass 'jlapack'

NB. =========================================================
NB.*gees v Schur factorization of a square matrix:
NB.        Z*T*conjugate_transpose(Z)=A
NB.
NB. syntax:
NB.   'Z T V'=. [RMASK] gees A
NB. where
NB.   A     - N-by-N matrix
NB.   RMASK - values to return bit mask: each bit corresponds
NB.           to value should be returned: 2b100 means
NB.           "only Z", 2b001 means "only V", 2b111 (default)
NB.           means "all", 2b000 is prohibited
NB.   Z     - N-by-N matrix of Schur vectors. If A is complex,
NB.           then Z is unitary, otherwise it's orthogonal
NB.   T     - N-by-N matrix of Schur form. If A is real, then
NB.           T is the real Schur form
NB.   V     - N-vector of eigenvalues, in the same order that
NB.           they appear on the diagonal of the output Schur
NB.           form T
NB.   N     >= 0
NB.
NB. if:
NB.   'Z T V'=. gees A
NB. then
NB.   A -: Z mp T mp +|:Z

gees=: 2b111&$: : (4 : 0)

ic=. iscomplex y
zero=. ic {:: dzero ; zzero
routine=. ic { 'dgees' ,: 'zgees'
iox=. ic { 9 14 ,: 7 8

if. (-. 0 1 -: x I. 1 8) +. ((0 ~: #@$) +. (0 -: ]) +. (0 ~: L.)) x do.
  error routine;'RMASK should be an integer in range [1,7]'
end.

vsquare y

sa=. |.$y
isvs=. 0 ~: 2b100 (17 b.) x
svsi=. isvs { 0 0 ,: sa

jobvs=. isvs { 'NV'
sort=. 'N'
select=. ''
n=. #y
a=. zero + |:y
lda=. ldvs=. 1 >. n
sdim=. izero
if. ic do.
  w=. n$zero
  rwork=. n$dzero
else.
  wr=. wi=. n$zero
end.
vs=. svsi$zero
lwork=. 1 >. 34*n
work=. lwork$zero
bwork=. n$izero
info=. izero

arg=. iox xtoken 'jobvs;sort;select;n;a;lda;sdim;wr;wi;w;vs;ldvs;work;lwork;rwork;bwork;info'

(cutarg arg)=. routine call , each ".arg

if. info~:0 do.
  error routine;'info result: ',":info return.
end.

if. 2b100 (17 b.) x do.
  vs=. |:svsi$vs
end.
if. 2b010 (17 b.) x do.
  a=. |:sa$a
end.
if. 2b001 (17 b.) x do.
  if. -. ic do.
    w=. wr
    if. 1 e. wi ~: 0 do.
      w=. w j. wi
    end.
  end.
else.
  w=. i. 0
end.

({. @: > ^: (1=#)) (I. _3 {. #: x) { vs;a;w
)

NB. =========================================================
NB.*tgees v test gees

tgees=: 3 : 0
match=. matchclean;;
smoutput 'Z T V'=. gees y
smoutput a=. y match clean Z mp T mp +|:Z
0 pick a
)

NB. =========================================================
NB. test matrices:

testgees=: 3 : 0
m0=. 0 0$0
m1=. ?.6 6$10
m2=. 0 0$zzero
m3=. j./ ?.2 6 6$10
tgees &> m0;m1;m2;m3
)
