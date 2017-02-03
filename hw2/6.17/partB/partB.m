red = imread('Fig0627(a)(WashingtonDC Band3-RED).TIF' );
blue = imread('Fig0627(c)(1)(WashingtonDC Band1-BLUE).TIF' );
green = imread('Fig0627(b)(WashingtonDC Band2-GREEN).TIF' );
infrared = imread('Fig0627(d)(WashingtonDC Band4).TIF' );


water = 255*(infrared < 25);
image(:,:,1) = red;
image(:,:,2) = green;
image(:,:,3) = blue+water;

figure(2);
imshow(image);

imwrite(image,'washingtonDCwater.png');
imwrite(water,'water.png');
