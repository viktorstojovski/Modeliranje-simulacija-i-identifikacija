%% Ojler (forward backward trapezoidal)

clc
clear

% Numericki da se reshi 
% x' = -a*x; a>0, pri
% x = exp(-a*t)
% T=1,2,3 chekor na integracija

x_forward(1) = 1;
x_backward(1) = 1;
x_trapezoidal(1) = 1;
a = 1;
t(1) = 0;
br_grafik = 1;


for T = 1:0.1:1.5
    % brojot na chekori na simulacija se menuva vo zavisnost od chekorot na
    % integracija T
    N = 12/T;
   
   for i = 1:N
   x_forward(i+1) = (1-a*T)*x_forward(i);
   x_backward(i+1) = (1/(1+a*T))*x_backward(i);
   x_trapezoidal(i+1) = ((2-a*T)/(2+a*T))*x_trapezoidal(i);
   t(i+1) = t(i) + T;
   end
   
   subplot(5,1,br_grafik)
   plot(t,exp(-a*t),'m',t,x_forward,'r',t,x_backward,'b',t,x_trapezoidal,'k')
   xlabel('t [s]')
   ylabel('x')
   legend('egzaktno','forward','backward','trapezoidal')
   title(['dobiena pri T = ',num2str(T)])
   grid on
   
   % izbrisi gi zapisanite vrednosti za sledno T
   x_forward = [];
   x_backward = [];
   x_trapezoidal = [];
   t = [];
   
   % postavi pocetni uslovi za sledno T
   t(1) =0;
   x_forward(1) = 1;
   x_backward(1) = 1;
   x_trapezoidal(1) = 1;
   br_grafik = br_grafik+1;
end