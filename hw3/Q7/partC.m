image = double(rgb2gray(imread('city.jpg')))/255;

filter = fspecial('sobel');
figure(1);
filterName = 'sobel filter';
spaceAndFreqFilter(image,filter,filterName);
print(figure(1),'partC1.png');

filter = fspecial('laplacian');
figure(1);
filterName = 'laplacian filter';
spaceAndFreqFilter(image,filter,filterName);
print(figure(1),'partC2.png');

filter = fspecial('log',5,.75);
figure(1);
filterName = 'LoG filter';
spaceAndFreqFilter(image,filter,filterName);
print(figure(1),'partC3.png');
