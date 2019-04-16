
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

%%
phe = [12 14 31 33 50 52 69 71 88 90 107 109];
indPhe = [];
for i=1:length(phe)
    indPhe = [indPhe find(aa==phe(i))];
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

%%
name = 'no crowder';

%%
d2 = open('/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/Data/FSFG crowders/FSFG-T2-excel.xlsx');
d1 = open('/Users/lauramaguire/Google Drive/Hough Lab/Nuclear Pore Team/Data/FSFG crowders/FSFG-T1-excel.xlsx');

%%
aa2 = d2.data(:,5);
r2 = d2.data(:,12);
r1err = d2.data(:,14);

aa1 = d1.data(:,5);
r1 = d1.data(:,12);
r2err = d1.data(:,14);

%%
phe = [12 14 31 33 50 52 69 71 88 90 107 109];
indPhe = [];
for i=1:length(phe)
    indPhe = [indPhe find(aa2==phe(i))];
end
indGly = indPhe(2:2:end)+1;
indSer = indGly-2;

indPhe1 = [];
for i=1:length(phe)
    indPhe1 = [indPhe1 find(aa1==phe(i))];
end
indGly1 = indPhe1(2:2:end)+1;
indSer1 = indGly1-2;

%%



%%
figure
hold on
errorbar(aa2,r2,r1err,'o')
plot(aa2(indPhe),r2(indPhe),'ro')
plot(aa2(indGly),r2(indGly),'ko')
plot(aa2(indSer),r2(indSer),'go')
hold off

xlabel('Amino acid');
ylabel('R2')
title(name);

figure
hold on
errorbar(aa1,r1,r2err,'o')
plot(aa1(indPhe1),r1(indPhe1),'ro')
plot(aa1(indGly1),r1(indGly1),'ko')
plot(aa1(indSer1),r1(indSer1),'go')
hold off

xlabel('Amino acid');
ylabel('R1')
title(name);

figure
hold on
plot(aa2,r2./r1(2:end),'o')
plot(aa1(indPhe),r2(indPhe)./r1(indPhe1),'ro')
plot(aa1(indGly),r2(indGly)./r1(indGly1),'ko')
plot(aa1(indSer),r2(indSer)./r1(indSer1),'go')
hold off

xlabel('Amino acid');
ylabel('R2/R1')
title(name);



