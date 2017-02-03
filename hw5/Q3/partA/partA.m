system("cmake .");
system("make");
system("rm -rf CMakeFiles");
system("rm CMakeCache.txt");
system("rm cmake_install.cmake");
system("rm Makefile");
system("./partA ../../traffic.avi");
figure(1)
k = 1;
for i = [1 45 91];
	subplot(3,2,k);
	str = sprintf("current frame %i.png",i);
	image = imread(str);
	imshow(image);
	title(str);
	str = sprintf("foreground frame %i.png",i);
	k = k+1;
	subplot(3,2,k);
	str = sprintf("foreground frame %i.png",i);
	image = imread(str);
	imshow(image);
	title(str);
	k = k+1;
end
	
