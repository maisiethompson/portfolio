ArrayList <Ring> rings;
boolean dark = false;
void setup()
{
  //size(600,600);
  fullScreen();
  rectMode(CENTER);
  rings = new ArrayList<Ring>();

  for (int i = 0; i < 12; i ++)
  {
    Ring r = new Ring (189, i*300/5, random (0.5,1), random(255));
    rings.add(r);
  }
}

void draw()
{
  background(0);
  for (Ring r : rings)
    r.display();
}
  
class Ring
{
  float x;
  float y;
  float v;
  float c;
  
  Ring(float xIn,float yIn, float vIn, float cIn)
  {
    x = xIn;
    y = yIn;
    v = vIn;
    c = cIn;
  }
  
  void display()
  {
    x -= v;
    if (dark)
      stroke(255);
    else
     noStroke();
    pushMatrix();
    translate(width/2,height/2);
    for (int i = 0; i < 100; i ++)
    {
     if (i%2 == 0)
       fill(0);
     if (i%2 != 0 && dark == false)
       fill(255);
     else 
       fill(0);
     rotate(degrees(30));
     rect(x,y,100,50);
    }
    popMatrix();
    
    if ((x > (200-10) && x < (200+10))||
        (x < (-200+10) && x > (-200-10))||
        (x > (200/10-10) && x < (200/10+10))||
        (x < (-200/10+10) && x > (-200/10-10)))
    {
      v = -v;
    }
    
  }
}

void keyPressed()
{
  if (key == 'o')
    dark  = !dark;
}
  