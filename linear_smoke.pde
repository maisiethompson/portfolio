int nparticles = 100;
ArrayList<Particle> particles;
Particle createParticle()
{
  float lifespan = 50.5;
  int c = color (255, random (0,170), random (215, 240));
  int r = (int) random (1,10);
  //float r = 0.5;
  //PVector position = new PVector (random (0, width), 0);
  PVector position = new PVector (mouseX, mouseY);
  //PVector velocity = new PVector(random (-100, 100),random (0,100));
  PVector velocity;
  velocity = PVector.random2D();
 velocity.set(0,1);
  velocity.setMag(1);
  PVector gravity = new PVector (0,random(-0.05, -0.01));
  Particle p = new Particle (c, r, position.x, position.y, lifespan, velocity, position, gravity);
  return p;
}
void setup()
{
  //fullScreen();
  size(600,600);
  particles = new ArrayList<Particle>();

}

void draw()
{
  background(0);
    for (int i = 0; i < nparticles; i++)
  {
    Particle p = createParticle();
    particles.add(p);
  }
  int i;
  for (i = particles.size()-1; i > 0; i-- )
  {
    Particle p = particles.get(i);
    p.display();
    p.update();
    if (p.isDead())
      particles.remove(p);
  }




}

class Particle
{
  int c;
  float r;
  float startX;
  float startY;
  float lifespan;
  PVector velocity;
  PVector position;
  PVector gravity;

  Particle (int c, float r, float startX, float startY, float lifespan, PVector velocity, PVector position, PVector gravity)
  {
    this.c = c;
    this.r = r;
    this.startX = startX;
    this.startY = startY;
    this.lifespan = lifespan;
    this.velocity = velocity;
    this.position = position;
    this.gravity = gravity;
  }

  void update()
  {
    position.add(velocity);
    velocity.add(gravity);
    lifespan -=.5;
  }

  void display()
  {
    noStroke();
    fill (255, lifespan);
    ellipse(position.x, position.y, r,r);
  }

  boolean isDead()
  {
    if (lifespan <0.0)
      return true;
    else
      return false;
  }
}
