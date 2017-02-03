red = imread('Fig0627(a)(WashingtonDC Band3-RED).TIF' );
blue = imread('Fig0627(c)(1)(WashingtonDC Band1-BLUE).TIF' );
green = imread('Fig0627(b)(WashingtonDC Band2-GREEN).TIF' );
infrared = imread('Fig0627(d)(WashingtonDC Band4).TIF' );

buildings = 255*(red > 60) .* (blue > 60) .* (green > 60);

image(:,:,1) = red + buildings;
image(:,:,2) = green - buildings;
image(:,:,3) = blue - buildings;


figure(1)
imshow(buildings);
figure(2)
imshow(image);

imwrite(image,'washingtonDCBuildings.png');
imwrite(buildings,'buildings.png');
