#include "opencv2/opencv.hpp"
#include <string>
#include "opencv2/legacy/legacy.hpp"
#include <stdio.h>
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
    
   	
    CvCapture* cap = cvCaptureFromAVI(argv[1]);
    //int totalFrames = static_cast<int>(capture.get(CV_CAP_PROP_FRAME_COUNT));
    
    int frameIndex[3] = {1,45,91};
    
    
    IplImage *currentFrame, *backgroundFrame, *flowFrame, *tempFrame;
    CvMat *velx, *vely;
    CvTermCriteria criteria;
    
    
	tempFrame = cvQueryFrame( cap );
	currentFrame = cvCloneImage( tempFrame );
	backgroundFrame = cvCloneImage( tempFrame );
    
    int cols = currentFrame->width;
	int rows = currentFrame->height;
	velx = cvCreateMat (rows, cols, CV_32FC1);
	vely = cvCreateMat (rows, cols, CV_32FC1);
	cvSetZero (velx);
	cvSetZero (vely);
    
    char buffer[100];
    

	while( tempFrame = cvQueryFrame( cap ))
	{
		currentFrame = cvCopy( tempFrame );
		
		flowFrame = cvCloneImage(currentFrame);
		cvCvtColor(currentFrame,currentFrame,CV_BGR2GRAY);
		
		
		cvCvtColor(backgroundFrame,backgroundFrame,CV_BGR2GRAY);
		
		
		/*
		cvCalcOpticalFlowLK(backgroundFrame, currentFrame, cvSize (15, 15), velx, vely);
		for (int k = 0; k < cols; k += 5) 
    	{
    		for (int l = 0; l < rows; l += 5) 
    		{
      			int dx = (int) cvGetReal2D (velx, l, k);
      			
      			int dy = (int) cvGetReal2D (vely, l, k);
      			
      			cvLine (flowFrame, cvPoint (k, l), cvPoint (k + dx, l + dy), CV_RGB (255, 0, 0), 1, CV_AA, 0);
    		}
  		}
  		*/
  		//cvShowImage ("ImageHS", currentFrame);
  		cvWaitKey (0);
	} 
    
     
    return 0;
    
}

