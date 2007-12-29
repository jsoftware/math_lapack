NB. dgeqrf  QR factorization of a real matrix
NB.
NB. dgeqrf   returns as per LAPACK
NB. dgeqrfQ  is a cover that returns Q and R

coclass 'jlapack'

NB. =========================================================
NB.*dgeqrf v QR factorization of a real matrix
NB.
NB. form: dgeqrf mat
NB.
NB. returns: H T R
NB.
NB. where:  H & T represent the Hermitian matrix Q
NB.         R is upper triangular
NB.         Q mp R   is   mat

dgeqrf=: 3 : 0

vmatrix y

if. iscomplex y do.
  need 'zgeqrf'
  zgeqrf y
  return.
end.

'm n'=. $y
k=. m <. n
lda=. m

a=. dzero + |: y
tau=. k $ dzero
lwork=. 10 * n >. m
work=. lwork$dzero
info=. izero

arg=. 'm;n;a;lda;tau;work;lwork;info'

(cutarg arg)=. 'dgeqrf' call ".arg

if. info~:0 do.
  error 'dgeqrf';'info result: ',":info return.
end.

val=. |: (n,m) $a
r=. utri val
h=. ((idmat @: $) + sltri) (_,k) {. val

h;tau;r
)

NB. =========================================================
NB.*dgeqrfQ v full QR factorization of a real matrix
NB.
NB. returns Q R
NB.
NB. where:  Q is Hermitian
NB.         R is upper triangular
NB.         Q mp R   is   mat

dgeqrfQ=: 3 : 0

if. iscomplex y do.
  need 'zgeqrf'
  zgeqrfQ y
  return.
end.

'h tau r'=. dgeqrf y
'm n'=. $r
q=. mp/ (idmat m) -"2 tau * */~"1 |:h
q;r
)

NB. =========================================================
NB.*tdgeqrf v test dgeqrf using dgeqrfQ
tdgeqrf=: 3 : 0
match=. matchclean;[;clean@]
smoutput 'Q R'=. dgeqrfQ y
smoutput a=. y match Q mp R
0 pick a
)

NB. =========================================================
NB. test matrices:

testdgeqrf=: 3 : 0
m0=: 8 %~ 2 2$13 9 3 7
m1=: ?.3 3$10
m2=: ?.7 4$10
m3=: ?.4 7$10
tdgeqrf &> m0;m1;m2;m3
)
