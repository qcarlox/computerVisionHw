#include "opencv2/opencv.hpp"
#include <string>
using namespace cv;
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
    
    VideoCapture capture(filename); 
    
    if (!capture.isOpened())
    {
        cerr << "Failed to open file\n";
        return 1;
    }
    //int totalFrames = static_cast<int>(capture.get(CV_CAP_PROP_FRAME_COUNT));
    
    int frameIndex[3] = {1,45,91};
    
    Mat currentFrame;
    Mat backgroundFrame;
    Mat frameDif;
    char buffer[100];
    
    for(int i=0;i<3;i++)
    {
    	currentFrame = readFrame(capture, frameIndex[i]);
    	cvtColor( currentFrame, currentFrame, CV_BGR2GRAY );
    	
    	backgroundFrame = readFrame(capture, frameIndex[i]-1);
    	cvtColor( backgroundFrame, backgroundFrame, CV_BGR2GRAY );
    	
    	frameDif = currentFrame - backgroundFrame;
    	threshold(frameDif, frameDif, 50, 255, THRESH_BINARY);
    	
    	snprintf(buffer,100,"object frame %d.png", frameIndex[i]);
    	string filename = buffer;
    	imwrite( filename, frameDif);
    	
    	snprintf(buffer,100,"current frame %d.png", frameIndex[i]);
    	filename = buffer;
    	imwrite( filename, currentFrame);
    	
    	snprintf(buffer,100,"background frame %d.png", frameIndex[i]);
    	filename = buffer;
    	imwrite( filename, backgroundFrame);
    }
     waitKey(0);
     return 0;
    
}

