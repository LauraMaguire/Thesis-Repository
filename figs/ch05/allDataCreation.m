conditions = {'Buffer' 'Lysate' '19% Serine' '25% PEG' '20% PEG' '13% PEG' '5% PEG' '25% PVP' '20% PVP' '13% PVP' '5% PVP'};
paramOrder = {'A' 'k' 'T' 'L'};

%%
b=1;ly=2;s=3;p25=4;p20=5;p13=6;p05=7;v25=8;v20=9;v13=10;v05=11;
a=1;k=2;t=3;lg=4;

%%
data(ly,a,1:3,1:6) = lys00_A;
data(ly,k,1:3,1:6) = lys00_k;
data(ly,t,1:3,1:6) = lys00_T;
data(ly,lg,1:3,1:6) = lys00_l;

%%
data(s,a,:,:) = ser19_A;
data(s,k,:,:) = ser19_k;
data(s,t,:,:) = ser19_T;
data(s,lg,:,:) = ser19_l;

%%
data(p25,a,1:2,1:5) = peg25_A;
data(p25,k,1:2,1:5) = peg25_k;
data(p25,t,1:2,1:5) = peg25_T;
data(p25,lg,1:2,1:5) = peg25_l;

%%
data(v25,a,1:2,1:5) = pvp25_A;
data(v25,k,1:2,1:5) = pvp25_k;
data(v25,t,1:2,1:5) = pvp25_T;
data(v25,lg,1:2,1:5) = pvp25_l;
%%
data(v20,a,1:2,1:5) = pvp20_A;
data(v20,k,1:2,1:5) = pvp20_k;
data(v20,t,1:2,1:5) = pvp20_T;
data(v20,lg,1:2,1:5) = pvp20_l;
%%
data(v05,a,1:2,1:5) = pvp5_A;
data(v05,k,1:2,1:5) = pvp5_k;
data(v05,t,1:2,1:5) = pvp5_T;
data(v05,lg,1:2,1:5) = pvp5_l;
%%
data(p05,a,1:2,1:5) = peg5_A;
data(p05,k,1:2,1:5) = peg5_k;
data(p05,t,1:2,1:5) = peg5_T;
data(p05,lg,1:2,1:5) = peg5_l;
%%
data(p20,a,1:2,1:5) = peg20_A;
data(p20,k,1:2,1:5) = peg20_k;
data(p20,t,1:2,1:5) = peg20_T;
data(p20,lg,1:2,1:5) = peg20_l;
%%
data(p13,a,:,:) = peg13_A;
data(p13,k,:,:) = peg13_k;
data(p13,t,:,:) = peg13_T;
data(p13,lg,:,:) = peg13_l;

%%
data(v13,a,:,:) = pvp13_A;
data(v13,k,:,:) = pvp13_k;
data(v13,t,:,:) = pvp13_T;
data(v13,lg,:,:) = pvp13_l;

%%
ind = [4,4,4,5,5,1,11];
data(b,a,1,1:length(t126.z.zeroA(4,:))) = t126.z.zeroA(4,:);
data(b,a,2,1:length(t219.z.zeroA(4,:))) = t219.z.zeroA(4,:);
data(b,a,3,1:length(t221.z.zeroA(4,:))) = t221.z.zeroA(4,:);
data(b,a,4,1:length(t228.z.zeroA(5,:))) = t228.z.zeroA(5,:);
data(b,a,5,1:length(t306.z.zeroA(5,:))) = t306.z.zeroA(5,:);
data(b,a,6,1:length(t328.z.zeroA(1,:))) = t328.z.zeroA(1,:);
data(b,a,7,1:length(t426.z.zeroA(11,:))) = t426.z.zeroA(11,:);

%%
ind = [4,4,4,5,5,1,11];
data(b,k,1,1:length(t126.z.zeroK(4,:))) = t126.z.zeroK(4,:);
data(b,k,2,1:length(t219.z.zeroK(4,:))) = t219.z.zeroK(4,:);
data(b,k,3,1:length(t221.z.zeroK(4,:))) = t221.z.zeroK(4,:);
data(b,k,4,1:length(t228.z.zeroK(5,:))) = t228.z.zeroK(5,:);
data(b,k,5,1:length(t306.z.zeroK(5,:))) = t306.z.zeroK(5,:);
data(b,k,6,1:length(t328.z.zeroK(1,:))) = t328.z.zeroK(1,:);
data(b,k,7,1:length(t426.z.zeroK(11,:))) = t426.z.zeroK(11,:);


%%
ind = [4,4,4,5,5,1,11];
data(b,lg,1,1:length(t126.z.zeroLag(4,:))) = t126.z.zeroLag(4,:);
data(b,lg,2,1:length(t219.z.zeroLag(4,:))) = t219.z.zeroLag(4,:);
data(b,lg,3,1:length(t221.z.zeroLag(4,:))) = t221.z.zeroLag(4,:);
data(b,lg,4,1:length(t228.z.zeroLag(5,:))) = t228.z.zeroLag(5,:);
data(b,lg,5,1:length(t306.z.zeroLag(5,:))) = t306.z.zeroLag(5,:);
data(b,lg,6,1:length(t328.z.zeroLag(1,:))) = t328.z.zeroLag(1,:);
data(b,lg,7,1:length(t426.z.zeroLag(11,:))) = t426.z.zeroLag(11,:);

%%
ind = [4,4,4,5,5,1,11];
data(b,t,1,1:length(t126.z.zeroT(4,:))) = t126.z.zeroT(4,:);
data(b,t,2,1:length(t219.z.zeroT(4,:))) = t219.z.zeroT(4,:);
data(b,t,3,1:length(t221.z.zeroT(4,:))) = t221.z.zeroT(4,:);
data(b,t,4,1:length(t228.z.zeroT(5,:))) = t228.z.zeroT(5,:);
data(b,t,5,1:length(t306.z.zeroT(5,:))) = t306.z.zeroT(5,:);
data(b,t,6,1:length(t328.z.zeroT(1,:))) = t328.z.zeroT(1,:);
data(b,t,7,1:length(t426.z.zeroT(11,:))) = t426.z.zeroT(11,:);


%%
for c=1:11
    for pr = 1:4
        param(c,pr,1) = nanmean(nonzeros(data(c,pr,:,:)));
    end
end

%%
for c=1:11
    for pr = 1:4
        param(c,pr,3) = sum(not(isnan(nonzeros((data(c,pr,:,:))))));
    end
end

%%
for c=1:11
    for pr = 1:4
        param(c,pr,2) = nanstd(nonzeros(data(c,pr,:,:)))/sqrt(param(c,pr,3));
    end
end
