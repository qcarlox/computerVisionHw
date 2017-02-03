image = imread('city.jpg');
image = rgb2gray(image);


edges = edge(image,'Canny');
theta =pi*(-90:.1:90)/180;
[houghTransform,R] = hough_line(edges,theta);
figure(1);
houghTransform = normalizeImage(houghTransform);
title('hough transform of city.jpg');
imshow(houghTransform);
[dIx,thetaIx] = find(houghTransform == max(max(houghTransform)));

figure(2)
imshow(image)
title('city.jpg + lines from hough transform');
hold on

figure(1)
title('hough transform of city.jpg');
k = 1;


hold on
colors = ['r' 'g' 'b' 'm' 'c'];
for i=1:5
	[dIx,thetaIx] = find(houghTransform == max(max(houghTransform)));
	x = -rows(image)*2:1:rows(image)*2;
	d = R(dIx(1));
	th = theta(thetaIx(1));
	figure(1)
	plot(thetaIx(1),dIx(1),[colors(i) 'o']);
	y = (x*cos(th) - d)/sin(th);
	figure(2)
	plot(x,-y,colors(i));
	for j= dIx(1)-10:dIx(1)+10
	    for k = thetaIx(1)-10:thetaIx(1)+10
	         if j > 0 & k > 0
	            houghTransform(j,k) = 0;
	        end
	    end
	end
end
hold off
figure(3)
title('edges of city.jpg');
imshow(edges);

print(figure(1),'partA1.png');
print(figure(2),'partA2.png');
print(figure(3),'partA3.png');
