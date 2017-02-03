system("cmake .");
system("make");
system("rm -rf CMakeFiles");
system("rm CMakeCache.txt");
system("rm cmake_install.cmake");
system("rm Makefile");
system("./partA ../../traffic.avi");

k = 1;
figure(1)
for i = [1 45 91];
	subplot(3,1,k)
	str = sprintf("current frame %i.png",i);
	image = imread(str);
	imshow(image);
	title(str);
	
	str = sprintf("foreground frame %i.png",i);
	image = imread(str);
	morphImage = cleanImage(image);
	labeledImage = bwlabel(morphImage);
	boundingBoxes = regionprops(labeledImage ,'BoundingBox');
	for j=1:rows(boundingBoxes)
		rectangle('Position',boundingBoxes(j,1).BoundingBox,'EdgeColor','green');
	end
	str = sprintf("cars = %i",rows(boundingBoxes));
	rectangle('Position',[2 1 35 10],'FaceColor','black');
	text(5,5,str,'color','yellow');
	k = k+1;
	
end
print(figure(1),'asd.png');
