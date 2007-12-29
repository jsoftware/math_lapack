NB. zgees   Schur factorization of a complex nonsymmetric matrix

coclass 'jlapack'

NB. =========================================================
NB.*zgees v Schur factorization of a complex nonsymmetric matrix
NB.
NB. form: zgees mat
NB.
NB. returns: Schur vectors; Schur form; eigenvalues
NB.
NB. if:
NB.       'Z T V' =. zgees A
NB. then
NB.       Z mp T mp +|:Z   is   A

zgees=: 3 : 0

vsquare y

jobvs=. 'V'
sort=. 'N'
select=. ''
a=. zzero + |: y
'lda n'=. $ y
sdim=. izero
w=. n $ zzero
ldvs=. n
vs=. (ldvs,n) $ zzero
lwork=. 33 * n
work=. lwork $ zzero
rwork=. n $ dzero
bwork=. n $ izero
info=. izero

arg=. 'jobvs;sort;select;n;a;lda;sdim;w;vs;ldvs;work;lwork;rwork;bwork;info'

(cutarg arg)=. 'zgees' call ".arg

if. info~:0 do.
  error 'zgees';'info result: ',":info return.
end.

t=. |: (n,lda) $ a
z=. |: (n,ldvs) $ vs

z;t;w

)

NB. =========================================================
NB.*tzgees v test zgees

tzgees=: 3 : 0
match=. matchclean;;
smoutput 'z t w'=. zgees y
smoutput a=. y match clean z mp t mp + |: z
0 pick a
)

NB. =========================================================
NB.*testzgees v test matrices

testzgees=: 3 : 0
m0=: j./ ?.2 3 3 $10
m1=: j./ ?.2 6 6 $10
tzgees &> m0;m1
)
