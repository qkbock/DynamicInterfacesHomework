  boolean pin4;
  boolean pin5;
  boolean pin6;
  boolean pin7;
  boolean pin8;
  boolean pin9;
  boolean pin10;
  boolean pin11;
  boolean pin12;
  boolean pin13;
   
void setup(){
  Serial.begin(9600);
  pinMode(4, INPUT_PULLUP);
  pinMode(5, INPUT_PULLUP);
  pinMode(6, INPUT_PULLUP);
  pinMode(7, INPUT_PULLUP);
  pinMode(8, INPUT_PULLUP);
  pinMode(9, INPUT_PULLUP);
  pinMode(10, INPUT_PULLUP);
  pinMode(11, INPUT_PULLUP);
  pinMode(12, INPUT_PULLUP);
  pinMode(13, INPUT_PULLUP);
  Serial.println("setup complete");
}

void loop(){
  int read4 = digitalRead(4);
  int read5 = digitalRead(5);
  int read6 = digitalRead(6);
  int read7 = digitalRead(7);
  int read8 = digitalRead(8);
  int read9 = digitalRead(9); 
  int read10 = digitalRead(10);
  int read11 = digitalRead(11); 
  int read12 = digitalRead(12);
  int read13 = digitalRead(13);
  
  if (read4 == HIGH) { pin4 = false; } else { pin4 = true; }
  if (read5 == HIGH) { pin5 = false; } else { pin5 = true; }
  if (read6 == HIGH) { pin6 = false; } else { pin6 = true; }
  if (read7 == HIGH) { pin7 = false; } else { pin7 = true; }
  if (read8 == HIGH) { pin8 = false; } else { pin8 = true; }

  
  if (read9 == HIGH) { pin9 = false; } else { pin9 = true; }
  if (read10 == HIGH) { pin10 = false; } else { pin10 = true; }
  if (read11 == HIGH) { pin11 = false; } else { pin11 = true; }
  if (read12 == HIGH) { pin12 = false; } else { pin12 = true; }
  if (read13 == HIGH) { pin13 = false; } else { pin13 = true; }

  if (pin4 && pin9) { Serial.print("a"); Serial.print('*'); }
  if (pin4 && pin10) { Serial.print("b"); Serial.print('*'); }
  if (pin4 && pin11) { Serial.print("c"); Serial.print('*'); }
  if (pin4 && pin12) { Serial.print("d"); Serial.print('*'); }
  if (pin4 && pin13) { Serial.print("e"); Serial.print('*'); }
  
  if (pin5 && pin9) { Serial.print("f"); Serial.print('*'); }
  if (pin5 && pin10) { Serial.print("g"); Serial.print('*'); }
  if (pin5 && pin11) { Serial.print("h"); Serial.print('*'); }
  if (pin5 && pin12) { Serial.print("i"); Serial.print('*'); }
  if (pin5 && pin13) { Serial.print("j"); Serial.print('*'); }
  
  if (pin6 && pin9) { Serial.print("k"); Serial.print('*'); }
  if (pin6 && pin10) { Serial.print("l"); Serial.print('*'); }
  if (pin6 && pin11) { Serial.print("m"); Serial.print('*'); }
  if (pin6 && pin12) { Serial.print("n"); Serial.print('*'); }
  if (pin6 && pin13) { Serial.print("o"); Serial.print('*'); }
  
  if (pin7 && pin9) { Serial.print("p"); Serial.print('*'); }
  if (pin7 && pin10) { Serial.print("q"); Serial.print('*'); }
  if (pin7 && pin11) { Serial.print("r"); Serial.print('*'); }
  if (pin7 && pin12) { Serial.print("s"); Serial.print('*'); }
  if (pin7 && pin13) { Serial.print("t"); Serial.print('*'); }
  
  if (pin8 && pin9) { Serial.print("u"); Serial.print('*'); }
  if (pin8 && pin10) { Serial.print("v"); Serial.print('*'); }
  if (pin8 && pin11) { Serial.print("w"); Serial.print('*'); }
  if (pin8 && pin12) { Serial.print("x"); Serial.print('*'); }
  if (pin8 && pin13) { Serial.print("y"); Serial.print('*'); }
  
  delay(500);
}
