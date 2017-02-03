function [accumulator] = houghCircle(image,radius)
	accScale = 1; 
	[X,Y] = meshgrid(1:1/accScale:columns(image),1:1/accScale:rows(image));
	X = X-ceil(columns(image)/2);
	Y = Y-ceil(rows(image)/2);
	accumulator = zeros(rows(X),columns(X));
	for i=1:rows(image)
		for j=1:columns(image);
			if(image(i,j) == 1);
				x0 = j-ceil(columns(image)/2);
				y0 = i-ceil(columns(image)/2);
				Z = (X-x0).^2 + (Y-y0).^2 > radius.^2 -radius & (X-x0).^2 + (Y-y0).^2 < radius.^2 + radius;
				accumulator = accumulator + Z;
			end
		end
	end
	accumulator = normalizeImage(accumulator);
	%{
	figure(2)
	imshow(accumulator);
	
	circles = zeros(rows(image),columns(image));
	temp = accumulator;
	[X,Y] = meshgrid(1:1:columns(image),1:1:rows(image));
	
	for i=1:2
		[y,x] = find(temp == max(max(temp)));
		for j=1:length(x)
			x0 = round(x(j,1)/accScale);
			y0 = round(y(j,1)/accScale);
			Z = ((X-x0).^2 + (Y-y0).^2 == radius.^2);
			circles = circles + Z;
			temp(temp == max(max(temp))) = 0;
		end
	end
	figure(3)
	imshow(circles);
	%}
end
	
