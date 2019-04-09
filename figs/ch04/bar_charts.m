
%% Bound fraction bar chart
figure(1)
hold on
hb = bar([-0.04,0.72, .82]);
errorbar(1:3,[-0.04,0.72, .82],[0.04,0.04,0.02],'k.')
hold off
 set(hb(1), 'FaceColor','r')
%  set(hb(2), 'FaceColor','b')
% set(hb(3), 'FaceColor','g')
axis([0 4 -0.05 1])
xticklabels({'','No FSFG-K','FSFG-K-1','FSFG-K-2',''})
title('Bound fraction');
%% Effective diffusion coefficients
figure(1)
hold on
% hb = bar(vertcat([58.79	44.10],[12.72 29.84],[11.45	36.12]));
% errorbar(0.5*(1:6),[58.79 44.10 12.72 29.84 11.45 36.12],[4.86 3.88 3.00 3.66 4.16 4.87],'k.')
hb = bar(vertcat([38.69	29.51],[9.03 21.85],[6.47 25.68]));
errorbar(0.5*(1:6),[38.69 29.51 9.03 21.85 6.47	25.68],[2.41 2.17 1.97	2.65 1.01 3.85],'k.')
hold off
 set(hb(1), 'FaceColor','r')
  set(hb(2), 'FaceColor','b')
% set(hb(3), 'FaceColor','g')
 axis([0 4 0 45])
xticklabels({'','No FSFG-K','FSFG-K-1','FSFG-K-2',''})
title('Observed diffusion constant ($\mu$m/s$^2$)');
legend({'Transport factor','Inert protein'});
%% Bound diffusion bar chart
figure(1)
hold on
% hb = bar([0.71,-1.42]);
% errorbar(1:2,[0.71,-1.42],[1.4,1.56],'k.')
hb = bar([1.97,0.47]);
errorbar(1:2,[1.97,0.47],[0.82,1.00],'k.')
hold off
 set(hb(1), 'FaceColor','r')
%  set(hb(2), 'FaceColor','b')
% set(hb(3), 'FaceColor','g')
axis([0 3 -1 3])
xticklabels({'','','FSFG-K-1','','FSFG-K-2',''})
title('Bound diffusion constant ($\mu$m/s$^2$)');