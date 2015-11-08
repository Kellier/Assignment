PImage img1, img2;

void setup()
{
  size(500, 500);
  
  PImage img;
  img = loadImage("Back.jpg");
  img1 = loadImage("keys.jpg");
  img2 = loadImage("drink.jpg");
  background(img);

}

void draw()
{
  image(img1, 0, 70);
  image(img2, 385, 70);
  
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("ONE 0R THE OTHER", 250, 30);
}
