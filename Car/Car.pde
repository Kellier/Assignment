void setup()
{
  size(500, 500);
  car = new Drive();
}

Drive car;

void draw()
{
  background(0);
  
  car.move();
  car.vehicle();
}
