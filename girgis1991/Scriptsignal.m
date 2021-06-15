clear
clc
close all
Fs = 4000;
t = 1/Fs:1/Fs:4;
t1 = 1/Fs:1/Fs:1;
k = 1;
for i = 1:2:20
   F(k) = 60 * i;
   A(k) = 20 - i;
   k = k + 1;
end
signal = 0;
for i = 1:10
   signal = signal + A(i)*cos(2*pi*F(i).*t); 
end
signal(1:4000) = 20*cos(2*pi*60.*t1);
figure,
plot(signal)