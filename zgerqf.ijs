NB. zgerqf  RQ factorization of a complex matrix
NB.
NB. zgerqf   returns as per LAPACK
NB. zgerqfQ  is a cover that returns R and Q

coclass 'jlapack'

NB. =========================================================
NB.*zgerqf v RQ factorization of a complex matrix
NB.
NB. form: zgerqf mat
NB.
NB. returns: R H T
NB.
NB. where:  R is upper triangular
NB.         H & T represent the Hermitian matrix Q
NB.         Q mp R   is   mat

zgerqf=: 3 : 0

vmatrix y

'm n'=. $y
k=. m <. n
d=. n-m
lda=. m

a=. zzero + |: y
tau=. k $ zzero
lwork=. 10 * n >. m
work=. lwork$zzero
info=. izero

arg=. 'm;n;a;lda;tau;work;lwork;info'

(cutarg arg)=. 'zgerqf' call ".arg

if. info~:0 do.
  error 'zgerqf';'info result: ',":info return.
end.

val=. |: (n,m) $a
r=. d utri val
h=. (d >. 0) ((idmat $) + (+ @: sltri)) (-k) {. val

r;h;tau
)

NB. =========================================================
NB.*zgerqfQ v full RQ factorization of a complex matrix
NB.
NB. returns R Q
NB.
NB. where:  R is upper triangular
NB.         Q is Hermitian
NB.         Q mp R   is   mat

zgerqfQ=: 3 : 0

'r h tau'=. zgerqf y
'm n'=. $r
q=. mp/ (idmat n) -"2 (+ tau) * (* +)"0/~"1 h
r;q
)

NB. =========================================================
NB.*tzgerqf v test zgerqf using zgerqfQ
tzgerqf=: 3 : 0
match=. matchclean;[;clean@]
smoutput 'R Q'=. zgerqfQ y
smoutput a=. y match R mp Q
0 pick a
)

NB. =========================================================
NB. test matrices:

testzgerqf=: 3 : 0
m0=: 8 %~ 2 2$13 9 3 7
m1=: ?.3 3$10
m2=: j./?. 2 7 4$10     NB. J Dictionary
m3=: j./?. 2 4 7$10
tzgerqf &> m0;m1;m2;m3
)
