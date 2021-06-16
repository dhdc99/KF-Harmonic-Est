function rmse = ukfoptim(input)
    load('unknownSignal.mat');
    alpha = input(1);
    Qvar = input(2);
    Rvar = input(3);
    SNR = 10;
    signaln = awgn(signal,SNR,'measured');
    f0=60;
    Ts=1/4000;
    hnum=10;
    kappa = hnum*2 -3;
    b=2;
    Q = diag(Qvar*ones(20,1));
    
    R = Rvar;
    [output,~] = ukfsample(signaln,f0,Ts,hnum,alpha,kappa,b,Q,R);
    
    
    
    trueamp(1,1:4000) = 20*ones(1,4000);
    for i = 1:10
        amp = 21 - 2*i;
        trueamp(i,4001:16000) = amp * ones(1,12000);
    end
    
    kalmerror = zeros(10,16000);
    
    for i = 1:10
        kalmerror(i,:) = trueamp(i,:) - output((2*i-1),:);
    end
    
    rmse = sum(rms(kalmerror(:,5000:16000)'));
end