NB. lapack definitions

path=: jpath '~addons/math/lapack/'

3 : 0''
if. UNAME-:'Linux' do.
  dll=: 'liblapack.so.3'
  JLAPACK=: 'F'
elseif. UNAME-:'Darwin' do.
  JLAPACK=: 'J'
  if. IFIOS do.
    dll=: '/System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/vecLib'
  else.
    dll=: '/System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/vecLib'
    if. -.fexist dll do.
      dll=: '/System/Library/Frameworks/vecLib.framework/vecLib'
    end.
  end.
elseif. UNAME-:'Win' do.
  if. IF64 do.
    if. fexist path,'jlapack64.dll' do.
      dll=: '"',path,'jlapack64.dll"'
      JLAPACK=: 'J'
    else.
      dll=: 'liblapack.dll'
      JLAPACK=: 'F'
    end.
  else.
    dll=: '"',path,'jlapack.dll"'
    JLAPACK=: 'J'
  end.
elseif. UNAME-:'Android' do.
  JLAPACK=: 'J'
  arch=. LF-.~ 2!:0'getprop ro.product.cpu.abi'
  dll=: '"',(jpath'~bin/../libexec/android-libs/',arch,'/liblapack.so'),'"'
  if. 0=fexist dltb dll -. '"' do.
    smoutput 'lapack error: please run install_jlapack_'''' to install liblapack.so'
  end.
elseif. do.
  'platform not supported' 13!:8[10
end.
''
)

NB. =========================================================
call=: 4 : 0
if. 'F'=JLAPACK do.
  x=. dll,' ',x,'_ + n ',(+:#y)$' *'
  r=. x cd LASTIN=: y
  LASTOUT=: }.r
elseif. 'J'=JLAPACK do.
  x=. dll,' ',x,'_ + i ',(+:#y)$' *'
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

install=: 3 : 0
if. -. UNAME-:'Android' do. return. end.
arch=. LF-.~ 2!:0'getprop ro.product.cpu.abi'
require 'pacman'
'rc p'=. httpget_jpacman_ 'http://www.jsoftware.com/download/android/libs/',arch, '/', z=. 'liblapack.so'
if. rc do.
  smoutput 'unable to download: ',z return.
end.
(<jpath'~bin/../libexec/android-libs/',arch,'/liblapack.so') 1!:2~ 1!:1 <p
2!:0 ::0: 'chmod 644 "',(jpath'~bin/../libexec/android-libs/',arch,'/liblapack.so'),'"'
1!:55 ::0: <p
smoutput 'done'
EMPTY
)

