clc
clear variables
close all


alpha = 0.147;
qvar = 1.1972;
R = 7308;

% alpha = 0.999;
% qvar = 13.8122;
% R = 4776;

load('unknownSignal.mat');
load('HIF.mat');
load('Inrush.mat');
load('NLLoad.mat');
signaln = awgn(signal,30,'measured');
noise = signal - signaln;
f0=60;
Ts=1/4000;
hnum=4;
t = linspace(0,1,4000);
kappa = hnum*2 -3;
% kappa = 0;
b=2;
output = zeros(hnum*2,4000,6);
Q = diag(qvar*ones(hnum*2,1));

for index = 2:7
    [output(:,:,index-1),~] = ukfsample(NL_Load(:,index),f0,Ts,hnum,alpha,kappa,b,Q,R);
end
% trueamp(1,1:4000) = 20*ones(1,4000);
% amp =19;
% for i = 1:10
%     trueamp(i,4001:16000) = amp * ones(1,12000);
%     amp=amp-2;
% end
%
% kalmerror = zeros(10,16000);
%
% for i = 1:10
%     kalmerror(i,:) = trueamp(i,:) - output((2*i-1),:);
% end

titles = {'Va'; 'Vb'; 'Vc'; 'Ia'; 'Ib'; 'Ic'};

subtitles = {'1st Harmonic';'3rd Harmonic';'5th Harmonic';'7th Harmonic'};

for index = 1:6
    figure
    tile=tiledlayout('flow');
    title(tile,titles(index));    
    for i = 1:2:size(output,1)
        nexttile
        plot(t,output(i,:,index));
        title(subtitles(round((i+1)/2)));
    end

end
% figure
% tiledlayout('flow');
% for i = 1:10
%     nexttile
%     plot(kalmerror(i,:));
% end

