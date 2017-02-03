figure (1, 'visible', 'off');
originalImage = imread('DSCN0479-001.JPG');
noisyImage = imread('DSCN0482-001.JPG');
Q3(originalImage,noisyImage);
print(figure(1),'partC.png');
