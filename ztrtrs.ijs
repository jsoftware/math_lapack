NB. ztrtrs   solves a triangular system A * X = B

coclass 'jlapack'

NB. =========================================================
NB.*ztrtrs v solves a triangular system A * X = B
NB.
NB. form: ztrtrs mata;matb
NB.
NB. returns: X
NB.
NB. if:
NB.       X =. ztrtrs A;B
NB. then
NB.       B -: A mp X
NB.       X -: (%.A) mp B

ztrtrs=: 3 : 0

'ma mb'=. y

if. (isreal ma) *. isreal mb do.
  need 'dtrtrs'
  dtrtrs y
  return.
end.

vsquare ma
vmatrixorvector mb

n=. #ma
if. n ~: #mb do.
  error 'ztrtrs';'arguments should match in length'
end.

uplo=. 'L'
trans=. 'T'
diag=. 'N'
nrhs=. {: 2 ($!.1) $mb
lda=. ldb=. n >. 1

a=. zzero + ma
b=. zzero + |:mb

info=. izero

arg=. 'uplo;trans;diag;n;nrhs;a;lda;b;ldb;info'

(cutarg arg)=. 'ztrtrs' call ".arg

if. info~:0 do.
  error 'ztrtrs';'info result: ',":info return.
end.

(|: @: ((nrhs,n) & $))^:(ismatrix mb) b

)

NB. =========================================================
NB.*tztrtrs v test dtrtrs
tztrtrs=: 3 : 0
'a b'=. y
match=. matchclean;;
smoutput x=. ztrtrs y
smoutput r=. b match clean a mp x
0 pick r
)

NB. =========================================================
NB. test matrices:

testztrtrs=: 3 : 0
ma0=: utri j./ ? 2 10 10$100
mb0=: j./ ? 2 10 5$50
ma1=: utri j./ ? 2 10 10$100
mb1=: j./ ? 2 10$50
tztrtrs &> (< ma0;mb0) , (< ma1;mb1)
)
