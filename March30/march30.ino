
int yellow = 3;  //analogRead          
int blue = 5;   //analogRead
int green = 7;  //digitalRead

int LDR = A2;
int SWITCH = A3;
int sensorValue;

void blink(){
  digitalWrite(green, HIGH);
  delay(100);
  digitalWrite(green, LOW);
  
  digitalWrite(yellow, HIGH);
  delay(100);
  digitalWrite(yellow, LOW);
  
  digitalWrite(blue, HIGH);
  delay(100);
  digitalWrite(blue, LOW);

  delay(200);
  
}

void setup() {
  pinMode(yellow, OUTPUT);
  pinMode(blue, OUTPUT);
  pinMode(green, OUTPUT);
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  
  sensorValue = analogRead(LDR);
  //Serial.println(sensorValue);
  if(sensorValue < 620){
    analogWrite(blue, 255);
    analogWrite(yellow, 0);
    
  }
  else if(sensorValue > 620 and sensorValue < 660){
    analogWrite(blue, 255);
    analogWrite(yellow, 255);
   
  }
  else if(sensorValue > 660 and sensorValue < 700){
    analogWrite(blue, 0);
    analogWrite(yellow, 255);
    
  }
  else if(sensorValue > 700 and sensorValue < 800){
    analogWrite(blue, 0);
    analogWrite(yellow, 0);
  }
  else{
    analogWrite(blue, 0);
    analogWrite(yellow, 0);
  }

  
  
  if(digitalRead(SWITCH)==HIGH and digitalRead(blue)==1 and digitalRead(yellow)==1) {
    digitalWrite(green, HIGH);
    delay(600);
    blink();
    blink();
  }
  else{
    digitalWrite(green, LOW);
  }
  
  
  

  
  
 
}
