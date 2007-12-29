NB. zgeqrf  QR factorization of a complex matrix
NB.
NB. zgeqrf   returns as per LAPACK
NB. zgeqrfQ  is a cover that returns Q and R

coclass 'jlapack'

NB. =========================================================
NB.*zgeqrf v QR factorization of a complex matrix
NB.
NB. form: zgeqrf mat
NB.
NB. returns: H T R
NB.
NB. where:  H & T represent the Hermitian matrix Q
NB.         R is upper triangular
NB.         Q mp R   is   mat

zgeqrf=: 3 : 0

vmatrix y

'm n'=. $y
s=. m <. n
lda=. m

a=. zzero + |: y
tau=. s $ zzero
lwork=. 10 * n >. m
work=. lwork$zzero
info=. izero

arg=. 'm;n;a;lda;tau;work;lwork;info'

(cutarg arg)=. 'zgeqrf' call ".arg

if. info~:0 do.
  error 'zgeqrf';'info result: ',":info return.
end.

val=. |: (n,m) $a
r=. utri val
h=. (idmat m,s) + sltri (m,s) {. val
h;tau;r
)

NB. =========================================================
NB.*zgeqrfQ v full QR factorization of a complex matrix
NB.
NB. returns Q R
NB.
NB. where:  Q is Hermitian
NB.         R is upper triangular
NB.         Q mp R   is   mat

zgeqrfQ=: 3 : 0

'h tau r'=. zgeqrf y
'm n'=. $r
q=. mp/ (idmat m,m) -"2 tau * (* +)"0/~"1 |:h
q;r
)

NB. =========================================================
NB.*tzgeqrf v test zgeqrf using zgeqrfQ
tzgeqrf=: 3 : 0
match=. matchclean;[;clean@]
smoutput 'Q R'=. zgeqrfQ y
smoutput a=. y match Q mp R
0 pick a
)

NB. =========================================================
NB. test matrices:

testzgeqrf=: 3 : 0
m0=: 8 %~ 2 2$13 9 3 7
m1=: ?.3 3$10
m2=: j./?. 2 7 4$10     NB. J Dictionary
m3=: j./?. 2 4 7$10
tzgeqrf &> m0;m1;m2;m3
)
