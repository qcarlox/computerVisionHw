function[] = rectangleplot(h)
	r = .25*h;
	[X,Y] = meshgrid(-r*2:.01:r*2,-r*2:.01:r*2);
	Z = h.*(abs(X) < r).*(abs(Y) < r);
	figure(1)
	subplot(1,2,1);
	mesh(X,Y,Z);
	subplot(1,2,2);
	imshow(Z);
	print(figure(1),'partE.png');
end
