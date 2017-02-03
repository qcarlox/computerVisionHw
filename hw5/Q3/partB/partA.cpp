#include "opencv2/opencv.hpp"
#include <string>
#include "opencv2/bgsegm.hpp"

using namespace cv;
using namespace bgsegm;
using namespace std;

/////////////////////////////////functions
Mat readFrame(VideoCapture& capture, int frameNumber) 
{	
	Mat frame;
	capture.set(CV_CAP_PROP_POS_FRAMES,frameNumber);
    bool success = capture.read(frame); 
    if (!success)
    {
    	cerr << "Cannot read frame " <<  frameNumber << endl;
    }
    return frame;
}

////////////////////////////////main
int main(int argc, char** argv)
{
    if (argc != 2) 
    {
        cout << "need a filename\n";
        return 1;
    }
    std::string filename = argv[1];
    //matlab defaults
    int history = 150;
    int nmixtures = 5;
    double backgroundRatio = .7;
    double noiseSigma = 30^2;
    
    VideoCapture capture(filename);
    Ptr<BackgroundSubtractorMOG> pmog;
    pmog = createBackgroundSubtractorMOG(history, nmixtures, backgroundRatio, noiseSigma);
   
    
    
    if (!capture.isOpened())
    {
        cerr << "Failed to open file\n";
        return 1;
    }
    int totalFrames = static_cast<int>(capture.get(CV_CAP_PROP_FRAME_COUNT));
    
    //int frameIndex[3] = {1,45,91};
    
    Mat currentFrame;
    Mat foregroundFrame;
    
    char buffer[100];
    
    for(int i=0;i<totalFrames;i++)
    {
    	
    	currentFrame = readFrame(capture, i);
    	cvtColor( currentFrame, currentFrame, CV_BGR2GRAY );
    	pmog->apply(currentFrame, foregroundFrame);
    	
    	if(i == 1 || i == 45 || i == 91)
    	{
			snprintf(buffer,100,"current frame %d.png", i);
			filename = buffer;
			imwrite( filename, currentFrame);
			
			snprintf(buffer,100,"foreground frame %d.png", i);
			filename = buffer;
			imwrite( filename, foregroundFrame);
		}
    	
    }
     waitKey(0);
     return 0;
    
}

