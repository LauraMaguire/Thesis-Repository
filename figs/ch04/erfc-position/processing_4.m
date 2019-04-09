%% Load experiment information
% Navigate to folder 'd-bound-calculation-dataset' on desktop before
% beginning.
Ntrials = 16; % total trials in dataset

info = cell(Ntrials,1); % create storage location for experiment information
plots = cell(Ntrials,1); % create storage location for experiment results
trialList = dir; % make a list of all files in current folder
for n=1:Ntrials % loop over all trials
    cd(trialList(n+3).name); % navigate to folder for a specific trial
    disp(['Opening trial ' trialList(n+3).name ' of ' num2str(Ntrials) '.']);
    infoStructure = load('info.mat'); % import the info
    info{n} = infoStructure.info;
    plotsStructure = load('plots.mat'); % import the plot data
    plots{n} = plotsStructure.plots;
    cd('..'); % go back up to the original directory
end
clear infoStructure plotsStructure n trialList currentList currentFolder

%% Prepare accumulation and profile data

acc = cell(2, Ntrials);
pro = cell(2, Ntrials);

time = cell(1,Ntrials); % set up storage for time axes
pos = cell(1, Ntrials); % set up storage for position axes

for n=1:Ntrials % loop over all trials
    
    time{n} = plots{n}.timeAx;
    pos{n} = plots{n}.posAx;
    
    currentGrnAcc = plots{n}.accumulation(1,:); % name some things for clarity
    currentRedAcc = plots{n}.accumulation(2,:);
    currentGrnRes = plots{n}.reservoir(1,:);
    currentRedRes = plots{n}.reservoir(2,:);
    
%     pro{1,n} = plots{n}.grnProfile;
%     pro{2,n} = plots{n}.redProfile;
    pro{1,n} = zeros(length(time{n}),length(pos{n}));
    pro{2,n} = zeros(length(time{n}),length(pos{n}));
    for t = 1:length(time{n})
        pro{1,n}(t,:) = plots{n}.grnProfile(t,:)./plots{n}.reservoir(1,t);
        pro{2,n}(t,:) = plots{n}.redProfile(t,:)./plots{n}.reservoir(2,t);
    end
    
    acc{1,n} = currentGrnAcc./currentGrnRes; % save the normalized accumulation
    acc{2,n} = currentRedAcc./currentRedRes;
end
disp('Finished storing profiles and normalized accumulation.');
clear n currentGrnAcc currentRedAcc currentGrnRes currentRedRes ...
    currentGrnPro currentRedPro t
%% Find radius of each gel (in microns)
% images=cell(Ntrials,1);
% imlimits =cell(Ntrials,1);
% for n=1:Ntrials
%     data = bfopen([info{n}.expFolderMac '/' info{n}.expName]);
%     images{n} = im2double(data{1,1}{2,1});
%     imlimits{n} = stretchlim(images{n});
%     figure
%     imshow(images{n},imlimits{n});
% end
% clear n data

masks = cell(Ntrials,1);
area = zeros(Ntrials,1);
perimeter = zeros(Ntrials,1);
tauD = zeros(Ntrials,1);
for n=1:Ntrials
    figure
    imshow(images{n},imlimits{n});
    [~, ~, masks{n}, ~, ~] = roipoly();
    close(gcf)
    area(n) = 1.58*1.58*sum(sum(masks{n})); % 1.58 microns per pixel at 4x
    perimeter(n) = 1.58*sum(sum(bwperim(masks{n}))); % sum over perimeter segments
    figure
    subplot(2,2,1)
    imshow(images{n},imlimits{n});
    subplot(2,2,2)
    imshow(masks{n});
    subplot(2,2,3)
    imshow(bwperim(masks{n}));
end
clear n
%% Tidy up for gels that don't fit onscreen - good results saved 11-12-18
% n = 16;
% figure
% subplot(2,2,1)
% imshow(images{n},imlimits{n});
% subplot(2,2,2)
% imshow(masks{n});
% subplot(2,2,3)
% imshow(bwperim(masks{n}));
% 
% figure
% imshow(images{n},imlimits{n});
% l = imdistline;

%%
tauD = (area./perimeter).^2*pi/4;

%% Fit accumulation using equation from Mortensen paper

fits.amp = zeros(2, Ntrials); % amplitude
fits.D = zeros(2, Ntrials); % lifetime
fits.ofs = zeros(2, Ntrials); % offset
fits.gof = cell(2, Ntrials);  % goodness of fit
for n=13%1:Ntrials % loop over all trials
    [fitresult, gofcur] = accFit(time{n}-time{n}(1),acc{1,n}-acc{1,n}(1),tauD(n)); % green data first
    fits.amp(1,n) = fitresult.A;
    fits.D(1,n) = fitresult.D;
%     fits.ofs(1,n) = fitresult.T;
    fits.gof{1,n} = gofcur;
    
    [fitresult, gofcur] = accFit(time{n}-time{n}(1),acc{2,n}-acc{2,n}(1),tauD(n)); % red data second
    fits.amp(2,n) = fitresult.A;
    fits.D(2,n) = fitresult.D;
%     fits.ofs(2,n) = fitresult.T;
    fits.gof{2,n} = gofcur;
