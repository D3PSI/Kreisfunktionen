float angle = 0;
float offset = 20;

static final int WIDTH = 1000;
static final int HEIGHT = WIDTH;

static final int r = WIDTH / 4;

ArrayList< PVector > sinGraph = new ArrayList< PVector >();
ArrayList< PVector > cosGraph = new ArrayList< PVector >();
ArrayList< PVector > tanGraph = new ArrayList< PVector >();

void setup(){

  PImage icon = loadImage("res/icon/icon.png");
  surface.setIcon(icon);
  surface.setTitle("A visualization of sin, cos and tan by D3PSI");
  size(1000, 1000);

}

void draw(){

  background(0);
  stroke(255);
  strokeWeight(1);
  ellipse(WIDTH / 2, HEIGHT / 2, WIDTH / 2, HEIGHT / 2);
  strokeWeight(1);
  line(0, HEIGHT / 2, WIDTH, HEIGHT / 2);
  line(WIDTH / 2, 0, WIDTH / 2, HEIGHT);
  line(WIDTH / 2 + r, 0, WIDTH / 2 + r, HEIGHT);
  line(0, HEIGHT / 2 + r, WIDTH, HEIGHT / 2 + r);
  line(WIDTH / 2 - r, 0, WIDTH / 2 - r, HEIGHT);
  line(0, HEIGHT / 2 - r, WIDTH, HEIGHT / 2 - r);
  stroke(255);
  strokeWeight(1);
  fill(255);
  ellipse(WIDTH / 2 + r * cos(angle), HEIGHT / 2 + r * sin(angle), 10, 10);
  stroke(255);
  strokeWeight(1);
  stroke(255, 0, 0);
  line(WIDTH / 2 + r * cos(angle), HEIGHT / 2, WIDTH / 2, HEIGHT / 2);
  stroke(0, 255, 0);
  line(WIDTH / 2, HEIGHT / 2 + r * sin(angle), WIDTH / 2, HEIGHT / 2);
  strokeWeight(1);
  stroke(23, 166, 255);
  line(WIDTH / 2, HEIGHT / 2, (WIDTH / 2) + r * cos(angle), (HEIGHT / 2) + r * sin(angle));
  strokeWeight(1);
  stroke(0, 0, 255);
  if(cos(angle) > 0) {
    
    line((WIDTH / 2) + r, HEIGHT / 2, (WIDTH / 2) + r, (HEIGHT / 2) + r * tan(angle));
    
  } else if (cos(angle) < 0){
  
    line((WIDTH / 2) - r, HEIGHT / 2, (WIDTH / 2) - r, (HEIGHT / 2) - r * tan(angle));
    
  }
  strokeWeight(1);
  stroke(255);
  
  line(WIDTH / 2, (HEIGHT / 2) + r * sin(angle), (WIDTH / 2) + r * cos(angle), (HEIGHT / 2) + r * sin(angle));
  line((WIDTH / 2) + r * cos(angle), HEIGHT / 2, (WIDTH / 2) + r * cos(angle), (HEIGHT / 2) + r * sin(angle));
  if(cos(angle) > 0) {
    
    line(WIDTH / 2, HEIGHT / 2, (WIDTH / 2) + r, (HEIGHT / 2) + r * tan(angle));
    
  } else if(cos(angle) < 0) {
  
    line(WIDTH / 2, HEIGHT / 2, (WIDTH / 2) - r, (HEIGHT / 2) - r * tan(angle));
  
  }
  
  strokeWeight(1);
  stroke(0, 255, 0);
  fill(255);
  
  sinGraph.add(0, new PVector(WIDTH / 2 - offset, HEIGHT / 2 + r * sin(angle)));
  
  for(int i = 0; i < sinGraph.size(); i++) {
    
    PVector vec = sinGraph.get(i);
    if(i + 1 < sinGraph.size()) {
      
      PVector next = sinGraph.get(i + 1);
      line(vec.x + offset, vec.y, next.x + offset, next.y);
      
    }
  
  }
  
  if(sinGraph.size() > WIDTH / 4) {
  
    sinGraph.remove(WIDTH / 4);
  
  }
 
  cosGraph.add(0, new PVector(WIDTH / 2 + r * cos(angle), HEIGHT / 2 + offset));
  
  stroke(255, 0, 0);
  
  for(int i = 0; i < cosGraph.size(); i++) {
    
    PVector vec = cosGraph.get(i);
    if(i + 1 < cosGraph.size()) {
      
      PVector next = cosGraph.get(i + 1);
      line(vec.x, vec.y - offset, next.x, next.y - offset);
      
    }
  
  }
  
  if(cosGraph.size() > HEIGHT / 4) {
  
    cosGraph.remove(HEIGHT / 4);
  
  }
    
  tanGraph.add(0, new PVector(WIDTH / 2 - offset, (HEIGHT / 2) + (r * tan(angle))));
  
  stroke(0, 0, 255);
  
  for(int i = 0; i < tanGraph.size(); i++) {
    
    PVector vec = tanGraph.get(i);
    if(i + 1 < tanGraph.size()) {
      
      PVector next = tanGraph.get(i + 1);
      if(!((vec.y < 0 && next.y > 0) || (vec.y > 0 && next.y < 0))) {
        
        line(vec.x + offset, vec.y, next.x + offset, next.y);
      
      }
      
    }
  
  }
    
  if(tanGraph.size() > WIDTH / 4) {
  
    tanGraph.remove(WIDTH / 4);
  
  }
  
  stroke(255);
  strokeWeight(1);
  
  if(cos(angle) > 0) {
    
    line(WIDTH / 2, (HEIGHT / 2) + r * tan(angle), WIDTH / 2 + r, (HEIGHT / 2) + r * tan(angle));
    
  } else if (cos(angle) < 0){
  
    line(WIDTH / 2, (HEIGHT / 2) + r * tan(angle), WIDTH / 2 - r, (HEIGHT / 2) - r * tan(angle));
    
  }
 
  fill(0);
  stroke(255);
  strokeWeight(1);
  
  angle -= 0.03;
  offset += 2;

}