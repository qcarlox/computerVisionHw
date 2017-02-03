x = [0 0 0 0 0;
	 0 0 0 0 0;
	 0 0 1 0 0;
	 0 0 0 0 0;
	 0 0 0 0 0;]
[dx,dy] = gradient(x)
figure(1)
subplot(2,1,1)
imshow(x)
title('delta');
subplot(2,1,2)
imshow(dx+dy+.5);
title('gradient kernel');
print(figure(1),'partA.png');
