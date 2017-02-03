function [PSNR] = imagePSNR(a,b)
	MSE = imageMSE(a,b);
	PSNR = 20*log10(255/sqrt(MSE));
end
