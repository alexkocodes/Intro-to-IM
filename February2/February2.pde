int circleCenterX = 300;
int circleCenterY = 300;
int r = 10;
void setup(){
  size(600, 600);
  background(255, 255, 255);
  
}
void draw(){
  
  noFill();
  for ( int i=0; i<10; i++){
    int a = int(random(0, 256));
    int b = int(random(0, 256));
    int c = int(random(0, 256));
    stroke(a,b,c);
    circle(circleCenterX, circleCenterY, r);
    r += 30;
  }
 
  
}
void star(){
  // star
    noFill();
    push();
    translate(280, 290); // center of the star
    beginShape();
    vertex(0, -50);
    vertex(14, -20);
    vertex(47, -15);
    vertex(23, 7);
    vertex(29, 40);
    vertex(0, 25);
    vertex(-29, 40);
    vertex(-23, 7);
    vertex(-47, -15);
    vertex(-14, -20);
    endShape(CLOSE);
    translate(100, 100);
    pop();
}
