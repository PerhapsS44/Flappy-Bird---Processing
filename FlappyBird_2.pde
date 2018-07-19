Pillar[] p = new Pillar[3];
int l = 100;
Bird[] birds = new Bird[l];
Bird[] tempb = new Bird[l];
boolean end = false;

void setup() {
  size(600, 400);
  for (int i=0; i<p.length; i++) {
    p[i] = new Pillar();
    if (i > 0) {
      p[i].x += (i)* 300;
    }
  }
  for (int i=0; i<birds.length; i++)
    birds[i] = new Bird();
}

void draw() {
  for (int i=0; i<p.length; i++) {
    p[i].update();
    if (p[i].remove) {
      removePillar();
    }
  }
  for (int i=0; i<birds.length; i++) {
    birds[i].Collision(p);
    birds[i].update();
    int I = 0;
    if (p[0].x + p[0].w < birds[i].x)
      I = 1;

    float[] inputs = new float[5];
    inputs[0] = birds[i].speed;
    inputs[1] = birds[i].y;
    inputs[2] = p[I].x-birds[i].x;
    inputs[3] = p[I].y1 - birds[i].y;
    inputs[4] = birds[i].y - p[I].y2;
    if (birds[i].n.estimate(inputs)[0] > 0.5) {
      if (birds[i].speed > 0)
        birds[i].speed = -4;
    }
    if (birds[i].endCondition()){ // TODO: delete the bird
      Bird[] t = removeBird(i);
      birds = t;
    }
  }
  if (birds.length == 0){
    NextGen();
  }



  background(0);
  for (int i=0; i<p.length; i++) {
    p[i].show();
  }
  for (int i=0; i<birds.length; i++)
    birds[i].show();
}


void removePillar() {
  for (int i=1; i<p.length; i++) {
    p[i-1] = p[i];
  }
  p[p.length-1] = new Pillar();
}

Bird[] removeBird(int I) {
  Bird[] t = new Bird[birds.length-1];
  for(int i=0;i<I;i++)
    t[i] = birds[i];
  for (int i = I; i < birds.length - 1; i++) {
    t[i] = birds[i+1];
  }
  return t;
}

void NextGen(){
  //////////////////////New Birds/////////////////////
  birds = new Bird[l];
  for (int i=0; i<birds.length; i++)
    birds[i] = new Bird();
  for (int i=0; i<p.length; i++) {
    p[i] = new Pillar();
    if (i > 0) {
      p[i].x += (i)* 300;
    }
  }
  reproduce();
  mutate();
  
  
}

void reproduce(){
  
}

void mutate(){
  
}
