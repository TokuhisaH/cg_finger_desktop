import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Finger;
import processing.awt.PSurfaceAWT;

LeapMotionP5 leap;

float posX, posY;
float[]fingX=new float[10];
float[]fingY=new float[10];
int sizeW = 500;
int sizeY = 500;
PSurface  suf = getSurface();



void settings() {
  size(sizeW, sizeY)  ;
   
}


public void setup() {
frameRate(100);
  leap = new LeapMotionP5(this);
}

public void draw() {
  background(0);
  fill(255);


  fingX[0]=-1000;
  fingY[0]=-1000;

  fingX[1]=1000;
  fingY[1]=1000;


  int i=0;  

  for (Finger finger : leap.getFingerList()) {


    PVector fingerPos = leap.getTip(finger);
    posX=fingerPos.x*1.3;
    posY=fingerPos.y*1.3;
    fingX[i]=posX;
    fingY[i]=posY;

    ellipse(posX, posY, 10, 10);
    i++;
  }
  //横幅（右）
  if (dist(fingX[0], fingY[0], fingX[1], fingY[1])<140&&fingX[1]-width>0) {
    controllWinXMax(fingX[0], fingY[0], fingX[1], fingY[1]);
  }
   else if (dist(fingX[0], fingY[0], fingX[1], fingY[1])<140&&width-fingX[1]<100) {
    controllWinXMin(fingX[0], fingY[0], fingX[1], fingY[1]);
  }
  
  //縦幅(下)
  if(dist(fingX[0], fingY[0], fingX[1], fingY[1])<140&&fingY[1]-height>0) {
    controllWinYMax(fingX[0], fingY[0], fingX[1], fingY[1]);
  }
     else if (dist(fingX[0], fingY[0], fingX[1], fingY[1])<140&&width-fingY[1]<100) {
    controllWinYMin(fingX[0], fingY[0], fingX[1], fingY[1]);
  }
  
  
    //位置
  if(dist(fingX[0], fingY[0], fingX[1], fingY[1])<100&&fingY[1]>0&&fingY[1]<100) {
  //suf.setLocation( (int)(fingX[0]+fingX[1])/2, (int)(fingY[0]+fingY[1])/2);
//   suf.setLocation( , 500); 

}

  
  
}







void positionWin(float x1, float y1, float x2, float y2) {
  suf.setLocation( (int)(x1+x2)/2, (int)(y1+y2)/2);
}


void controllWinXMax(float x1, float y1, float x2, float y2) {

  PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
  PSurfaceAWT.SmoothCanvas smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
  smoothCanvas.getFrame().setAlwaysOnTop(true);
  //smoothCanvas.getFrame().removeNotify();
  //smoothCanvas.getFrame().setUndecorated(true);
  smoothCanvas.getFrame().setLocation(500, 500);
  //smoothCanvas.getFrame().addNotify();
  sizeW=sizeW+15;
  surface.setResizable(true);
  smoothCanvas.getFrame().setSize(sizeW, sizeY);
}

void controllWinXMin(float x1, float y1, float x2, float y2) {

  PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
  PSurfaceAWT.SmoothCanvas smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
  smoothCanvas.getFrame().setAlwaysOnTop(true);
  //smoothCanvas.getFrame().removeNotify();
//  smoothCanvas.getFrame().setUndecorated(true);
  smoothCanvas.getFrame().setLocation(500, 500);
  //smoothCanvas.getFrame().addNotify();
  sizeW=sizeW-15;
  if (sizeW<300)sizeW=301;
  smoothCanvas.getFrame().setSize(sizeW, sizeY);
}



void controllWinYMax(float x1, float y1, float x2, float y2) {

  PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
  PSurfaceAWT.SmoothCanvas smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
  smoothCanvas.getFrame().setAlwaysOnTop(true);
  //smoothCanvas.getFrame().removeNotify();
  //smoothCanvas.getFrame().setUndecorated(true);
  smoothCanvas.getFrame().setLocation(500, 500);
  //smoothCanvas.getFrame().addNotify();
  sizeY=sizeY+15;
  surface.setResizable(true);
  smoothCanvas.getFrame().setSize(sizeW, sizeY);
}


void controllWinYMin(float x1, float y1, float x2, float y2) {

  PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
  PSurfaceAWT.SmoothCanvas smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
  smoothCanvas.getFrame().setAlwaysOnTop(true);
  //smoothCanvas.getFrame().removeNotify();
//  smoothCanvas.getFrame().setUndecorated(true);
  smoothCanvas.getFrame().setLocation(500, 500);
  //smoothCanvas.getFrame().addNotify();
  sizeY=sizeY-15;
  if (sizeY<300)sizeY=301;
  smoothCanvas.getFrame().setSize(sizeW, sizeY);
}



public void stop() {
  leap.stop();
}
