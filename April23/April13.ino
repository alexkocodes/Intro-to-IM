int red = 0;
int blue = 0;
int yellow = 0;
int green = 0;

const int REDLED = 3;
const int BLUELED = 5;
const int YELLOWLED = 7;
const int GREENLED = 8;


void setup() {
  Serial.begin(9600);
  Serial.println("0,0");
  pinMode(3, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
}

void loop() {
  while (Serial.available()) {
    red = Serial.parseInt();
    blue = Serial.parseInt();
    yellow = Serial.parseInt();
    green = Serial.parseInt();
    
    if (Serial.read() == '\n') {
      digitalWrite(REDLED, red);
      digitalWrite(BLUELED, blue);
      digitalWrite(YELLOWLED, yellow);
      digitalWrite(GREENLED, green);
      int sensor = analogRead(A0);
      delay(1);
      Serial.println(sensor);
    }
  }
}

/*
import processing.serial.*;
Serial myPort;
int xPos=0;
int yPos=0;
boolean onOff=false;
boolean onOff2=false;
void setup(){
  size(960,720);
  printArray(Serial.list());
  String portname=Serial.list()[1];
  println(portname);
  myPort = new Serial(this,portname,9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}
void draw(){
  background(255);
  ellipse(xPos,yPos,30,30);
  if (mousePressed){
    if(mouseX<=width/2)
      onOff2=true;
    else
      onOff=true;
  }else{
    onOff=onOff2=false;
  }
}
void serialEvent(Serial myPort){
  String s=myPort.readStringUntil('\n');
  s=trim(s);
  if (s!=null){
    println(s);
    int values[]=int(split(s,','));
    if (values.length==2){
      xPos=(int)map(values[0],0,1023,0, width);
      yPos=(int)map(values[1],0,1023,0, height);
    }
  }
  myPort.write(int(onOff)+","+int(onOff2)+"\n");
}
 */
