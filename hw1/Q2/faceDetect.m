function [] = faceDetect(filename);

	image = imread(filename);
	thresholdedImage = thresholdFaces(image);
	figure(1);
	subplot(1,3,1);
	imshow(thresholdedImage);
	title('thresholded image');
	
	structuralElement = strel ("rectangle", [9 6]);
	morphImage = imdilate(thresholdedImage,structuralElement);
	
	structuralElement = strel ("square", 27);
	morphImage = imerode(morphImage,structuralElement);
	structuralElement = strel ("rectangle", [15 10]);
	morphImage = imdilate(morphImage,structuralElement);
	structuralElement = strel ("square", 9);
	morphImage = imerode(morphImage,structuralElement);
	structuralElement = strel ("rectangle", [30 20]);
	morphImage = imdilate(morphImage,structuralElement);
	figure(1)
	subplot(1,3,2);
	imshow(morphImage);
	title('image after morphology');
	
	subplot(1,3,3);
	imshow(image);
	title('location of detected faces');
	labeledImage = bwlabel(morphImage);
	boundingBoxes = regionprops(labeledImage ,'BoundingBox');
	for i=1:rows(boundingBoxes)
		rectangle('Position',boundingBoxes(i,1).BoundingBox,'EdgeColor','red');
	end
	
	print(figure(1),['faceDetect' filename(1:end-3) 'png']);
end


