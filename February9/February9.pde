
class Ripple{
  float x, y;
  int t1 = 1;
  int t2 = 1;
  int a = int(random(0, 256));
  int b = int(random(0, 256));
  int c = int(random(0, 256));
  int r1 = 1;
  int r2 = 1;
  Ripple (float xpos, float ypos){
    x = xpos;
    y = ypos; 
    
  }
  void show(){
    noFill();
    strokeWeight(3);
    stroke(a,b,c);
    for(int i=0; i<2; i++){
      circle(x,y,r1);
      r1+=t1;
      t1+=2;
    }
  }
  void noShow(){
    
    stroke(a,b,c);
    fill(255);
    for(int i=0; i<2; i++){
      circle(x,y,r2);
      r2+=t2;
      t2+=0.8;
    }
  }
  
}

Ripple[] myRippleArray = new Ripple[20];
int n = 0;
void setup(){
  smooth();
  size(600, 600);
  background(255, 255, 255);
  frameRate(10);
  
}
void draw(){
  for (int i=0; i<n; i++){
    myRippleArray[i].show();
    myRippleArray[i].noShow();
  }
  
}

void mousePressed(){
  if (n >= myRippleArray.length) {
    println("Sorry, there is no more room in the array for more emojis");
    return;
  }
  else{
    myRippleArray[n] = new Ripple(mouseX, mouseY);
    n++;
  }
}
  
  
