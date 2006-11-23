NB. dgetrf computes an LU factorization of a general M-by-N matrix

coclass 'jlapack'

NB. =========================================================
NB.*dgetrf v computes an LU factorization of a general M-by-N matrix
NB.
NB. form: dgetrf mat
NB.
NB. returns: L U I
NB,
NB. where   L is lower triangular
NB.         U is upper triangular
NB.         I are the pivot indices

dgetrf=: 3 : 0

vmatrix y.

if. iscomplex y. do.
  need 'zgetrf'
  zgetrf y.
  return.
end.

'm n'=. $y.
mn=. m <. n
lda=. m
a=. dzero + |: y.
ipiv=. mn$izero
info=. izero

arg=. 'm;n;a;lda;ipiv;info'

(cutarg arg)=. 'dgetrf' call ".arg

a=. |:(n,m)$a

l=. (idmat m,n) + sltri a
u=. utri a

if. m <: n do.
  l=. (m,m){.l
else.
  u=. (n,n){.u
end.

l;u;ipiv

)

NB. =========================================================
NB.*tdgetrf v test dgetrf
tdgetrf=: 3 : 0
m=. y.
match=. matchclean;;
smoutput 'L U I'=. dgetrf m
swap=. (I-1) ,each i.#I
swap=. (#~ ~:/ &>) swap
for_i. swap do. m=. i C. m end.
smoutput a=. m match L mp U
0 pick a
)

NB. =========================================================
NB. test matrices:

testdgetrf=: 3 : 0
m0=: ?.4 6$10
m1=: ?.5 12$10
tdgetrf &> m0;m1
)
