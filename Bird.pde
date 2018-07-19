class Bird {

  float y;
  float x = 100;
  float speed;
  float gravity = 0.2;
  float limit = 5;
  
  float score = 0;
  float fitness;

  boolean end = false;
  
  NeuralNetwork n;

  Bird() {
    y = height/2;
    n = new NeuralNetwork(5,4,1);
    speed = 0;
  }

  void update() {
    speed += gravity;
    if (speed > limit)
      speed = limit;
    y += speed;
    score+=0.01;
  }
  
  void show() {
    fill(255,255,255,100);
    ellipse(x, y, 32, 32);
  }
  
  void Collision(Pillar[] p) {
    for (int i=0; i<p.length; i++) {
      if ((this.x >= p[i].x && this.x <= (p[i].x+p[i].w)) && (this.y >= p[i].y2 || this.y <= p[i].y1)) {
        this.end = true;
      }
    }
    if (this.y > height || this.y < 0)
      this.end = true;
  }
  
  boolean endCondition() {
    if (this.end){
      return true;
    }
    return false;
  }
}
