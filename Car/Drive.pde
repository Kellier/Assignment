class Drive
{
  PVector pos;
  PVector forward;
  float theta;
  float a = 245.0f;
  float b = 245.0f;
  float rad = 15.0f;
  float speed = 5.0f;
  
  Drive(float x, float y, float w)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.a = a;
    this.b = b;
    theta = 0.0f;
  }
  
  Drive()
  {
    this(width * 0.5f, height * 0.5f, 50);
  }
  
  void move()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    
    forward.mult(speed);
    
    if(keyPressed)
    {
      if(key == 'w')
      {
        pos.add(forward);
      }
      if(key == 'a')
      {
        theta -= 0.1f;
      }
      if(key == 'd')
      {
        theta += 0.1f;
      }
    }
  }
    
  void vehicle()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    stroke(255);
    line(a, b, a + 30, b);
    line(a, b, a - 20, b + 20);
    line(a + 30, b, a + 50, b + 20);
    line(a - 20, b + 20, a - 30, b + 20);
    line(a + 50, b + 20, a + 60, b + 20);
    line(a - 30, b + 20, a - 30, b + 30);
    line(a + 60, b + 20, a + 60, b + 30);
    line(a - 30, b + 30, a - 20, b + 30);
    line(a + 60, b + 30, a + 50, b + 30);
    line(a, b + 30, a + 30, b + 30);
    ellipse(a - 10, b + 30, rad, rad);
    ellipse(a + 40, b + 30, rad, rad);
    popMatrix();
   }
}
