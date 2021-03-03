
import processing.sound.*;

int screen = 0;
int coin =0;
int al = 0;
int again = 0 ;
int flag1, flag2;
PImage coin_img;
PImage bomb_img;
PImage arrow1_img;
PImage arrow2_img; 
PImage arrow3_img;
PImage gameover;
PImage win_img;
PImage pengans_img;
PImage penguin_img;
PImage alert_img;
PFont mono;
PFont bonus;
PFont front;
int appear=1;
int ans_x =0;
int ans_y =0;
int ans_h =0;
int ans_w =0;
int click =0;
int change =0;
int life = 3;
int[] clr_box = {255, 222, 173};
int[] clr_text = {255, 20, 147};

int x_q6 = 270;
int y_q6 = 150;
float deltax = 0;
float deltay = 0;
boolean within=false;
int flag=1;
int win = 0 ;
int p;
int prev;
SoundFile pass, coin_sound, background, wrong, win_sound, gameover_sound;

public class Coin{
  public Coin(){
    image(coin_img, 750, 50, 100, 100);
    fill(255, 215, 0);
    textSize(70);
    textFont(mono);
    text(": "+coin, 850, 120);
  }
  
}

public class Lives{
  int self_number;
  public Lives(int number){
    
    if (screen!=0){
      fill(0);
      textSize(30);
      textFont(mono);
      self_number = number;
      alert_img = loadImage("images/alert.jpg");
      
    }
    if (al==1){
      textSize(40);
      image(alert_img,0,450,600,200);
      textFont(mono);
    }
    
    else{
      if(self_number!=0){   
        fill(255, 0, 0);
        textFont(mono);
        text("Lives:"+str(self_number),35,550);
      }
    }
  }
}

public class Button{ 
  String self_txt;
  int self_x;
  int self_y;
  int self_h;
  int self_w;
  int[] self_clr_box;
  int[] self_clr_text;
  int self_font_size;
  int self_ans;
  int self_qsn =0;
  
  Button( String txt, int x, int y, int h, int w, int[] clr_box, int[] clr_text, int font_size, int ans){
      self_txt=txt;
      self_x=x;
      self_y=y;
      self_h=h;
      self_w=w;
      self_clr_box=clr_box;
      self_clr_text=clr_text;
      self_font_size=font_size;
      self_ans=ans;
      self_qsn=0;
  }
  void display(){
    if(screen !=11){
      if (self_txt!=""){
        fill(self_clr_box[0], self_clr_box[1], self_clr_box[2]);
      }
      else{
        noFill();
      }
      noStroke();
      rect(self_x, self_y, self_w, self_h, 10);
      fill(self_clr_text[0], self_clr_text[1], self_clr_text[2]); 
    }
    if(screen==10){
      textFont(bonus);
    }
    else{
      textFont(mono);
    }
    
    if(self_txt.length() >12){
      textSize(32);
      text(self_txt, self_x+20, self_y+40);
    }
    else{
      textSize(self_font_size);
      text(self_txt,self_x+40,self_y+70);
    }
    
    if(mouseX>self_x && mouseX < self_x+self_w && mouseY>self_y && mouseY<self_y+self_h && screen!=11){
      
      
      if(self_txt!="THE ANSWER"){
        stroke(255, 255, 0);
        strokeWeight(10);
        
        fill(self_clr_box[0], self_clr_box[1], self_clr_box[2]);
        rect(self_x, self_y, self_w, self_h, 15);
        fill(self_clr_text[0], self_clr_text[1], self_clr_text[2]); 
        if(screen==10){
          textFont(bonus);
        }
        else{
          textFont(mono);
        }
        textSize(self_font_size+5);
        
        if(self_txt.length() >12){
          textSize(self_font_size+5);
          text(self_txt, self_x+40, self_y+30);
        }
        else{
          textSize(self_font_size+5);
          text(self_txt, self_x+40, self_y+70);
        }
        
        
      }
     if (flag==0){
       if(mouseX>self_x && mouseX <self_x+self_w && mouseY>self_y && mouseY <self_y+self_h){
         if (screen!=11){
           stroke(255, 20, 147);
           strokeWeight(10);
           fill(self_clr_box[0], self_clr_box[1], self_clr_box[2]);
           rect(self_x, self_y, self_w, self_h, 15);
           fill(self_clr_text[0], self_clr_text[1], self_clr_text[2]);
           textFont(mono);
           textSize(self_font_size+10);
           text(self_txt, self_x+20, self_y+70); 
         }
         if (self_ans==0){
           life-=1;
           wrong.play();
           click=0;
           flag=1;
         }
         if (self_ans==2){
           life=0;
         }
         if (self_ans==1 && screen!=10){
           screen+=1;
           pass.amp(0.5);
           pass.play();
           flag=1;
           click=0;
           if(self_txt=="Try again?"){
             again=1;
           }
           if(self_txt=="YES!!")
           {
             coin-=70;
             life+=1;
             coin_sound.amp(0.4);
             coin_sound.play();
           }
         }
         int u=0;
         if (self_txt=="WHAT DO\nYOU MEAN?" && flag==0){
            if (mouseX>230 && mouseX <270 && mouseY>390 && mouseY <430){
              click=0;
              u=1;
              screen+=1;
              pass.amp(0.5);
              pass.play();
              flag=1;
            }
            else{
              life-=1;
              click=0;
              flag=1;
            }
            
         }
         if(screen!=1 && self_ans==1 && u==1 || (screen!=1 && self_ans==1)){ //has to be double checked
           if (self_txt!="NAH"){
             coin+=10;
           }
         
         }
         if(screen==13 && self_ans==1){
           screen=0;
           life=3;
           
         }
         if(life<=0 && self_ans==1){
           screen=0; 
           life=3;
           
         }   
       }      
     }      
    }    
  }
}

