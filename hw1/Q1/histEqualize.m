%performs histogram equalization on grayscale image

function [equalizedImage] = histEqualize(image, numberOfBins)
    [row,column] = size(image);
    pixelIntensities = 255;
    image = double(image(:));
    histogram = hist(image, numberOfBins)/length(image)';
    cumulativeSum = cumsum(histogram);
    image = floor(image*numberOfBins/pixelIntensities);
    equalizedImage = floor(cumulativeSum(image)*pixelIntensities);
    equalizedImage = uint8(reshape(equalizedImage,row,column));
end
	    
	
