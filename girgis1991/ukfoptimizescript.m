clear variables
clc
close all

fun = @ukfoptim;
lb=[0.0001;0.0001;0.0001];
ub=[1;100;10000];
x0 = [0.147;1.1972;7308];

%initialswarm = repmat(x0',6,1);
options = optimoptions('particleswarm','SwarmSize',72,'UseParallel',true,'PlotFcn','pswplotbestf','MinNeighborsFraction',1);
[x1,fval1] = particleswarm(fun,3,lb,ub,options);

% options = optimoptions('simulannealbnd','PlotFcn',{@saplotbestx,@saplotbestf,@saplotx,@saplotf},'InitialTemperature',[2 20 10000],'ReannealInterval',30);
% [x,fval,flag,out] = simulannealbnd(fun,x0,lb,ub,options);

% options = optimoptions('surrogateopt','PlotFcn','surrogateoptplot','UseParallel',true,'MaxFunctionEvaluations',10000);
% [x2,fval2]= surrogateopt(fun,lb,ub,options);

% options = optimoptions(@fmincon,'Algorithm','interior-point');
% problem = createOptimProblem('fmincon','objective',fun,'x0',x0,'lb',lb,'ub',ub,'options',options);
% ms = MultiStart('PlotFcn',@gsplotbestf,'UseParallel',true);
% x=run(ms,problem,12);

% options = optimoptions(@fmincon,'Algorithm','sqp');
% problem = createOptimProblem('fmincon','objective',fun,'x0',x0,'lb',lb,'ub',ub,'options',options);
% ms = MultiStart('PlotFcn',@gsplotbestf,'UseParallel',true);
% [x,fval4]=run(ms,problem,12);