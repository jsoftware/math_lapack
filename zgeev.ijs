NB. zgeev   eigenvalues and eigenvectors of complex square matrix

coclass'jlapack'

NB. =========================================================
NB.*zgeev v eigenvalues and eigenvectors of complex square matrix
NB.
NB. form: zgeev mat
NB.
NB. returns: left eigenvectors; eigenvalues; right eigenvectors
NB.
NB. if:
NB.       'L V R' =. zgeev m
NB. then
NB.        m mp R      is   V *"1 R
NB.       (+|:L) mp m  is   V * +|:L

zgeev=: 3 : 0

vsquare y.

s=. $y.
n=. lda=. ldvl=. ldvr=. #y.
a=. zzero + |: y.
w=. n$zzero
jobvl=. jobvr=. 'V'
vl=. vr=. a * zzero
lwork=. 20*n
rwork=. work=. lwork$dzero
info=. izero

arg=. 'jobvl;jobvr;n;a;lda;w;vl;ldvl;vr;ldvr;work;lwork;rwork;info'

(cutarg arg)=. 'zgeev' call ".arg

if. info~:0 do.
  'zgeev' error 'info result: ',":info return.
end.

val=. w
lvec=. |:s$vl
rvec=. |:s$vr

lvec;val;rvec

)

NB. =========================================================
NB.*tzgeev v test zgeev
tzgeev=: 3 : 0
match=. matchclean;;
smoutput 'L V R'=. zgeev y.
smoutput a=. (y. mp R) match V *"1 R
smoutput b=. ((+|:L) mp y.) match V * +|:L
(0 pick a) *. 0 pick b
)

NB. =========================================================
NB. test matrices:

testzgeev=: 3 : 0
NB. real eigenvalues 2 0.5
m0=: 8 %~ 2 2$13 9 3 7

NB. real eigenvalues 0 3
m1=: 2 2$2 _2 _1 1

NB. complex eigenvalues:
m2=: 2 2$1 _1 1 1

NB. 2 real, 2 complex eigenvalues:
m3=: _2+?.4 4$4

NB. 6 real, 6 complex eigenvalues:
m4=: _2+?.10 10$100
tzgeev &> m0;m1;m2;m3;m4
)
