int D;
int diceSize = 10;
int sum = 0;
void setup()
{
  size(4000,4000);
  noLoop();
}
void draw(){
  background(255)
  D = 100; 
  for(int y=diceSize;y<height-diceSize;y+=diceSize){
    for(int x=diceSize;x<width-diceSize;x+=diceSize){
      Die cube = new Die(x,y,diceSize);
      cube.show();
      sum += cube.number;
    }
  };
  fill(0);
  textAlign(CENTER,TOP);
  text("Sum = "+sum,width/2,5);
  System.out.print(sum);
}
void mousePressed()
{
  sum = 0;
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
    number=(int)(Math.random()*D+1);
  }
  void dot(float x, float y){
    ellipse(x+mySideLength/2+myX,y+mySideLength/2+myY,mySideLength/10,mySideLength/10);
  }
  void show()
  {
    int unit = (int)(mySideLength/4);
    roll();
    fill(255);
    rect(myX,myY,mySideLength,mySideLength);
    fill(0);
    if(number==1){
      dot(0,0);
    }
    else if(number==2){
      dot(-unit,unit);
      dot(unit,-unit);
    }
    else if(number==3){
      dot(unit,-unit);
      dot(0,0);
      dot(-unit,unit);
    }
    else if(number==4){
      dot(unit,unit);
      dot(-unit,-unit);
      dot(unit,-unit);
      dot(-unit,unit);
    }
    else if(number==5){
      dot(0,0);
      dot(unit,unit);
      dot(-unit,-unit);
      dot(unit,-unit);
      dot(-unit,unit);
    }
    else if(number==6){
      dot(-unit,unit);
      dot(-unit,0);
      dot(-unit,-unit);
      dot(unit,unit);
      dot(unit,0);
      dot(unit,-unit);
    }
    else{
      String numStr = number+"";
      float dynamicFontSize = mySideLength*0.7/(numStr.length*0.35); 
      textSize(min(dynamicFontSize, mySideLength*0.6));
      textAlign(CENTER, CENTER);
      text(numStr,myX+mySideLength/2,myY+mySideLength/2);
    }
    noFill();
  }
}
