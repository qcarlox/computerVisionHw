function[] = gaussianplot(sigma)
	[X,Y] = meshgrid(-sigma*4:.1:sigma*4,-sigma*4:.1:sigma*4);
	Z = exp(-(X.^2 + Y.^2)/(2*sigma.^2))/(2*pi*sigma.^2);
	figure(1)
	subplot(1,2,1);
	mesh(X,Y,Z);
	subplot(1,2,2);
	imshow(Z);
	print(figure(1),'partD2.png');
end
