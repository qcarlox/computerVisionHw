image = imread('city.jpg');
image = rgb2gray(image);
edges = edge(image,'canny');
figure(1);
title('edges using edge function with default parameters');
imshow(edges);
image = double(image);
[edges,gradMag,gradAngle] = canny(image,1,.15);
figure(2);
title('edges using custom canny function with sig = .5 and tau =.1');
imshow(edges);

