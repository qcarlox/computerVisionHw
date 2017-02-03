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

//////
//string ty =  type2str( M.type() );
//printf("Matrix: %s %dx%d \n", ty.c_str(), M.cols, M.rows );
string type2str(int type) {
  string r;

  uchar depth = type & CV_MAT_DEPTH_MASK;
  uchar chans = 1 + (type >> CV_CN_SHIFT);

  switch ( depth ) {
    case CV_8U:  r = "8U"; break;
    case CV_8S:  r = "8S"; break;
    case CV_16U: r = "16U"; break;
    case CV_16S: r = "16S"; break;
    case CV_32S: r = "32S"; break;
    case CV_32F: r = "32F"; break;
    case CV_64F: r = "64F"; break;
    default:     r = "User"; break;
  }

  r += "C";
  r += (chans+'0');

  return r;
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
    char buffer[100];
    //capure returns uint8 matrices
    int totalFrames = static_cast<int>(capture.get(CV_CAP_PROP_FRAME_COUNT));
    
    Mat sum = readFrame(capture, 0);
    sum.convertTo(sum,CV_32F);
    
    for(int i=1;i<totalFrames;i++)
    {
    	Mat frame;
    	frame = readFrame(capture, i);
    	frame.convertTo(frame,CV_32F);
    	sum += frame;
    }
    
    Mat backgroundFrame = sum/totalFrames;
    
    cvtColor( backgroundFrame, backgroundFrame, CV_BGR2GRAY );
    imwrite( "backgroundFrame.png", backgroundFrame);
    
    Mat currentFrame;
    Mat frameDif;
    
    int frameIndex[3] = {1,45,91};
    for(int i=0;i<3;i++)
    {
    	currentFrame = readFrame(capture, frameIndex[i]);
    	currentFrame.convertTo(currentFrame,CV_32F);
    	cvtColor( currentFrame, currentFrame, CV_BGR2GRAY );
    	
    	frameDif = currentFrame - backgroundFrame;
    	threshold(frameDif, frameDif, 50, 255, THRESH_BINARY);
    	
    	snprintf(buffer,100,"object frame %d.png", frameIndex[i]);
    	filename = buffer;
    	
    	//imshow( filename, frameDif);
    	imwrite( filename, frameDif);
    	
    	snprintf(buffer,100,"current frame %d.png", frameIndex[i]);
    	filename = buffer;
    	
    	//imshow( filename, currentFrame);
    	imwrite( filename, currentFrame);
    	
    	snprintf(buffer,100,"background frame %d.png", frameIndex[i]);
    	filename = buffer;
    	imwrite( filename, backgroundFrame);
    }
     waitKey(0);
     return 0;
    
}

