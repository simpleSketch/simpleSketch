int color_selection = 0;
int cap_selection = 0;

float thickness = 1.0; //default thickness (0 is minimum or the program will crash)
float increment = 0.5; //the increment by which the thickness changes by
float min_thick = 0.0; //the minimum thickness (0 is the lowest it can go or the program will crash)
float max_thick = 21.0; //the maximum thickness

BufferedReader reader;
String modifier;
int nameModifier;

void setup() {
  size(1060, 600);
  background(255);
  reader = createReader("name_modifier.txt");
  try {
    modifier = reader.readLine();
    println("Current modifier: "+modifier);
    nameModifier = int(modifier);
  }
  catch(IOException e){
    e.printStackTrace();
    exit();
  }
  
}

void draw() {
  //thickness
  strokeWeight(thickness);
  
  //color selection
  if(color_selection == 0){
    colorMode(RGB);
    stroke(0);
  }
  if(color_selection == 1){
    colorMode(RGB);
    stroke(255,0,0);
  }
  if(color_selection == 2){
    colorMode(RGB);
    stroke(255, 166, 0);
  }
  if(color_selection == 3){
    colorMode(RGB);
    stroke(255, 255, 0);
  }
  if(color_selection == 4){
    colorMode(RGB);
    stroke(0, 255, 0);
  }
  if(color_selection == 5){
    colorMode(RGB);
    stroke(0, 0, 255);
  }
  if(color_selection == 6){
    colorMode(RGB);
    stroke(166, 0, 255);
  }
  if(color_selection == 7){
    colorMode(HSB);
    stroke(frameCount % 256, 255, 255);
  }
  if(color_selection == 8){
    colorMode(RGB);
    stroke(255);
  }
  
  //cap selection
  if(cap_selection == 0){
    strokeCap(ROUND);
  }
  if(cap_selection == 1){
    strokeCap(PROJECT);
  }
  
  //draw the line
  if(mousePressed == true) {
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
M = RAINBOW (MULTI-COLOR)
E = ERASER/WHITE
UP = HIGHER THICKNESS BY NORMAL INCREMENT
DOWN = LOWER THICKNESS BY NORMAL INCREMENT
A = HIGHER THICKNESS BY 8 TIMES THE NORMAL INCREMENT
Z = LOWER THICKNESS BY 8 TIMES THE NORMAL INCREMENT
S = CHANGE CAP
CONTROL = SAVE CURRENT SKETCH

COLORS BY NUM:
0 = BLACK
1 = RED
2 = ORANGE
3 = YELLOW
4 = GREEN
5 = BLUE
6 = PURPLE
7 = RAINBOW
8 = ERASER/WHITE

STROKE CAP BY NUM:
0 = ROUND (DEFAULT)
1 = SQUARE (PROJECT CAP IN P3)
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
  if(key == 'M' || key == 'm'){
    color_selection = 7;
    println("Color is now rainbow/multi-color");
  }
  if(key == 'E' || key == 'e'){
    color_selection = 8;
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
      if (thickness <= max_thick - (increment*8)){
        thickness += (8*increment);
        println("Thickness now ", thickness);
      }
    }
  }
  if(key == 'Z' || key == 'z'){
    if (thickness > min_thick){
      if (thickness >= min_thick + (increment*8)){
        thickness -= (8*increment);
        println("Thickness now ", thickness);
      }
    }
  }
  if(key == 'S' || key == 's'){
    if(cap_selection == 0){
      cap_selection = 1;
      println("Cap is now square");
    }
    else{
      cap_selection = 0;
      println("Cap is now round");
    }
  }
  if(keyCode == CONTROL){
    PImage sketch = get();
    sketch.save("sketch"+str(nameModifier)+".jpg");
    println("Saved sketch"+str(nameModifier));
    nameModifier++;
  }
}

void dispose(){
  println("Stopping...");
  String stringName = str(nameModifier);
  String[] toSave = {stringName};
  saveStrings("name_modifier.txt", toSave);
}
