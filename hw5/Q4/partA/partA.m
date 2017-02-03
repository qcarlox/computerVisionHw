v = VideoReader('traffic.avi');
allFrames = read(v);

k = 1;
index = [1,41,91];
optical = opticalFlowLK;
for i=2:size(allFrames,4)
    if(i == 2 || i == 46 || i == 92)
        currentFrame = allFrames(:,:,:,i);
        currentFrame = rgb2gray(currentFrame);
        pastFrame = allFrames(:,:,:,i-1);
        pastFrame = rgb2gray(pastFrame);
        flow = estimateFlow(optical,pastFrame);
        flow = estimateFlow(optical,currentFrame);
        figure(k)
        hold on
        imshow(currentFrame);
        plot(flow);
        hold off
        str = sprintf('image%i',k);
        saveas( gcf,str, 'png' );
        k = k+1;
    end
end

