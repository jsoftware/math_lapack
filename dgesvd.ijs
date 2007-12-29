NB. dgesvd  singular value decomposition of real matrix

coclass 'jlapack'

NB. =========================================================
NB.*dgesvd v singular value decomposition of real matrix
NB.
NB. form: dgesvd mat
NB.
NB. returns: left singular vectors; diagonal matrix of
NB.          singular values; right singular vectors
NB.
NB. if:
NB.       'L S R' =. dgesvd A
NB. then
NB.        L mp S mp |: R   is   A

dgesvd=: 3 : 0

vmatrix y

if. iscomplex y do.
  need 'zgesvd'
  zgesvd y
  return.
end.

'm n'=. $y
mn=. m <. n
lda=. m
ldu=. m
ldvt=. n

jobu=. jobvt=. 'A'
a=. dzero + |:y

s=. mn$dzero
u=. (m,m)$dzero
vt=. (n,n)$dzero

lwork=. 10 * m >. n
work=. lwork$dzero
info=. izero

arg=. 'jobu;jobvt;m;n;a;lda;s;u;ldu;vt;ldvt;work;lwork;info'

(cutarg arg)=. 'dgesvd' call ".arg

if. info~:0 do.
  error 'dgesvd';'info result: ',":info return.
end.

vt=. (n,n)$vt
u=. |: (m,m)$u
s=. |: (n{.s) * idmat n,m

u;s;vt

)

NB. =========================================================
NB.*tdgesvd v test dgesvd
tdgesvd=: 3 : 0
match=. matchclean;;
smoutput 'L S R'=. dgesvd y
smoutput a=. y match clean L mp S mp |:R
0 pick a
)

NB. =========================================================
NB. test matrices:

testdgesvd=: 3 : 0
m0=: ?.3 3 $10
m1=: ?.4 6 $10
tdgesvd &> m0;m1
)
