image = imread('DSCN0479-001.JPG');
figure(1);
imshow(image);
title('original image');

noisyImage = imnoise(image,'gaussian',0,.005);
imshow(noisyImage);
str = 'noisy image with gaussian noise: mean = 0, var = .005';
MSE = imageMSE(image,noisyImage)
PSNR = imagePSNR(image,noisyImage)

smoothImage(noisyImage);