public class Basic{
  PImage self_img;
  String  self_txt;
  int self_x, self_y, self_w, self_h;
  public Basic(String image_file, int x, int y, int w, int h, String txt){
    self_img = loadImage("images/"+image_file);
    self_x=x;
    self_y=y;
    self_w=w;
    self_h=h;
    self_txt=txt;
  }
  void display(){
    image(self_img, self_x, self_y, self_w, self_h);
  }
  void question(){
    fill(51, 153, 255);
    textSize(70);
    textFont(mono);
    text(self_txt, 35, 120);
  }
  
}


  
void mousePressed(){ //changes variable flag to 0 when mouse pressed
  click=1;
  flag=0;
  
}
void keyPressed(){  //specific to question 10, if key pressed is 1 then answer is correct and accordingly works
  if(keyCode==49 && screen==11){
    screen+=1;
    pass.amp(0.5);
    pass.play();
    flag=1;
    click=0;
    coin+=10;
  }
  
}
void mouseReleased(){
  flag=1;
}
void Gameover(){
  screen=0;
  coin=0;
  life=3;
}


void setup(){
  
  size(1000, 600);
  background(240, 255, 240);

  mono = loadFont("InkFree-70.vlw");
  bonus = loadFont("Serif-48.vlw");
  front = createFont("front.ttf", 25);
  coin_img=loadImage("images/coin.png");
  bomb_img=loadImage("images/bomb.png");
  arrow1_img=loadImage("images/Arrow_1.png");
  arrow2_img=loadImage("images/Arrow_2.png");
  arrow3_img=loadImage("images/Arrow_3.png");
  gameover=loadImage("images/gameover.jpg");
  win_img=loadImage("images/win.jpg");
  pengans_img = loadImage("images/pengans.png");
  penguin_img = loadImage("images/penguin.png");
  pass = new SoundFile(this, "sounds/pass.mp3");
  coin_sound =  new SoundFile(this, "sounds/coin.wav");
  background = new SoundFile(this, "sounds/background.mp3");
  wrong =  new SoundFile(this, "sounds/wrong.mp3");
  win_sound = new SoundFile(this, "sounds/win.wav");
  gameover_sound = new SoundFile(this, "sounds/gameover.wav");
}


