int color_selection = 0;
int cap_selection = 0;
int shape_selection = 0;

int tool_selection = 0;

float thickness = 1.0; //default thickness (0 is minimum or the program will crash)
final float increment = 0.5; //the increment by which the thickness changes by
final float min_thick = 0.0; //the minimum thickness (0 is the lowest it can go or the program will crash)
final float max_thick = 21.0; //the maximum thickness

final int spray_speed = 50;
final int spray_width = 30;
float spray_radx;
float spray_rady;
float spray_angle;
float spray_x;
float spray_y;

BufferedReader reader;
String modifier;
int nameModifier;

PImage square;
PImage circle;
PImage star;
PImage triangle;

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
  println("Loading the images...");
  square = loadImage("square.png");
  circle = loadImage("circle.png");
  star = loadImage("star.png");
  triangle = loadImage("triangle.png");
  println("Finished loading the images.");
}

void draw() {
  if(tool_selection == 0 || tool_selection == 2 || tool_selection == 3){
    if(tool_selection == 0 || tool_selection == 3){
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
    }
    
    if(tool_selection == 2){
      //thickness
      strokeWeight(thickness);
      
      //color selection
      if(color_selection == 0){
        colorMode(RGB);
        stroke(0, 50.0);
      }
      if(color_selection == 1){
        colorMode(RGB);
        stroke(255,0,0, 50.0);
      }
      if(color_selection == 2){
        colorMode(RGB);
        stroke(255, 166, 0, 50.0);
      }
      if(color_selection == 3){
        colorMode(RGB);
        stroke(255, 255, 0, 50.0);
      }
      if(color_selection == 4){
        colorMode(RGB);
        stroke(0, 255, 0, 50.0);
      }
      if(color_selection == 5){
        colorMode(RGB);
        stroke(0, 0, 255, 50.0);
      }
      if(color_selection == 6){
        colorMode(RGB);
        stroke(166, 0, 255, 50.0);
      }
      if(color_selection == 7){
        colorMode(HSB);
        stroke(frameCount % 256, 255, 255, 50.0);
      }
      if(color_selection == 8){
        colorMode(RGB);
        stroke(255);
      }
    }
    
    //cap selection
    if(cap_selection == 0){
      strokeCap(ROUND);
    }
    if(cap_selection == 1){
      strokeCap(PROJECT);
    }
    
    if(tool_selection == 0 || tool_selection == 2){
      //draw the line
      if(mousePressed) {
        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
    if(tool_selection == 3){
      if(mousePressed){
        for(int i = 0; i<spray_speed; i++){
          spray_radx = random(spray_width);
          spray_rady = random(spray_width);
          spray_angle = random(360);
          spray_x = (spray_radx*cos(radians(spray_angle)))+mouseX;
          spray_y = (spray_rady*cos(radians(spray_angle)))+mouseY;
          point(spray_x, spray_y);
        }
      }
    }
  }
  if(tool_selection == 1){
    if(mousePressed == true){
      if(shape_selection == 0){
        image(square, mouseX-125, mouseY-125);
      }
      if(shape_selection == 1){
        image(circle, mouseX-125, mouseY-125);
      }
      if(shape_selection == 2){
        image(star, mouseX-125, mouseY-125);
      }  
      if(shape_selection == 3){
        image(triangle, mouseX-125, mouseY-125);
      }
    }
  }
}

/*
KEYS:

SPACE = CLEAR
C = CYCLE THROUGH ALL THE COLORS / CYCLE THROUGH ALL THE SHAPES
B = BLACK
E = ERASER/WHITE
UP = HIGHER THICKNESS BY NORMAL INCREMENT
DOWN = LOWER THICKNESS BY NORMAL INCREMENT
A = HIGHER THICKNESS BY 8 TIMES THE NORMAL INCREMENT
Z = LOWER THICKNESS BY 8 TIMES THE NORMAL INCREMENT
S = CHANGE CAP
T = CHANGE TOOL
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

SHAPES BY NUM:
0 = SQUARE
1 = CIRCLE
2 = STAR
3 = TRIANGLE

TOOLS BY NUM:
0 = MARKER
1 = SHAPES
2 = HIGHLIGHTER
3 = SPRAY BRUSH
*/


void keyPressed(){
  if(key == ' '){
    background(255);
    println("Screen cleared");
  }
  if(key == 'B' || key == 'b'){
    if(tool_selection == 1){
      tool_selection = 0;
    }
    color_selection = 0;
    println("Color is now black");
  }
  if(key == 'C' || key == 'c'){
    if(tool_selection == 0 || tool_selection == 2 || tool_selection == 3){
      if(color_selection == 8){
        color_selection = 0;
        println("Color is now black");
      }
      else{
        color_selection++;
        if(color_selection == 1){
          println("Color is now red");
        }
        if(color_selection == 2){
          println("Color is now orange");
        }
        if(color_selection == 3){
          println("Color is now yellow");
        }
        if(color_selection == 4){
          println("Color is now green");
        }
        if(color_selection == 5){
          println("Color is now blue");
        }
        if(color_selection == 6){
          println("Color is now purple");
        }
        if(color_selection == 7){
          println("Color is now rainbow/multicolored");
        }
        if(color_selection == 8){
          println("Color is now white/eraser");
        }
      }
    }
    if(tool_selection == 1){
      if(shape_selection == 3){
        shape_selection = 0;
        println("Shape is now square");
      }
      else{
        shape_selection++;
        if(shape_selection == 1){
          println("Shape is now circle");
        }
        if(shape_selection == 2){
          println("Shape is now star");
        }
        if(shape_selection == 3){
          println("Shape is now triangle");
        }
      }
    }
  }
  if(key == 'E' || key == 'e'){
    if(tool_selection == 1){
      tool_selection = 0;
    }
    color_selection = 8;
    println("Color is now white/eraser");
  }
  if(keyCode == UP){
    if(tool_selection == 0 || tool_selection == 2){
      if (thickness < max_thick){
        thickness += increment;
        println("Thickness now ", thickness);
      }
    }
  }
  if(keyCode == DOWN){
    if(tool_selection == 0 || tool_selection == 2){
      if (thickness > min_thick){
        thickness -= increment;
        println("Thickness now ", thickness);
      }
    }
  }
  if(key == 'A' || key == 'a'){
    if(tool_selection == 0 || tool_selection == 2){
      if (thickness < max_thick){
        if (thickness <= max_thick - (increment*8)){
          thickness += (8*increment);
          println("Thickness now ", thickness);
        }
      }
    }
  }
  if(key == 'Z' || key == 'z'){
    if(tool_selection == 0 || tool_selection == 2){
      if (thickness > min_thick){
        if (thickness >= min_thick + (increment*8)){
          thickness -= (8*increment);
          println("Thickness now ", thickness);
        }
      }
    }
  }
  if(key == 'S' || key == 's'){
    if(tool_selection == 0 || tool_selection == 2){
      if(cap_selection == 0){
        cap_selection = 1;
        println("Cap is now square");
      }
      else{
        cap_selection = 0;
        println("Cap is now round");
      }
    }
  }
  if(key == 'T' || key == 't'){
    if(tool_selection == 3){
      tool_selection = 0;
      println("Tool is now marker");
    }
    else{
      tool_selection++;
      if(tool_selection == 1){
        println("Tool is now shapes");
      }
      if(tool_selection == 2){
        println("Tool is now highlighter");
      }
      if(tool_selection == 3){
        println("Tool is now spray brush");
      }
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
