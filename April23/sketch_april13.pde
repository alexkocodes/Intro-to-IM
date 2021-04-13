PVector velocity;
PVector gravity;
PVector position;
PVector acceleration;
PVector wind;
float drag = 0.99;
float mass = 50;
float hDampening;

boolean onOffred=false;
boolean onOffblue=false;
boolean onOffyellow=false;
boolean onOffgreen=false;
import processing.serial.*;
Serial myPort;

PVector cursor;
PImage hand;

void setup() {
  size(640,360);
  noStroke();
  position = new PVector(width/2, 0);
  velocity = new PVector(0,0);
  acceleration = new PVector(0,0);
  gravity = new PVector(0, 0.5*mass);
  wind = new PVector(0,0);
  hDampening=map(mass,15,80,.98,.96);
  
  hand = loadImage("palm.png");
  cursor = new PVector (width/2, 10);
  printArray(Serial.list());
  String portname=Serial.list()[2];
  println(portname);
  myPort = new Serial(this,portname,9600);
  myPort.clear();
  myPort.bufferUntil('\n');
  
}

void draw() {
  background(255);
  image(hand, cursor.x, -20, 100, 100);
  if (!keyPressed){
    wind.x=0;
    velocity.x*=hDampening;
  }
  applyForce(wind);
  applyForce(gravity);
  velocity.add(acceleration);
  velocity.mult(drag);
  position.add(velocity);
  acceleration.mult(0);
  ellipse(position.x,position.y,mass,mass);
  
  if (position.y > height-mass/2) {
      velocity.y *= -0.9;  // A little dampening when hitting the bottom
      position.y = height-mass/2;
      if(position.x <= 160){
        onOffgreen = true;
        fill(171, 235, 198 );
      }
      else if (position.x > 160 && position.x <= 320){
        onOffyellow = true;
        fill(249, 231, 159);
      }
      else if(position.x > 320 && position.x <= 480){
        onOffblue = true;
        fill(174, 214, 241 );
      }
      else{
        onOffred = true;
        fill(245, 183, 177);
      }
      
    }
    else{
      onOffred = false;
      onOffblue = false;
      onOffyellow = false;
      onOffgreen = false;
      
    }
    
    
}
  
void applyForce(PVector force){
  // Newton's 2nd law: F = M * A
  // or A = F / M
  PVector f = PVector.div(force, mass);
  acceleration.add(f);
}

void keyPressed(){
  if (keyCode==LEFT){
    wind.x=-1;
  }
  if (keyCode==RIGHT){
    wind.x=1;
  }
  if (key==' '){
    mass=random(15,80);
    position.y=-mass;
    velocity.mult(0);
    position.x = cursor.x + 50;
  }
}

void serialEvent(Serial myPort){
  String s=myPort.readStringUntil('\n');
  s=trim(s);
  println(s);
  cursor.x = map(parseInt(s), 0, 1023, -10, width-40);
  myPort.write(int(onOffred)+","+int(onOffblue)+","+int(onOffyellow)+","+int(onOffgreen)+"\n");
}
