%% FG124 AGGREGATION CURVE FITTING
% This script fits the results of an FG124 aggregation timecourse to a
% sigmoid and plots the fit parameters.  It takes as input the raw Excel
% file produced by the plate reader.

% Full file path the the folder where all timecourses are stored
%basename = 'C:\Users\Laura\Google Drive\Hough Lab\Nuclear Pore Team\Data\FG124 aggregation timecourses\';
basename = '/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/Data/FG124 aggregation timecourses/';
% Date in 'yymmdd' format
% Date in 'yymmdd' format
date = '170126';
% Import the data
num = xlsread([basename date '/' date '_TimeCourse.xlsx']);

%% Shape the data into an array
% D1 = # rows on the plate (always 8)
% D2 = # columns on the plate (always 12)
% D3 = # time points taken (calculated automatically from plate reader save
%      format)
timePoints = (size(num,1) - 20)/12;
%rawData = zeros(8,12,timePoints);
rawData = zeros(8,12,100);
for t=1:100
    rawData(:,:,t) = num(12*t+13:12*t+20,:);
end
clear t num

%% Indicate which wells correspond to which conditions

% List conditions in order (final two should be buffer and GuHCl):
label = {'19% Serine' '13% PVP' '13% PEG' 'Buffer' 'GuHCl'};

%List the number of replicates for each condition:
reps = [6 6 5 6 1];

% Create a time axis based (update each time):
timePoints = floor(timePoints);
t=1:timePoints;
time = 10*(t-1)/60+1;
clear t

% Create an array which will organize data
% D1 = # of conditions
% D2 = maximum # of reps (conditions with fewer reps will be filled in with
%      NaN)
% D3 = # of time points
data = nan(length(label),max(reps),timePoints);

% Create an array to hold the blank data
% D1 = # of conditions
% D2 = # of time points
blanks = zeros(length(label),timePoints);

% Fill in data (will need to be modified each time based on well map):
blanks(1,:) = rawData(1,8,:);
blanks(2,:) = rawData(3,8,:);
blanks(3,:) = rawData(4,8,:);
blanks(4,:) = rawData(2,8,:);
blanks(5,:) = rawData(5,8,:);

data(1,:,:) = rawData(1,1:6,:);
data(2,:,:) = rawData(3,1:6,:);
data(3,1:5,:) = rawData(4,1:5,:);
data(4,:,:) = rawData(2,1:6,:);
data(5,1,:) = rawData(5,1,:);

clear rawData

%% Plot the data before fitting to see what it looks like
close all
for con=1:length(label)
    figure
    title(label(con))
    xlabel('Time (hr)')
    ylabel('Intensity')
    hold all
    for rep=1:reps(con)
        plot(time,squeeze(data(con,rep,:)),'o');
    end
    plot(time,blanks(con,:),'k-');
end
clear con rep

%% Initialize arrays for the fit parameters and goodness-of-fit
A = nan(size(data,1),size(data,2));
T = nan(size(data,1),size(data,2));
k = nan(size(data,1),size(data,2));
C = nan(size(data,1),size(data,2));
GOF = nan(size(data,1),size(data,2),5);
%% Fit all replicates and display the fit
close all
for i=1:size(data,1) % number of conditions
    for j=1:reps(i) % number of reps
        norm = squeeze(data(i,j,:))/mean(blanks(i,:));
        %norm = squeeze(data(i,j,1:end))./smooth(blanks(i,1:end));
        [fitresult, gof] = sigmoidFit(time(1:end), norm.');
        title([label(i) ' Rep ' num2str(j)])
        A(i,j) = fitresult.A;
        T(i,j) = fitresult.T;
        k(i,j) = fitresult.k;
        C(i,j) = fitresult.C;
        GOF(i,j,1) = gof.sse;
        GOF(i,j,2) = gof.rsquare;
        GOF(i,j,3) = gof.dfe;
        GOF(i,j,4) = gof.adjrsquare;
        GOF(i,j,5) = gof.rmse;
    end
end
clear fitresult gof i j norm

%% Calculate lag time
L = nan(length(label),max(reps));
for i=1:length(label) % number of conditions
    for j=1:reps(i) % number of reps
        L(i,j) = T(i,j) - 2/k(i,j);
    end
end
clear i j

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
meanAmp = nanmean(A(1:x,:),2);
errAmp = nanstd(A(1:x,:),0,2);
bar(meanAmp);
hold all
set(gca, 'XTick', 1:length(label(1:x)), 'XTickLabel', label(1:x));
errorbar(meanAmp,errAmp,'k.')
ylabel('Amplitude (AU)')
title('Amplitude')

subplot(2,2,2)
meanK = nanmean(k(1:x,:),2);
errK = nanstd(k(1:x,:),0,2);
bar(meanK);
hold all
set(gca, 'XTick', 1:length(label(1:x)), 'XTickLabel', label(1:x));
errorbar(meanK,errK,'k.')
title('Time constant')
ylabel('Time constant (1/hr)')
   
subplot(2,2,3)
meanT = nanmean(T(1:x,:),2);
errT = nanstd(T(1:x,:),0,2);
bar(meanT);
hold all
set(gca, 'XTick', 1:length(label(1:x)), 'XTickLabel', label(1:x));
errorbar(meanT,errT,'k.')
ylabel('Half-time (hr)')
title('Half-time')
  
subplot(2,2,4)
meanlag = nanmean(L(1:x,:),2);
errlag = nanstd(L(1:x,:),0,2);
bar(meanlag);
hold all
set(gca, 'XTick', 1:length(label(1:x)), 'XTickLabel', label(1:x));
errorbar(meanlag,errlag,'k.')
ylabel('Lag time (hr)')
title('Lag time')

clear x

%% Save workspace

save([basename date '\' date '_fits.mat']);