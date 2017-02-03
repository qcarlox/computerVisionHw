bins = [256 128 64]';
figure(1);
image = imread('jetplane.tif');
numberOfPixels = length(image(:));
subplot(2,2,1);
imshow(image);
title('original image');
figure(2);
subplot(2,2,1);
normalizedHistogram = hist(image(:),256)/numberOfPixels;
stem(normalizedHistogram);
title('histogram of original image');
for i=1:length(bins)
    figure(1);
    eqImage = histEqualize(image,bins(i,1));
    subplot(2,2,i+1);
    imshow(eqImage);
    str = sprintf('equalized image using %d bins', bins(i,1));
    title(str);
    figure(2)
    subplot(2,2,i+1);
    normalizedHistogram = hist(eqImage(:),256)/numberOfPixels;
    stem(normalizedHistogram);
    str = sprintf('histogram of equalized image using %d bins', bins(i,1));
    title(str);
end
print(figure(1),'outputImages.png');
print(figure(2),'outputHistograms.png');
