import oscP5.*;
import netP5.*;

OscP5 myOscP5;
NetAddress myRemoteLocation;

PImage sky;
PImage grass;

int clicks = 0;
int enemyClicks;
float x = 20;
float enemyX = 20;
float speed = .05;
int gameState = 0;
int timer = 350;
boolean count = false;
int masterWin = 0;
int slaveWin = 0;

void setup() {
  size(1000, 469);
  myOscP5 = new OscP5(this, 30011);
  myRemoteLocation = new NetAddress("127.0.0.1", 30010);
  frameRate(60);
}

void draw() {
  background(0);
  
    fill(0, 255, 0);
    text("" + masterWin, 10, 30);
    fill(255, 0, 0);
    text("" + slaveWin, 10, 60);
    
  if (gameState == 0) {
    text(timer/60, width/2, height/2);
    if (timer <= 1) {
      gameState = 1;
    }
  }
  if (gameState == 1) {
    rect(x, 300, 20, 20);
    rect(enemyX, 350, 20, 20);
    
    OscMessage message = new OscMessage("/slave");
    message.add(clicks);
    myOscP5.send(message, myRemoteLocation);
    
    if(masterWin == 1){
      gameState = 3;
    }
    else if(slaveWin == 1){
      gameState = 2;
    }
  }
  
  if (gameState == 2) {
    fill(0, 255, 0);
    text("WIN", width/2, height/2);
  }
  if (gameState == 3) {
    fill(255, 0, 0);
    text("LOSE", width/2, height/2);
  }
}

void keyPressed() {
  if (key == ' ') {
    count = true;
  }
}

void keyReleased() {
  if (count){
    clicks++;
    count = false;
  }
}

void oscEvent(OscMessage message) {
  if (message.checkAddrPattern("/locations") == true) {
    enemyX = message.get(0).floatValue();
    x = message.get(1).floatValue();
    println(enemyX);
  }
  if (message.checkAddrPattern("/timer") == true) {
    timer = message.get(0).intValue();
  }
  if (message.checkAddrPattern("/masterWin") == true) {
    masterWin = message.get(0).intValue();
  }
  if (message.checkAddrPattern("/slaveWin") == true) {
    slaveWin = message.get(0).intValue();
  }
}

