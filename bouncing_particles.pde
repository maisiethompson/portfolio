int nparticles = 50;
ArrayList<Particle> particles;

Particle createParticle()
{
 // int c = color (255, random (0,170), random (215, 240));
 int c = 255;
  int r = (int) random (3,10);
  PVector position = new PVector (random (r, width-r), random (r, height-r));
  PVector velocity = PVector.random2D();
//  PVector velocity = new PVector (0,0);
  velocity.setMag(1);
  PVector gravity = new PVector (0,random(0.1, 0.3));
  Particle p = new Particle (c, r, position.x, position.y, velocity, position, gravity);
  return p;
}
void setup()
{
  background(0);
  //fullScreen();
  size(600,600);
  particles = new ArrayList<Particle>();
  for (int i = 0; i < nparticles; i++)
  {
    Particle p = createParticle();
    particles.add(p);
  }
}

void draw()
{
 // background(255);
  for (Particle p : particles)
  {
    p.display();
    p.update();
  }
}

class Particle
{
  int c;
  float r;
  float startX;
  float startY;
  PVector velocity;
  PVector position;
  PVector gravity;

  Particle (int c, float r, float startX, float startY, PVector velocity, PVector position, PVector gravity)
  {
    this.c = c;
    this.r = r;
    this.startX = startX;
    this.startY = startY;
    this.velocity = velocity;
    this.position = position;
    this.gravity = gravity;
  }

  void update()
  {
    position.add(velocity);
    velocity.add(gravity);
  }

  void display()
  {

    noStroke();
    fill (c);
    ellipse(position.x, position.y, r,r);
    if (position.x < r/2 || position.x > width-r/2)
    {
      velocity.x = -velocity.x;
      update();
      if (position.y < height)
      {
         velocity.mult(0.95);
      }
    }

    if (position.y < r/2 || position.y > height - r/2)
    {
      velocity.y = -velocity.y;
      update();
      if (position.y < height)
      {
         velocity.mult(0.95);
      }
    }
  }
}
