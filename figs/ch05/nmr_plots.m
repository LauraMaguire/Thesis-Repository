
%name = 'No crowder';
name = 'PVP';

%%
d = open(['/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/'...
    'Data/FSFG crowders/PVP.xlsx']);

%%
aa = d.data(:,1);
r1 = d.data(:,5);
r1err = d.data(:,7);

r2 = d.data(:,12);
r2err = d.data(:,14);

%% Figure out where FSFG's are in amino acid list
phe = [12 14 31 33 50 52 69 71 88 90 107 109]; % amino acid numbers of Phe
indPhe = [];
for i=1:length(phe)
    indPhe = [indPhe find(aa==phe(i))]; % tie Phe residues to index of aa list
end
indGly = indPhe(2:2:end)+1;
indSer = indGly-2;

%%
figure
hold on
errorbar(aa,r1,r1err,'o')
plot(aa(indPhe),r1(indPhe),'ro')
plot(aa(indGly),r1(indGly),'ko')
plot(aa(indSer),r1(indSer),'go')
hold off

xlabel('Amino acid');
ylabel('R1')
title(name);

figure
hold on
errorbar(aa,r2,r2err,'o')
plot(aa(indPhe),r2(indPhe),'ro')
plot(aa(indGly),r2(indGly),'ko')
plot(aa(indSer),r2(indSer),'go')
hold off

xlabel('Amino acid');
ylabel('R2')
title(name);

figure
hold on
errorbar(aa,r2./r1,(r2./r1).*sqrt((r1err./r1).^2+(r2err./r2).^2),'o')
plot(aa(indPhe),r2(indPhe)./r1(indPhe),'ro')
plot(aa(indGly),r2(indGly)./r1(indGly),'ko')
plot(aa(indSer),r2(indSer)./r1(indSer),'go')
hold off

xlabel('Amino acid');
ylabel('R2/R1')
title(name);

%% Averaging across repeated regions
repeatR1 = zeros(5,19);
repeatR2 = zeros(5,19);

%phe = [12 14 31 33 50 52 69 71 88 90 107 109]; % amino acid numbers of Phe

for i=1:5
    repeatR1(i,:) = r1((9+(i-1)*19)+strcmp(name,'No crowder'):(8+i*19)+strcmp(name,'No crowder'));
    repeatR2(i,:) = r2((9+(i-1)*19):(8+i*19));
end

r1Avg = nanmean(repeatR1);
r2Avg = nanmean(repeatR2);
r1AvgErr = nanstd(repeatR1)/sqrt(5);
r2AvgErr = nanstd(repeatR2)/sqrt(5);

%% 
figure
hold on
errorbar(r1Avg,r1AvgErr,'o')
plot(r1Avg(1:3),'ro')
plot(4,r1Avg(4),'ko')
plot(2,r1Avg(2),'go')
hold off

xlabel('Amino acid');
ylabel('R1')
title(name);

figure
hold on
errorbar(r2Avg,r2AvgErr,'o')
plot(r2Avg(1:3),'ro')
plot(4,r2Avg(4),'ko')
plot(2,r2Avg(2),'go')
hold off

xlabel('Amino acid');
ylabel('R2')
title(name);

figure
hold on
errorbar(r2Avg./r1Avg,(r2Avg./r1Avg).*sqrt((r1AvgErr./r1Avg).^2+(r2AvgErr./r2Avg).^2),'o')
plot(r2Avg(1:3)./r1Avg(1:3),'ro')
plot(4,r2Avg(4)./r1Avg(4),'ko')
plot(2,r2Avg(2)./r1Avg(2),'go')
hold off

xlabel('Amino acid');
ylabel('R2/R1')
title(name);
%%
fsfg = load('/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/Data/FSFG crowders/FSFG.mat');
peg = load('/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/Data/FSFG crowders/PEG.mat');
pvp = load('/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/Data/FSFG crowders/PVP.mat');
%%
figure
hold on
errorbar(fsfg.r1Avg,fsfg.r1AvgErr,'o')
errorbar(peg.r1Avg,peg.r1AvgErr,'o')
errorbar(pvp.r1Avg,pvp.r1AvgErr,'o')
hold off
xlabel('Amino acid');
ylabel('R1')
%title(name);
legend({'No crowder','PEG','PVP'});

figure
hold on
errorbar(fsfg.r2Avg,fsfg.r2AvgErr,'o')
errorbar(peg.r2Avg,peg.r2AvgErr,'o')
errorbar(pvp.r2Avg,pvp.r2AvgErr,'o')
hold off
xlabel('Amino acid');
ylabel('R2')
%title(name);
legend({'No crowder','PEG','PVP'});

figure
hold on
errorbar(fsfg.r2Avg./fsfg.r1Avg,(fsfg.r2Avg./fsfg.r1Avg).*...
    sqrt((fsfg.r1AvgErr./fsfg.r1Avg).^2+(fsfg.r2AvgErr./fsfg.r2Avg).^2),'o')
errorbar(peg.r2Avg./peg.r1Avg,(peg.r2Avg./peg.r1Avg).*...
    sqrt((peg.r1AvgErr./peg.r1Avg).^2+(peg.r2AvgErr./peg.r2Avg).^2),'o')
errorbar(pvp.r2Avg./pvp.r1Avg,(pvp.r2Avg./pvp.r1Avg).*...
    sqrt((pvp.r1AvgErr./pvp.r1Avg).^2+(pvp.r2AvgErr./pvp.r2Avg).^2),'o')
hold off
xlabel('Amino acid');
ylabel('R2/R1')
%title(name);
legend({'No crowder','PEG','PVP'});
