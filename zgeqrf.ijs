NB. zgeqrf  QR factorization of a complex matrix
NB.
NB. zgeqrf   returns as per LAPACK
NB. zgeqrfQ  is a cover that returns Q and R

NB. for nonce only works with square matrices

coclass'jlapack'

NB. =========================================================
NB.*zgeqrf v QR factorization of a complex matrix
NB.
NB. form: zgeqrf mat
NB.
NB. returns: H T R
NB.
NB. where:  H & T represent the Hermitian matrix Q
NB.         R is upper triangular
NB.         and mat =  Q mp R

zgeqrf=: 3 : 0

vsquare y.

'm n'=. $y.
s=. m <. n
lda=. m

a=. zzero + |: y.
tau=. s $ zzero
lwork=. 10 * n >. m
work=. lwork$zzero
info=. izero

arg=. 'm;n;a;lda;tau;work;lwork;info'

(cutarg arg)=. 'zgeqrf' call ".arg

if. info~:0 do.
  'zgeqrf' error 'info result: ',":info return.
end.

val=. |: (s,n) $a
r=. utri val
h=. (idmat n,s) + sltri val
h;tau;r
)

NB. =========================================================
NB.*zgeqrfQ v full QR factorization of a complex matrix
NB.
NB. returns Q R
NB.
NB. where:  Q is Hermitian
NB.         R is upper triangular
NB. and  mat =  Q mp R

zgeqrfQ=: 3 : 0
'h tau r'=: zgeqrf y.
'n m'=. $r
q=. mp/ (idmat n) -"2 tau * */~"1 |:h
q;r
)

NB. =========================================================
NB.*tzgeqrf v test zgeqrf using zgeqrfQ
tzgeqrf=: 3 : 0
if. y. -: '' do. m=. m0 else. m=. y. end.
match=. matchclean;[;clean@]
smoutput 'Q R'=. zgeqrfQ m
smoutput a=. m match Q mp R
0 pick a
)

NB. =========================================================
NB. test matrices:

testzgeqrf=: 3 : 0
m0=: 8 %~ 2 2$13 9 3 7
m1=: ?.3 3$10
m2=: j./?. 2 7 4$10     NB. J Dictionary
m3=: j./?. 2 5 5$10
NB. *./ tzgeqrf &> m0;m1;m2;m3
tzgeqrf &> m0;m1
)
