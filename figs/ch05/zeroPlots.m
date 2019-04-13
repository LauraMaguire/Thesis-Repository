bufferIndex = 11;
day = '/170126/';
name = '/170126_zeroedData';

meanBufferK = nanmean(k(bufferIndex,:));
zeroK = k - meanBufferK;
meanBufferT = nanmean(T(bufferIndex,:));
zeroT = T - meanBufferT;
meanBufferLag = nanmean(L(bufferIndex,:));
zeroLag = L - meanBufferLag;
meanBufferA = nanmean(A(bufferIndex,:));
zeroA = A - meanBufferA;

%% Make bar charts of the averaged parameters

% Show GuHCl rep? 1=yes, 0=no
GuHCl = 0;

x=length(label);
if GuHCl==0
    x=length(label)-1;
end

close all
figure
subplot(2,2,1)
meanAmp = nanmean(zeroA(1:x,:),2);
errAmp = nanstd(zeroA(1:x,:),0,2);
bar(meanAmp);
hold all
set(gca, 'XTick', 1:length(label(1:x)), 'XTickLabel', label(1:x));
errorbar(meanAmp,errAmp,'k.')
ylabel('Amplitude (AU)')
title('Amplitude')

subplot(2,2,2)
meanK = nanmean(zeroK(1:x,:),2);
errK = nanstd(zeroK(1:x,:),0,2);
bar(meanK);
hold all
set(gca, 'XTick', 1:length(label(1:x)), 'XTickLabel', label(1:x));
errorbar(meanK,errK,'k.')
title('Time constant')
ylabel('Time constant (1/hr)')
   
subplot(2,2,3)
meanT = nanmean(zeroT(1:x,:),2);
errT = nanstd(zeroLag(1:x,:),0,2);
bar(meanT);
hold all
set(gca, 'XTick', 1:length(label(1:x)), 'XTickLabel', label(1:x));
errorbar(meanT,errT,'k.')
ylabel('Half-time (hr)')
title('Half-time')
  
subplot(2,2,4)
meanlag = nanmean(zeroLag(1:x,:),2);
errlag = nanstd(zeroLag(1:x,:),0,2);
bar(meanlag);
hold all
set(gca, 'XTick', 1:length(label(1:x)), 'XTickLabel', label(1:x));
errorbar(meanlag,errlag,'k.')
ylabel('Lag time (hr)')
title('Lag time')

clear x

%% save results

path = '/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/Data/FG124 aggregation timecourses/';

z = struct();

z.meanBufferK = meanBufferK;
z.zeroK = zeroK;
z.meanBufferT = meanBufferT;
z.zeroT = zeroT;
z.meanBufferLag = meanBufferLag;
z.zeroLag = zeroLag;
z.meanBufferA = meanBufferA;
z.zeroA = zeroA;

z.label = label;


fullpath = [path day name];
save(fullpath, 'z');

