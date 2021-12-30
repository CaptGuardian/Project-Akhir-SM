
int numBalls=0;
float friction = -0.9;
Ball[] balls = new Ball[9];

  
void setup() {
  size(1280, 720);
  keyPressed();
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 150), i, balls);
  }
  noStroke();
  //fill(random(1,255),random(1,255),random(1,255));
  reset();
}
//untuk reset object
void reset(){
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 150), i, balls);
  }
  noStroke();
  //fill(random(1,255),random(1,255),random(1,255));
}
//untuk menampilkan sesuai key
void keyPressed(){
    if(key== '3'){
      
      numBalls = 0;
      numBalls = numBalls+3;
      reset();
  
    }
    else if(key=='4'){
      numBalls = 0;
      numBalls = numBalls+4;
      reset();
    }
    else if(key=='5'){
      numBalls = 0;
      numBalls = numBalls+5;
      reset();
    }
    else if(key=='6'){
      numBalls = 0;
      numBalls = numBalls+6;
      reset();
    }
    else if(key=='7'){
      numBalls = 0;
      numBalls = numBalls+7;
      reset();
    }
    else if(key=='8'){
      numBalls = 0;
      numBalls = numBalls+8;
      reset();
    }
    else if(key=='9'){
      numBalls = 0;
      numBalls = numBalls+9;
      reset();
    }
   
  }

void draw() {
  background(0);
  for (int i=0; i<numBalls;i++) {//memanggil fungsi object
    balls[i].collide();
    balls[i].move();
    balls[i].display();
    //ball.collide();
    //ball.move();
    //ball.display();  
  }
}

class Ball {//membuat identitas object sebagai bola
  
  float x, y;
  float r=random(1,255);
  float g=random(1,255);
  float b=random(1,255);
  float diameter;
  float vx = random(-5,5);
  float vy = random(-5,5);
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {//perulangan identitas untuk objek lebih dari satu
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {//fungsi untuk collision/tabrakan
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) ;
        float ay = (targetY - others[i].y) ;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() {//fungsi gerakan bola
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction;   
      r = random(1,255);
      g = random(1,255);
      b = random(1,255);
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
      r = random(1,255);
      g = random(1,255);
      b = random(1,255);
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
      r = random(1,255);
      g = random(1,255);
      b = random(1,255);
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
      r = random(1,255);
      g = random(1,255);
      b = random(1,255);
    }
  }
  
  void display() {
    fill(r,g,b);
    ellipse(x, y, diameter, diameter);
  }
}
