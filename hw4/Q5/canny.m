function [E,M,A] = canny(I,sig,tau)
	
    smoothedImage = imsmooth(I,"Gaussian",sig);
    
    horizontalFilter = [-1 -1 -1;0 0 0;1 1 1;];
    horizontalEdges = imfilter(smoothedImage,horizontalFilter);
    
    verticalFilter = horizontalFilter';
    verticalEdges = imfilter(smoothedImage,verticalFilter);
    
    edgeGradients = sqrt(verticalEdges.^2 + horizontalEdges.^2);
    edgeGradients = normalizeImage(edgeGradients);
    M = edgeGradients;
   
    
    
    edgeDirections = abs(atan2(verticalEdges,horizontalEdges));
    edgeDirections = roundAngleValues(edgeDirections);
    A = edgeDirections;
    edgeGradients = nonMaxSuppression(edgeGradients, edgeDirections);
    E = (edgeGradients > tau);
	    
    
end

function [roundedImage] = roundAngleValues(image)
    image(isnan(image)) = 0;
    image(image > 0 & image < 22.5*pi/180) = 0;
    image(image > 157.5*pi/180 & image < 180*pi/180) = 0;
    image(image > 22.5*pi/180 & image < 67.5*pi/180) = 45;
    image(image > 67.5*pi/180 & image < 112.5*pi/180) = 90;
    image(image > 112.5*pi/180 & image < 157.5*pi/180) = 135;
    roundedImage = image;
end

function [suppressedImage] = nonMaxSuppression(gradImage, angleImage)
    for i=2:rows(gradImage)-1
        for j=2:columns(gradImage)-1
            switch(angleImage(i,j))
                case 0
                    gradImage(i,j) = nonMaxPixel(gradImage(i,j),gradImage(i,j-1),gradImage(i,j+1));
                case 45
                    gradImage(i,j) = nonMaxPixel(gradImage(i,j),gradImage(i-1,j+1),gradImage(i+1,j-1));
                case 90
                    gradImage(i,j) = nonMaxPixel(gradImage(i,j),gradImage(i+1,j),gradImage(i-1,j));
                case 135
                    gradImage(i,j) = nonMaxPixel(gradImage(i,j),gradImage(i-1,j-1),gradImage(i+1,j+1));
                otherwise
                    gradImage(i,j) = nonMaxPixel(gradImage(i,j),gradImage(i,j-1),gradImage(i,j+1));
            end
        end
    end
    suppressedImage = gradImage;
end

function [pixelValue] = nonMaxPixel(currentPixel,adjPixel1,adjPixel2)
	if(currentPixel < adjPixel1 || currentPixel < adjPixel2)
		pixelValue = 0;
	else
		pixelValue = currentPixel;
	end
end
