[X,Y] = meshgrid(-100:.1:100,-100:.1:100);
Z = X.^2 + Y.^2 == 100;
imshow(Z);
%{
edges = edge(image,'Canny');
theta =pi*(-90:.1:90)/180;
[houghTransform,R] = hough_line(edges,theta);
figure(1);
houghTransform = normalizeImage(houghTransform);
imshow(houghTransform);
[dIx,thetaIx] = find(houghTransform == max(max(houghTransform)));

figure(2)
imshow(image)


k = 1;


hold on
for i=1:5
	[dIx,thetaIx] = find(houghTransform == max(max(houghTransform)));
	x = -rows(image):1:1;
	d = R(dIx(1))
	th = theta(thetaIx(1));
	th*180/pi
	y = (x*cos(th) - d)/sin(th);
	plot(-y,-x);
	houghTransform(dIx,thetaIx) = 0;
end
hold off
%}
