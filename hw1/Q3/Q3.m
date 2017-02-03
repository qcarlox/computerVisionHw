function [] = Q3(originalImage, noisyImage);
	
	figure(1);
	subplot(3,2,1)
	imshow(originalImage);
	title('original image');

	subplot(3,2,2)
	imshow(noisyImage);
	str = 'noisy image'
	title(str);
	MSE = imageMSE(originalImage,noisyImage)
	PSNR = imagePSNR(originalImage,noisyImage)

	subplot(3,2,3)
	tic()
	smoothedImage = imsmooth(noisyImage,'Average',3);
	time = toc();
	imshow(smoothedImage);
	str = 'noisy image smoothed with 3x3 mean filter'
	time
	title(str);
	MSE = imageMSE(originalImage,smoothedImage)
	PSNR = imagePSNR(originalImage,smoothedImage)

	subplot(3,2,4)
	tic()
	smoothedImage = imsmooth(noisyImage,'Average',5);
	time = toc();
	imshow(smoothedImage);
	str = 'noisy image smoothed with 5x5 mean filter'
	time
	title(str);
	MSE = imageMSE(originalImage,smoothedImage)
	PSNR = imagePSNR(originalImage,smoothedImage)

	subplot(3,2,5)
	tic()
	smoothedImage = imsmooth(noisyImage,'Median',3);
	time = toc();
	imshow(smoothedImage);
	str = 'noisy image smoothed with 3x3 median filter'
	time
	title(str);
	MSE = imageMSE(originalImage,smoothedImage)
	PSNR = imagePSNR(originalImage,smoothedImage)

	subplot(3,2,6)
	tic()
	smoothedImage = imsmooth(noisyImage,'Median',5);
	time = toc();
	imshow(smoothedImage);
	str = 'noisy image smoothed with 5x5 median filter'
	time
	title(str);
	MSE = imageMSE(originalImage,smoothedImage)
	PSNR = imagePSNR(originalImage,smoothedImage)

