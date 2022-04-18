clcx
clear
k=1:10
u3=[0 1 8 27 64 125 216 343 512 729]
y=[5 6 13 32 69 130 221 348 517 734]
U=[ones(length(k),1),u3']
Yp=y'
K=inv(U'*U)*U'*Yp