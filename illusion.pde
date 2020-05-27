ArrayList<Square> squares;
boolean c = true;
boolean inverted = false;
boolean r = true;
float speed = 0.00005;
boolean dark = false;
float x;
void setup()
{
  //size (800,800);
  x = 15;
  fullScreen();
  rectMode(CENTER);
  squares = new ArrayList<Square>();
  for (float i = width/x; i > 0; i --)
  {
    Square s = new Square(i *10,c);
    squares.add(s);
    c = !c;
  }
}

void draw()
{
  background(0);
  
  println(x);
  for (Square s : squares)
    s.display();
}

class Square
{
  float s;
  boolean c;
  float rotate = 0;
  
  Square(float s, boolean c)
  {
    this.s = s;
    this.c = c;
  }
  
  void display()
  {
    if (dark)
      stroke(255);
    else
      noStroke();
    rotate += s* speed;
    pushMatrix();
    translate(width/2, height/2);
    if (r)
      rotate(rotate);
    if (r == false)
      rotate(-rotate);
    if (c && dark == false)
      fill(255);
    else
      fill(0);
    rect(0,0,s,s);
    popMatrix();
    
    if (inverted)
      c = !c;
    
  }
}

  void keyPressed()
{
  if (key == ' ')
    inverted = !inverted; 
  if (key == 's')
    speed += 0.0001;
  if (key == 'd')
    speed -= 0.0001;
  if (key == 'r')
    r = !r;
  if (key == 'o')
    dark = !dark;
  if (key == 'q')
    speed = 0.00005;
  

}