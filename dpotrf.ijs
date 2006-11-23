NB. dpotrf  Cholesky factorization of real symmetric positive definite matrix

coclass'jlapack'

NB. =========================================================
NB.*dpotrf v Cholesky factorization of real symmetric positive definite matrix
NB.
NB. form: dpotrf mat
NB.
NB. The factorization has the form
NB.
NB.    A = L mp T mp |:L
NB.
NB. where L is lower triangular.

dpotrf=: 3 : 0

vsymposdef y.

if. iscomplex y. do.
  need 'zpotrf'
  zpotrf y.
  return.
end.

n=. lda=. #y.
a=. dzero + |: y.
uplo=. 'L'
info=. izero

arg=. 'uplo;n;a;lda;info'

(cutarg arg)=. 'dpotrf' call ".arg

if. info~:0 do.
  'dpotrf' error 'info result: ',":info return.
end.

ltri |:(n,n)$a

)

NB. =========================================================
NB.*tdpotrf v test dpotrf
tdpotrf=: 3 : 0
if. y. -: '' do. m=. m0 else. m=. y. end.
match=. matchclean;;
smoutput L=. dpotrf m
smoutput a=. m match L mp |: L
0 pick a
)

NB. =========================================================
NB. test matrices:
testdpotrf=: 3 : 0
m0=: (mp |:) ?.4 4$10
m1=: (mp |:) _25 + ?.10 10$100
tdpotrf &> m0;m1
)
