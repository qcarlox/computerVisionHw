
figure(1)
k = 1;
for i = [1 45 91];
	subplot(3,1,k);
	
	str = sprintf("frame%i.png",i);
	image = imread(str);
	imshow(image);
	title(str);
	k = k+1;
end
	
