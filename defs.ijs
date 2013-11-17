NB. lapack definitions

path=: jpath '~addons/math/lapack/'

3 : 0''
NB. if. IF64 *. UNAME-:'Win' do.
NB.   '64-bit not supported' 13!:8[10
NB. end.
if. UNAME-:'Linux' do.
  dll=: 'liblapack.so.3 '
  JLAPACK=: 'F'
elseif. UNAME-:'Darwin' do.
  JLAPACK=: 'J'
  dll=: '/System/Library/Frameworks/vecLib.framework/vecLib '
elseif. UNAME-:'Win' do.
  if. IF64 do.
    dll=: 'liblapack.dll '
    JLAPACK=: 'F'
  else.
    dll=: '"',path,'jlapack.dll" '
    JLAPACK=: 'J'
  end.
elseif. do.
  'platform not supported' 13!:8[10
end.
''
)

NB. =========================================================
call=: 4 : 0
if. 'F'=JLAPACK do.
  x=. dll,x,'_ + n ',(+:#y)$' *'
  r=. x cd LASTIN=: y
  LASTOUT=: }.r
elseif. 'J'=JLAPACK do.
  x=. dll,x,'_ + i ',(+:#y)$' *'
  r=. x cd LASTIN=: y
  if. > {. r do.
    error x;'lapack dll return code: ',": > {. r
  else.
    LASTOUT=: }.r
  end.
end.
)

NB. =========================================================
docs=: 3 : 0
NB. if. 0>4!:0 <'dirs' do. load 'dir' end.
NB. dirs jpathsep path,'doc/*.lap'
{.("1) 1!:0 jpathsep path,'doc/*.lap'
)

NB. =========================================================
need=: 3 : 0
require (<path) ,each (;:y) ,each <'.ijs'
)

NB. =========================================================
routines=: 3 : 0
NB. if. 0>4!:0 <'dirs' do. load 'dir' end.
NB. dirs jpathsep path,'*.ijs'
{.("1) 1!:0 jpathsep path,'*.ijs'
)
