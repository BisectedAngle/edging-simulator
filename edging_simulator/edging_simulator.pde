PImage pic;

void setup() {
  frameRate(60);
  fullScreen();
  background(200);
  noLoop();
  textSize(150);
  textAlign(CENTER);
  fill(0);
  text("EDGING SIMULATOR", width/2, height/2);
  textSize(80);
  pic = loadImage("stop.jpg");}

String stage = "start";
float angle = 230;
int count = 0;
int countsec = 0;
String edgingmessage = "";

void draw(){
  loop();
  //print("X:",str(mouseX),"Y:",str(mouseY));
  if (stage == "start"){
   if(mouseX <= 1045 && mouseX >= 870 && mouseY >= 610 && mouseY <= 690){
     fill(150);
     text("PLAY", width/2, height/2+150);}
   else{
     fill(0);
     text("PLAY", width/2, height/2+150);}}
  
  if(stage == "play"){
    fill(200);
    rect(0,0, width, height);
    rectMode(CORNERS);
    fill(0);
    
    translate(width, height);
    rotate(radians(angle));
    rectMode(CORNERS);
    rect(0, 0, 1500, 100);
    angle -= 1;  
    
    count += 1;
    
    translate(width/3, height/4);
    rotate(radians(180));
    textAlign(LEFT);
    textSize(100);
    fill(255,0,0);
    text(countsec, 0, 0);
    
    if(count % 60 == 0){
     countsec = count/60;}
   
    
    if(angle == 180 || angle == 230){
      stage = "FAILED TO EDGE";}
  }
  
  if(stage == "FAILED TO EDGE"){
    background(200);
    textSize(150);
    pic.resize(width, height);
    image(pic, 0, 0);
    textAlign(CENTER);
    fill(0);
    text("YOU HAVE FAILED TO EDGE", width/2, height/2);
    edgingmessage = "EDGING SCORE: " + str(countsec);
    textSize(80);
    text(edgingmessage, width/2, height/2+100);
    
    if(mouseX <= 1175 && mouseX >= 740 && mouseY >= 660 && mouseY <= 740){
     fill(150);
     text("EDGE AGAIN?", width/2, height/2+200);}
    else{
     fill(0);
     text("EDGE AGAIN?", width/2, height/2+200);}
    }
 
}

void mouseClicked(){
  if (stage == "start"){
   if(mouseX <= 1045 && mouseX >= 870 && mouseY >= 610 && mouseY <= 690){
     fill(200);
     rect(0,0, width, height);
     angle = 230;   
     stage = "play";
   }
    }
  if(stage == "FAILED TO EDGE"){
    if(mouseX <= 1175 && mouseX >= 740 && mouseY >= 660 && mouseY <= 740){
      angle = 230;
      count = 0;
      countsec = 0;
      stage = "play";}}}
 


void keyPressed(){
  angle += 7;}
