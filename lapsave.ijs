
PFM=: jpath '~Addons/math/lapack/'
PTO=: jpath '~addons/math/lapack/'

f=. 3 : 0
(PTO,y) fcopynew PFM,y
)

f each <;._2 (0 : 0)
lapack.txt
lapack.ijs
lapack.ijt
lapack.so
jlapack.dll
dgeev.ijs
dgeqrf.ijs
dgesv.ijs
dgesvd.ijs
dgetrf.ijs
doc.ijs
dpotrf.ijs
zgeev.ijs
zgeqrf.ijs
)

load 'math/lapack'