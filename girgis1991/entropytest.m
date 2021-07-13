clear variables
clc
close all

load('HIFSig.mat');
load('isum.mat');
load('isumnl.mat');
load('i1nl.mat');
load('i2nl.mat');
load('i3nl.mat');
fs = 4000;
ts = 1/fs;
t = ts:ts:4;
dur= seconds(t);
xt = timetable(dur',isum(1,:)',isum(2,:)',isum(3,:)',isum(4,:)');
xt2 = timetable(dur',HIFSig(:,5),HIFSig(:,6),HIFSig(:,7),HIFSig(:,5)+HIFSig(:,6)+HIFSig(:,7));

embeddim = 2;

% normalentropy1 = sampen(isum(1,1000:4000),embeddim,0.1,'euclidean')
% hifentropy1 = sampen(isum(1,4000:16000),embeddim,0.1,'euclidean')
%
% normalentropy3 = sampen(isum(2,1000:4000),embeddim,0.1,'euclidean')
% hifentropy3 = sampen(isum(2,4000:16000),embeddim,0.1,'euclidean')
%
% normalentropy5 = sampen(isum(3,1000:4000),embeddim,0.1,'euclidean')
% hifentropy5 = sampen(isum(3,4000:16000),embeddim,0.1,'euclidean')
%
% normalentropy7 = sampen(isum(4,1000:4000),embeddim,0.1,'euclidean')
% hifentropy7 = sampen(isum(4,4000:16000),embeddim,0.1,'euclidean')

embeddim = 2;
timevssampen1 = [];
timevssampen3 = [];
timevssampen5 = [];
timevssampen7 = [];
timevssampen1nlsum = [];
timevssampen3nlsum = [];
timevssampen5nlsum = [];
timevssampen7nlsum = [];
timevssampen1nla = [];
timevssampen3nla = [];
timevssampen5nla = [];
timevssampen7nla = [];
timevssampen1nlb = [];
timevssampen3nlb = [];
timevssampen5nlb = [];
timevssampen7nlb = [];
timevssampen1nlc = [];
timevssampen3nlc = [];
timevssampen5nlc = [];
timevssampen7nlc = [];

samplesperstep = 250;
t = linspace(0,4,16000/samplesperstep);
for index = 1:samplesperstep:16000
    timevssampen1(end+1) = sampen(isum(1,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen3(end+1) = sampen(isum(2,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen5(end+1) = sampen(isum(3,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen7(end+1) = sampen(isum(4,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen1nlsum(end+1) = sampen(isumnl(1,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen3nlsum(end+1) = sampen(isumnl(2,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen5nlsum(end+1) = sampen(isumnl(3,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen7nlsum(end+1) = sampen(isumnl(4,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    
    timevssampen1nla(end+1) = sampen(i1nl(1,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen3nla(end+1) = sampen(i1nl(2,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen5nla(end+1) = sampen(i1nl(3,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen7nla(end+1) = sampen(i1nl(4,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    
    timevssampen1nlb(end+1) = sampen(i2nl(1,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen3nlb(end+1) = sampen(i2nl(2,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen5nlb(end+1) = sampen(i2nl(3,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen7nlb(end+1) = sampen(i2nl(4,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    
    timevssampen1nlc(end+1) = sampen(i3nl(1,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen3nlc(end+1) = sampen(i3nl(2,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen5nlc(end+1) = sampen(i3nl(3,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    timevssampen7nlc(end+1) = sampen(i3nl(4,index:index+(samplesperstep-1)),embeddim,0.1,'euclidean');
    
    
    
    
end

figure
hold on
p1 = plot(t,timevssampen1,'LineWidth',2);
p2 = plot(t,timevssampen3,'LineWidth',2);
p3 = plot(t,timevssampen5,'LineWidth',2);
p4 = plot(t,timevssampen7,'LineWidth',2);
p1.Color(4) = 0.6;
p2.Color(4) = 0.6;
p3.Color(4) = 0.6;
p4.Color(4) = 0.6;
title("Entropy vs time, HIF current Sum, "+ samplesperstep +" samples per step");
xlabel('Time (s)');
ylabel('Sample Entropy');
legend({'1st','3rd','5th','7th'});

figure
hold on
p1 = plot(t,timevssampen1nlsum,'LineWidth',2);
p2 = plot(t,timevssampen3nlsum,'LineWidth',2);
p3 = plot(t,timevssampen5nlsum,'LineWidth',2);
p4 = plot(t,timevssampen7nlsum,'LineWidth',2);
p1.Color(4) = 0.6;
p2.Color(4) = 0.6;
p3.Color(4) = 0.6;
p4.Color(4) = 0.6;
title("Entropy vs time, NL current Sum, "+ samplesperstep +" samples per step");
xlabel('Time (s)');
ylabel('Sample Entropy');
legend({'1st','3rd','5th','7th'});

figure
hold on
p1 = plot(t,timevssampen1nla,'LineWidth',2);
p2 = plot(t,timevssampen3nla,'LineWidth',2);
p3 = plot(t,timevssampen5nla,'LineWidth',2);
p4 = plot(t,timevssampen7nla,'LineWidth',2);
p1.Color(4) = 0.6;
p2.Color(4) = 0.6;
p3.Color(4) = 0.6;
p4.Color(4) = 0.6;
title("Entropy vs time, NL current phase A, "+ samplesperstep +" samples per step");
xlabel('Time (s)');
ylabel('Sample Entropy');
legend({'1st','3rd','5th','7th'});

figure
hold on
p1 = plot(t,timevssampen1nlb,'LineWidth',2);
p2 = plot(t,timevssampen3nlb,'LineWidth',2);
p3 = plot(t,timevssampen5nlb,'LineWidth',2);
p4 = plot(t,timevssampen7nlb,'LineWidth',2);
p1.Color(4) = 0.6;
p2.Color(4) = 0.6;
p3.Color(4) = 0.6;
p4.Color(4) = 0.6;
title("Entropy vs time, NL current phase B, "+ samplesperstep +" samples per step");
xlabel('Time (s)');
ylabel('Sample Entropy');
legend({'1st','3rd','5th','7th'});


figure
hold on
p1 = plot(t,timevssampen1nlc,'LineWidth',2);
p2 = plot(t,timevssampen3nlc,'LineWidth',2);
p3 = plot(t,timevssampen5nlc,'LineWidth',2);
p4 = plot(t,timevssampen7nlc,'LineWidth',2);
p1.Color(4) = 0.6;
p2.Color(4) = 0.6;
p3.Color(4) = 0.6;
p4.Color(4) = 0.6;
title("Entropy vs time, NL current phase C, "+ samplesperstep +" samples per step");
xlabel('Time (s)');
ylabel('Sample Entropy');
legend({'1st','3rd','5th','7th'});