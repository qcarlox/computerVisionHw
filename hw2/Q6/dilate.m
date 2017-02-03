a = [ 0 1 0 0 ;
	  0 1 0 0 ;
	  0 0 1 1 ;
	  0 0 1 0 ;
	  0 0 1 0 ];
	 
b = [ 0 1 0 ;
	  0 0 0 ;
	  0 1 1 ];
figure(1)
imshow(a);
imwrite(a,'original.png');
imwrite(b,'SE.png');
SE = strel('arbitrary',b);

figure(2)
dilatedImage = imdilate(a,SE);
imshow(dilatedImage);
imwrite(dilatedImage,'dilated.png');
