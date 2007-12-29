NB. dpotrf   Cholesky factorization of a real symmetric
NB.          positive definite matrix

coclass 'jlapack'

NB. =========================================================
NB.*dpotrf v Cholesky factorization of a real symmetric
NB.          positive definite matrix
NB.
NB. form: dpotrf mat
NB.
NB. The factorization has the form
NB.
NB.    mat -: L mp |:L
NB.
NB. where L is lower triangular.

dpotrf=: 3 : 0

if. iscomplex y do.
  need 'zpotrf'
  zpotrf y
  return.
end.

vsymposdef y

n=. lda=. #y
a=. dzero + |: y
uplo=. 'L'
info=. izero

arg=. 'uplo;n;a;lda;info'

(cutarg arg)=. 'dpotrf' call ".arg

if. info~:0 do.
  error 'dpotrf';'info result: ',":info return.
end.

ltri |:(n,n)$a

)

NB. =========================================================
NB.*tdpotrf v test dpotrf
tdpotrf=: 3 : 0
match=. matchclean;;
smoutput L=. dpotrf y
smoutput a=. y match L mp |: L
0 pick a
)

NB. =========================================================
NB. test matrices:
testdpotrf=: 3 : 0
m0=: (mp |:) ?.4 4$10
m1=: (mp |:) _25 + ?.10 10$100
tdpotrf &> m0;m1
)
