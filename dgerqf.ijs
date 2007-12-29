NB. dgerqf  RQ factorization of a real matrix
NB.
NB. dgerqf   returns as per LAPACK
NB. dgerqfQ  is a cover that returns R and Q

coclass 'jlapack'

NB. =========================================================
NB.*dgerqf v RQ factorization of a real matrix
NB.
NB. form: dgerqf mat
NB.
NB. returns: R H T
NB.
NB. where:  R is upper triangular
NB.         H & T represent the Hermitian matrix Q
NB.         Q mp R   is   mat

dgerqf=: 3 : 0

vmatrix y

if. iscomplex y do.
  need 'zgerqf'
  zgerqf y
  return.
end.

'm n'=. $y
k=. m <. n
d=. n-m
lda=. m

a=. dzero + |: y
tau=. k $ dzero
lwork=. 10 * n >. m
work=. lwork$dzero
info=. izero

arg=. 'm;n;a;lda;tau;work;lwork;info'

(cutarg arg)=. 'dgerqf' call ".arg

if. info~:0 do.
  error 'dgerqf';'info result: ',":info return.
end.

val=. |: (n,m) $a
r=. d utri val
h=. (d >. 0) ((idmat $) + sltri) (-k) {. val

r;h;tau
)

NB. =========================================================
NB.*dgerqfQ v full RQ factorization of a real matrix
NB.
NB. returns R Q
NB.
NB. where:  R is upper triangular
NB.         Q is Hermitian
NB.         Q mp R   is   mat

dgerqfQ=: 3 : 0

if. iscomplex y do.
  need 'zgerqf'
  zgerqfQ y
  return.
end.

'r h tau'=. dgerqf y
'm n'=. $r
q=. mp/ (idmat n) -"2 tau * */~"1 h
r;q
)

NB. =========================================================
NB.*tdgerqf v test dgerqf using dgerqfQ
tdgerqf=: 3 : 0
match=. matchclean;[;clean@]
smoutput 'R Q'=. dgerqfQ y
smoutput a=. y match R mp Q
0 pick a
)

NB. =========================================================
NB. test matrices:

testdgerqf=: 3 : 0
m0=: 8 %~ 2 2$13 9 3 7
m1=: ?.3 3$10
m2=: ?.7 4$10
m3=: ?.4 7$10
tdgerqf &> m0;m1;m2;m3
)
