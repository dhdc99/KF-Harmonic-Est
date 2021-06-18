clear variables
clc
close all

fun = @ukfoptim;
fun2 = @ukfoptim2;
lb=[0.0001;0.0001;0.0001];
ub=[0.5;10;10000];
x0 = [0.0001;0.0001;0.0001];

% options = optimoptions('particleswarm','SwarmSize',72,'UseParallel',true,'PlotFcn','pswplotbestf');
% x = particleswarm(fun,3,lb,ub,options);

% options = optimoptions('simulannealbnd','HybridFcn',@fmincon,'PlotFcn',{@saplotbestx,@saplotbestf,@saplotx,@saplotf});
% x = simulannealbnd(fun,[0.0001;0.0001;0.0001],lb,ub,options);

options = optimoptions('surrogateopt','PlotFcn','surrogateoptplot','UseParallel',true,'MaxFunctionEvaluations',10000);
[x,fval]= surrogateopt(fun,lb,ub,options);
[x2,fval2]= surrogateopt(fun2,lb,ub,options);

% options = optimoptions(@fmincon,'Algorithm','interior-point');
% problem = createOptimProblem('fmincon','objective',fun,'x0',x0,'lb',lb,'ub',ub,'options',options);
% ms = MultiStart('PlotFcn',@gsplotbestf,'UseParallel',true);
% x=run(ms,problem,12);

% options = optimoptions(@fmincon,'Algorithm','sqp');
% problem = createOptimProblem('fmincon','objective',fun,'x0',x0,'lb',lb,'ub',ub,'options',options);
% ms = MultiStart('PlotFcn',@gsplotbestf,'UseParallel',true);
% x=run(ms,problem,12);