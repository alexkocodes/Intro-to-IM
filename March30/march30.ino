
int yellow = 3;  //analogRead          
int blue = 5;   //analogRead
int green = 7;  //digitalRead

int LDR = A2;
int SWITCH = A3;
int sensorValue;

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


  if(digitalRead(SWITCH)==HIGH){
    digitalWrite(green, HIGH);
  }
  else{
    digitalWrite(green, LOW);
  }
  
  
  

  
  
 
}
