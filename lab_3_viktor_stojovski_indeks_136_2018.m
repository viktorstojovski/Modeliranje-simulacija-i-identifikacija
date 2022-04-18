%% PRIMER1 OJLEROVA POSTAPKA
x(1)=3
T0=1
TF=1.35
t(1)=1
T=0.05
n=floor((Tf-T0)/T)
f=@(x,t)t*(x^2)
for k=1:n
    x(k+1)=x(k)+T*f(x(k),t(k))
    t(k+1)=t(k)+T
    fprintf('x(%d)=%.4f\n',k-1,x(k))
end
plot(t,x)
%% PRIMER 2 TAJLOROVA FORMULA
syms x,t
x(1)=3
T0=1
TF=1.35
t(1)=1
T=0.05
n=floor((Tf-T0)/T)
f=@(x,t)t*(x^2)

    for k=1:n
    x(k+1)=x(k)+T*f(x(k),t(k))+0.5*T^2*(diff(f,t)+f*diff(f,x))
    t(k+1)=t(k)+T
    fprintf('x(%d)=%.4f\n',k-1,x(k))
end
plot(t,x)
%% ZADACA 

a=0.35
w0=1
h=0.01
T0=0
TF=3000
T=0.01
n=floor((Tf-T0)/T)
x0=random('NORMAL',0,1)
y0=random('NORMAL',0,1)
x=x0
y=y0
t=T0
X(1)=x0
Y(1)=y0
for i=2:n
    K11=y
    K21=a*y-a*y*x^2-x
    K12=y+(h*K21)/2
    K22=a*(y+(h*K21)/2)-a*(y+(h*K21)/2)*(x+(h*K11)/2)-(x+(h*K11)/2)
    K13=y+(h*K12)/2
    K23=a*(y+(h*K22)/2)-a*(y+(h*K22)/2)*(x+(h*K12)/2)-(x+(h*K12)/2)
    K14=y+h*K23
    K24=a*(y+(h*K23))-a*(y+(h*K23))*(x+(h*K13))-(x+(h*K13))
    x=x+h*(K11+2*K12+2*K13+K14)/6
    y=y+h*(K21+2*K22+2*K23+K24)/6
    t=t+h
    X(i)=x
    Y(i)=y
    T(i)=t;
    x1(i)=y
    y1(i)=a*(1-x^2)*y-x
end
figure(1)
plot(T,X,'r',T,Y,'b'),grid
figure(2)
plot(X,x1),grid
figure(3)
plot(Y,y1),grid
    