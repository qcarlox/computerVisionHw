function[] = cylinderplot(h)
	r = .25*h;
	[X,Y] = meshgrid(-r*2:.01:r*2,-r*2:.01:r*2);
	Z = h.*(X.^2 + Y.^2 < r.^2);
	figure(1)
	subplot(1,2,1);
	mesh(X,Y,Z);
	subplot(1,2,2);
	imshow(Z);
	print(figure(1),'partD1.png');
end
