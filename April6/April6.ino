#include "pitches.h"

//song1
int melody1[] = {
  NOTE_C5, NOTE_G4, NOTE_G4, NOTE_A4, NOTE_G4, 0, NOTE_B4, NOTE_C5
};

int Durations1[] = {
  4, 8, 8, 4, 4, 4, 4, 4
};

//song2
int melody2[] = {
  NOTE_E5, NOTE_D5, NOTE_FS4, NOTE_GS4, NOTE_CS5, NOTE_B4, NOTE_D4, NOTE_E4, 
  NOTE_B4, NOTE_A4,NOTE_CS4, NOTE_E4, NOTE_A4
};

int Durations2[] = {
  8, 8, 4, 4, 8, 8, 4, 4, 8, 8, 4, 4, 2
};

//song3
int melody3[] = {
  NOTE_C5, NOTE_C5, NOTE_G5, NOTE_G5, NOTE_A5, NOTE_A5, NOTE_G5, NOTE_F5, NOTE_F5, 
  NOTE_E5, NOTE_E5, NOTE_D5, NOTE_D5, NOTE_C5
};

int Durations3[] = {
  4, 4, 4, 4, 4, 4, 2, 4, 4, 4, 4, 4, 4, 2
};

//song4
int melody4[] = {
  NOTE_F3, NOTE_C4, NOTE_F3, NOTE_G3, NOTE_A3, NOTE_AS3, NOTE_A3, NOTE_G3, NOTE_C3, NOTE_D3, 
  NOTE_E3, NOTE_F3, NOTE_G3, NOTE_A3, NOTE_AS3, NOTE_A3, NOTE_G3, NOTE_F3
};

float Durations4[] = {
  2, 2, 1, 4, 4, 2, 2, 0.8, 7, 2, 2, 2, 5, 5, 5, 2, 2, 1
};

const int greenSwitch = 4;
const int yellowSwitch = 2;
unsigned long current = millis();
float t = 1;

void setup() {
  Serial.begin(9600);
  
}

void loop() {

  
    
    int sensorValue = analogRead(A2);
    
    if ( sensorValue < 250) {
      for (int thisNote = 0; thisNote < 8; thisNote++) {
        sensorValue = analogRead(A2);
        updateT();
        if(sensorValue < 250) {
          float Duration = 1000 / Durations1[thisNote];
          Duration = Duration/t;
          tone(8, melody1[thisNote], Duration);
    
          int pauseBetweenNotes = Duration * 1.30;
          delay(pauseBetweenNotes);
        }
      }
      delay(500);
    }
    else if ( sensorValue > 250 and sensorValue < 500) {
      for (int thisNote = 0; thisNote < 14; thisNote++) {
        sensorValue = analogRead(A2);
        updateT();
        if(sensorValue > 250 and sensorValue < 500){
          float Duration = 1000 / Durations2[thisNote];
          Duration = Duration/t;
          
          tone(8, melody2[thisNote], Duration);
          
          int pauseBetweenNotes = Duration * 1.30;
          delay(pauseBetweenNotes);
        }
      }
      delay(500);
    }
    else if ( sensorValue > 500 and sensorValue < 750) {
      for (int thisNote = 0; thisNote < 15; thisNote++) {
        sensorValue = analogRead(A2);
        updateT();
        if(sensorValue > 500 and sensorValue < 750){
          float Duration = 1000 / Durations3[thisNote];
          Duration = Duration/t;
          
          tone(8, melody3[thisNote], Duration);
  
          int pauseBetweenNotes = Duration * 1.30;
          delay(pauseBetweenNotes);
        }
      }
      delay(500);
    }
    else if ( sensorValue > 750 ) {
      for (int thisNote = 0; thisNote < sizeof(melody4) ; thisNote++) {
        sensorValue = analogRead(A2);
        updateT();
        if(sensorValue > 750){
          float Duration = 800 / Durations4[thisNote];
          Duration = Duration/t;
          tone(8, melody4[thisNote], Duration);
  
          int pauseBetweenNotes = Duration * 1.30;
          delay(pauseBetweenNotes);
        }
      }
      delay(500);
    }     
}

void updateT(){
  
  if(digitalRead(greenSwitch)==HIGH and digitalRead(yellowSwitch)==LOW){
      t+=0.2;
      Serial.print("t: ");
      Serial.println(t);
    }
    
    if(digitalRead(yellowSwitch)==HIGH and digitalRead(greenSwitch)==LOW){
      t-=0.2;
      Serial.print("t: ");
      Serial.println(t);
    }
}
