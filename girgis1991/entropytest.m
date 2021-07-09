clear variables
clc 
close all

load('HIFSig.mat');
load('isum.mat');
fs = 4000;
ts = 1/fs;
t = ts:ts:4;
dur= seconds(t);
xt = timetable(dur',isum(1,:)',isum(2,:)',isum(3,:)',isum(4,:)');
xt2 = timetable(dur',HIFSig(:,5),HIFSig(:,6),HIFSig(:,7),HIFSig(:,5)+HIFSig(:,6)+HIFSig(:,7));

embeddim = 2;

normalentropy1 = sampen(isum(1,1000:4000),embeddim,0.1,'euclidean')
hifentropy1 = sampen(isum(1,4000:16000),embeddim,0.1,'euclidean')

normalentropy3 = sampen(isum(2,1000:4000),embeddim,0.1,'euclidean')
hifentropy3 = sampen(isum(2,4000:16000),embeddim,0.1,'euclidean')

normalentropy5 = sampen(isum(3,1000:4000),embeddim,0.1,'euclidean')
hifentropy5 = sampen(isum(3,4000:16000),embeddim,0.1,'euclidean')

normalentropy7 = sampen(isum(4,1000:4000),embeddim,0.1,'euclidean')
hifentropy7 = sampen(isum(4,4000:16000),embeddim,0.1,'euclidean')

figure
tiledlayout('flow');
nexttile
pentropy(isum(1,:),4000);
nexttile
pentropy(isum(2,:),4000);
nexttile
pentropy(isum(3,:),4000);
nexttile
pentropy(isum(4,:),4000);