initGreen = im2double(data{14}.greenImage);
    initGreen = imadjust(initGreen,[0.0;0.03]);
    
    initRed = im2double(data{14}.redImage);
    initRed = imadjust(initRed,[0.01;0.06]);
    image = cat(3,initRed,initGreen,imageb);

%imshow(image)
%%
initGreen = im2double(data{14}.greenImage);
    initGreen = imadjust(initGreen(:,1:1344/2),[0.01;0.03]);
    initGreen = horzcat(initGreen, zeros(1024,1344/2));
    
    initRed = im2double(data{14}.redImage);
    initRed = imadjust(initRed(:,1344/2:end),[0.01;0.06]);
    initRed = horzcat(zeros(1024,1344/2-1),initRed);
    %imshow(initRed)
imshow(cat(3,initRed,initGreen,imageb))
J2 = imcrop(cat(3,initRed,initGreen,imageb),[155.51 	0.51	1069.98 1023.98]);
%%
imshow(J)
%%
K = imcrop(equilMask,rect);
%%
imshow(K)
%%
for i = 1:size(image,1)
    % count nonzero entries in gel mask image
    % largest number of nonzero entries will be the "diameter" in pixels
    rmax(i) = nnz(equilMask(i,:));
    i
end

%%
[M,data{14}.y] = max(rmax);
%%
test = ones(size(imageb));
test(I-5:I+5,:) = 0.5*ones(11,1344);
%imshow(test)
c = ones(size(imageb));
% c(data{14}.y-7:data{14}.y+7,data{14}.x-7:data{14}.x+7) = zeros(15,15);
c(data{14}.y-10:data{14}.y+10,data{14}.x-10:data{14}.x+10) = zeros(21,21);
%%
K = imcrop(test.*equilMask.*c-0.25*data{14}.bleachSpot,[155.51 	0.51	1069.98 1023.98]);
%%
imshow(test.*equilMask-0.25*data{14}.bleachSpot)

%[v,rect] = imcrop(gcf);
%%
imshow(K)
%%
diameter = equilMask(data{14}.y,:);
startIndex = find(diameter~=0, 1, 'first');
data{14}.x = startIndex+max(rmax)/2;

%%
initGreen = im2double(data{16}.greenImage);
    initGreen = imadjust(initGreen,[0.002;0.02]);
    
    initRed = im2double(data{16}.redImage);
    initRed = imadjust(initRed,[0.015;0.06]);
    imageb = zeros(size(initRed));
    image = cat(3,initRed,initGreen,imageb);

imshow(image)

%%
%%
for i = 1:size(image,1)
    % count nonzero entries in gel mask image
    % largest number of nonzero entries will be the "diameter" in pixels
    rmax(i) = nnz(data{16}.gelMask(i,:));
end

%%
[M,I] = max(rmax);
%%
test = ones(size(imageb));
test(I-5:I+5,:) = 0.5*ones(11,1344);
%imshow(test)
c = ones(size(imageb));
% c(data{14}.y-7:data{14}.y+7,data{14}.x-7:data{14}.x+7) = zeros(15,15);
c(data{16}.y-10:data{16}.y+10,data{16}.x-10:data{16}.x+10) = zeros(21,21);
%%
imshow(test.*data{16}.gelMask.*c-0.25*data{16}.bleachSpot);