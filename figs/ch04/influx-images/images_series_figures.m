%% Load cct1 gel from 2/19 for bleach images
r = load('/Volumes/houghgrp/Processed Images/2019-2-19_21/results.mat');
%% Load final dataset for image scaling
data = load('/Volumes/houghgrp/Processed Images/bound_diffusion_dataset2.mat');
%% Make a set of plots with red and green overlaid
% imageg = imadjust(im2double(img),[0.0109102006561379;0.0222781719691768]);
% imager = imadjust(im2double(imr),[0.0140535591668574;0.0482642862592508]);
subplot(1,3,1)
imageg = imadjust(im2double(r.GreenImages{1,1}),[0.005;0.0222781719691768]);
imager = imadjust(im2double(r.RedImages{1,1}/3.75),[0.005;0.0222781719691768]);
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
% imshow(image, 'InitialMagnification',50);
imshow(image);

subplot(1,3,2)
imageg = imadjust(im2double(r.GreenImages{1,2}),[0.005;0.0222781719691768]);
imager = imadjust(im2double(r.RedImages{1,2}/3.75),[0.005;0.0222781719691768]);
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
imshow(image);

subplot(1,3,3)
imageg = imadjust(im2double(r.GreenImages{1,end}),[0.005;0.0222781719691768]);
imager = imadjust(im2double(r.RedImages{1,end}/3.75),[0.005;0.0222781719691768]);
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
imshow(image);
%% Show green and red channels separately
n=316;
subplot(2,3,1)
imageg = imadjust(im2double(r.GreenImages{1,1}),[0.007;0.022]);
imager = zeros(size(imageg));
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
% imshow(image, 'InitialMagnification',50);
imshow(image);
hold on
line([900,n+900],[850,850]);
hold off

subplot(2,3,2)
imageg = imadjust(im2double(r.GreenImages{1,2}),[0.007;0.022]);
imager = zeros(size(imageg));
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
imshow(image);

subplot(2,3,3)
imageg = imadjust(im2double(r.GreenImages{1,end}),[0.007;0.022]);
imager = zeros(size(imageg));
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
imshow(image);

subplot(2,3,4)
imageg = zeros(size(imager));
imager = imadjust(im2double(r.RedImages{1,1}),[0.015;0.035]);
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
% imshow(image, 'InitialMagnification',50);
imshow(image);

subplot(2,3,5)
imageg = zeros(size(imager));
imager = imadjust(im2double(r.RedImages{1,2}),[0.015;0.035]);
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
imshow(image);

subplot(2,3,6)
imageg = zeros(size(imager));
imager = imadjust(im2double(r.RedImages{1,end}),[0.015;0.035]);
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
imshow(image);
%% Test one image at at time
imager = imadjust(im2double(r.GreenImages{1,1}),grnScale);
imageg = zeros(size(imager));
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
imshow(image, 'InitialMagnification',50);

%% Load cct2 gel from 2/21 for influx series
r = load('/Volumes/houghgrp/Processed Images/2019-2-21_5/results.mat');
%% Load profile experiment
profiles = bfopen('/Volumes/houghgrp/Microscopy/190220/190220_profiles_02.vsi');
%%
ListOfImages = profiles{1,1};
GreenImages = ListOfImages(1:2:length(ListOfImages));
RedImages = ListOfImages(2:2:length(ListOfImages));
%% set initial scales
% grnScale = [0.00556954299229419;0.0268558785381857];
% redScale = [0.0183566033417258;0.0502479591058213];
grnScale = [0;0.07];
redScale = [0.0183566033417258;0.0502479591058213];
%% Test one image at at time
imageg = imadjust(im2double((9/3.75)*r.GreenImages{1,1}),grnScale);
imager = zeros(size(imageg));
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
imshow(image, 'InitialMagnification',50);
%%

%% Show green and red channels separately for influx
n=316;
subplot(2,3,1)
imageg = imcrop(imadjust(im2double(GreenImages{1,1}),grnScale),rect2);
imager = zeros(size(imageg));
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
% imshow(image, 'InitialMagnification',50);
imshow(image);
hold on
line([500,n+500],[700,700]);
hold off

subplot(2,3,2)
imageg = imcrop(imadjust(im2double((9/8)*GreenImages{1,end}),grnScale),rect2);
imager = zeros(size(imageg));
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
imshow(image);

subplot(2,3,3)
imageg = imcrop(imadjust(im2double((9/3.75)*r.GreenImages{1,1}),grnScale),rect3);
imager = zeros(size(imageg));
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
imshow(image);

subplot(2,3,4)
imager = imcrop(imadjust(im2double(RedImages{1,1}),redScale),rect2);
imageg = zeros(size(imager));
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
% imshow(image, 'InitialMagnification',50);
imshow(image);

subplot(2,3,5)
imager = imcrop(imadjust(im2double((23/22)*RedImages{1,end}),redScale),rect2);
imageg = zeros(size(imager));
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
imshow(image);

subplot(2,3,6)
imager = imcrop(imadjust(im2double((23/29)*r.RedImages{1,1}),redScale),rect3);
imageg = zeros(size(imager));
imageb = zeros(size(imager));
image = cat(3,imager,imageg,imageb);
% Display the image as a figure.
imshow(image);

%% Crop the images
figure
[J,rect3] = imcrop(imadjust(im2double((9/3.75)*r.GreenImages{1,1}),grnScale));
%%
imshow(J);
%%
J2 = imcrop(imadjust(im2double((9/8)*GreenImages{1,end}),grnScale),rect2);
%%
imshow(J2)

