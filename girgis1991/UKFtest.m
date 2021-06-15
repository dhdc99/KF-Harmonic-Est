clc
clear variables
close all

load('unknownSignal.mat');
[output,p] = ukfsample(signal,60,1/4000,10,0.001,0,2,diag(0.0001*ones(20,1)),0);