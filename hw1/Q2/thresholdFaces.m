function [thresholdedImage] = thresholdFaces(image)
    HUpper = 35/360;
    HLower = 5/360;
    SLower = 20/100;
    VLower = 20/100;
    image = double(image)/255;
    imageHSV = rgb2hsv(image);
    mask = (HUpper >= imageHSV(:,:,1)) .* (imageHSV(:,:,1) >= HLower) .* (imageHSV(:,:,2) >= SLower) .* (imageHSV(:,:,3) > VLower);
    thresholdedImage = mat2gray(mask);
end
