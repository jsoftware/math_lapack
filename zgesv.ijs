NB. zgesv   solves the complex system A * X = B

coclass 'jlapack'

NB. =========================================================
NB.*zgesv v solves the complex system A * X = B
NB.
NB. form: zgesv mata;matb
NB.
NB. returns: X
NB.
NB. if:
NB.       X =. zgesv A;B
NB. then
NB.       A mp X       is   B
NB.       (%.A) mp B   is   X

zgesv=: 3 : 0

'ma mb'=: y

if. (isreal ma) *. isreal mb do.
  need 'dgesv'
  dgesv y
  return.
end.

vsquare ma
vmatrix mb

n=. #ma
if. n ~: #mb do.
  error 'zgesv';'matrices should have same number of rows'
end.

nrhs=. {:$mb
lda=. ldb=. n

a=. zzero + |:ma
b=. zzero + |:mb

ipiv=. n$zzero

info=. izero

arg=. 'n;nrhs;a;lda;ipiv;b;ldb;info'

(cutarg arg)=. 'zgesv' call ".arg

if. info~:0 do.
  error 'zgesv';'info result: ',":info return.
end.

|: (nrhs,n)$ b

)

NB. =========================================================
NB.*tzgesv v test zgesv
tzgesv=: 3 : 0
'a b'=. y
match=. matchclean;;
smoutput x=. zgesv y
smoutput r=. b match clean a mp x
0 pick r
)

NB. =========================================================
NB. test matrices:

testzgesv=: 3 : 0
ma0=. j./ ?.2 4 4$100
mb0=. j./ ?.2 4 3$50
ma1=. j./ ?.2 20 20$100
mb1=. j./ ?.2 20 11$50
tzgesv &> (< ma0;mb0) , (< ma1;mb1)
)
