%image = double(imread('city.jpg'))/255;
image = double(rgb2gray(imread('city.jpg')))/255;
figure(1)
subplot(2,2,1);
imshow(image);
title('original image');

filter = fspecial('average',7);
filteredImage = imfilter(image,filter);
subplot(2,2,2);
imshow(filteredImage);
title('image filtered with 7x7 mean filter');

filter = fspecial('gaussian',7,.5);
filteredImage = imfilter(image,filter);
subplot(2,2,3);
imshow(filteredImage);
title('image filtered with 7x7 gaussian filter with .5 sigma');

filter = fspecial('gaussian',7,3);
filteredImage = imfilter(image,filter);
subplot(2,2,4);
imshow(filteredImage);
title('image filtered with 7x7 gaussian filter with 3 sigma');

print(figure(1),'partA.png');


