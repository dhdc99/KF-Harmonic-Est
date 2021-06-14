clc
clear variables
close all

load('unknownSignal.mat');
[output,p] = ukfsample(signal,60,1/4000,10,0.5,0,2,diag(0.1*ones(40,1)),0.1);