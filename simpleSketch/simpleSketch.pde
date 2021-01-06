int color_selection = 0;
float thickness = 1.0;
float increment = 0.5;
float min_thick = 0.0;
float max_thick = 21.0;

void setup() {
  size(1060, 600);
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
  if (color_selection == 7){
    stroke(255);
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
E = ERASER/WHITE
UP = HIGHER THICKNESS BY NORMAL INCREMENT
DOWN = LOWER THICKNESS BY NORMAL INCREMENT
A = HIGHER THICKNESS BY 8 TIMES THE NORMAL INCREMENT
Z = LOWER THICKNESS BY 8 TIMES THE NORMAL INCREMENT

COLORS BY NUM:
0 = BLACK
1 = RED
2 = ORANGE
3 = YELLOW
4 = GREEN
5 = BLUE
6 = PURPLE
7 = ERASER/WHITE

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
  if(key == 'E' || key == 'e'){
    color_selection = 7;
    println("Color is now white/eraser");
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
  if(key == 'A' || key == 'a'){
    if (thickness < max_thick){
      if (thickness <= max_thick - 4){
        thickness += (8*increment);
        println("Thickness now ", thickness);
      }
    }
  }
  if(key == 'Z' || key == 'z'){
    if (thickness > min_thick){
      if (thickness >= min_thick + 4){
        thickness -= (8*increment);
        println("Thickness now ", thickness);
      }
    }
  }
}