end
disp('Finished fitting accumulation data.');
clear n gofcur

%% Calculate partition coefficients and bound probability pb
% partition coefficient is the amplitude plus the offset (limit of
% exponential fit as t goes to infinity)

partCoeffs = zeros(2, Ntrials); % green goes in first column, red in second
bProb = zeros(2,Ntrials);

for n=1:Ntrials
    partCoeffs(1,n) = (fits.amp(1,n)+fits.ofs(1,n));
    partCoeffs(2,n) = (fits.amp(2,n)+fits.ofs(2,n));
    bProb(n) = 1-partCoeffs(2,n)/partCoeffs(1,n); % expression from paper supplement
end
disp('Finished calculating partition coefficients and bound probability.');
clear n

%%
% lim = zeros(Ntrials,4);
% % lim(:,1) = edge of gel (within reservoir)
% % lim(:,2) = middle of gel
% % lim(:,3) = green peak if it exists, edge of gel (within gel) otherwise
% % lim(:,4) = red edge of gel (within gel)
for n=9%:Ntrials
    plot(pro{1,n}(1:10:end,:).','g');
    hold all
    plot(pro{2,n}(1:10:end,:).','r');
    
    datacursormode on
    dcm_obj = datacursormode(gcf);

    disp('Click the gel edge on the reservoir side.');
    waitforbuttonpress;
    c = getCursorInfo(dcm_obj);
    lim(n,1) = c.DataIndex;
    
    disp('Click the gel interior.');
    waitforbuttonpress;
    c = getCursorInfo(dcm_obj);
    lim(n,2) = c.DataIndex;
    
    disp('Click the green peak or gel edge on the gel side.');
    waitforbuttonpress;
    c = getCursorInfo(dcm_obj);
    lim(n,3) = c.DataIndex;
    
    disp('Click the red gel edge on the gel side.');
    waitforbuttonpress;
    c = getCursorInfo(dcm_obj);
    lim(n,4) = c.DataIndex;
    
    disp('Click the green gel edge on the gel side.');
    waitforbuttonpress;
    c = getCursorInfo(dcm_obj);
    lim(n,5) = c.DataIndex;

    disp('Positions recorded.');
    close all
end
clear c n dcm_obj
disp('Finished recording all positions.');

%% alternate method of estimating partition coefficient
for n=1:Ntrials
    partCoeffs(1,n) = pro{1,n}(end,lim(n,5))/pro{1,n}(end,lim(n,1));
    partCoeffs(2,n) = pro{2,n}(end,lim(n,4))/pro{2,n}(end,lim(n,1));
    
    bProb = 1-partCoeffs(2,:)./partCoeffs(1,:); % expression from paper supplement
end
clear n

%% Find the half-max values
halfMaxIndices = cell(Ntrials,2); % make a storage space for half-max indices as a function of time
halfMaxValues = cell(Ntrials,2);


for n=1:Ntrials % loop over all trials
    
    % make vectors with the correct number of time points
    halfMaxIndices{n,1} = zeros(length(time{n}),1);
    halfMaxIndices{n,2} = zeros(length(time{n}),1);
    
    % set the green range and find the green half-max value
    rangeg = partCoeffs(1,n)*pro{1,n}(1,lim(n,1))-pro{1,n}(1,lim(n,2));
    halfMaxValues{n,1} = partCoeffs(1,n)*pro{1,n}(:,lim(n,1))-.5*rangeg;
    
    % set the red range and find the red half-max value
    ranger = partCoeffs(2,n)*pro{2,n}(1,lim(n,1))-pro{2,n}(1,lim(n,2));
    halfMaxValues{n,2} = partCoeffs(2,n)*pro{2,n}(:,lim(n,1))-.5*ranger;

    % loop over all time points and find index that matches half-max value
    for t=1:length(time{n})
        
        [~,halfMaxIndices{n,1}(t)] = min(abs(...
            horzcat(zeros(1,lim(n,3)-1), smooth(pro{1,n}(t,lim(n,3):end)).')-halfMaxValues{n,1}(t)));
        
        [~,halfMaxIndices{n,2}(t)] = min(abs(smooth(pro{2,n}(t,:),50)-halfMaxValues{n,2}(t)));
    end
end
clear n t ranger rangeg

%% Convert from indices to positions; plot half-max position vs time
halfMaxPos = cell(Ntrials,2);
hold all
for n=[2 4 5:7 9:11 13]%1:Ntrials
    halfMaxPos{n,2} = pos{n}(halfMaxIndices{n,2});
    for t=1:length(time{n})
    if pro{2,n}(t,end)>halfMaxValues{n,2}
        halfMaxPos{n,2}(t) = nan;
    end
    end
    plot(time{n},abs((halfMaxPos{n,2}-halfMaxPos{n,2}(1))),'o');
end
figure
hold all
for n=[2 4 5:7 9:11 13]
    halfMaxPos{n,1} = pos{n}(halfMaxIndices{n,1});
    for t=1:length(time{n})
        if pro{1,n}(t,end)>halfMaxValues{n,1}
            halfMaxPos{n,1}(t) = nan;
        end
    end
    plot(time{n},abs((halfMaxPos{n,1}-halfMaxPos{n,1}(1))),'o');
end

clear n t
