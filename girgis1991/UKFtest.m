clc
clear variables
close all

load('unknownSignal.mat');
signaln = awgn(signal,20,'measured');
noise = signal - signaln;
f0=60;
Ts=1/4000;
hnum=10;
alpha = 0.147;
kappa = hnum*2 -3;
% kappa = 0;
b=2;
Q = diag(1.1972*ones(20,1));

R = 7308;
[output,p] = ukfsample(signaln,f0,Ts,hnum,alpha,kappa,b,Q,R);

trueamp(1,1:4000) = 20*ones(1,4000);
amp =19;
for i = 1:10
    trueamp(i,4001:16000) = amp * ones(1,12000);
    amp=amp-2;
end

kalmerror = zeros(10,16000);

for i = 1:10
    kalmerror(i,:) = trueamp(i,:) - output((2*i-1),:);
end


figure
tiledlayout('flow');
for i = 1:2:20
    nexttile
    plot(output(i,:));
    ylim([0 20]);
end

figure
tiledlayout('flow');
for i = 1:10
    nexttile
    plot(kalmerror(i,:));
end

