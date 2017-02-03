function [normalizedImage] = normalizeColorImage(image)
	MI = min(min(min(image)));
	MA = max(max(max(image)));
	normalizedImage = (image-MI)./(MA-MI);
end
