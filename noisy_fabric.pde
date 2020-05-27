float x1 = 0;
float y2 = 0;
float y1 = 0;
float a = 0;
float b = 0;
void setup()
{
  size (800,800);
  background(255);
}

void draw()
{
  fill(0);
  a += 0.01;
 // b += 0.002;
  x1 +=0.8;
  y1 = 0;
  y2 = noise(a)*height;
  line(x1-100,y1,x1,y2);
  ellipse(x1, y2,2,2);
  y1 = y2;
}