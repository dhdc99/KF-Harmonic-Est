clc
%clear variables
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
load('HIFSig.mat');
load('NLSig.mat');
signaln = awgn(signal,30,'measured');
noise = signal - signaln;
f0=60;
Ts=1/4000;
hnum=4;
t = linspace(0,Ts * length(HIFSig),length(HIFSig));
kappa = hnum*2 -3;
% kappa = 0;
b=2;
output = zeros(hnum*2,length(HIFSig),7);
Q = diag(qvar*ones(hnum*2,1));

for index = 2:7
    [output(:,:,index-1),~] = ukfsample(HIFSig(:,index),f0,Ts,hnum,alpha,kappa,b,Q,R);
end
[output(:,:,7),~] = ukfsample(HIFSig(:,5)+HIFSig(:,6)+HIFSig(:,7),f0,Ts,hnum,alpha,kappa,b,Q,R);
ylim([0 0.5]);
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

titles = {'Phase 1 Voltage'; 'Vb'; 'Vc'; 'Phase 1 Current'; 'Ib'; 'Ic';'Isum'};
subtitles = {'1st Harmonic';'3rd Harmonic';'5th Harmonic';'7th Harmonic'};

for index = 1:7
    figure
    tile=tiledlayout('flow');
    title(tile,titles(index));    
    for i = 1:2:size(output,1)
        nexttile
        plot(t,output(i,:,index),'LineWidth',2); % Try plotting the norm of cosine and sine tracker
        title(subtitles(round((i+1)/2)));
        xlabel('Time (s)');
    end

end
% figure
% tiledlayout('flow');
% for i = 1:10
%     nexttile
%     plot(kalmerror(i,:));
% end

