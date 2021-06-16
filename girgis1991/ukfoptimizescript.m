clear variables
clc
close all

fun = @ukfoptim;
lb=[0.0001;0.0001;0.0001];
ub=[1;100;10000];

options = optimoptions('particleswarm','SwarmSize',50,'HybridFcn',@fmincon,'UseParallel',true,'PlotFcn','pswplotbestf');
x = particleswarm(fun,3,lb,ub,options);