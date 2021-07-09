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

pentropy(xt2(:,4));