int platX;
int platY;
PImage plz;

void setup(){
  size(1000,600); //Sets size to 1000 by 600
 colorMode(HSB, 360,100,100); //Changes color mode to HSB
  background(360,0,50); /*Sets background color
  to a dull gray*/
  plz = loadImage("plz.png");
}

void draw(){
 stageZero(); 
 platX = 200;
 platY = 278;
 platZero();
 platX = 563;
 platY = 234;
 platZero();
}