%% Create subsets of data that go nicely together
short = zeros(5,4,3);
dataShort = zeros(5,4,7,6);
ls = cell(1,5);

for i=1:3
    short(i,:,:) = param(i,:,:);
    dataShort(i,:,:,:) = data(i,:,:,:);
    ls{i} = conditions{i};
end

short(4,:,:) = param(6,:,:);
dataShort(4,:,:,:) = data(6,:,:,:);
ls{4} = conditions{6};
short(5,:,:) = param(10,:,:);
dataShort(5,:,:,:) = data(10,:,:,:);
ls{5} = conditions{10};

%%
pvp = zeros(5,4,3);
datapvp = zeros(5,4,7,6);
lv = cell(1,5);

for i=8:11
    pvp(i-7,:,:) = param(i,:,:);
    lv{i-7} = conditions{i};
    datapvp(i-7,:,:,:) = data(i,:,:,:);
end

pvp(5,:,:) = param(1,:,:);
lv{5} = conditions{1};
datapvp(5,:,:,:) = data(1,:,:,:);

%%
peg = zeros(5,4,3);
datapeg = zeros(5,4,7,6);
lp = cell(1,5);

for i=4:7
    peg(i-3,:,:) = param(i,:,:);
    lp{i-3} = conditions{i};
    datapeg(i-3,:,:,:) = data(i,:,:,:);
end

peg(5,:,:) = param(1,:,:);
lp{5} = conditions{1};
datapeg(5,:,:,:) = data(1,:,:,:);

%% Make bar charts of the averaged parameters

close all
figure
subplot(2,2,1)
bar(short(:,a,1));
hold all
set(gca, 'XTick', 1:length(ls), 'XTickLabel', ls);
errorbar(short(:,a,1),short(:,a,2),'r.')
ylabel('Amplitude (AU)')
title('Amplitude')

subplot(2,2,2)
bar(short(:,k,1));
hold all
set(gca, 'XTick', 1:length(ls), 'XTickLabel', ls);
errorbar(short(:,k,1),short(:,k,2),'r.')
title('Time constant')
ylabel('Time constant (1/hr)')

subplot(2,2,3)
bar(short(:,t,1));
hold all
set(gca, 'XTick', 1:length(ls), 'XTickLabel', ls);
errorbar(short(:,t,1),short(:,t,2),'r.')
ylabel('Half-time (hr)')
title('Half-time')
  
subplot(2,2,4)
bar(short(:,lg,1));
hold all
set(gca, 'XTick', 1:length(ls), 'XTickLabel', ls);
errorbar(short(:,lg,1),short(:,lg,2),'r.')
ylabel('Lag time (hr)')
title('Lag time')

%% Make bar charts of the averaged parameters

close all
figure
subplot(2,2,1)
bar(peg(:,a,1));
hold all
set(gca, 'XTick', 1:length(lp), 'XTickLabel', lp);
errorbar(peg(:,a,1),peg(:,a,2),'r.')
ylabel('Amplitude (AU)')
title('Amplitude')

subplot(2,2,2)
bar(peg(:,k,1));
hold all
set(gca, 'XTick', 1:length(lp), 'XTickLabel', lp);
errorbar(peg(:,k,1),peg(:,k,2),'r.')
title('Time constant')
ylabel('Time constant (1/hr)')

subplot(2,2,3)
bar(peg(:,t,1));
hold all
set(gca, 'XTick', 1:length(lp), 'XTickLabel', lp);
errorbar(peg(:,t,1),peg(:,t,2),'r.')
ylabel('Half-time (hr)')
title('Half-time')
  
subplot(2,2,4)
bar(peg(:,lg,1));
hold all
set(gca, 'XTick', 1:length(lp), 'XTickLabel', lp);
errorbar(peg(:,lg,1),peg(:,lg,2),'r.')
ylabel('Lag time (hr)')
title('Lag time')

%% Make bar charts of the averaged parameters

close all
figure
subplot(2,2,1)
bar(pvp(:,a,1));
hold all
set(gca, 'XTick', 1:length(lv), 'XTickLabel', lv);
errorbar(pvp(:,a,1),pvp(:,a,2),'r.')
ylabel('Amplitude (AU)')
title('Amplitude')

subplot(2,2,2)
bar(pvp(:,k,1));
hold all
set(gca, 'XTick', 1:length(lv), 'XTickLabel', lv);
errorbar(pvp(:,k,1),pvp(:,k,2),'r.')
title('Time constant')
ylabel('Time constant (1/hr)')

subplot(2,2,3)
bar(pvp(:,t,1));
hold all
set(gca, 'XTick', 1:length(lv), 'XTickLabel', lv);
errorbar(pvp(:,t,1),pvp(:,t,2),'r.')
ylabel('Half-time (hr)')
title('Half-time')
  
subplot(2,2,4)
bar(pvp(:,lg,1));
hold all
set(gca, 'XTick', 1:length(lv), 'XTickLabel', lv);
errorbar(pvp(:,lg,1),pvp(:,lg,2),'r.')
ylabel('Lag time (hr)')
title('Lag time')

%% Make bar charts of the averaged parameters

close all
figure
subplot(2,2,1)
bar(peg(:,k,1));
hold all
set(gca, 'XTick', 1:length(lp), 'XTickLabel', lp);
errorbar(peg(:,k,1),peg(:,k,2),'r.')
title('Time constant')
ylabel('Time constant (1/hr)')

subplot(2,2,2)
bar(peg(:,lg,1));
hold all
set(gca, 'XTick', 1:length(lp), 'XTickLabel', lp);
errorbar(peg(:,lg,1),peg(:,lg,2),'r.')
ylabel('Lag time (hr)')
title('Lag time')

subplot(2,2,3)
bar(pvp(:,k,1));
hold all
set(gca, 'XTick', 1:length(lv), 'XTickLabel', lv);
errorbar(pvp(:,k,1),pvp(:,k,2),'r.')
title('Time constant')
ylabel('Time constant (1/hr)')
  
subplot(2,2,4)
bar(pvp(:,lg,1));
hold all
set(gca, 'XTick', 1:length(lv), 'XTickLabel', lv);
errorbar(pvp(:,lg,1),pvp(:,lg,2),'r.')
ylabel('Lag time (hr)')
title('Lag time')

%% Make bar charts of the averaged parameters

close all

subplot(1,2,1)
bar(short(:,k,1));
hold all
set(gca, 'XTick', 1:length(ls), 'XTickLabel', ls);
errorbar(short(:,k,1),short(:,k,2),'r.')
title('Time constant')
ylabel('Time constant (1/hr)')

subplot(1,2,2)
bar(short(:,lg,1));
hold all
set(gca, 'XTick', 1:length(ls), 'XTickLabel', ls);
errorbar(short(:,lg,1),short(:,lg,2),'r.')
ylabel('Lag time (hr)')
title('Lag time')
