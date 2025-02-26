clear all;    
clc;
% loading distribution dataset to fit
name2='uniform_1_10_1m.csv' % file name comes here 

X=table2array(readtable(name)); % converting dataset to array
%X_max=max(X); % max of X;
%X=X./X_max % normalizing X
N=size(X,1) % dataset size

%% --------------------------------------------------------------------
tic % start of processing time
delta=0; %intializing interval step
moments=[]; %array to store moments - each row contains moments of a competing set with k scenarios
ProbVals=[]; % probabilites of a competing set with k scenarios
midVals=[]; %mid values or representative value of k scenarios
SD_moments=[]; %array to store moments - each row contains moments of a competing set with k scenarios


T=10; % Stability criterion parameter - iterations included eavaluted for convergence
S=0.0005; % convergence criterion or stability cut off -  0.005  0.0005
xLoop=3; % starting with 3 scenarios minimum as competing distribution

% Starting evaluation till find a distribution found for which all moments meet S
go=true; 
while go;
    xLoop=xLoop+1
    delta=(max(X)-min(X))/xLoop; %interval step width
    
    % Finding ProbVals/MidVals for scenarios in the current competing
    % distribution
    pLoop=1; %looping variable for finding probabilites
    while pLoop<=xLoop;
        % calculating ProbVals
        ProbVals(pLoop,1)= (countis(X,strcat('<',num2str((min(X) +delta*(pLoop)))))...
            - countis(X,strcat('<',num2str((min(X) +delta*(pLoop-1)))))  )/N;
        % calculating midVals
        midVals(pLoop)= ((min(X)+delta*(pLoop-1))+ ...
            (min(X)+delta*(pLoop)))/2;
        pLoop=pLoop+1; % rounding to adjst for num2str error ...
    end
    
    moments=[moments; zeros(1,4)];
    moments(xLoop,1)=sum(transpose(midVals(:))*ProbVals(:));
    moments(xLoop,2)=sum((((midVals-moments(xLoop,1)).^2)').*ProbVals(:,1));
    moments(xLoop,3)=( sum((((midVals-moments(xLoop,1)).^3)').*ProbVals(:,1))  )/ moments(xLoop,2).^(3/2);
    moments(xLoop,4)=( sum((((midVals-moments(xLoop,1)).^4)').*ProbVals(:,1))  )/ moments(xLoop,2).^(4/2);

    if (xLoop>T+3)
        SD_moments=[SD_moments; zeros(1,4)];
        SD_moments(xLoop,1)=std(moments(  (size(moments(:,1),1)-T):(size(moments(:,1),1)),1));
        SD_moments(xLoop,2)=std(moments(  (size(moments(:,2),1)-T):(size(moments(:,1),1)),2));
        SD_moments(xLoop,3)=std(moments(  (size(moments(:,3),1)-T):(size(moments(:,1),1)),3));
        SD_moments(xLoop,4)=std(moments(  (size(moments(:,4),1)-T):(size(moments(:,1),1)),4));
        SD_moments(xLoop,:)
    end
    
    
    
    if (xLoop>T+3)
        
        if  ( SD_moments(xLoop,1)<S & ...
                SD_moments(xLoop,2)<S & ...
                SD_moments(xLoop,3)<S & ...
                SD_moments(xLoop,4)<S);
                go=false;
                'number of scnerios coverged to'
                xLoop
                SD_moments(xLoop,:)
        end
        if  (xLoop==250);
            go=false;
            'number of scnerios coverged to'
            xLoop
            
        end
    end
    
       
    % assigning values to scenariosInMarketRisk & probValOfScMarketRisk
    % matrices

end

'Converged....'
time=(toc)


figure(1)
x_length=size(moments(:,1),1);
subplot(2,2,1)
plot(moments(1:x_length,1))
title('1st');
subplot(2,2,2)
plot(moments(1:x_length,2))
title('  2nd');
subplot(2,2,3)
plot(moments(1:x_length,3))
title('3rd');
subplot(2,2,4)
plot(moments(1:x_length,4))
title('4th');
p=mtit('Moment convergence Plots','fontsize',12,'color',[0 0 0],'xoff',0,'yoff',-1.15);



figure(2) % sobplots for SD_moments
x_length=size(SD_moments(:,1),1);
subplot(2,2,1)
plot(SD_moments(T+3:x_length,1))
title('1st');
subplot(2,2,2)
plot(SD_moments(T+3:x_length,2))
title('  2nd');
subplot(2,2,3)
plot(SD_moments(T+3:x_length,3))
title('3rd');
subplot(2,2,4)
plot(SD_moments(T+3:x_length,4))
title('4th');
p=mtit('Standard Deviation Convergence Plots','fontsize',12,'color',[0 0 0],'xoff',0,'yoff',-1.15);


figure(3) % sobplots for SD_moments
bar(ProbVals)
title(strcat('Discretized (k=', num2str(size(moments(:,1),1)), ')'));
X=[];
Y=table2array(readtable(name2)); % converting dataset to array
s_Mean=mean(Y);
s_Var=var(Y);
s_std=std(Y);
s_Skewness=skewness(Y);
s_Kurtosis=kurtosis(Y);
%Y=[];

output=[N; T; S; size(moments(:,1),1);...
    (s_Mean-moments(size(moments(:,1),1),1))/s_Mean; ...
    (s_Var-moments(size(moments(:,1),1),2))/s_std; ...
    (s_Skewness-moments(size(moments(:,1),1),3))/s_Skewness; ...
    (s_Kurtosis-moments(size(moments(:,1),1),4))/s_Kurtosis; ...
    time];
output=output'
moments(size(moments(:,1),1),3)


%figure(4)
%histogram(Y)
%% file outpu from estm_AccptLoss_Probs
dlmwrite ('moments.csv', moments)
dlmwrite ('probabilities.csv', ProbVals)
dlmwrite ('output.csv', output)
