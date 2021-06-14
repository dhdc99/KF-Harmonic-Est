clc
clear variables
close all

load('unknownSignal.mat');
harmnum=10;
[output,p] = ukfsample(signal,60,1/4000,harmnum,0.1,0,2,1,1);

figure
tiledlayout('flow');

for index = 1:4:4*harmnum
        nexttile
    plot(output(index+3,:));
end