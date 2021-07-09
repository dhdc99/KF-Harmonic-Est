function rmse = ukfoptim(input)
baseline=load('hiftrue.mat');
s=load('HIFSig.mat');
alpha = input(1);
Qvar = input(2);
Rvar = input(3);

error = 0;

f0=60;
Ts=1/4000;
hnum=4;
kappa = hnum*2 - 3;
b=2;
Q = diag(Qvar*ones(hnum*2,1));
R = Rvar;

for index = 2:7
    
    [output,~] = ukfsample(s.HIFSig(1:4000,index),f0,Ts,hnum,alpha,kappa,b,Q,R);
    
    kalmerror = baseline.hiftrue(:,index-1) - output(1,:);
    
    error =  error + (norm(kalmerror,'fro')); % Frobenius norm of the error matrix
end
rmse = error;
end