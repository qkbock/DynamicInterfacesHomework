import oscP5.*;
import netP5.*;

OscP5 myOscP5;
NetAddress myRemoteLocation;

PImage countdown;
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;
PImage seven;
PImage eight;
PImage nine;
PImage ten;

PImage background;
PImage flagFinish;
PImage flagStart;
PImage poleFinish;
PImage poleStart;
PImage snailMe;
PImage snailEnemy;

int clicks = 0;
int enemyClicks;
float x = 20;
float enemyX = 20;
float speed = .05;
int gameState = 0;
int timer = 360;
int winningNumber = 100;
boolean count = false;
int masterWin = 0;
int slaveWin = 0;

void setup() {
  size(1000, 469);
  myOscP5 = new OscP5(this, 30010);
  myRemoteLocation = new NetAddress("127.0.0.1", 30011);
  frameRate(60);

  countdown = loadImage("countdown.png");
  one = loadImage("one.png"); 
  two = loadImage("two.png");
  three = loadImage("three.png");
  four = loadImage("four.png");
  five = loadImage("five.png");
  six = loadImage("six.png");
  seven = loadImage("seven.png");
  eight = loadImage("eight.png");
  nine = loadImage("nine.png");
  ten = loadImage("ten.png");
  
  background = loadImage("background.png");
  flagFinish = loadImage("flagFinish.png");
  flagStart = loadImage("flagStart.png");
  poleFinish = loadImage("poleFinish.png");
  poleStart = loadImage("poleStart.png");
  snailMe = loadImage("snail1.png");
  snailEnemy = loadImage("snail2.png");  
}

void draw() {
  background(255);

  if (gameState == 0) {
    OscMessage message = new OscMessage("/stakes");
    message.add(winningNumber);
    myOscP5.send(message, myRemoteLocation);
    
    OscMessage send = new OscMessage("/timer");
    send.add(timer);
    myOscP5.send(send, myRemoteLocation);
    timer--;
    
    image(countdown, 0, 0);
    
    if(timer > 5*60 && timer < 6*60){
      image(five, 0, 0);
    }
    if(timer > 4*60 && timer < 5*60){
      image(four, 0, 0);
    }
    if(timer > 3*60 && timer < 4*60){
      image(three, 0, 0);
    }
    if(timer > 2*60 && timer < 3*60){
      image(two, 0, 0);
    }
    if(timer > 1*60 && timer < 2*60){
      image(one, 0, 0);
    }
    
    
    if (timer < 60) {
      gameState = 1;
    }
  }
  if (gameState == 1) {
    
    image(background, 0, 0);
    
    float myGoalX = map(clicks, 0, winningNumber, 20, width-20);
    float enemyGoalX = map(enemyClicks, 0, winningNumber, 20, width-20);
    
    x += (myGoalX - x)*speed;
    enemyX += (enemyGoalX - enemyX)*speed;
    
    image(poleFinish, 0, 0);
    image(poleStart, 0, 0);
   
    image(snailMe, x, 275);
    image(snailEnemy, enemyX, 325);
    
    image(flagFinish, 0, 0);
    image(flagStart, 0, 0);
    
    OscMessage message = new OscMessage("/locations");
    message.add(x);
    message.add(enemyX);
    myOscP5.send(message, myRemoteLocation);
    
    if(clicks >= winningNumber){
      masterWin = 1;
      gameState = 2;
      OscMessage masterWinMessage = new OscMessage("/masterWin");
      masterWinMessage.add(masterWin);
      myOscP5.send(masterWinMessage, myRemoteLocation);
    }
    if(enemyClicks >= winningNumber){
      slaveWin = 1;
      gameState = 3;
      OscMessage slaveWinMessage = new OscMessage("/slaveWin");
      slaveWinMessage.add(slaveWin);
      myOscP5.send(slaveWinMessage, myRemoteLocation);
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
  if (message.checkAddrPattern("/slave") == true) {
    enemyClicks = message.get(0).intValue();
  }
}

