function[] = spaceAndFreqFilter(image,filter,filterName)
	tic();
	filteredImage = imfilter(image,filter);
	[filterName ' time domain']
	toc()
	
	subplot(1,2,1);
	imshow(normalizeImage(filteredImage));
	title(['image filtered in spacial domain']);
	
	
	si = size(image);
	row = si(1,1);
	col = si(1,2);
	
	tic();
	Fimage = fft2(image,row*2,col*2);
	Ffilter = fft2(filter,row*2,col*2);
	FfilteredImage = Fimage .* Ffilter;
	filteredImage = real(ifft2(FfilteredImage));
	filteredImage = filteredImage(5:row,5:col,:);
	[filterName ' freq domain']
	toc()
	
	subplot(1,2,2);
	imshow(normalizeImage(filteredImage));
	title(['image filtered in freq domain']);

end
