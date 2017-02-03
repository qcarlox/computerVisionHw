image = double(rgb2gray(imread('city.jpg')))/255;
figure(1);
si = size(image);
row = si(1,1);
col = si(1,2);
Fimage = fft2(image,row*2,col*2);
Fimage = normalizeImage(log10(1+abs(Fimage)));
Fimage = fftshift(Fimage);
imshow(Fimage);

print(figure(1),'partA.png');