void draw(){
  
  if(background.isPlaying()==false){
    background.play();
  }
  background(240, 255, 240);
  if (screen==0){
    //reset all the variables when restarted
    flag1=0;
    flag2=0;
    life=3;
    coin=0;
    al=0;
    again=0;
    appear=1;  
    change =0;
    x_q6 = 270;
    y_q6 = 150;
    deltax = 0;
    deltay = 0;
    within=false;
    win = 0 ;
    fill(175, 100, 220);
    textSize(80);
    textFont(mono);
    text("aN eAsY QuIZz", 230, 100);
    textFont(front);
    fill(0);
    textSize(25);
    text("Welcome to the hardest easy quiz you will ever find. Here's how you will try to beat this game:\n\n - answer each question right! Simple. \n - You have three lives initially, but you will lose one life when you answer a question wrong! \n - You get ten coins when you pass a question! \n Try not to fry your brain while playing. Good luck ;)", 190, 150, 600, 400);
    
    text("Made By Alex Ko", 800, 560 );
    int[] clr_box = {255,255,224};
    int[] clr_text = {255, 20, 147};
    Button btn = new Button("START",330, 500, 75, 300 , clr_box, clr_text,50, 1 );
    ans_x=320;
    ans_y=350;
    ans_h=75; 
    ans_w=300;
    btn.display();
  }
  if (screen==1){ // first question
 
    background(240, 255, 240);
    ans_x=150;
    ans_y=350;
    ans_h=100;
    ans_w=300;
    Basic basic = new Basic("onion.jpg",350, -10, 300, 200, "Q1: What is                ?");
    basic.display();
    basic.question();
    
    Button button3 = new Button("SHALLOTS", 150, 350, 100, 300, clr_box, clr_text, 43, 1); 
    button3.display();
    Button button1 = new Button("     28", 150, 200, 100, 300, clr_box, clr_text, 48, 0);
    button1.display();
    Button button2 = new Button("CARROT", 550, 200, 100, 300, clr_box, clr_text, 48, 0);
    button2.display();
    Button button4 = new Button("  3.14", 550, 350, 100, 300, clr_box, clr_text, 48, 0);
    button4.display();
  }
  if (screen==2){ // second question
    
    background(240, 255, 240);
    ans_x=550;
    ans_y=200;
    ans_h=100;
    ans_w=300;
    Basic basic = new Basic("abundance.png",400, -10, 200, 200, "Q2: What is                ?");
    basic.display();
    basic.question();
    
    
    
    Button button1 = new Button("CUPCAKE", 150, 200, 100, 300, clr_box, clr_text, 38, 0); 
    button1.display();
    Button button2 = new Button("ABUNDANCE", 550, 200, 100, 300, clr_box, clr_text, 38, 1);
    button2.display();
    Button button3 = new Button("FAIRY CAKE", 150, 350, 100, 300, clr_box, clr_text, 38, 0);
    button3.display();
    Button button4 = new Button("BALLET BUN", 550, 350, 100, 300, clr_box, clr_text, 38, 0);
    button4.display();
  }
  if (screen==3){ // second question
 
    background(240, 255, 240);
    ans_x=550;
    ans_y=200;
    ans_h=100;
    ans_w=300;
    textFont(mono);
    textSize(50);
    fill(51, 153, 255);
    text("Q3:   .SDRAWKCAB\nNOITSEUQ SIHT\n          REWSNA", 180, 50 );
  
    
   
    Button button1 = new Button("WELL...", 150, 200, 100, 300, clr_box, clr_text, 38, 0); 
    button1.display();
    Button button2 = new Button("K.O", 550, 200, 100, 300, clr_box, clr_text, 38, 1);
    button2.display();
    Button button3 = new Button("TENNIS ELBOW", 150, 350, 100, 300, clr_box, clr_text, 35, 0);
    button3.display();
    Button button4 = new Button("YES", 550, 350, 100, 300, clr_box, clr_text, 38, 0);
    button4.display();
  }
  
   if (screen==4){ // second question
 
    background(240, 255, 240);
    ans_x=200;
    ans_y=40;
    ans_h=100;
    ans_w=300;

  
    
    
    Button button1 = new Button("OUT OF ORDER", 150, 200, 100, 300, clr_box, clr_text, 32, 0); 
    button1.display();
    Button button2 = new Button("OUT OF ORDER", 550, 200, 100, 300, clr_box, clr_text, 32, 0);
    button2.display();
    Button button3 = new Button("OUT OF ORDER", 150, 350, 100, 300, clr_box, clr_text, 32, 0);
    button3.display();
    Button button4 = new Button("OUT OF ORDER", 550, 350, 100, 300, clr_box, clr_text, 32, 0);
    button4.display();
    // the actual answer button
    int[] clr_box_special = {240, 255, 240}; 
    int[] clr_text_special = {51, 153, 255};
    Button button5 = new Button("THE ANSWER", 240, 47, 100, 300, clr_box_special, clr_text_special, 50, 1);
    button5.display();
    textFont(mono);
    textSize(50);
    fill(51, 153, 255);
    text("Q4: CLICK", 35, 120 );
  }
  if (screen==5){
    al =1;
    
    background(0);
    fill(240, 255, 240);
    rect(0,550,300,50);
    
    textSize(80);
    textFont(mono);
    fill(255, 255, 0);
    text("Q5: Put the mouse...", 220, 250);
    text("...on here -->", 500, 400);
    
    stroke(51, 153, 255);
    noFill();
    circle(950, 380, 80);
    
    noStroke();
    fill(220, 20, 60);
    circle(950, 380, 30);
    
    if(change == 0){
      if(910 < mouseX && mouseX < 990 && 340 < mouseY && mouseY < 420){
        change=1;
      }
    }
    if (change==1){
      background(51, 153, 255);
      textSize(32);
      
      fill(0,255,0);
      circle(950, 380, 110);
      circle(10, 300, 150);
      fill(0);
      text("GO", 930, 420);
      
      fill(220, 20, 60);
      circle(950, 380, 30);
      circle(10, 300, 30);
      fill(0);
      textSize(32);
      text("NEXT", 0,210);
      
      text("QUESTION", 20, 400);
      
      
      textFont(mono);
      textSize(60);
      fill(173, 216, 235);
      
      text("DON'T TOUCH", 250, 300);
      text("THE BLUE!!", 300, 350);
      
     
      if (!(-20<mouseX && mouseX <30 && 260<mouseY && mouseY <330 || 910 < mouseX && mouseX < 1000 && 340 < mouseY && mouseY < 420 )){
        life=0;
        
      }
      else if( -10<mouseX && mouseX <30 && 270<mouseY && mouseY<320){
        screen+=1;
        flag=1;
        coin+=10;
        
        
      }
    }
    
  }
  if (screen==6){
    
    ans_x=270;
    ans_y=150;
    ans_h=70;
    ans_w=300;
    al=0;
    background(240, 255, 240);
    fill(51, 153, 255);
    textSize(60);
    text("Q6: WHAT HAPPENS IF\n       YOU P...P...PICK UP\n          ", 90, 50);
    
    
    image(penguin_img, x_q6, y_q6, 400, 70);
    
    if (x_q6!=270 && y_q6!=150){
      image(pengans_img, 180, 150, 100, 70);
      if(flag==1){
        appear=0;
      }
    }
    if(appear==0){
      Button button5 = new Button("NEXT QUESTION", 300, 150, 100, 300, clr_box, clr_text, 28, 1);
      button5.display();
    }
    Button button1 = new Button("NOTHING", 150, 280, 100, 300, clr_box, clr_text, 32, 0); 
    button1.display();
    Button button2 = new Button("IT PECKS YOUR \n FACE OFF", 550, 280, 100, 300, clr_box, clr_text, 28, 0);
    button2.display();
    Button button3 = new Button("IT FILLS \n YOUR STOMACH", 150, 400, 100, 300, clr_box, clr_text, 28, 0);
    button3.display();
    Button button4 = new Button("PENGUIN POO", 550, 400, 100, 300, clr_box, clr_text, 32, 0);
    button4.display();
    
    if (flag==0){
      
      if(x_q6< mouseX && mouseX < (x_q6+300) ){
        
        x_q6 = mouseX - 150;
        y_q6 = mouseY - 35;
        
        
      }
    }
    p=millis();
    
   
  }
  if (screen==7){
    
    background(240, 255, 240);
    int m = millis() - p;
    int seconds = m/1000;
    fill(51, 153, 255);
    textSize(60);
    text("Q7: 23 - 16 =?", 200, 100 );
    
    int starttime = 10 - seconds;
    
    if (starttime==7){
      int[] box = {240, 255, 240};
      int[] text  = {240, 255, 240};
      Button button5 = new Button("", 30, 40, 100, 100, box,  text, 35, 1);
      noStroke();
      button5.display();
    }
    if (starttime <0){
      life = 0;
    }
    fill(0);
    textSize(50);
    text(starttime, 100, 100);
    image(bomb_img, 20, 40, 80, 80);
    
    Button button1 = new Button("    4", 150, 200, 100, 300, clr_box, clr_text, 35, 0); 
    button1.display();
    Button button2 = new Button("    WALRUS", 550, 200, 100, 300, clr_box, clr_text, 35, 0);
    button2.display();
    Button button3 = new Button("I DONT KNOW", 150, 350, 100, 300, clr_box, clr_text, 35, 0);
    button3.display();
    Button button4 = new Button("All of above", 550, 350, 100, 300, clr_box, clr_text, 35, 0);
    button4.display();
    
    
  }
  if (screen==8){
    background(240, 255, 240);
    fill(51, 153, 255);
    textSize(50);
    text("Q8: What is the answer to Q2?", 40, 120 );
    
    Button button1 = new Button("This one", 150, 200, 100, 300, clr_box, clr_text, 38, 0); 
    button1.display();
    Button button2 = new Button("Or this one", 550, 200, 100, 300, clr_box, clr_text, 38, 1);
    button2.display();
    Button button3 = new Button("This?", 150, 350, 100, 300, clr_box, clr_text, 38, 0);
    button3.display();
    Button button4 = new Button("Maybe this", 550, 350, 100, 300, clr_box, clr_text, 38, 0);
    button4.display();
    
    image(arrow1_img, 700, 300, 80, 60);
    image(arrow2_img, 450, 260, 110, 80);
    image(arrow3_img, 450, 350, 100, 60);
    
  }
  if (screen==9){
    background(240, 255, 240);
    fill(255, 0, 0);
    textFont(bonus);
    textSize(60);
    text("BONUS!! Do you want to\nredeem 1 life for 60 points?", 70, 120 );
    
    Button button1 = new Button("YES!!", 150, 300, 100, 300, clr_box, clr_text, 40, 1); 
    button1.display();
    Button button2 = new Button("NAH", 550, 300, 100, 300, clr_box, clr_text, 40, 1);
    button2.display();
    
  }
  if(screen==10){
    ans_x=200;
    ans_y=400;
    ans_h=40;
    ans_w=40;
    background(240, 255, 240);
    fill(51, 153, 255);
    textFont(bonus);
    textSize(60);
    
    text("Q9: The answer is\n       a horseshoe.", 70, 90 );
    Button button1 = new Button("HOOF", 150, 200, 100, 300, clr_box, clr_text, 30, 0); 
    button1.display();
    Button button2 = new Button("A horseshoe", 550, 200, 100, 300, clr_box, clr_text, 30, 0);
    button2.display();
    Button button3 = new Button("WHAT DO\nYOU MEAN?", 150, 350, 100, 300, clr_box, clr_text, 30, 1);
    button3.display();
    Button button4 = new Button("HORSES WEAR\nSHOES??", 550, 350, 100, 300, clr_box, clr_text, 30, 0);
    button4.display();
    
    prev = millis();
    
  }
  if(screen==11){
    background(240, 255, 240);
    text("ok", 300, 350);
    
    int m = millis() - prev;
    int seconds = m /1000;
    PImage traffic = loadImage("images/traffic.png");
    fill(255,0,0);
    textFont(mono);
    textSize(80);
    
    text("Q10. QUICK!!\n PRESS ONE", 200, 90 );
    image(traffic, 0, 250, 1000, 200);
    Button button1 = new Button("", 150, 300, 100, 150, clr_box, clr_text, 50, 0); 
    button1.display();
    Button button2 = new Button("", 550, 300, 100, 150, clr_box, clr_text, 50, 0);
    button2.display();
    Button button3 = new Button("", 350, 300, 100, 150, clr_box, clr_text, 50, 0);
    button3.display();
    Button button4 = new Button("", 750, 300, 100, 150, clr_box, clr_text, 50, 0);
    button4.display();
    
    int starttime = 5 - seconds;
    
    if (starttime==7){
      int[] box = {240, 255, 240};
      int[] text  = {240, 255, 240};
      Button button5 = new Button("", 30, 40, 100, 100, box, text, 35, 1);
      noStroke();
      button5.display();
    }
    if(starttime<0){
      life=0;
    }
    fill(0);
    textSize(50);
    text(starttime, 120 , 130);
    image(bomb_img, 30, 50, 100, 100);
        
  }
  if (screen==12){ //win
    background(0);
    fill(255, 0, 0);
    textSize(50);
    text("Final Question!\nAnswer the follwing question\nwrong 4 times to win!\nQ: 23 - 16?", 50, 90 );
    int[] clr_box = {250, 0, 0};
    int[] clr_text = {255, 255, 255};
    Button button1 = new Button("7", 150, 300, 100, 300, clr_box, clr_text, 30, 2); 
    button1.display();
    Button button2 = new Button("A horseshoe", 550, 300, 100, 300, clr_box, clr_text, 30, 0);
    button2.display();
    
    if(life==4){
      win=1;
    }
  }
  
  Lives gamelife= new Lives(life);
  
  if (screen==13){
    image(win_img, 0, 0, 1000, 600);
    if(flag1==0){
      win_sound.play();
    }
    background.stop();
    flag1=1;
    int[] clr_box= {255, 0, 0};
    int[] clr_text= {255, 255, 255};
    Button restart = new Button("Restart?", 730, 500, 100, 300, clr_box, clr_text, 40, 1);
    restart.display();
    
    
  }
  if (life<=0 && screen!=13){
    background.stop();
    int[] clr_box= {255, 0, 0};
    int[] clr_text= {255, 255, 255};
    if (screen!=12 && screen!=13){
      image(gameover, 0, 0, 1000, 600);
      if(flag2==0){
        gameover_sound.play();
      }
      flag2=1;
      Button restart = new Button("Restart?", 730, 500, 100, 300, clr_box, clr_text, 40, 1);
      restart.display();
     
    }
    else if (win==1) {
      screen += 1;
    }
    else if (win==0){
      image(gameover, 0, 0, 1000, 600);
      if(flag2==0){
        gameover_sound.play();
      }
      flag2=1;
      Button restart = new Button("Restart?", 730, 500, 100, 300, clr_box, clr_text, 40, 1);
      restart.display();
     
    }
    
  }
  if (screen!=0 && screen!=13){
    Coin coin1 = new Coin();
    
    
  }
  
  
  
  
}
