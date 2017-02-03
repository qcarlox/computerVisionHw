bins = [256 128 64]';
figure(1);
image = imread('jetplane.tif');
numberOfPixels = length(image(:));
subplot(2,2,1);
imshow(image);
title('original image');
for i=1:length(bins)
    figure(1)
    eqImage = blockproc(image,[32,32], @histEqualize,bins(i,1));
    subplot(2,2,i+1);
    imshow(eqImage);
    str = sprintf('equalized image using %d bins in 32x32 blocks', bins(i,1));
    title(str);
end
print(figure(1),'outputImages32.png');
