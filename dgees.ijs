NB. dgees   Schur factorization of a real nonsymmetric matrix

coclass 'jlapack'

NB. =========================================================
NB.*dgees v Schur factorization of a real nonsymmetric matrix
NB.
NB. form: dgees mat
NB.
NB. returns: Schur vectors; real Schur form; eigenvalues
NB.
NB. if:
NB.       'Z T V' =. dgees A
NB. then
NB.       Z mp T mp |:Z   is   A

dgees=: 3 : 0

vsquare y

jobvs=. 'V'
sort=. 'N'
select=. ''
a=. dzero + |: y
'lda n'=. $ y
sdim=. izero
wr=. n $ dzero
wi=. n $ dzero
ldvs=. n
vs=. (ldvs,n) $ dzero
lwork=. 34 * n
work=. lwork $ dzero
bwork=. n $ izero
info=. izero

arg=. 'jobvs;sort;select;n;a;lda;sdim;wr;wi;vs;ldvs;work;lwork;bwork;info'

(cutarg arg)=. 'dgees' call ".arg

if. info~:0 do.
  error 'dgees';'info result: ',":info return.
end.

t=. |: (n,lda) $ a
z=. |: (n,ldvs) $ vs
if. 1 e. wi ~: 0 do.
  wr=. wr j. wi
end.

z;t;wr

)

NB. =========================================================
NB.*tdgees v test dgees

tdgees=: 3 : 0
match=. matchclean;;
smoutput 'z t w'=. dgees y
smoutput a=. y match clean z mp t mp |: z
0 pick a
)

NB. =========================================================
NB.*testdgees v test matrices

testdgees=: 3 : 0
m0=: ?.3 3 $10
m1=: ?.6 6 $10
tdgees &> m0;m1
)
