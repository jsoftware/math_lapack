NB. lapack definitions

sys=. (;:'Darwin Linux Win') i. <UNAME
bin=. > sys { 'vecLib';'lapack.so';'jlapack.dll'
dar=. '/System/Library/Frameworks/vecLib.framework/'

path=: jpath '~addons\math\lapack\'
dll=: '"',((sys{0 1 1){::dar;path),bin,'" '

NB. =========================================================
call=: 4 : 0
x=. dll,x,'_ + i ',(+:#y)$' *'
r=. x cd LASTIN=: y
if. > {. r do.
  error x;'lapack dll return code: ',": > {. r
else.
  LASTOUT=: }.r
end.
)

NB. =========================================================
docs=: 3 : 0
if. 0>4!:0 <'dirs' do. load 'dir' end.
dirs jhostpath path,'doc\*.lap'
)

NB. =========================================================
need=: 3 : 0
require (<path) ,each (;:y) ,each <'.ijs'
)

NB. =========================================================
routines=: 3 : 0
if. 0>4!:0 <'dirs' do. load 'dir' end.
dirs jhostpath path,'*.ijs'
)
