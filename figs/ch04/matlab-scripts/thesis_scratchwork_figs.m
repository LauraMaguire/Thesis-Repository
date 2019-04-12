x=1.58*(-1024/2:1024/2-1);
y=1.58*(-1344/2:1344/2-1);
%%
image = total.*im2double(GreenImages{2});
r = zeros(size(image));
theta = zeros(size(image));
rmax = zeros(length(x),1);
        
for xInd = 1:length(x)
    rmax(xInd) = nnz(image(xInd,:));
    r(xInd,:) = sqrt(x(xInd)^2+y.^2);
    theta(xInd,:) = atan(y./x(xInd));
end

rmax = 1.58*max(rmax)/2;
imagesc(r)
figure
imagesc(theta)


%%
numAlpha = 10;
numN = 10; % always set to an even number
a=rmax;

jn = zeros(size(image));
cosine = zeros(size(image));
sine = zeros(size(image));

integralCos = zeros(numN,numAlpha);
integralSin = zeros(numN,numAlpha);

for n=1:numN
    alpha = besselzero((n-1)-numN/2,numAlpha,1)/a;
    
    for alphaInd=1:numAlpha
        
        besselOrder = (n-1)-numN/2;
        
        for xInd = 1:length(x)
            
            if besselOrder<0
                jn(xInd,:) = (-1)^besselOrder*real(besselj(abs(besselOrder),alpha(alphaInd)*sqrt(x(xInd)^2+y.^2)));
            else
                jn(xInd,:) = besselj(besselOrder,alpha(alphaInd)*sqrt(x(xInd)^2+y.^2));
            end
            cosine(xInd,:) = cos(besselOrder*atan(y./x(xInd)));
            sine(xInd,:) = sin(besselOrder*atan(y./x(xInd)));
                        
        end
       
        
        integrandCos = image.*jn.*cosine.*r;
        integrandSin = image.*jn.*cosine.*r;
        
        integrandCos(513,673) = 0;
        integrandSin(513,673) = 0;
        
%         integralCos(n,alphaInd) = trapz(trapz(integrandCos));
%         integralSin(n,alphaInd) = trapz(trapz(integrandSin));

        integralCos(n,alphaInd) = double(sum(sum(integrandCos)));
        integralSin(n,alphaInd) = double(sum(sum(integrandSin)));
        
        disp(['Finished zero number ' num2str(alphaInd) ' of ' num2str(numAlpha)]);
    end
    disp(['Finished ' num2str(n) ' of ' num2str(numN) ' terms.']);
    disp(['Finished Bessel order ' num2str((n-1)-numN/2) '.']);
end

clear n alphaInd xInd r jn cosine sine alpha

%%
imagesc(integralCos)

%%
numAlpha = 10;
numN = 10; % always set to an even number
a=rmax;

jn = zeros(size(image));
cosine = zeros(size(image));
sine = zeros(size(image));

for n=1:numN
    alpha = besselzero((n-1)-numN/2,numAlpha,1)/a;
    
    for alphaInd=1:numAlpha
        
        besselOrder = (n-1)-numN/2;
        
        % stays the same
        for xInd = 1:length(x)
            for yInd = 1:length(y)
            

            
            if besselOrder<0
                jn(xInd,yInd) = (-1)^besselOrder*real(besselj(abs(besselOrder),alpha(alphaInd)*sqrt(r(xInd,yInd))));
            else
                jn(xInd,yInd) = besselj(besselOrder,alpha(alphaInd)*sqrt(r(xInd,yInd)));
            end
            cosine(xInd,:) = cos(besselOrder*theta(xInd,yInd));
            sine(xInd,:) = sin(besselOrder*theta(xInd,yInd));
            end
                        
        end

        
        disp(['Finished zero number ' num2str(alphaInd) ' of ' num2str(numAlpha)]);
    end
    disp(['Finished ' num2str(n) ' of ' num2str(numN) ' terms.']);
    disp(['Finished Bessel order ' num2str((n-1)-numN/2) '.']);
end

clear n alphaInd xInd r jn cosine sine alpha

%%
im = GreenImages{2};
imshow(imadjust(im,[0,0.02]));
%%
imagesc();
% figure
% imagesc(co);
% figure
% imagesc(jn);
% figure
% imagesc(r);
%%
imr = RedImages{2};
%%
test = bfopen('/Volumes/houghgrp/Microscopy/2015/150602/Kap121_Pho4/Kap121_Pho4_03.vsi');

%%
ListOfImages = test{1,1};
GreenImages = ListOfImages(1:2:length(ListOfImages));
RedImages = ListOfImages(2:2:length(ListOfImages));
grnScale = stretchlim(im2double(GreenImages{end}));
redScale = stretchlim(im2double(RedImages{end}));
    imageg = imadjust(im2double(GreenImages{end}),grnScale);
    imager = imadjust(im2double(RedImages{end}),redScale);
    imageb = alpha(size(imager));
    image = cat(3,imager,imageg,imageb);
    % Display the image as a figure.
    imshow(image, 'InitialMagnification',50);
    
    %%
test2 = imcrop(image);
%%
imshow(test2);
line([50 50+127],[50 50]);
%%
plot(dyeFraction.','o')
%%
plot(tau.','o');
%%
m=median(dyeFraction(1,:));
%%
mtg = median(tauDye(1,:));
%%
mtg2 = median(tau(1,:));
%%
imshow(image,[0.,0.02])
%%
[c, s] = calculateCoeffs(image,2,2);