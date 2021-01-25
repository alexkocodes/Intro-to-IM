int faceCenterX = width/2;
int faceCenterY = height/2;
int faceSixe = 200;

void setup() {
  size(800, 500);
  faceCenterX = width/2;
  faceCenterY = height/2;
  faceSixe = 200; 
  
}
void draw(){
  background(255, 255, 204);
  
  //face
  noStroke();
  fill(255, 229, 204);
  ellipse(faceCenterX, faceCenterY, 300,450);
  
  //eyes
  stroke(0,0,0);
  fill(255);
  ellipse(320, 190, 90, 50);
  ellipse(480, 190, 90, 50);
  fill(51,0,51);
  circle(320,190,50);
  circle(480,190,50);
  fill(160,160,160);
  circle(320,190,20);
  circle(480,190,20);
  
  
  //curve 
  strokeWeight(2);
  fill(255, 229, 204);
  bezier(faceCenterX, 290, 340, 260, 285, 350, faceCenterX, 200); //nose
  
  pushStyle();
  stroke(102,51,0);
  strokeWeight(3);
  fill(255,153,153);
  ellipse(faceCenterX,350,120,60);
  line(340,350,460,350); //lips
  popStyle();
  
  noStroke();
  fill(51,153,252);
  rect(380,30,40,90);
  triangle(350,120,faceCenterX,150,450,120);//avatar sign
}
