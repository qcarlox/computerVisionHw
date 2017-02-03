function [shiftedImage] = colorFFTshift(image)
	for i=1:3
		shiftedImage(:,:,i) = fftshift(image(:,:,i));
	end
end
