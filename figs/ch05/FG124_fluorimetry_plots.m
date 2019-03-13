%% Script for producing plots from FG124 fluorimetry data

%% PEG and PVP absorbance as a function of wavelength
hold on
plot(lambda,abs_PTB_PEG5percent,'o','MarkerFaceColor', [0, 0.4470, 0.7410]);
plot(lambda,abs_PTB_PVP5percent,'o');
hold off
legend({'5% PEG in PTB', '5% PVP in PTB'});
title('Crowder absorbance');
xlabel('Wavelength (nm)');
ylabel('Absorbance');
str = 'Normalized by subtracting PTB absorbance.';
annotation('textbox','String',str);

%% Fresh and aggregated FG124 data in separate subplots
subplot(1,3,1)
hold on
plot(lambda,FG124_PTB_fresh-blank_PTB,'--','Color',[0, 0.4470, 0.7410]);
plot(lambda,FG124_PTB_agted-blank_PTB,'-','Color',[0, 0.4470, 0.7410]);
axis([270 350 0 7.5e5])
xlabel('Wavelength (nm)');
ylabel('Intensity (counts)');
legend({'340 $\mu$M fresh FG124','170 $\mu$M aggregated FG124'});
title('PTB only')
hold off
subplot(1,3,2)
hold on
plot(lambda,FG124_PEG_fresh-blank_PEG,'--','Color',[0.8500, 0.3250, 0.0980]);
plot(lambda,FG124_PEG_agted-blank_PEG,'-','Color',[0.8500, 0.3250, 0.0980]);
axis([270 350 0 7.5e5])
xlabel('Wavelength (nm)');
legend({'340 $\mu$M fresh FG124','340 $\mu$M aggregated FG124'});
title('5% PEG in PTB')
hold off
subplot(1,3,3)
hold on
plot(lambda,FG124_PVP_fresh-blank_PVP,'--','Color',[0.4940, 0.1840, 0.5560]);
plot(lambda,FG124_PVP_agted-blank_PVP,'-','Color',[0.4940, 0.1840, 0.5560]);
axis([270 350 0 7.5e5])
xlabel('Wavelength (nm)');
legend({'340 $\mu$M fresh FG124','340 $\mu$M aggregated FG124'});
title('5% PVP in PTB')
hold off

%% Fresh and aggregated FG124 data normalized and offset
hold on
plot(lambda,(FG124_PTB_fresh-blank_PTB)/max(FG124_PTB_fresh-blank_PTB),...
    '--','Color',[0, 0.4470, 0.7410]);
plot(lambda,(FG124_PTB_agted-blank_PTB)/max(FG124_PTB_agted-blank_PTB),...
    '-','Color',[0, 0.4470, 0.7410]);
plot(lambda,(FG124_PEG_fresh-blank_PEG)/max(FG124_PEG_fresh-blank_PEG)+1,...
    '--','Color',[0.8500, 0.3250, 0.0980]);
plot(lambda,(FG124_PEG_agted-blank_PEG)/max(FG124_PEG_agted-blank_PEG)+1,...
    '-','Color',[0.8500, 0.3250, 0.0980]);
plot(lambda,(FG124_PVP_fresh-blank_PVP)/max(FG124_PVP_fresh-blank_PVP)+2,...
    '--','Color',[0.4940, 0.1840, 0.5560]);
plot(lambda,(FG124_PVP_agted-blank_PVP)/max(FG124_PVP_agted-blank_PVP)+2,...
    '-','Color',[0.4940, 0.1840, 0.5560]);
axis([270 350 0 3.05])
xlabel('Wavelength (nm)');
ylabel('Normalized ntensity (a.u.)');
legend({'340 $\mu$M fresh FG124 in PTB','170 $\mu$M aggregated FG124 in PTB',...
    '340 $\mu$M fresh FG124 in 5\% PEG','340 $\mu$M aggregated FG124 in 5\% PEG',...
    '340 $\mu$M fresh FG124 in 5\% PVP','340 $\mu$M aggregated FG124 in 5\% PVP'},...
    'Location','eastoutside');

hold off

%% Make plot comparing Phe peak (from reference) to FSFG and FG124
hold on
plot(Phe_lambda,Phe_notMine/max(Phe_notMine));
plot(lambda,FSFG/max(FSFG));
plot(lambda(1:81),FG124_fresh/max(FG124_fresh));
plot(lambda(1:81),FG124_agted/max(FG124_agted));
axis([270 350 0 1.05])
xlabel('Wavelength (nm)');
ylabel('Normalized ntensity (a.u.)');
legend({'Phenylalanine (from ref.)','100 $\mu$M FSFG',...
    '340 $\mu$M fresh FG124','170 $\mu$M aggregated FG124'},...
    'Location','northeast');

hold off
