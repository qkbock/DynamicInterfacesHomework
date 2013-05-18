import ddf.minim.*;

Minim minim;
AudioPlayer player;

import processing.serial.*;
Serial myPort;
String inString;

AudioSample right;
AudioSample wrong;

PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;
PImage k;
PImage l;
PImage m;
PImage n;
PImage o;
PImage p;
PImage q;
PImage r;
PImage s;
PImage t;
PImage u;
PImage v;
PImage w;
PImage x;
PImage y;
PImage intro;

String[] letters = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y"};
String goalString = "j";
int score = 0;
int gameState = -1;
int timer = 4000;

void setup(){
  size(1800, 1200);
  inString = "";
  println(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  minim = new Minim(this);
  
  wrong = minim.loadSample("wrong.wav");
  right = minim.loadSample("right.wav");

  a = loadImage("a.png");
  b = loadImage("b.png");
  c = loadImage("c.png");
  d = loadImage("d.png");
  e = loadImage("e.png");
  f = loadImage("f.png");
  g = loadImage("g.png");
  h = loadImage("h.png");
  i = loadImage("i.png");
  j = loadImage("j.png");
  k = loadImage("k.png");
  l = loadImage("l.png");
  m = loadImage("m.png");
  n = loadImage("n.png");
  o = loadImage("o.png");
  p = loadImage("p.png");
  q = loadImage("q.png");
  r = loadImage("r.png");
  s = loadImage("s.png");
  t = loadImage("t.png");
  u = loadImage("u.png");
  v = loadImage("v.png");
  w = loadImage("w.png");
  x = loadImage("x.png");
  y = loadImage("y.png");
  intro = loadImage("intro.png");
  println("setup complete");
}

void draw(){
  if(gameState == -1){
    background(200, 200, 170);
    rect(20, 20, 20, 20);
    score = 0;
    image(intro, 0, 0);
  }
  if(gameState == 0){
    background(200, 200, 170);
    gameState = 1;
  }
  if(gameState == 1){ 
    if (inString.equals("a") == true) { background(200, 200, 170); image(a, width/3, height/4); } 
    else if (inString.equals("b") == true) { background(200, 200, 170); image(b, width/3, height/4); }   
    else if (inString.equals("c") == true) { background(200, 200, 170); image(c, width/3, height/4); }   
    else if (inString.equals("d") == true) { background(200, 200, 170); image(d, width/3, height/4); }
    else if (inString.equals("e") == true) { background(200, 200, 170); image(e, width/3, height/4); }   
    else if (inString.equals("f") == true) { background(200, 200, 170); image(f, width/3, height/4); }   
    else if (inString.equals("g") == true) { background(200, 200, 170); image(g, width/3, height/4); }
    else if (inString.equals("h") == true) { background(200, 200, 170); image(h, width/3, height/4); }   
    else if (inString.equals("i") == true) { background(200, 200, 170); image(i, width/3, height/4); }   
    else if (inString.equals("j") == true) { background(200, 200, 170); image(j, width/3, height/4); }
    else if (inString.equals("k") == true) { background(200, 200, 170); image(k, width/3, height/4); }   
    else if (inString.equals("l") == true) { background(200, 200, 170); image(l, width/3, height/4); }   
    else if (inString.equals("m") == true) { background(200, 200, 170); image(m, width/3, height/4); }
    else if (inString.equals("n") == true) { background(200, 200, 170); image(n, width/3, height/4); }   
    else if (inString.equals("o") == true) { background(200, 200, 170); image(o, width/3, height/4); }   
    else if (inString.equals("p") == true) { background(200, 200, 170); image(p, width/3, height/4); }
    else if (inString.equals("q") == true) { background(200, 200, 170); image(q, width/3, height/4); }   
    else if (inString.equals("r") == true) { background(200, 200, 170); image(r, width/3, height/4); }   
    else if (inString.equals("s") == true) { background(200, 200, 170); image(s, width/3, height/4); }
    else if (inString.equals("t") == true) { background(200, 200, 170); image(t, width/3, height/4); }   
    else if (inString.equals("u") == true) { background(200, 200, 170); image(u, width/3, height/4); }   
    else if (inString.equals("v") == true) { background(200, 200, 170); image(v, width/3, height/4); }
    else if (inString.equals("w") == true) { background(200, 200, 170); image(w, width/3, height/4); }   
    else if (inString.equals("x") == true) { background(200, 200, 170); image(x, width/3, height/4); }   
    else if (inString.equals("y") == true) { background(200, 200, 170); image(y, width/3, height/4); }
    fill(200, 200, 170);
    rect(5, 20, 30, 30);
    fill(0);
    text(timer, 10, 30); 
//    timer --; 
    if(timer <= 0){
      timer = 1000;
      gameState = 2;
    }
  }
  
  if(gameState == 2){
    drawGoal(goalString);
    drawWhatsBeingPressed(inString);
    if(inString.equals(goalString)){
      resetGoal();
      right.trigger();
      score++;
      background(200, 200, 170);
    }
//    else if(!inString.equals(goalString)){
//      wrong.trigger();
//    }
    fill(200, 200, 170);
    rect(5, 20, 30, 30);
    fill(0);
    text(timer, 10, 30);
    timer --;
    if(timer <=0){
      gameState = 3;
    }    
  }
  
  if(gameState == 3){
    background(200, 200, 170);
    text("Game Over", width/2, height/2 - 30);
    text("Score: "+score, width/2, height/2);
  }
  println(gameState);
}

void resetGoal(){
  int rand = int(random(26));
  goalString = letters[rand];
  timer = 1000;
}


void keyReleased(){
  gameState++;
  if(gameState > 3){
    gameState = 0;
  }
}


void serialEvent(Serial myPort){
  char blorp = myPort.readChar();  
  if(blorp == '*') {
    println("DONE!");
    println(inString);
    inString = "";
  }
  else {
    inString += blorp;
  }
}

void drawGoal(String goalString){
  if (goalString.equals("a") == true) { background(200, 200, 170); image(a, width/3, height/4); } 
  else if (goalString.equals("b") == true) { background(200, 200, 170); image(b, width/3, height/4); }   
  else if (goalString.equals("c") == true) { background(200, 200, 170); image(c, width/3, height/4); }   
  else if (goalString.equals("d") == true) { background(200, 200, 170); image(d, width/3, height/4); }
  else if (goalString.equals("e") == true) { background(200, 200, 170); image(e, width/3, height/4); }   
  else if (goalString.equals("f") == true) { background(200, 200, 170); image(f, width/3, height/4); }   
  else if (goalString.equals("g") == true) { background(200, 200, 170); image(g, width/3, height/4); }
  else if (goalString.equals("h") == true) { background(200, 200, 170); image(h, width/3, height/4); }   
  else if (goalString.equals("i") == true) { background(200, 200, 170); image(i, width/3, height/4); }   
  else if (goalString.equals("j") == true) { background(200, 200, 170); image(j, width/3, height/4); }
  else if (goalString.equals("k") == true) { background(200, 200, 170); image(k, width/3, height/4); }   
  else if (goalString.equals("l") == true) { background(200, 200, 170); image(l, width/3, height/4); }   
  else if (goalString.equals("m") == true) { background(200, 200, 170); image(m, width/3, height/4); }
  else if (goalString.equals("n") == true) { background(200, 200, 170); image(n, width/3, height/4); }   
  else if (goalString.equals("o") == true) { background(200, 200, 170); image(o, width/3, height/4); }   
  else if (goalString.equals("p") == true) { background(200, 200, 170); image(p, width/3, height/4); }
  else if (goalString.equals("q") == true) { background(200, 200, 170); image(q, width/3, height/4); }   
  else if (goalString.equals("r") == true) { background(200, 200, 170); image(r, width/3, height/4); }   
  else if (goalString.equals("s") == true) { background(200, 200, 170); image(s, width/3, height/4); }
  else if (goalString.equals("t") == true) { background(200, 200, 170); image(t, width/3, height/4); }   
  else if (goalString.equals("u") == true) { background(200, 200, 170); image(u, width/3, height/4); }   
  else if (goalString.equals("v") == true) { background(200, 200, 170); image(v, width/3, height/4); }
  else if (goalString.equals("w") == true) { background(200, 200, 170); image(w, width/3, height/4); }   
  else if (goalString.equals("x") == true) { background(200, 200, 170); image(x, width/3, height/4); }   
  else if (goalString.equals("y") == true) { background(200, 200, 170); image(y, width/3, height/4); }
}

void drawWhatsBeingPressed(String inString){
  if (inString.equals("a") == true) { background(200, 200, 170); image(a, 0, 0); } 
  else if (inString.equals("b") == true) { background(200, 200, 170); image(b, 0, 0); }   
  else if (inString.equals("c") == true) { background(200, 200, 170); image(c, 0, 0); }   
  else if (inString.equals("d") == true) { background(200, 200, 170); image(d, 0, 0); }
  else if (inString.equals("e") == true) { background(200, 200, 170); image(e, 0, 0); }   
  else if (inString.equals("f") == true) { background(200, 200, 170); image(f, 0, 0); }   
  else if (inString.equals("g") == true) { background(200, 200, 170); image(g, 0, 0); }
  else if (inString.equals("h") == true) { background(200, 200, 170); image(h, 0, 0); }   
  else if (inString.equals("i") == true) { background(200, 200, 170); image(i, 0, 0); }   
  else if (inString.equals("j") == true) { background(200, 200, 170); image(j, 0, 0); }
  else if (inString.equals("k") == true) { background(200, 200, 170); image(k, 0, 0); }   
  else if (inString.equals("l") == true) { background(200, 200, 170); image(l, 0, 0); }   
  else if (inString.equals("m") == true) { background(200, 200, 170); image(m, 0, 0); }
  else if (inString.equals("n") == true) { background(200, 200, 170); image(n, 0, 0); }   
  else if (inString.equals("o") == true) { background(200, 200, 170); image(o, 0, 0); }   
  else if (inString.equals("p") == true) { background(200, 200, 170); image(p, 0, 0); }
  else if (inString.equals("q") == true) { background(200, 200, 170); image(q, 0, 0); }   
  else if (inString.equals("r") == true) { background(200, 200, 170); image(r, 0, 0); }   
  else if (inString.equals("s") == true) { background(200, 200, 170); image(s, 0, 0); }
  else if (inString.equals("t") == true) { background(200, 200, 170); image(t, 0, 0); }   
  else if (inString.equals("u") == true) { background(200, 200, 170); image(u, 0, 0); }   
  else if (inString.equals("v") == true) { background(200, 200, 170); image(v, 0, 0); }
  else if (inString.equals("w") == true) { background(200, 200, 170); image(w, 0, 0); }   
  else if (inString.equals("x") == true) { background(200, 200, 170); image(x, 0, 0); }   
  else if (inString.equals("y") == true) { background(200, 200, 170); image(y, 0, 0); }

}
