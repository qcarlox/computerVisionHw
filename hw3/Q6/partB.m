%image = double(imread('city.jpg'))/255;

image = double(rgb2gray(imread('city.jpg')))/255;

figure(1)
subplot(2,2,1);
imshow(image);
title('original image');

figure(2)
subplot(2,2,1);
imshow(image);
title('original image');

filter = fspecial('sobel');
filteredImage = imfilter(image,filter);
filteredImage = filteredImage - mean(mean(filteredImage));
figure(1)
subplot(2,2,2);
imshow(normalizeImage(imfilter(image,filter)));
title('image filtered with sobel');

figure(2)
subplot(2,2,2);
enhancedImage = image-filteredImage;
imshow(enhancedImage);
title('image filtered with sobel + original');


filter = fspecial('laplacian');
filteredImage = imfilter(image,filter);
filteredImage = filteredImage-mean(mean(filteredImage));
figure(1)
subplot(2,2,3);
imshow(normalizeImage(imfilter(image,filter)));
title('image filtered with laplacian');

figure(2)
subplot(2,2,3);
enhancedImage = image-filteredImage;
imshow(enhancedImage);
title('image filtered with laplacian + original');

filter = fspecial('log',5,.75);
filteredImage = imfilter(image,filter);
filteredImage = filteredImage-mean(mean(filteredImage));
figure(1)
subplot(2,2,4);
imshow(normalizeImage(imfilter(image,filter)));
title('image filtered with LoG');

figure(2)
subplot(2,2,4);
enhancedImage = image-filteredImage;
imshow(enhancedImage);
title('image filtered with LoG + original');

print(figure(1),'partB1.png');
print(figure(2),'partB2.png');
