originalImage = imread('DSCN0479-001.JPG');
noisyImage = imnoise(originalImage, 'salt & pepper', .05);
Q3(originalImage,noisyImage);
print(figure(1),'partB.png');
