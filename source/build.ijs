NB. build.ijs

mkdir_j_ jpath '~Addons/math/lapack'
mkdir_j_ jpath '~addons/math/lapack'

writesource_jp_ '~Addons/math/lapack/source';'~Addons/math/lapack/lapack.ijs'

(jpath '~addons/math/lapack/lapack.ijs') (fcopynew ::0:) jpath '~Addons/math/lapack/lapack.ijs'

f=. 3 : 0
(jpath '~addons/math/lapack/',y) (fcopynew ::0:) jpath '~Addons/math/lapack/',y
''
)

f 'dgees.ijs'
f 'dgeev.ijs'
f 'dgeqrf.ijs'
f 'dgerqf.ijs'
f 'dgesvd.ijs'
f 'dgesv.ijs'
f 'dgetrf.ijs'
f 'doc.ijs'
f 'dpotrf.ijs'
f 'dtrtrs.ijs'
f 'gebal.ijs'
f 'gees.ijs'
f 'geev.ijs'
f 'gehrd.ijs'
f 'gelqf.ijs'
f 'gels.ijs'
f 'gelss.ijs'
f 'geqlf.ijs'
f 'geqrf.ijs'
f 'gerqf.ijs'
f 'gesvd.ijs'
f 'gesv.ijs'
f 'gesvx.ijs'
f 'getrf.ijs'
f 'heev.ijs'
f 'lapack.ijs'
f 'lapack.ijt'
f 'lartg.ijs'
f 'potrf.ijs'
f 'test0.ijs'
f 'test.ijs'
f 'tests.ijs'
f 'trtrs.ijs'
f 'zgees.ijs'
f 'zgeev.ijs'
f 'zgeqrf.ijs'
f 'zgerqf.ijs'
f 'zgesv.ijs'
f 'zpotrf.ijs'
f 'ztrtrs.ijs'

NB. g=. {."1[ 1!:0 <jpath '~Addons/math/lapack/source/doc/*'
NB. empty f&.> 'doc/'&,&.> g
