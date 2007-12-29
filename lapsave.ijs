
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
dgees.ijs
dgeev.ijs
dgerqf.ijs
dgeqrf.ijs
dgesv.ijs
dgesvd.ijs
dgetrf.ijs
doc.ijs
dpotrf.ijs
dtrtrs.ijs
zgees.ijs
zgeev.ijs
zgerqf.ijs
zgeqrf.ijs
zgesv.ijs
zpotrf.ijs
ztrtrs.ijs
)

load 'math/lapack'