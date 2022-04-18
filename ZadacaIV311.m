clc
clear
k=0:5
u=[0 1 2 3 4 5]'
y=[0 0 1 4 11 26]
U=[y(1:5)',u(1:5)]
Yp=y(2:6)'
theta=inv(U'*U)*U'*Yp