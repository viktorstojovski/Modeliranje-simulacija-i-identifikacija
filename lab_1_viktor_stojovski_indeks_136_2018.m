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
%% ZADACA RUNGE KUTA

a=0.35
w0=1
h=0.01
T0=0
TF=3000
T=0.01
n=floor((TF-T0)/T)
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
    %% ZADACA RUNGE KUTA FELBERG
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
f1=@(x,y) y; 
f2=@(x,y) a*(1-x^2)*y-x;
for i=2:n
        k1 = h * f(t, x);
        k2 = h * f(t + h/4, x + k1/4);
        k3 = h * f(t + 3*h/8, x + 3*k1/32 + 9*k2/32);
        k4 = h * f(t + 12*h/13, x + 1932*k1/2197 - 7200*k2/2197 + 7296*k3/2197);
        k5 = h * f(t + h, x+ 439*k1/216 - 8*k2 + 3680*k3/513 - 845*k4/4104);
        k6 = h * f(t + h/2, x - 8*k1/27 + 2*k2 - 3544*k3/2565 + 1859*k4/4104 - 11*k5/40);

   x = x + 25*k1/216 + 1408*k3/2565 + 2197*k4/4104 - k5/5;
   y = y + 16*k1/135 + 6656*k3/12825 + 28561*k4/56430 - 9*k5/50 + 2*k6/55;
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