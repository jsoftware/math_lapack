NB. lapack validation
NB.
NB. validation routines that check argument is a matrix:
NB.    vmatrix
NB.    vhermitian
NB.    vorthogonal
NB.    vsquare
NB.    vsymmetric
NB.
NB. validation routines that check argument is either
NB. a matrix or vector:
NB.    vmatrixorvector

isreal=: -: +
iscomplex=: -.@isreal
isvector=: 1: = #@$
ismatrix=: 2: = #@$
ismatrixorvector=: 1 2 e.~ #@$
issquare=: =/ @ $
issymmetric=: -:   |:
ishermitian=: -: +@|:

NB. =========================================================
isorthogonal=: 3 : 0
q=. y mp |: y
*./ 0 = clean ,q - idmat $q
)

NB. =========================================================
isunitary=: 3 : 0
q=. y mp + |: y
*./ 0 = clean ,q - idmat $q
)

NB. =========================================================
f=. 2 : 'm&(13!:8)@(#&12)@(0 e. v)'

vmatrix=: 'argument should be a matrix' f ismatrix
vmatrixorvector=: 'argument should be either a matrix or vector' f ismatrixorvector
vhermitian=: 'argument should be a hermitian matrix' f ishermitian [ vmatrix
vorthogonal=: 'argument should be an orthogonal matrix' f isorthogonal [ vmatrix
vsquare=: 'argument should be a square matrix' f issquare [ vmatrix
vsymmetric=: 'argument should be a symmetric matrix' f issymmetric [ vmatrix
