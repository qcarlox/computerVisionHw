function [] = Q3(originalImage, noisyImage);
	
	
	figure(1);
	imshow(originalImage);
	title('original image');

	figure(2);
	imshow(noisyImage);
	str = 'noisy image'
	title(str);
	MSE = imageMSE(originalImage,noisyImage)
	PSNR = imagePSNR(originalImage,noisyImage)

	figure(3);
	smoothedImage = imsmooth(noisyImage,'Average',3);
	imshow(smoothedImage);
	str = 'noisy image smoothed with 3x3 mean filter'
	title(str);
	MSE = imageMSE(originalImage,smoothedImage)
	PSNR = imagePSNR(originalImage,smoothedImage)

	figure(4);
	smoothedImage = imsmooth(noisyImage,'Average',5);
	imshow(smoothedImage);
	str = 'noisy image smoothed with 5x5 mean filter'
	title(str);
	MSE = imageMSE(originalImage,smoothedImage)
	PSNR = imagePSNR(originalImage,smoothedImage)

	figure(5);
	smoothedImage = imsmooth(noisyImage,'Median',3);
	imshow(smoothedImage);
	str = 'noisy image smoothed with 3x3 median filter'
	title(str);
	MSE = imageMSE(originalImage,smoothedImage)
	PSNR = imagePSNR(originalImage,smoothedImage)

	figure(6);
	smoothedImage = imsmooth(noisyImage,'Median',5);
	imshow(smoothedImage);
	str = 'noisy image smoothed with 5x5 median filter'
	title(str);
	MSE = imageMSE(originalImage,smoothedImage)
	PSNR = imagePSNR(originalImage,smoothedImage)

