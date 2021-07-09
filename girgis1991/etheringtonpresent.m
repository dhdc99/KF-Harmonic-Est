clear variables
clc
close all

load('HIF.mat');
load('HIFSig.mat');
alpha = 0.147;
qvar = 1.1972;
R = 7308;
f0=60;
Ts=1/4000;
hnum=4;
t = linspace(0,Ts * length(HIFSig),length(HIFSig));
kappa = hnum*2 -3;
% kappa = 0;
b=2;
output = zeros(hnum*2,length(HIFSig),6);
Q = diag(qvar*ones(hnum*2,1));
% t = linspace(0,50,201);
% f=figure;
% tile=tiledlayout('flow');
% nexttile
% plot(t,High_impedance_fault(500:700,5),'k',t,High_impedance_fault(500:700,6),'r',t,High_impedance_fault(500:700,7),'b','LineWidth',2);
% title('Normal Current');
% legend('Phase 1','Phase 2','Phase 3');
% xlabel('Time (millisecond)');
% nexttile
% plot(t,High_impedance_fault(1900:2100,5),'k',t,High_impedance_fault(1900:2100,6),'r',t,High_impedance_fault(1900:2100,7),'b','LineWidth',2);
% title('HIF Current');
% legend('Phase 1','Phase 2','Phase 3');
% xlabel('Time (millisecond)');
% f.Position = [0 0 1024 720];

% t = linspace(0,2*pi,1000);
% hold on
% p1 = plot(t,sin(t),'LineWidth',2);
% p2 = plot(t,0.1*sin(3*t),'LineWidth',2);
% p3 = plot(t,0.1*sin(5*t),'LineWidth',2);
% p4 = plot(t,sin(t)+0.1*sin(3.*t)+0.1*sin(5.*t),'r','LineWidth',2);
% legend('AC Waveform','Third Harmonic','Fifth Harmonic','Result');
% title('Effect of Harmonics on AC Waveforms');
% p1.Color(4) = 0.75;
% p2.Color(4) = 0.5;
% p3.Color(4) = 0.5;
