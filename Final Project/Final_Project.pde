import processing.serial.*;
import processing.sound.*;

SoundFile duck;
SoundFile bg;
SoundFile newHigh;
SoundFile pop;
Serial myPort;
PVector position1;
PVector position2;
PVector fingerp;
int distance;
int redswitch;
int blueswitch;
float g = 5;
PImage bird;
PImage bird2;
PImage bird3;
PImage background;
PImage topPipe;
PImage btmPipe;
PImage title;
PImage spacebar;
PImage finger;
PImage over;
PFont game;
int jump = 5;
int x1 = 0;
int x2 = 1000;
int progress;
IntList pipeX, pipeY;
int current = 0;
int current_finger = 0;
int prev, time, overTime;
int speed = 3;
int gap;
int difficulty = 1;
int sensor;
String second_bird = "red";

boolean direction = false; // going down
boolean shake = false; 
boolean gameover = false;
boolean start = false;
boolean played = false;
boolean pop_played1 = false;
boolean pop_played2 = false;
boolean newHigh_played = false;


Table table;
String[] score;

void setup(){
  size(1000,640);
  printArray(Serial.list());
  String portname=Serial.list()[2];
  println(portname);
  myPort = new Serial(this,portname,9600);
  myPort.clear();
  myPort.bufferUntil('\n');
  pipeX = new IntList();
  pipeY= new IntList();
  
  
  distance = height/2;
  position1 = new PVector(width/5 + 40, height/2);
  position2 = new PVector(width/5 - 80 , height/2);
  fingerp = new PVector(600, 360);
  
  // load all the image files
  bird = loadImage("images/flappy.png");
  bird2 = loadImage("images/bird2.png");
  bird3 = loadImage("images/bird3.png");
  background = loadImage("images/forest.jpg");
  topPipe = loadImage("images/top.png");
  btmPipe = loadImage("images/bottom.png");
  title = loadImage("images/title.png");
  spacebar = loadImage("images/spacebar.png");
  finger = loadImage("images/finger.png");
  over = loadImage("images/gameover.png");
  
  // load all the font files
  game = createFont("fonts/ARCADECLASSIC.TTF", 32);
  
  // load all the sound files
  duck = new SoundFile(this, "sounds/duck.mp3");
  //bg = new SoundFile(this, "sounds/bg.mp3");
  newHigh = new SoundFile(this, "sounds/newHigh.wav");
  pop = new SoundFile(this, "sounds/pop.mp3");
  
  //load the csv file
  table = loadTable("best score.csv", "header");
  score = table.getStringColumn("Best Score");
  println(score[0]);
  generate_pipe();
  
}
void draw(){
  /*
  if(bg.isPlaying() == false){
    bg.play();
  }
  */
  movebg(background);
  image(bird, position1.x, position1.y, 70, 50);
  
  if(difficulty == 2){
    if(blueswitch == 1 && start == false){
      second_bird = "blue";
    }
    else if(redswitch == 1 && start == false){
      second_bird = "red";
    }
    if(second_bird == "red"){
      image(bird2, position2.x, position2.y, 70, 50);
    }
    else{
      image(bird3, position2.x, position2.y, 70, 50);
    }
    
    
  }
  
  if(gameover == false && start == true){ // if the game is not over and the game has started
  
    
    move_bird1(position1);
    move_pipe(position1);
    
    
    if(difficulty == 2){
      if(second_bird == "red"){
        move_bird2(position2, redswitch);
      }
      else{
        move_bird2(position2, blueswitch);
      }
      
      move_pipe(position2);
    }
    displayTime();
    overTime = millis();
    if(frameCount % 100 == 0){
      progress+=1;
      if(progress % 10 ==0){
        speed +=1;
        gap += 10;
        println(gap);
      }
    }

  }
  else if( start == false){ // if the game hasn't started, make the bird float
    
    if ( millis() - current > 1000){
      direction = !direction;
      current = millis();
    }
    if (direction==false){
      position1.y ++;
      position2.y ++;
    }
    else{
      position1.y --;
      position2.y --;
    }
    
    image(title, 400, 200, 400, 100);
    image(spacebar, 400, 200, 400, 300);
    image(finger, fingerp.x, fingerp.y, 80, 80);
    textFont(game);
    text("Try press 1 and 2!", 450, 480);
    
    if ( millis() - current_finger >= 100){
      shake = !shake;
      current_finger = millis();
    }
    if (shake==false){
      fingerp.y ++;
      
    }
    else{
      fingerp.y --;

    }
  }
  else if(gameover == true){
    if(played == false){
      duck.amp(0.5);
      duck.play();
      played = true;
    }
    move_pipe(position1);
    move_pipe(position2);
    displayOver();
  }
  
}

