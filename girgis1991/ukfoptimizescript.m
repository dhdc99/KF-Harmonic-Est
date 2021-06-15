clear variables
clc
close all

fun = @ukfoptim;
lb=[0.0001;0.0001;0.0001];
ub=[1;100;10000];
options = optimoptions('particleswarm','SwarmSize',100,'HybridFcn',@fmincon);
x = particleswarm(fun,3,lb,ub,options);