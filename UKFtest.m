clc
clear variables
close all

load('unknownSignal.mat');
output = ukfsample(signal,60,1/4000,10,1,0,2);