void serialEvent (Serial myPort){
  
    String s=myPort.readStringUntil('\n');
    s = trim(s);

    int values[] = int(split(s, ","));
    distance = values[0];
    redswitch = values[1];
    blueswitch = values[2];
    
    myPort.write("received");
}

void movebg(PImage background){
  image(background, x1, 0);
  x1--;
  if(x1 < 0){
    image(background, x2, 0);
    x2--; 
  }
  if(x1 == -width){
    x1 = x2;
    x2 = width;
  }   
}

void generate_pipe(){
  pipeX.clear();
  pipeY.clear();
  for(int i=0; i<5; i++){
    pipeX.append( width/2 + 400*i);
    pipeY.append((int)random(-600, 0));
  }
 
}

void move_pipe(PVector position){
  
    for(int i=0; i< pipeX.size(); i++){
    image(topPipe, pipeX.get(i), pipeY.get(i) + gap, 180, 600);
    image(btmPipe, pipeX.get(i), pipeY.get(i) + 750 - gap, 180, 600);
    
    pipeX.set(i, pipeX.get(i) - speed); // the speed at which the pipe will move
    
    if (pipeX.get(i) < - 600){
      pipeX.remove(i);
      pipeY.remove(i); // remove the pipe when it's out of the frame
      
      pipeX.append( pipeX.get(pipeX.size() -1) + 400);
      pipeY.append((int)random(-600, 0)); // add a new pipe to the end of the list
      
    }
    
    if((position.x + 50 >= pipeX.get(i) && position.x + 50 <pipeX.get(i) + 180)|| (position.x + 20>= pipeX.get(i) && position.x + 20 <pipeX.get(i) + 180)){
      if(position.y < pipeY.get(i) + 570  || position.y + 30 > pipeY.get(i) + 760){
        gameover = true; 
      }
    }    
  }
}  

void displayTime(){
  textFont(game);
  time = millis() - prev;
  textSize(40);
  text("Time "+time/1000, 800, 100);

}

void displayOver(){
  boolean high = false;
  if(gameover == true){
    image(over, 400, 200, 400, 100);
  }
  if(millis() - overTime >= 2000){
    
    textSize(50);
    text("Your Score is "+time/1000+" !", 430, 330);
    if(pop_played1 == false){
      pop.amp(0.5);
      pop.play();
      pop_played1 = true;
    }
  }
   if(millis() - overTime >= 3000){
     image(spacebar, 400, 220, 400, 300);
     image(finger, fingerp.x, fingerp.y, 50, 80);
     
     if(time/1000 > parseInt(score[0])){
      table.setInt(0, 0, time/1000);
      saveTable(table, "best score.csv");
      high = true;
     }
      
     if ( millis() - current_finger >= 200){
       shake = !shake;
       current_finger = millis();
     }
     if (shake==false){
       fingerp.y ++;
       
       if(high == true){   
         text("New  high  score!", 430, 500);
         if(newHigh_played == false){
          newHigh.amp(0.5);
          newHigh.play();
          newHigh_played = true;
        }
       }
       
     }
     else{
       fingerp.y --; 
     }
     
  }
  
  
}

void move_bird1(PVector position){
  if(position.y > 10 && position.y < 600){
      if(distance > 600){
        position.y += g;
        
      }
      else{
        position.y -= g-2;
        position.y -= jump;
      }
    }
    else{
      if(position.y <=10 && distance > 600){
        position.y += g;
      }
      if(position.y >=600 && distance < 600){
        position.y -= g-2;
      }
    }
}

void move_bird2(PVector position, int sensor){
  if(position.y > 10 && position.y < 600){
      if(sensor ==0){
        position.y += g;
        
      }
      else{
        position.y -= g-2;
        position.y -= jump;
      }
    }
    else{
      if(position.y <=10 && sensor == 0){
        position.y += g;
      }
      if(position.y >=600 && sensor == 1){
        position.y -= g-2;
      }
    }
}

void keyPressed(){
  if(key == ' ' && start == false){
    start = true;
    prev = millis(); // get the time when the game starts
  }
  if( key == ' ' && gameover == true){
    gameover =  false;
    start = false;
    position1.x = width/5 + 40;
    position1.y = height/2;
    position2.x = width/5 - 80;
    position2.y = height/2;
    generate_pipe();
    progress = 0;
    played = false;
    gap = 0;
    speed = 3;
  }
  if(key== '2' && start == false){
    difficulty = 2;
  }
  else if( key == '1' && start == false){
    difficulty = 1;
  }
}
