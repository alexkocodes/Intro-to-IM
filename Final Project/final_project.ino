const int REDSWITCH = A3;
const int BLUESWITCH = A5;
const int ldr = A0;
int sensorValue;
int red, blue;

void setup() {

  Serial.begin(9600); 
  
}
void loop() {
  
  sensorValue = analogRead(ldr);
  red = digitalRead(REDSWITCH);
  blue = digitalRead(BLUESWITCH);
  if(sensorValue>800){
    sensorValue = 800;
  }
  delay(10);
  Serial.print(sensorValue);
  Serial.print(",");
  Serial.print(red);
  Serial.print(",");
  Serial.println(blue);
}
