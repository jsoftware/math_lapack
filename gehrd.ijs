NB. gehrd   reduce a general square matrix to upper
NB.         Hessenberg form

coclass 'jlapack'

NB. =========================================================
NB.*gehrd v reduce a general square matrix A to upper
NB.         Hessenberg form H by an unitary similarity
NB.         transformation:
NB.           Q' * A * Q = H
NB.
NB. syntax:
NB.   'H Q'=. [RMASK] gehrd A;ILO;IHI
NB. where
NB.   A       - N-by-N matrix
NB.   ILO,IHI - integers. It is assumed that A is already
NB.             upper triangular in rows and columns 1:ILO-1
NB.             and IHI+1:N. ILO and IHI are normally set by
NB.             a previous call to xGEBAL; otherwise they
NB.             should be set to 1 and N respectively.
NB.   RMASK   - values to return bit mask: each bit corresponds
NB.             to value should be returned: 2b01 means
NB.             "only Q", 2b10 means "only H", 2b11 (default)
NB.             means "all", 2b00 is prohibited
NB.   H       - N-by-N upper Hessenberg matrix with zeros under
NB.             the first subdiagonal, factor from the
NB.             factorization Q*H*Q'=A
NB.   Q       - N-by-N matrix, factor from the factorization
NB.             Q*H*Q'=A. If A is complex, then Q is unitary,
NB.             otherwise it's orthogonal
NB.   N       >= 0
NB.
NB. if:
NB.   'H Q'=. gehrd A;1;N
NB. then
NB.   H -: (+|:Q) mp A mp Q

gehrd=: (2b11&$: : (4 : 0)) " 0 1

'ma ilo ihi'=. y
ic=. iscomplex ma
zero=. ic {:: dzero ; zzero
routine=. ic { 'dgehrd' ,: 'zgehrd'
rmask=. x

if. (-. 0 1 -: x I. 1 4) +. ((0 ~: #@$) +. (0 -: ]) +. (0 ~: L.)) rmask do.
  error routine;'RMASK should be an integer in range [1,3]'
end.

vsquare ma

n=. #ma
if. (1 > ilo) +. ((ilo > ihi) *. ((0 ~: n) +. (1 ~: ilo) +. (0 ~: ihi))) +. (ihi > n) do.
  error routine;'following should hold: 1 <: ILO <: IHI <: N'
end.

sa=. |.$ma

ilo=. izero + ilo
ihi=. izero + ihi
a=. zero + |:ma
lda=. 1 >. n
tau=. (0 >. n-1)$zero  NB. '>.' to fix case 0=n
lwork=. 1 >. n
work=. lwork$zero
info=. izero

arg=. 'n;ilo;ihi;a;lda;tau;work;lwork;info'

(cutarg arg)=. routine call , each ". arg

if. info~:0 do.
  error routine;'info result: ',":info return.
end.

a=. |:sa$a
h=. q=. izero

if. 2b10 (17 b.) rmask do.
  h=. _1 utri a
end.

if. 2b01 (17 b.) rmask do.
  ldiff=. 0 >. ihi-ilo  NB. '>.' to fix case 0=n
  qsize=. n , ldiff
  nilo=. - {. ilo
  qvec=. (nilo idmat qsize) + (((0 , <: ilo) ,: qsize) (nilo & sltri) ;. 0 a)
  q=. mp/ (idmat n) -"2 (((0 >. <: ilo) ,: ldiff) ] ;. 0 tau) * (* +)"0/~"1 |:qvec
end.

({. @: > ^: (1=#)) (I. _2 {. #: rmask) { h;q
)

NB. =========================================================
NB.*tgehrd v test gehrd

tgehrd=: 3 : 0
'a ilo ihi'=. y
match=. matchclean;;
smoutput 'h q'=. gehrd y
smoutput r=. h match clean (+|:q) mp a mp q
0 pick r
)

NB. =========================================================
NB. test matrices:

testgehrd=: 3 : 0
ios=. 1 0;2 0;3 0;4 0;5 0;6 0;7 0;8 0;9 0;9 1;9 2;9 3;9 4;9 5;9 6;9 7;9 8
ma0=. 0 0$0
ma1=. ? 10 10$100
ma2=. 0 ios } ma1
ma3=. 0 0$zzero
ma4=. j./ ? 2 10 10$100
ma5=. 0 ios } ma4
tgehrd &> (< ma0;1;(#ma0)) , (< ma1;1;(#ma1)) , (< ma2;2;9) , (< ma3;1;(#ma3)) , (< ma4;1;(#ma4)) , (< ma5;2;9)
)
