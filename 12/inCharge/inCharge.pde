import oscP5.*;
import netP5.*;

OscP5 myOscP5;
NetAddress myRemoteLocation;

int clicks = 0;
int enemyClicks;
int gameState = 0;
int timer = 360;
int winningNumber = 10;

void setup() {
  myOscP5 = new OscP5(this, 30010);
  myRemoteLocation = new NetAddress("127.0.0.1", 30011);
  frameRate(60);
  
  size(600, 200);
  
}

void draw() {
  background(0);
  if (gameState == 0) {
    OscMessage message = new OscMessage("/stakes");
    message.add(winningNumber);
    myOscP5.send(message, myRemoteLocation);
    
    OscMessage send = new OscMessage("/timer");
    send.add(timer);
    myOscP5.send(send, myRemoteLocation);
    timer--;
    text(timer/60, width/2, height/2);
    if (timer < 1) {
      gameState = 1;
    }
  }
  if (gameState == 1) {
    fill(0, 255, 0);
    text(clicks, 10, 30);
    fill(255, 0, 0);
    text(enemyClicks, 10, 60);

    OscMessage message = new OscMessage("/master");
    message.add(clicks);
    myOscP5.send(message, myRemoteLocation);
    if(clicks >= winningNumber){
      gameState = 2;
    }
    if(enemyClicks >= winningNumber){
      gameState = 3;
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
    clicks++;
  }
}

void oscEvent(OscMessage message) {
  if (message.checkAddrPattern("/slave") == true) {
    enemyClicks = message.get(0).intValue();
  }
}

