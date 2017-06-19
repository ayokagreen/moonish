/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/68154*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int radius = 900;  

/*Create the arrays for x position and y position of points around our circle */
float [] xPos = new float [360];  
float [] yPos = new float [360];
color randomColor = color(random(255),random(255),random(255));


void setup() {       
  size(2000, 2000);      
  smooth();          
  background(20);  
noFill();  
  randomColor = color(random(255),random(255),random(255));

  /*Fill the arrays with coordinates around circle using cosine and sine */
  for (int i = 0; i < 360; i++) {
    float angle = radians(i);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
  }
  
}

void draw() {  
  strokeWeight(2);  
  translate(width/2, height/2); // Move origin to middle of canvas. 

  for (int i = 0; i < 360; i++) {
    stroke(randomColor, random(40, 80));  //randomize color of lines
    int random1= (int)random(359); //choose random coordinates for point A
    int random2= (int)random(359); //choose random coordinates for point B
    int random3= (int)random(359); //choose random coordinates for control point 1
    int random4= (int)random(359); //choose random coordinates for control point 2

    //line(xPos[random1], yPos[random1], xPos[random2], yPos[random2]); //draw line from point A to point B
    //bezier(xPos[random1], yPos[random1], xPos[random3], yPos[random3], xPos[random4], yPos[random4], xPos[random2], yPos[random2]);
    bezier(xPos[random1], yPos[random1], random(width), random(height), random(width), random(height), xPos[random2], yPos[random2]);

  }
  stroke(20);
  noFill();
  strokeWeight(550);
  ellipse(0, 0, radius*2+450, radius*2+450);
  noLoop();
  
}

void mousePressed()
{

  loop();
}


/*------------------------------------*/


void keyPressed()  //save the framme when we press the letter s
{
  if (key == 's' || key =='S')
  {
    saveFrame("moonish"+timeStamp()+".tiff");
  } else if (key == 'r' || key =='R')
  {
    background(20);
    randomColor = color(random(255),random(255),random(255));
    redraw();
  }
}

long timeStamp() {
  long timestamp = System.currentTimeMillis();
  return timestamp;
}

