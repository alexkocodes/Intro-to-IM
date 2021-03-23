
const int REDLED = 3;
const int BLUELED  = 4;
const int YELLOWLED  = 6;
const int GREENLED = 8;
const int REDSWITCH = 2;
const int BLUESWITCH = 5;
const int YELLOWSWITCH = 7;
const int GREENSWITCH = 9;
int caught = 0;
int led[] = {3, 4, 6, 8};
int buttons[] = {2, 5, 7, 9};
int interval = random(1000, 5000);
int chosen = random(0, 4);
int duration  = random(500, 1000);
unsigned long current = millis(); // current time
bool start = true;
int game_round = 0;
bool light_caught = false;
bool blinked = false;
bool all = false;
void blink(){
  digitalWrite(REDLED, HIGH);
  delay(100);
  digitalWrite(REDLED, LOW);
  
  digitalWrite(BLUELED, HIGH);
  delay(100);
  digitalWrite(BLUELED, LOW);
  
  digitalWrite(YELLOWLED, HIGH);
  delay(100);
  digitalWrite(YELLOWLED, LOW);
  
  digitalWrite(GREENLED, HIGH);
  delay(100);
  digitalWrite(GREENLED, LOW);

  delay(200);
  
}
void allOn(){
  for(int i=0; i<4; i++){
    digitalWrite(led[i], HIGH);
  }
  delay(500);
  for(int i=0; i<4; i++){
    digitalWrite(led[i], LOW);
  }
  delay(500);
}



void setup() {
  Serial.begin(9600);
  pinMode(REDLED, OUTPUT);
  pinMode(BLUELED, OUTPUT);
  pinMode(YELLOWLED, OUTPUT);
  pinMode(GREENLED, OUTPUT);
  randomSeed(analogRead(0));
}

void loop() {

  if(all == false){
    allOn();
    allOn();
    all = true;
    delay(1500);
  }
  
  if(start==true){

    if(light_caught == false){
      digitalWrite(led[chosen], HIGH);
    }
    
    if(digitalRead(buttons[chosen])==HIGH and digitalRead(led[chosen]) == 1){
      if(light_caught == false){
        caught+=1;
        light_caught = true;
        Serial.println(caught);
        game_round += 1;
      }
      digitalWrite(led[chosen], LOW);
    }
    if((millis() - current) >= duration)
    { 
      digitalWrite(led[chosen], LOW); 
      delay(interval);  
      current = millis();
      game_round += 1;
      light_caught = false;
      interval = random(1000, 5000);
      chosen = random(0, 4);
      duration  = random(200, 500);
        
    } 
    
    
  }

  if(game_round == 20){
    start = false;
    if(caught==10){
      blink();
      blink();
      Serial.println("You win!");
      game_round = 0;
    }
    else{
       Serial.print("You caught ");
       Serial.print(caught);
       Serial.println(" lights!");
       game_round = 0;
    }

  }


}
  
