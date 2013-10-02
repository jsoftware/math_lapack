NB. lapack definitions

path=: jpath '~addons/math/lapack/'

3 : 0''
if. IF64 *. UNAME-:'Win' do.
  '64-bit not supported' 13!:8[10
end.
if. UNAME-:'Linux' do.
  if. IF64 do.
    dll=: '"',path,'lapack64.so" '
  else.
    dll=: '"',path,'lapack',(IFRASPI#'_raspi32'),'.so" '
  end.
elseif. UNAME-:'Darwin' do.
  dll=: '/System/Library/Frameworks/vecLib.framework/vecLib '
elseif. UNAME-:'Win' do.
  dll=: '"',path,'jlapack.dll" '
elseif. do.
  'platform not supported' 13!:8[10
end.
''
)

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
