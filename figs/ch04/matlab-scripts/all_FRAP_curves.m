


interpG = zeros(100,80);
interpR = zeros(100,80);
subplot(1,3,1)
for i=indexCtrl(3:end)
    t = data{i}.time(2:end)/60;
    g = data{i}.norm(1,2:end)/data{i}.norm(1,1);
    r = data{i}.norm(2,2:end)/data{i}.norm(2,1);
    p1=plot(t,g,'color',[120/255 250/255 182/255]);
    interpG(i,:) = interp1(t,g,0.5*(1:80));
    interpR(i,:) = interp1(t,r,0.5*(1:80));
    p2=plot(t,r,'color',[230/255 150/255 150/255]);
    hold on
end
avgG = sum(interpG,1)/length(indexCtrl(3:end));
avgR = sum(interpR,1)/length(indexCtrl(3:end));
plot(0.5*(1:80),avgG,'color',[45/255 210/255 132/255],'LineWidth',5)
plot(0.5*(1:80),avgR,'color',[155/255 45/255 45/255],'LineWidth',5)
axis([0 40 0.6 1.05])
yticks([0.6 0.7 0.8 0.9 1.0])
hold off

interpG = zeros(100,80);
interpR = zeros(100,80);
subplot(1,3,2)
for i=indexCct1(3:end)
    t = data{i}.time(2:end)/60;
    g = data{i}.norm(1,2:end)/data{i}.norm(1,1);
    r = data{i}.norm(2,2:end)/data{i}.norm(2,1);
    p1=plot(t,g,'color',[120/255 250/255 182/255]);
    interpG(i,:) = interp1(t,g,0.5*(1:80));
    interpR(i,:) = interp1(t,r,0.5*(1:80));
    p2=plot(t,r,'color',[230/255 150/255 150/255]);
    hold on
end
avgG = sum(interpG,1)/length(indexCct1(3:end));
avgR = sum(interpR,1)/length(indexCct1(3:end));
plot(0.5*(1:80),avgG,'color',[45/255 210/255 132/255],'LineWidth',5)
plot(0.5*(1:80),avgR,'color',[155/255 45/255 45/255],'LineWidth',5)
axis([0 40 0.6 1.05])
yticks([0.6 0.7 0.8 0.9 1.0])
hold off

interpG = zeros(100,80);
interpR = zeros(100,80);
subplot(1,3,3)
for i=indexCct2(2:end)
    t = data{i}.time(2:end)/60;
    g = data{i}.norm(1,2:end)/data{i}.norm(1,1);
    r = data{i}.norm(2,2:end)/data{i}.norm(2,1);
    p1=plot(t,g,'color',[120/255 250/255 182/255]);
    interpG(i,:) = interp1(t,g,0.5*(1:80));
    interpR(i,:) = interp1(t,r,0.5*(1:80));
    p2=plot(t,r,'color',[230/255 150/255 150/255]);
    hold on
end
avgG = sum(interpG,1)/length(indexCct2(2:end));
avgR = sum(interpR,1)/length(indexCct2(2:end));
plot(0.5*(1:80),avgG,'color',[45/255 210/255 132/255],'LineWidth',5)
plot(0.5*(1:80),avgR,'color',[155/255 45/255 45/255],'LineWidth',5)
axis([0 40 0.6 1.05])
yticks([0.6 0.7 0.8 0.9 1.0])
hold off