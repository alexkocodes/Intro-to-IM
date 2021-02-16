//initiate variables

int n1, adj1, n2, adj2, v1, b1, adv1, adj3, n3, c1, p1;
PImage background;
PFont font, title;


//Create strings

String[] verbs = new String[99]; 
String[] bodyparts = new String[99]; 
String[] nouns = new String[99];
String[] adverbs = new String[99];
String[] places = new String[99];
String[] adjectives = new String[99];
String[] celebs = new String[99];


// Poem Format
// [noun1] is [adj1] 
// [noun2] is [adj2]
// And here I am, I [verbs1] my [bodyparts1], since it's hurting
// Thinking [adv1], where to find the [adj3] [noun3]
// Did anybody see [celebs1] in [place1] the other day? 
// Because they hit my [bodyparts1] on the streets


void setup(){
  
  //font
  font = createFont("Caveat-Bold.ttf",30);
  title = createFont("MarckScript-Regular.ttf", 40);
  size(1200, 800);
  Table table;
  table = loadTable("words.csv", "header");
  verbs = table.getStringColumn("verbs");
  nouns = table.getStringColumn("nouns");
  adverbs = table.getStringColumn("adverbs");
  bodyparts = table.getStringColumn("body parts");
  places = table.getStringColumn("places");
  adjectives = table.getStringColumn("adjectives");
  celebs = table.getStringColumn("celebs");
  
  background = loadImage("background.jpeg");
  
}
void draw(){
  background(background); 
  textAlign(CENTER, CENTER);
  number();
  textFont(title);
  fill(0,0,0);
  textSize(50);
  text("Can you understand a computer's poetic mind?", 600, 100);
  textSize(30);
  textFont(font);
  text( "My " + nouns[n1] + " are " + adjectives[adj1] +".",400, 280);
  text( "My " + nouns[n2] + " are " + adjectives[adj2] +".",400, 330);
  text( "And here I am, with my " + bodyparts[b1] + " hurting...",400, 380);
  text( "Thinking "+ adverbs[adv1] +", where to find the " + adjectives[adj3] + " " + nouns[n3] + ".",400, 450);
  text( "Did anybody see " + celebs[c1]+ " in " + places[p1] + " the other day?",400, 520);
  text( " Because they " + verbs[v1] +" my " + bodyparts[b1] +" on the streets.",400, 570);
          
  noLoop();
}

void number(){
  
  n1 = int(random(98));
  adj1 = int(random(98)); 
  n2 = int(random(98)); 
  adj2 = int(random(98)); 
  v1 = int(random(98)); 
  b1 = int(random(98)); 
  adv1 = int(random(98)); 
  adj3 = int(random(98)); 
  n3 = int(random(98)); 
  c1 = int(random(98)); 
  p1 = int(random(98)); 
}

void mouseClicked(){
  loop();
}
