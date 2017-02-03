function [morphImage] = cleanImage(image)
	structuralElement = strel ("square", 9);
	morphImage = imdilate(image,structuralElement);
	structuralElement = strel ("square", 5);
	morphImage = imerode(morphImage,structuralElement);
end
