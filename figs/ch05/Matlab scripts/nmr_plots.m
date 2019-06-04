
%name = 'No crowder';
name = 'PEG';

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
fsfg.repeatR1 = zeros(5,19);
fsfg.repeatR2 = zeros(5,19);

%phe = [12 14 31 33 50 52 69 71 88 90 107 109]; % amino acid numbers of Phe

for i=1:5
    fsfg.repeatR1(i,:) = fsfg.r1((9+(i-1)*19)+strcmp(name,'No crowder'):(8+i*19)+strcmp(name,'No crowder'));
    fsfg.repeatR2(i,:) = fsfg.r2((9+(i-1)*19)+strcmp(name,'No crowder'):(8+i*19)+strcmp(name,'No crowder'));
end

fsfg.r1Avg = nanmean(fsfg.repeatR1);
fsfg.r2Avg = nanmean(fsfg.repeatR2);
fsfg.r1AvgErr = nanstd(fsfg.repeatR1)/sqrt(5);
fsfg.r2AvgErr = nanstd(fsfg.repeatR2)/sqrt(5);

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
%% RUN THIS ONE
figure
hold on
errorbar(fsfg.r1Avg,fsfg.r1AvgErr,'o')
errorbar(peg.r1Avg,peg.r1AvgErr,'o')
errorbar(pvp.r1Avg,pvp.r1AvgErr,'o')
hold off
xlabel('Amino acid');
ylabel('R_1 (s)')
%title(name);
legend({'No crowder','PEG','PVP'});
 axis square
 box on

figure
hold on
errorbar(fsfg.r2Avg,fsfg.r2AvgErr,'o')
errorbar(peg.r2Avg,peg.r2AvgErr,'o')
errorbar(pvp.r2Avg,pvp.r2AvgErr,'o')
hold off
xlabel('Amino acid');
ylabel('R_2 (s)')
%title(name);
legend({'No crowder','PEG','PVP'});
 axis square
 box on

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
ylabel('R_2/R_1')
%title(name);
legend({'No crowder','13% PEG','13% PVP'});
 axis square
 box on


%% Averaging across repeated regions
peg.repeatR1 = zeros(5,19);
peg.repeatR2 = zeros(5,19);

%phe = [12 14 31 33 50 52 69 71 88 90 107 109]; % amino acid numbers of Phe

for i=1:5
    peg.repeatR1(i,:) = peg.r1((9+(i-1)*19):(8+i*19));
    peg.repeatR2(i,:) = peg.r2((9+(i-1)*19):(8+i*19));
end

peg.r1Avg = nanmean(peg.repeatR1);
peg.r2Avg = nanmean(peg.repeatR2);
%% dealing with error
peg.repeatR1Err = zeros(5,19);
peg.repeatR2Err = zeros(5,19);

%phe = [12 14 31 33 50 52 69 71 88 90 107 109]; % amino acid numbers of Phe

for i=1:5
   peg.repeatR1Err(i,:) = peg.r1err((9+(i-1)*19)+strcmp(name,'No crowder'):(8+i*19)+strcmp(name,'No crowder'));
    peg.repeatR2Err(i,:) = peg.r2err((9+(i-1)*19)+strcmp(name,'No crowder'):(8+i*19)+strcmp(name,'No crowder'));
end

%% Averaging across repeated regions
pvp.repeatR1 = zeros(5,19);
pvp.repeatR2 = zeros(5,19);

%phe = [12 14 31 33 50 52 69 71 88 90 107 109]; % amino acid numbers of Phe

for i=1:5
    pvp.repeatR1(i,:) = pvp.r1((9+(i-1)*19):(8+i*19));
    pvp.repeatR2(i,:) = pvp.r2((9+(i-1)*19):(8+i*19));
end

pvp.r1Avg = nanmean(pvp.repeatR1);
pvp.r2Avg = nanmean(pvp.repeatR2);
%% dealing with error
pvp.repeatR1Err = zeros(5,19);
pvp.repeatR2Err = zeros(5,19);

%phe = [12 14 31 33 50 52 69 71 88 90 107 109]; % amino acid numbers of Phe

for i=1:5
   pvp.repeatR1Err(i,:) = pvp.r1err((9+(i-1)*19):(8+i*19));
    pvp.repeatR2Err(i,:) = pvp.r2err((9+(i-1)*19):(8+i*19));
end

%% Averaging across repeated regions
fsfg.repeatR1 = zeros(5,19);
fsfg.repeatR2 = zeros(5,19);

%phe = [12 14 31 33 50 52 69 71 88 90 107 109]; % amino acid numbers of Phe

for i=1:5
    fsfg.repeatR1(i,:) = fsfg.r1((9+(i-1)*19)+1:(8+i*19)+1);
    fsfg.repeatR2(i,:) = fsfg.r2((9+(i-1)*19)+1:(8+i*19)+1);
end

fsfg.r1Avg = nanmean(fsfg.repeatR1);
fsfg.r2Avg = nanmean(fsfg.repeatR2);
%% dealing with error
fsfg.repeatR1Err = zeros(5,19);
fsfg.repeatR2Err = zeros(5,19);

%phe = [12 14 31 33 50 52 69 71 88 90 107 109]; % amino acid numbers of Phe

for i=1:5
   fsfg.repeatR1Err(i,:) = fsfg.r1err((9+(i-1)*19)+1:(8+i*19)+1);
    fsfg.repeatR2Err(i,:) = fsfg.r2err((9+(i-1)*19)+1:(8+i*19)+1);
end


% r1Avg = nanmean(repeatR1);
% r2Avg = nanmean(repeatR2);
% r1AvgErr = nanstd(repeatR1)/sqrt(5);
% r2AvgErr = nanstd(repeatR2)/sqrt(5);

% fsfg.wR1 = 1./fsfg.repeatR1Err.^2;
% fsfg.wR2 = 1./fsfg.repeatR2Err.^2;
% 
% fsfg.r1AvgErr = 1./sqrt(sum(fsfg.wR1));
% fsfg.r2AvgErr = 1./sqrt(sum(fsfg.wR2));
% 
% fsfg.r1AvgErr(1) = 1/sqrt(1/fsfg.repeatR1Err(1,1)^2 + 1/fsfg.repeatR1Err(1,2)^2);
% fsfg.r2AvgErr(1) = 1/sqrt(1/fsfg.repeatR2Err(1,1)^2 + 1/fsfg.repeatR2Err(1,2)^2);
% 
% fsfg.r1AvgErr([2:4,19]) = fsfg.repeatR1Err(1,[2:4,19]);
% fsfg.r2AvgErr([2:4,19]) = fsfg.repeatR2Err(1,[2:4,19]);
% 
% 1/sqrt(1/0.09429^2+1/0.07737^2)
%%
test = nan(5,19);
for j=1:19
    t = unique(fsfg.repeatR1Err(:,j));
    test(1:length(t),j)=t;
    w = 1./test.^2;
    fsfg.r1AvgErr = 1./sqrt(nansum(w));
end

%%
peg.tc=(1./(4.*pi*60834000)).*sqrt(6.*(peg.r2Avg./peg.r1Avg)-7);%nu_N in Hz from Kathryn
pvp.tc=(1./(4.*pi*60834000)).*sqrt(6.*(pvp.r2Avg./pvp.r1Avg)-7);%nu_N in Hz from Kathryn
fsfg.tc=(1./(4.*pi*60834000)).*sqrt(6.*(fsfg.r2Avg./fsfg.r1Avg)-7);%nu_N in Hz from Kathryn



