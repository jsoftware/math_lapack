NB. dtrtrs   solves a triangular system A * X = B

coclass 'jlapack'

NB. =========================================================
NB.*dtrtrs v solves a triangular system A * X = B
NB.
NB. form: dtrtrs mata;matb
NB.
NB. returns: X
NB.
NB. if:
NB.       X =. dtrtrs A;B
NB. then
NB.       B -: A mp X
NB.       X -: (%.A) mp B

dtrtrs=: 3 : 0

'ma mb'=. y

if. (iscomplex ma) +. iscomplex mb do.
  need 'ztrtrs'
  ztrtrs y
  return.
end.

vsquare ma
vmatrixorvector mb

n=. #ma
if. n ~: #mb do.
  error 'dtrtrs';'arguments should match in length'
end.

uplo=. 'L'
trans=. 'T'
diag=. 'N'
nrhs=. {: 2 ($!.1) $mb
lda=. ldb=. n >. 1

a=. dzero + ma
b=. dzero + |:mb

info=. izero

arg=. 'uplo;trans;diag;n;nrhs;a;lda;b;ldb;info'

(cutarg arg)=. 'dtrtrs' call ".arg

if. info~:0 do.
  error 'dtrtrs';'info result: ',":info return.
end.

(|: @: ((nrhs,n) & $))^:(ismatrix mb) b

)

NB. =========================================================
NB.*tdtrtrs v test dtrtrs
tdtrtrs=: 3 : 0
'a b'=. y
match=. matchclean;;
smoutput x=. dtrtrs y
smoutput r=. b match clean a mp x
0 pick r
)

NB. =========================================================
NB. test matrices:

testdtrtrs=: 3 : 0
ma0=: utri ? 10 10$100
mb0=: ? 10 5$50
ma1=: utri ? 10 10$100
mb1=: ? 10$50
tdtrtrs &> (< ma0;mb0) , (< ma1;mb1)
)
