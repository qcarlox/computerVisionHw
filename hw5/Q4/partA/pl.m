
figure(1)
k = 1;
ind = [1,45,91];
for i=ind
	subplot(3,1,k);
	str = sprintf("current frame %i.png",i);
	image = imread(str);
	imshow(image);
	title(str);
	k = k+1
end
	
