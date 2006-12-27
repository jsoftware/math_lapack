NB. lapack validation
NB.
NB. validation routines that check argument is a matrix:
NB.    vmatrix
NB.    vhermitian
NB.    vorthogonal
NB.    vsquare
NB.    vsymposdef

iscomplex=: -. @ (-: +)
ismatrix=: 2: = #@$
isreal=: -: +
issquare=: =/ @ $
ishermitian=: -: +@|:

NB. =========================================================
isorthogonal=: 3 : 0
q=. y mp |: y
*./ 0 = clean ,q - idmat $q
)

NB. =========================================================
issymposdef=: 3 : 0
if. 0==/$y do. 0 return. end.
y-:|:y
)

NB. =========================================================
f=. 2 : 'm&(13!:8)@(#&12)@(0 e. v)'

vmatrix=: 'argument should be a matrix' f ismatrix
vhermitian=: 'argument should be a hermitian matrix' f ishermitian [ vmatrix
vorthogonal=: 'argument should be an orthogonal matrix' f isorthogonal [ vmatrix
vsquare=: 'argument should be a square matrix' f issquare [ vmatrix
vsymposdef=: 'argument should be a symmetric positive-definite matrix' f issymposdef [ vmatrix
