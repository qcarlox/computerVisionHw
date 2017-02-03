originalImage = imread('DSCN0479-001.JPG');
noisyImage = imnoise(originalImage, 'gaussian', 0, .005);
Q3(originalImage,noisyImage);
print(figure(1),'partA.png');

