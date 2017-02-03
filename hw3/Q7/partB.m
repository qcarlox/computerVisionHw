image = double(rgb2gray(imread('city.jpg')))/255;

filter = fspecial('average',7);
figure(1);
filterName = '7x7 mean filter';
spaceAndFreqFilter(image,filter,filterName);
print(figure(1),'partB1.png');

filter = fspecial('gaussian',7,.5);
figure(1);
filterName = '3x3 gaussian filter with .5 sigma';
spaceAndFreqFilter(image,filter,filterName);
print(figure(1),'partB2.png');

filter = fspecial('gaussian',7,3);
figure(1);
filterName = '3x3 gaussian filter with 3 sigma';
spaceAndFreqFilter(image,filter,filterName);
print(figure(1),'partB3.png');
