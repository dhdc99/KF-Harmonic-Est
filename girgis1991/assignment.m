clear all;
clc;
close all;

load('unknownSignal.mat');
load('HIFSig.mat');
load('HIFlong.mat');
% figure
% stft(HIFSig(:,5), 4000,'Window',flattopwin(512,'periodic'),'FFTLength',512,'OverlapLength',461);
% title("512 Points STFT");
% ylim([0 2]);
%goertzel, autocorrelation
%4000/512 = 7.8125 Hz per fft bin, 60/7.812 = 7.68

s=stft(signal, 4000,'Window',flattopwin(512,'periodic'),'FFTLength',512,'OverlapLength',461);
s_mag=abs(s);
figure
tiledlayout('flow');
nexttile
plot(linspace(0,4,304),s_mag(264,:).*(4.6378)/256);
xlabel('Time');
ylabel('Magnitude');
title('Fundamental Frequency 60Hz');
ylim([0 20]);

nexttile
plot(linspace(0,4,304),s_mag(round(256+7.68*3),:).*(4.6378)/256);
xlabel('Time');
ylabel('Magnitude');
title('3rd Harmonic 180Hz');
ylim([0 20]);

nexttile
plot(linspace(0,4,304),s_mag(round(256+7.68*5),:).*(4.6378)/256);
xlabel('Time');
ylabel('Magnitude');
title('5th Harmonic 300Hz');
ylim([0 20]);

nexttile
plot(linspace(0,4,304),s_mag(round(256+7.68*7),:).*(4.6378)/256);
xlabel('Time');
ylabel('Magnitude');
title('7rd Harmonic 420Hz');
ylim([0 20]);

nexttile
plot(linspace(0,4,304),s_mag(round(256+7.68*9),:).*(4.6378)/256);
xlabel('Time');
ylabel('Magnitude');
title('9th Harmonic 540Hz');
ylim([0 20]);

nexttile
plot(linspace(0,4,304),s_mag(round(256+7.68*11),:).*(4.6378)/256);
xlabel('Time');
ylabel('Magnitude');
title('11th Harmonic 660Hz');
ylim([0 20]);

nexttile
plot(linspace(0,4,304),s_mag(round(256+7.68*13),:).*(4.6378)/256);
xlabel('Time');
ylabel('Magnitude');
title('13th Harmonic 780Hz');
ylim([0 20]);

nexttile
plot(linspace(0,4,304),s_mag(round(256+7.68*15),:).*(4.6378)/256);
xlabel('Time');
ylabel('Magnitude');
title('15th Harmonic 900Hz');
ylim([0 20]);

nexttile
plot(linspace(0,4,304),s_mag(round(256+7.68*17),:).*(4.6378)/256);
xlabel('Time');
ylabel('Magnitude');
title('17th Harmonic 1020Hz');
ylim([0 20]);

nexttile
plot(linspace(0,4,304),s_mag(round(256+7.68*19),:).*(4.6378)/256);
xlabel('Time');
ylabel('Magnitude');
title('19th Harmonic 1140Hz');
ylim([0 20]);

figure
hold on
for count = 0:9
plot(linspace(0,4,304),s_mag(round(256+7.68+2.*7.68.*count),:).*(4.6378)/256,'LineWidth',2);
end
legend({'1st','3rd','5th','7th','9th','11th','13th','15th','17th','19th'},'location','southwest');
xlabel('Time(s)');
ylabel('Magnitude');
title('Measurement of Odd Harmonics Using Fourier');