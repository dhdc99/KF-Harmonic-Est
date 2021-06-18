function rmse = ukfoptim2(input)
s=load('unknownSignal.mat');
alpha = input(1);
Qvar = input(2);
Rvar = input(3);
rmse = 0;
signaln = zeros(1,16000);
trueamp = zeros(10,16000);
trueamp(1,1:4000) = 20*ones(1,4000);
error = zeros(3,1);

f0=60;
Ts=1/4000;
hnum=10;
kappa = 17;
b=2;
Q = diag(Qvar*ones(20,1));
R = Rvar;
for i = 1:10
    amp = 21 - 2*i;
    trueamp(i,4001:16000) = amp * ones(1,12000);
end

for index = 10:10:30
    SNR = index;
    signaln(1:4000) = awgn(s.signal(1:4000),SNR,'measured');
    signaln(4001:16000) = awgn(s.signal(4001:16000),SNR,'measured');
    
    [output,~] = ukfsample(signaln,f0,Ts,hnum,alpha,kappa,b,Q,R);
    
    output(2:2:end,:) = [];
    
    kalmerror = trueamp - output;
    
    error(index./10) =  sqrt((10.^(index./10))).*sum(rms(kalmerror(:,1000:16000))); % Try both transposing and not transposing
end
rmse = sum(error);
end