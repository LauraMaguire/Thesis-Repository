
%% Bound fraction bar chart
figure(1)
hold on
hb = bar([-0.04,0.72, 0.79]);
errorbar(1:3,[-0.04,0.72, 0.79],[0.04,0.04,0.02],'k.')
hold off
 set(hb(1), 'FaceColor','r')
%  set(hb(2), 'FaceColor','b')
% set(hb(3), 'FaceColor','g')
axis([0 4 -0.05 1])
xticklabels({'','No FSFG','FSFG concat-1','FSFG concat-2',''})
title('Bound fraction');
%% Effective diffusion coefficients
figure(1)
hold on
% hb = bar(vertcat([58.79	44.10],[12.72 29.84],[11.45	36.12]));
% errorbar(0.5*(1:6),[58.79 44.10 12.72 29.84 11.45 36.12],[4.86 3.88 3.00 3.66 4.16 4.87],'k.')
hb = bar(vertcat([56.10	46.44],[15.23 34.71],[12.82	41.33]));
errorbar(0.5*(1:6),[56.10 46.44 15.23 34.71 12.82 41.33],[11.36 8.00 3.23 4.99 2.85	2.94],'k.')
hold off
 set(hb(1), 'FaceColor','r')
  set(hb(2), 'FaceColor','b')
% set(hb(3), 'FaceColor','g')
 axis([0 4 0 70])
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
%% Partition coefficients
figure(1)
hold on
% hb = bar(vertcat([58.79	44.10],[12.72 29.84],[11.45	36.12]));
% errorbar(0.5*(1:6),[58.79 44.10 12.72 29.84 11.45 36.12],[4.86 3.88 3.00 3.66 4.16 4.87],'k.')
hb = bar(vertcat([0.4776 0.4831],[1.80 0.47],[3.14 0.64]));
errorbar(0.5*(1:6),[0.4776 0.4831 1.80 0.47 3.14 0.64],[0.0307 0.0246 0.14 0.03 0.25 0.03],'k.')
hold off
 set(hb(1), 'FaceColor','r')
  set(hb(2), 'FaceColor','b')
% set(hb(3), 'FaceColor','g')
 axis([0 4 0 4])
xticklabels({'','No FSFG ','FSFG concat-1','FSFG concat-2',''})
title('Partition coefficient');
legend({'Transport factor','Inert protein'});