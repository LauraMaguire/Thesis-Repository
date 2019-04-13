experiment = zeros(1,100);
for j =1:6
for i=1:100
    experiment(j,i) = data(j,1,i);
end
end
fit = 1+A(1,1)./(1+exp(-k(1,1).*(time-T(1,1))));

plot(time, experiment, 'bo');
hold all
plot(time, fit, 'r-');
xlabel('Time (hr)');
ylabel('Normalized intensity');
title('Intensity vs. time');
legend('Data','Fit')

%%
% j27 = load('C:\Users\bit\Desktop\sophie\time course fits\170127\170127_workspacefinal.mat');
% f19 = load('C:\Users\bit\Desktop\sophie\time course fits\170219\170219_workspace_final.mat');
% f21 = load('C:\Users\bit\Desktop\sophie\time course fits\170221\170221_workspace_final.mat');
% f28 = load('C:\Users\bit\Desktop\sophie\time course fits\170228\170228_workspace_final.mat');
% m07 = load('C:\Users\bit\Desktop\sophie\time course fits\170307\170307_workspace_final.mat');

%%
j27 = load('/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/Data/sophies fit/time course fits/170127/170127_workspace.mat');
f19 = load('/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/Data/sophies fit/time course fits/170219/170219_workspace.mat');
f21 = load('/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/Data/sophies fit/time course fits/170221/170221_workspace.mat');
f28 = load('/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/Data/sophies fit/time course fits/170228/170228_workspace2.mat');
m07 = load('/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/Data/sophies fit/time course fits/170307/170307_workspace.mat');

%%

allAmp = zeros(5,5);

for j=1:5
    allAmp(1,j) = j27.meanAmp(j);
    allAmp(2,j) = f19.meanAmp(j);
    allAmp(3,j) = f21.meanAmp(j);
    allAmp(4,j) = f28.meanAmp(j);
    allAmp(5,j) = m07.meanAmp(j);
    
    errAmp(1,j) = j27.errAmp(j);
    errAmp(2,j) = f19.errAmp(j);
    errAmp(3,j) = f21.errAmp(j);
    errAmp(4,j) = f28.errAmp(j);
    errAmp(5,j) = m07.errAmp(j);
end

%%
Amplitude = [j27.A f19.A f21.A f28.A m07.A];
meanA = mean(Amplitude,2,'omitnan');
errA = std(Amplitude,0,2,'omitnan');%/sqrt(30);

k = [j27.k f19.k f21.k f28.k m07.k];
meanK = mean(k,2,'omitnan');
errK = std(k,0,2,'omitnan');%/sqrt(30);

T = [j27.T f19.T f21.T f28.T m07.T];
meanT = mean(T,2,'omitnan');
errT = std(T,0,2,'omitnan');%/sqrt(30);

lag = T - 2./k;
meanlag = mean(lag,2,'omitnan');
errlag = std(lag,0,2,'omitnan');%/sqrt(30);

%%
   close all
   figure
   bar(meanA(1:5));
   hold all
   Labels = {'PEG', 'PVP', 'Serine', 'Buffer', 'Lysate'};
   set(gca, 'XTick', 1:5, 'XTickLabel', Labels);
   errorbar(meanA(1:5),errA(1:5),'k.')
   ylabel('Amplitude (AU)')
   title('Amplitude')
   
   figure
   bar(meanK(1:5));
   hold all
   Labels = {'PEG', 'PVP', 'Serine', 'Buffer', 'Lysate'};
   set(gca, 'XTick', 1:5, 'XTickLabel', Labels);
   errorbar(meanK(1:5),errK(1:5),'k.')
   title('k')
   ylabel('k (1/hr)')
   
   figure
   bar(meanT(1:5));
   hold all
   Labels = {'PEG', 'PVP', 'Serine', 'Buffer', 'Lysate'};
   set(gca, 'XTick', 1:5, 'XTickLabel', Labels);
   errorbar(meanT(1:5),errT(1:5),'k.')
   ylabel('T (hr)')
   title('T')
  
   figure
   bar(meanlag(1:5));
   hold all
   Labels = {'PEG', 'PVP', 'Serine', 'Buffer', 'Lysate'};
   set(gca, 'XTick', 1:5, 'XTickLabel', Labels);
   errorbar(meanlag(1:5),errlag(1:5),'k.')
   
%%
A = zeros(1,5);
den = zeros(1,5);
errA = zeros(1,5);
for i=1:5
    for j=1:5
        A(i) = A(i) + allAmp(j,i)/errAmp(j,i)^2;
        den(i) = den(i) + 1/errAmp(j,i)^2;
        errA(i) = errA(i) + 1/errAmp(j,i)^2;
    end
    Amp(i) = A(i)/den(i);
    errA(i) = errA(i)^(-1/2);
end



%%
   close all
   bar(meanA(1:4));
   hold all
   Labels = {'PEG', 'PVP', 'Serine', 'Buffer', 'Lysate'};
   set(gca, 'XTick', 1:4, 'XTickLabel', Labels);
   errorbar(meanA(1:4),errA(1:4),'k.')

%%
   close all
   bar(meanAmp(1:4));
   hold all
   Labels = {'PEG', 'PVP', 'Serine', 'Buffer'};
   set(gca, 'XTick', 1:4, 'XTickLabel', Labels);
   errorbar(meanAmp(1:4),errAmp(1:4),'k.')
   
   %%
   close all
   bar(meanK(1:4));
   hold all
   Labels = {'PEG', 'PVP', 'Serine', 'Buffer'};
   set(gca, 'XTick', 1:4, 'XTickLabel', Labels);
   errorbar(meanK(1:4),errK(1:4),'k.')
   
%%
close all
bar(meanT(1:4));
hold all
Labels = {'PEG', 'PVP', 'Serine', 'Buffer'};
set(gca, 'XTick', 1:4, 'XTickLabel', Labels);
errorbar(meanT(1:4),errT(1:4),'k.')