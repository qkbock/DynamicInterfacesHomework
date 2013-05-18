import processing.serial.*;

Serial myPort;
int val;
String inString;

int stupid = 0;

void setup(){
  size(200, 200);
  
  inString = "";
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw(){
//  if ( myPort.available() > 0) {
//    val = myPort.read();     
//  }
  
  background(255);
  if (inString.equals("2") == true) { fill(255, 0, 0); } 
    else if (inString.equals("3") == true) { fill(0, 255, 0); }   
    else if (inString.equals("12") == true) { fill(0, 0, 255); }   
    else if (inString.equals("13") == true) { fill(0); }
    rect(50, 50, 100, 100);


}

void serialEvent(Serial myPort){
  char blorp = myPort.readChar();
//  if(blorp == null) return;
  
  if(blorp == '*') {
    println("DONE!");
    println(inString);
    inString = "";
  }
  else {
    inString += blorp;
  }
  
    

}
