NB. dgeqrf  QR factorization of a real matrix
NB.
NB. dgeqrf   returns as per LAPACK
NB. dgeqrfQ  is a cover that returns Q and R

coclass'jlapack'

NB. =========================================================
NB.*dgeqrf v QR factorization of a real matrix
NB.
NB. form: dgeqrf mat
NB.
NB. returns: H T R
NB.
NB. where:  H & T represent the Hermitian matrix Q
NB.         R is upper triangular
NB.         and mat =  Q mp R

NB. for nonce limited to square matrices:

dgeqrf=: 3 : 0

vsquare y.

if. iscomplex y. do.
  need 'zgeqrf'
  zgeqrf y.
  return.
end.

'm n'=. $y.
s=. m <. n
lda=. m

a=. dzero + |: y.
tau=. s $ dzero
lwork=. 10 * n >. m
work=. lwork$dzero
info=. izero

arg=. 'm;n;a;lda;tau;work;lwork;info'

(cutarg arg)=. 'dgeqrf' call ".arg

if. info~:0 do.
  'dgeqrf' error 'info result: ',":info return.
end.

val=: |: (s,n)$a
r=. utri val
h=. (idmat n,s) + sltri val

h;tau;r
)

NB. =========================================================
NB.*dgeqrfQ v full QR factorization of a real matrix
NB.
NB. returns Q R
NB.
NB. where:  Q is Hermitian
NB.         R is upper triangular
NB. and  mat =  Q mp R

dgeqrfQ=: 3 : 0
'h tau r'=: dgeqrf y.
'n m'=: $r
q=. mp/ (idmat n) -"2 tau * */~"1 |:h
q;r
)

NB. =========================================================
NB.*tdgeqrf v test dgeqrf using dgeqrfQ
tdgeqrf=: 3 : 0
match=. matchclean;[;clean@]
smoutput 'Q R'=. dgeqrfQ y.
smoutput a=. y. match Q mp R
0 pick a
)

testdgeqrf=: 3 : 0
m0=: 8 %~ 2 2$13 9 3 7
m1=: ?.4 4$10
NB. m2=: ?.4 3$10
NB. *./ tdgeqrf &> m0;m1;m2
*./ tdgeqrf &> m0;m1
)
