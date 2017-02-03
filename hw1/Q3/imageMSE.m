function [MSE] = imageMSE(a,b)
	MSE = mean(mean(mean((a-b).^2)));
end
