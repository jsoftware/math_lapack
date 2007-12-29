NB. zpotrf   Cholesky factorization of a complex Hermitian
NB.          positive definite matrix

coclass 'jlapack'

NB. =========================================================
NB.*zpotrf v Cholesky factorization of a complex Hermitian
NB.          positive definite matrix
NB.
NB. form: zpotrf mat
NB.
NB. The factorization has the form
NB.
NB.    mat -: L mp +|:L
NB.
NB. where L is lower triangular.

zpotrf=: 3 : 0

if. isreal y do.
  need 'dpotrf'
  dpotrf y
  return.
end.

vhermitian y

n=. lda=. #y
a=. zzero + |: y
uplo=. 'L'
info=. izero

arg=. 'uplo;n;a;lda;info'

(cutarg arg)=. 'zpotrf' call ".arg

if. info~:0 do.
  error 'zpotrf';'info result: ',":info return.
end.

ltri |:(n,n)$a

)

NB. =========================================================
NB.*tzpotrf v test zpotrf
tzpotrf=: 3 : 0
match=. matchclean;;
smoutput L=. zpotrf y
smoutput a=. y match L mp + |: L
0 pick a
)

NB. =========================================================
NB. test matrices:
testzpotrf=: 3 : 0
m0=: (mp (+ @ |:)) j./ ?.2 4 4$10
m1=: (mp (+ @ |:)) _25 + j./ ?.2 10 10$100
tzpotrf &> m0;m1
)
