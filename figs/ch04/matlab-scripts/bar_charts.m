
%% Bound fraction bar chart
figure(1)
hold on
hb = bar([-0.03,0.72, 0.79]);
errorbar(1:3,[-0.03,0.72, 0.79],[0.04,0.04,0.02],'k.')
hold off
 set(hb(1), 'FaceColor','r')
%  set(hb(2), 'FaceColor','b')
% set(hb(3), 'FaceColor','g')
axis([0 4 -0.1 1])
yticks([0 0.2 0.4 0.6 0.8 1])
xticklabels({'','No FSFG','FSFG concat-1','FSFG concat-2',''})
title('Bound fraction');
%% Effective diffusion coefficients
figure(1)
hold on
% hb = bar(vertcat([58.79	44.10],[12.72 29.84],[11.45	36.12]));
% errorbar(0.5*(1:6),[58.79 44.10 12.72 29.84 11.45 36.12],[4.86 3.88 3.00 3.66 4.16 4.87],'k.')
% hb = bar(vertcat([56.10	46.44],[15.23 34.71],[12.82	41.33]));
% errorbar(0.5*(1:6),[56.10 46.44 15.23 34.71 12.82 41.33],[11.36 8.00 3.23 4.99 2.85	2.94],'k.')
hb = bar(vertcat([47.44	40.74],[15.23 34.71],[12.82	41.33]));
errorbar(0.5*(1:6),[47.44 40.74 15.23 34.71 12.82 41.33],[7.53 5.82 3.23 4.99 2.85	2.94],'k.')
hold off
 set(hb(1), 'FaceColor','r')
  set(hb(2), 'FaceColor','b')
% set(hb(3), 'FaceColor','g')
 axis([0 4 0 60])
xticklabels({'','No FSFG','FSFG concat-1','FSFG concat-2',''})
title('Observed diffusion constant ($\mu$m/s$^2$)');
legend({'Transport factor','Inert protein'});
%% Bound diffusion bar chart
figure(1)
hold on
% hb = bar([0.71,-1.42]);
% errorbar(1:2,[0.71,-1.42],[1.4,1.56],'k.')
hb = bar([5.62,5.22]);
errorbar(1:2,[5.62,5.22],[2.27,3.20],'k.')
hold off
 set(hb(1), 'FaceColor','r')
%  set(hb(2), 'FaceColor','b')
% set(hb(3), 'FaceColor','g')
axis([0 3 0 10])
xticklabels({'','','FSFG concat-1','','FSFG concat-2',''})
title('Bound diffusion constant ($\mu$m/s$^2$)');

%% Bound diffusion with predictions
figure(1)
hold on
% hb = bar([0.71,-1.42]);
% errorbar(1:2,[0.71,-1.42],[1.4,1.56],'k.')
% hb = bar([5.62,5.22]);
% errorbar(1:2,[5.62,5.22],[2.27,3.20],'k.')
% hb = bar(vertcat([6.9 5.62],[9.3 5.22]));
% errorbar(0.5*(1:4),[6.9 5.62 9.3 5.22],[0.3 2.27 0.3 3.20],'k.')
hb = bar(vertcat([4.25 5.62],[6.0 5.22]));
errorbar(0.5*(1:4),[4.25 5.62 6.0 5.22],[1 2.27 0.9 3.20],'k.')
axis([0 3 0 10])

hold off
 set(hb(1), 'FaceColor','r')
%  set(hb(2), 'FaceColor','b')
% set(hb(3), 'FaceColor','g')
%axis([0 3 0 10])
xticklabels({'','','FSFG concat-1','','FSFG concat-2',''})
title('Bound diffusion constant ($\mu$m/s$^2$)');
legend({'Model prediction','Experiment'});

%% Partition coefficients
figure(1)
hold on
% hb = bar(vertcat([58.79	44.10],[12.72 29.84],[11.45	36.12]));
% errorbar(0.5*(1:6),[58.79 44.10 12.72 29.84 11.45 36.12],[4.86 3.88 3.00 3.66 4.16 4.87],'k.')
hb = bar(vertcat([0.47 0.47],[1.80 0.47],[3.14 0.64]));
errorbar(0.5*(1:6),[0.47 0.47 1.80 0.47 3.14 0.64],[0.03 0.02 0.14 0.03 0.25 0.03],'k.')
hold off
 set(hb(1), 'FaceColor','r')
  set(hb(2), 'FaceColor','b')
