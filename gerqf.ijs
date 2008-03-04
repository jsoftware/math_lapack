NB. gerqf  RQ factorization of a M-by-N matrix

coclass 'jlapack'

NB. =========================================================
NB.*gerqf v RQ factorization of a M-by-N matrix A: R * Q.= A
NB.
NB. syntax:
NB.   'R H TAU Q'=. [RMASK] gerqf A
NB. where
NB.   A     - M-by-N matrix
NB.   RMASK - values to return bit mask: each bit corresponds
NB.           to value should be returned: 2b1000 means
NB.           "only R", 2b0001 means "only Q", 2b1111 means
NB.           "all", 2b0000 is prohibited, 2b1001 is default
NB.   R     - M-by-min(M,N) upper trapezoidal matrix R (R is
NB.           upper triangular if M <= N)
NB.   H     - min(M,N)-by-N matrix of the elementary
NB.           reflectors H(i), stored rowwise
NB.   TAU   - min(M,N)-vector, scalar factors of the
NB.           elementary reflectors
NB.   Q     - N-by-N matrix. If A is complex, then Q is
NB.           unitary, otherwise it's orthogonal
NB.   M     >= 0
NB.   N     >= 0
NB.
NB. if:
NB.   'R H TAU Q'=. 2b1111 gerqf A
NB. then
NB.   Q -: mp/ (idmat M) -"2 TAU * (* +)"0/~"1 |:H
NB.   A -: Q mp R

gerqf=: 2b1001&$: : (4 : 0)

ic=. iscomplex y
zero=. ic {:: dzero ; zzero
routine=. ic { 'dgerqf' ,: 'zgerqf'

if. (-. 0 1 -: x I. 1 16) +. ((0 ~: #@$) +. (0 -: ]) +. (0 ~: L.)) x do.
  error routine;'RMASK should be an integer in range [1,15]'
end.

vmatrix y

'm n'=. $y
k=. m <. n
d=. n-m
a=. zero + |:y
lda=. 1 >. m
tau=. k $ zero
lwork=. 1 >. 10 * m >. n
work=. lwork$zero
info=. izero

arg=. 'm;n;a;lda;tau;work;lwork;info'

(cutarg arg)=. routine call , each ".arg

if. info~:0 do.
  error routine;'info result: ',":info return.
end.

r=. h=. q=. izero

if. 2b1101 (17 b.) x do.
  val=. |: (n,m) $a
  if. 2b1000 (17 b.) x do.
    r=. d utri val
  end.
  if. 2b0101 (17 b.) x do.
    h=. (d >. 0) ((idmat $) + (+ @: sltri)) (-k) {. val
  end.
  if. 2b0001 (17 b.) x do.
    q=. mp/ (idmat n) -"2 (+ tau) * (* +)"0/~"1 h
  end.
end.

({. @: > ^: (1=#)) (I. _4 {. #: x) { r;h;tau;q
)

NB. =========================================================
NB.*tgerqf v test gerqf

tgerqf=: 3 : 0
match=. matchclean;;
smoutput 'R Q'=. gerqf y
smoutput a=. y match R mp Q
0 pick a
)

NB. =========================================================
NB. test matrices:

testgerqf=: 3 : 0
m0=. 0 0$0
m1=. ?.4 6$10
m2=. ?.6 4$10
m3=. ?.6 6$10
m4=. 0 0$zzero
m5=. j./ ?. 2 4 6$10
m6=. j./ ?.2 6 4$10
m7=. j./ ?.2 6 6$10
tgerqf &> m0;m1;m2;m3;m4;m5;m6;m7
)
