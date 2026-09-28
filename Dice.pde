int size = 25;
int sum = 0;
void setup()
{
  size(500,500);
  noLoop();
}
void draw()
{
  for(int y=size;y<height-size;y+=size){
    for(int x=size;x<width-size;x+=size){
      Die cube = new Die(x,y,size);
      cube.show();
      sum += cube.number;
    }
  };
  fill(0);
  textAlign(CENTER,TOP);
  text("Sum = "+sum,width/2,5);
}
void mousePressed()
{
  sum = 0;
  background(255);
  redraw();
}
class Die //models one single dice cube
{
  int number;
  int myX;
  int myY;
  int mySideLength;
  Die(int x, int y, int sideLength) //constructor
  {
    myX = x;
    myY = y;
    mySideLength = sideLength;
  }
  void roll()
  {
    number=(int)(Math.random()*6);
  }
  void dot(float x, float y){
    ellipse(x+mySideLength/2+myX,y+mySideLength/2+myY,mySideLength/10,mySideLength/10);
  }
  void show()
  {
    roll();
    fill(255);
    rect(myX,myY,mySideLength,mySideLength);
    fill(0);
    if(number==1){
      dot(0,0);
    }
    else if(number==2){
      dot(,-);
      dot(-,+);
    }
    else if(number==3){
      dot(myX,myY);
      dot(0,0);
      dot(myX,myY);
    }
    else if(number==4){
      
    }
    else if(number==5){
      dot(0,0);
    }
    else if(number==6){
      
    }
    noFill();
  }
}
