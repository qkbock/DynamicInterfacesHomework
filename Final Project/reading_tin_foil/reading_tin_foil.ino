  boolean twoOn;
  boolean threeOn;
  boolean twelveOn;
  boolean thirteenOn;

void setup(){
  Serial.begin(9600);
  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  pinMode(12, INPUT_PULLUP);
  pinMode(13, INPUT_PULLUP);
}

void loop(){
  int read2 = digitalRead(2);
  int read3 = digitalRead(3);
  int read12 = digitalRead(12);
  int read13 = digitalRead(13);
  
  if (read2 == HIGH) { twoOn = false; } else { twoOn = true; }
  if (read3 == HIGH) { threeOn = false; } else { threeOn = true; }
  if (read12 == HIGH) { twelveOn = false; } else { twelveOn = true; }
  if (read13 == HIGH) { thirteenOn = false; } else { thirteenOn = true; }

  if (twoOn) { Serial.print("2"); Serial.print('*'); }
  if (threeOn) { Serial.print("3"); Serial.print('*');}
  if (twelveOn) { Serial.print("12"); Serial.print('*');}
  if (thirteenOn) { Serial.print("13"); Serial.print('*');}

  delay(500);
}



