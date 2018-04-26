require 'math/lapack'

routine=: 0 : 0
gebal
gees
geev
gehrd
gelqf
gels
gelss
geqlf
geqrf
gerqf
gesv
gesvd
gesvx
getrf
heev
lartg
potrf
trtrs
)

test=: 3 : 0
for_r. <;._2 routine do.
smoutput >r
load '~addons/math/lapack/',(>r),'.ijs'
('test',(>r),'_jlapack_')~''
end.
''
)

test''
