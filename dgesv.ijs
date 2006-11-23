NB. dgesv solves the real system A * X = B

coclass 'jlapack'

NB. =========================================================
NB.*dgesv v solves the real system A * X = B
NB.
NB. form: dgesv mata;matb
NB.
NB. returns: X
NB.
NB. if
NB.       X =. dgesv A;B
NB. then
NB.       A mp X   is  B
NB.
NB. equivalently, X is (%.A) mp B

dgesv=: 3 : 0

'ma mb'=: y.

if. (iscomplex ma) +. iscomplex mb do.
  need 'zgesv'
  zgesv y.
  return.
end.

vsquare ma
vmatrix mb

n=. #ma
if. n ~: #mb do.
  'dgesv' error 'matrices should have same number of rows'
  return.
end.

nrhs=. {:$mb
lda=. ldb=. n

a=. dzero + |:ma
b=. dzero + |:mb

ipiv=. n$dzero

info=. izero

arg=. 'n;nrhs;a;lda;ipiv;b;ldb;info'

(cutarg arg)=. 'dgesv' call ".arg

if. info~:0 do.
  'dgesv' error 'info result: ',":info return.
end.

|: (nrhs,n)$ b

)

NB. =========================================================
NB.*tdgesv v test dgesv
tdgesv=: 3 : 0
'a b'=. y.
match=. matchclean;;
smoutput x=. dgesv y.
smoutput r=. b match clean a mp x
0 pick r
)

NB. =========================================================
NB. test matrices:

testdgesv=: 3 : 0
ma0=: ?.4 4$100
mb0=: ?.4 3$50
ma1=: ?.20 20$100
mb1=: ?.20 11$50
tdgesv &> (< ma0;mb0) , (< ma1;mb1)
)
