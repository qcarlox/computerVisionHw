function [normalizedImage] = normalizeImage(image)
	MI = min(min(image));
	MA = max(max(image));
	normalizedImage = (image-MI)./(MA-MI);
end
