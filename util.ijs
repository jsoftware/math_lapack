NB. lapack utils
NB.
NB. lapzero etc.
NB.
NB. cutarg        cut argument list
NB. error         display message and signal error
NB. extijs        ensure script has ijs extension
NB.
NB. clean         clean numbers near 0
NB. matchclean    if clean x-y is all 0
NB.
NB. diagmat       diagonal matrix
NB. idmat         identity matrix
NB. ltmat         lower triangular matrix
NB. utmat         upper triangular matrix
NB.
NB. ltri          return only lower triangular matrix
NB. utri          return only upper triangular matrix
NB. sltri         return only strictly lower triangular matrix
NB. sutri         return only strictly upper triangular matrix

cd=: 15!:0

izero=: 23-23
ione=: 23-22
dzero=: 1.1-1.1
done=: 2.1-1.1
zzero=: 1j1-1j1
zone=: 2j1-1j1

cutarg=: <;._1 @ (';'&,)
extijs=: , ((0: < #) *. [: -. '.'"_ e. ]) # '.ijs'"_

NB. =========================================================
matchclean=: 0: *./ . = clean @ , @: -

NB. =========================================================
diagmat=: * =@i.@#
idmat=: (0 $: ]) :(= ({. -~/&i. {:)@])

mp=: +/ . *

ltmat=: (0 $: ]) :(>: ({. -~/&i. {:)@])
utmat=: (0 $: ]) :(<: ({. -~/&i. {:)@])

ltri=: (0 $: ]) : (] * (>: ({. -~/&i. {:)@$@]))
utri=: (0 $: ]) : (] * (<: ({. -~/&i. {:)@$@]))
sltri=: (0 $: ]) : (] * (> ({. -~/&i. {:)@$@]))
sutri=: (0 $: ]) : (] * (< ({. -~/&i. {:)@$@]))


NB. =========================================================
NB.*clean v clean numbers to tolerance (default 1e_10)
NB. sets values less than tolerance to 0
clean=: 3 : 0
1e_10 clean y
:

if. L. y do.
  x clean each y
else.
  if. 16 ~: 3!:0 y do.
    y * x <: |y
  else.
    j./"1 y* x <: | y=. +.y
  end.
end.
)

NB. =========================================================
NB. cxpair
cxpair=: 4 : 0
'i j'=: |: _2 [\ x
r=. i {"1 y
z=. j. j {"1 y
n=. (r+z) ,. r-z
n (i,j)}"1 y
)

NB. =========================================================
NB. error - display message and signal error
error=: 3 : 0
wdinfo y
error=. 13!:8@1:
error ''
)