% set(hb(3), 'FaceColor','g')
 axis([0 4 0 4])
xticklabels({'','No FSFG ','FSFG concat-1','FSFG concat-2',''})
title('Partition coefficient');
legend({'Transport factor','Inert protein'});

%% Bound diffusion with predictions, upper and lower bounds
figure(1)
hold on

hb = bar(vertcat([0.40 4.25 5.62],[0.59 5.18 5.22]));
errorbar(0.5*(1:6),[0.40 4.25 5.62 0.59 5.18 5.22],[0.1 1 2.27 0.06 0.5 3.20],'k.')
axis([0 3 0 10])

hold off
 set(hb(1), 'FaceColor','r')
%  set(hb(2), 'FaceColor','b')
% set(hb(3), 'FaceColor','g')
%axis([0 3 0 10])
xticklabels({'','','FSFG concat-1','','FSFG concat-2',''})
title('Bound diffusion constant ($\mu$m/s$^2$)');
legend({'Model prediction','Experiment'});
%% Plot of tethered diffusion prediction DB vs KD
kd = logspace(1, 3); % in uM
kon = 1e9*1e-6; %in uM^-1 s^-1;
lp = 1e-3; % in um

% plot cct1 values
DF = 35; % in um^2/s
Lc = 50e-3; % in um
DB = DF./(1+3.*DF./(Lc.*lp.*kon.*kd));
semilogx(kd, DB)

% plot cct2 values
DF = 41; % in um^2/s
Lc = 100e-3; % in um
DB = DF./(1+3.*DF./(Lc.*lp.*kon.*kd));
hold on
semilogx(kd, DB)
hold off

% cct1 KD lower bound
line([24 24], [0 20]);
% cct1 KD upper bound
line([300 300], [0 20]);
% cct2 KD lower bound
line([18 18], [0 20]);
% cct2 KD upper bound
line([180 180], [0 20]);

% Hayama 18 data
%FSFG6 (NMR)0.56 ± 0.01 (ITC)0.53 ± 0.07 mM
%FSFG12 (NMR)0.37 ± 0.01 (ITC)0.42 ± 0.03 mM
% combine as weighted averages?
% cct1 KD
line([560 560], [0 20]);
% cct2 KD
line([370 370], [0 20]);
%% Plot of tethered diffusion prediction DB vs KD, separate subplots
kd = logspace(1, 3); % in uM
kon = 1e9*1e-6; %in uM^-1 s^-1;
lp = 1e-3; % in um

% plot cct1 values
DF = 35; % in um^2/s
Lc = 50e-3; % in um
DB = DF./(1+3.*DF./(Lc.*lp.*kon.*kd));
subplot(2,1,1)
semilogx(kd, DB)
% cct1 KD lower bound
line([24 24], [0 20]);
% cct1 KD upper bound
line([300 300], [0 20]);
% cct1 KD
line([560 560], [0 20]);
ylabel('D_B (\mum^2/s)');
% cct1 DB
line([10 1000], [5.62 5.62]);
% cct1 DB upper error bar
line([10 1000], [5.62+2.27 5.62+2.27]);
% cct1 DB lower error bar
line([10 1000], [5.62-2.27 5.62-2.27]);

% plot cct2 values
DF = 41; % in um^2/s
Lc = 100e-3; % in um
DB = DF./(1+3.*DF./(Lc.*lp.*kon.*kd));
subplot(2,1,2)
semilogx(kd, DB)
% cct2 KD lower bound
line([18 18], [0 20]);
% cct2 KD upper bound
line([180 180], [0 20]);
% cct2 KD
line([370 370], [0 20]);
% cct2 DB
line([10 1000], [5.22 5.22]);
% cct2 DB upper error
line([10 1000], [5.22+3.20 5.22+3.20]);
% cct2 DB lower error
line([10 1000], [5.22-3.20 5.22-3.20]);
xlabel('Dissociation constant K_D (\muM)');
ylabel('D_B (\mum^2/s)');


% Hayama 18 data
%FSFG6 (NMR)0.56 ± 0.01 (ITC)0.53 ± 0.07 mM
%FSFG12 (NMR)0.37 ± 0.01 (ITC)0.42 ± 0.03 mM
% combine as weighted averages?

