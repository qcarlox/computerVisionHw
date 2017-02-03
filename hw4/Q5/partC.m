image = imread('wirebond_mask.tif');
image = double(image)/255;
sig = [.5,1,3];
t = [.6,.8];
k = 1;
figure(1);

for i=1:length(t)
	for j=1:length(sig)
		edges = canny(image,sig(j),t(i));
		subplot(2,3,k);
		imshow(edges);
		k = k+1;
	end
end


