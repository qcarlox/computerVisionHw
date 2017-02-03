red = imread('Fig0627(a)(WashingtonDC Band3-RED).TIF' );
blue = imread('Fig0627(c)(1)(WashingtonDC Band1-BLUE).TIF' );
green = imread('Fig0627(b)(WashingtonDC Band2-GREEN).TIF' );
infrared = imread('Fig0627(d)(WashingtonDC Band4).TIF' );

image(:,:,1) = red;
image(:,:,2) = green;
image(:,:,3) = blue;

figure(2);
imshow(image);
imwrite(image,'washingtonDCcolor.png');
