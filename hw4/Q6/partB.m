%[X,Y] = meshgrid(-100:1:100,-100:1:100);
%Z = (X-20).^2 + (Y-20).^2 > 990 & (X-20).^2 + (Y-20).^2 < 1100;
%imshow(Z);
radius = 38;
image = imread('quarters.bmp');
edgeImage = edge(image,'Sobel');
figure(1)
title('edges of quarters.bmp');
imshow(edgeImage);

accumulator = houghCircle(edgeImage,radius);


figure(2)
title('hough transform of quarters.bmp');
imshow(accumulator)
	
	
	
circles = zeros(rows(image),columns(image));
[X,Y] = meshgrid(1:1:columns(image),1:1:rows(image));
X = X-ceil(columns(image)/2);
Y = Y-ceil(rows(image)/2);
k = 1;

for i=1:3
	[colIx,rIx] = find(accumulator == max(max(accumulator)));
	x0 = rIx(1)-ceil(columns(image)/2);
	y0 = colIx(1)-ceil(columns(image)/2);
	Z = (X-x0).^2 + (Y-y0).^2 > radius.^2 -radius & (X-x0).^2 + (Y-y0).^2 < radius.^2 + radius;
	circles = circles + Z;
	for j= colIx(1)-10:colIx(1)+10
	    for k = rIx(1)-10:rIx(1)+10
	        if j > 0 & k > 0
	            accumulator(j,k) = 0;
	        end
	    end
	end
end
figure(3);
title('circles from hough transform + quarters.bmp');
imshow(circles*255+image);

print(figure(1),'partB1.png');
print(figure(2),'partB2.png');
print(figure(3),'partB3.png');
%}
