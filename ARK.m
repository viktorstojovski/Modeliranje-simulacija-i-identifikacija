%%
clc 
clear

f = @(t,y) 1+y*y; % the function that has to be integrated

epsilon = 0.00001;

h = 0.1;

t = 0;
w = 0;
i = 0; 
Tf = 2; % The final time of simulation
y(1) = w;

% print the first step, i = 0.
fprintf('Step %d: t = %6.4f, w = %18.15f\n', i, t, w);

while t<Tf
h = min(h, Tf-t);
1 = h * f(t, y);
        k2 = h * f(t + h/4, y + k1/4);
        k3 = h * f(t + 3*h/8, y + 3*k1/32 + 9*k2/32);
        k4 = h * f(t + 12*h/13, y + 1932*k1/2197 - 7200*k2/2197 + 7296*k3/2197);
        k5 = h * f(t + h, y + 439*k1/216 - 8*k2 + 3680*k3/513 - 845*k4/4104);
        k6 = h * f(t + h/2, y - 8*k1/27 + 2*k2 - 3544*k3/2565 + 1859*k4/4104 - 11*k5/40);

        w1 = y + 25*k1/216 + 1408*k3/2565 + 2197*k4/4104 - k5/5;
        w2 = y + 16*k1/135 + 6656*k3/12825 + 28561*k4/56430 - 9*k5/50 + 2*k6/55;
R = abs(w1-w2)/h; % estimate how close w1 and w2 are
delta = 0.84*(epsilon/R)^(1/4); % update the integration step h

if R<=epsilon 
t =t+h ; % increment time for h 
w = w1; % the solution is equal to w1
y(i+1) = ; % store the value of w in y
i = i+1; % increment the counter
fprintf('Step %d: t = %6.4f, w = %18.15f\n', i, t, w); % print the Step, the time and soultion value
h =h*delta ; % adapt the h value, h = delta*h
else
h =delta*h ; % adapt the h value, h = delta*h
end

end