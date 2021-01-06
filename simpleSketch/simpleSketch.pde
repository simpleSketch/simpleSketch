int color_selection = 0;
float thickness = 1.0;
float increment = 0.5;
float min_thick = 0.0;
float max_thick = 4.0;

void setup() {
  size(640, 360);
  background(255);
}

void draw() {
  strokeWeight(thickness);
  if (color_selection == 0){
    stroke(0);
  }
  if (color_selection == 1){
    stroke(255,0,0);
  }
  if (color_selection == 2){
    stroke(255, 166, 0);
  }
  if (color_selection == 3){
    stroke(255, 255, 0);
  }
  if (color_selection == 4){
    stroke(0, 255, 0);
  }
  if (color_selection == 5){
    stroke(0, 0, 255);
  }
  if (color_selection == 6){
    stroke(166, 0, 255);
  }
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

/*
KEYS:

SPACE = CLEAR
R = RED
O = ORANGE
Y = YELLOW
G = GREEN
B = BLUE
P = PURPLE
L = BLACK
UP = HIGHER THICKNESS
DOWN = LOWER THICKNESS

COLORS BY NUM:
0 = BLACK
1 = RED
2 = ORANGE
3 = YELLOW
4 = GREEN
5 = BLUE
6 = PURPLE

*/


void keyPressed(){
  if(key == ' '){
    background(255);
    println("Screen cleared");
  }
  if(key == 'L' || key == 'l'){
    color_selection = 0;
    println("Color is now black");
  }
  if(key == 'R' || key == 'r'){
    color_selection = 1;
    println("Color is now red");
  }
  if(key == 'O' || key == 'o'){
    color_selection = 2;
    println("Color is now orange");
  }
  if(key == 'Y' || key == 'y'){
    color_selection = 3;
    println("Color is now yellow");
  }
  if(key == 'G' || key == 'g'){
    color_selection = 4;
    println("Color is now green");
  }
  if(key == 'B' || key == 'b'){
    color_selection = 5;
    println("Color is now blue");
  }
  if(key == 'P' || key == 'p'){
    color_selection = 6;
    println("Color is now purple");
  }
  if(keyCode == UP){
    if (thickness < max_thick){
      thickness += increment;
      println("Thickness now ", thickness);
    }
  }
  if(keyCode == DOWN){
    if (thickness > min_thick){
      thickness -= increment;
      println("Thickness now ", thickness);
    }
  }
}
