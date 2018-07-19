class Pillar {

  float x;
  float w = 50;
  float gap = 100;
  float y1;
  float y2;
  float speed = 2;
  boolean remove = false;

  Pillar() {
    x = 900;
    y1 = random(gap, height-2*gap);
    y2 = y1+gap;
  }

  void update(){
    x -= speed;
    if (x < -w){
      remove = true;
    }
  }

  void show() {
    fill(255);
    rect(x, 0, w, y1);
    rect(x,y2,w,height-y2);
  }
}