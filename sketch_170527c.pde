
import processing.serial.*;

Serial arduinoport;
String myCal = null;
int angle;
int distance;

void setup(){
  size(1200,700);
  background(0);
  arduinoport  = new Serial(this, "COM3", 9600);
}
void draw(){
  noStroke(); 
  fill(0,7);
  rect(0,0,width,height);
  
    title();
    rader();
    object();
    lines();
    texts();
  
 }


void serialEvent(Serial p){
   try{
     myCal = p.readStringUntil('.');
     if(myCal != null){
     String[] list = split(myCal,',');
     angle = int(list[0]);
     distance = int(list[1].replace(".",""));
     
     print("angle " +angle);
     println(" distance "+distance + "cm");
   
   }
   }
   catch(Exception e){
     }
   }
void texts(){
pushMatrix();
  textSize(20);
  fill(100,100,100);
  textAlign(RIGHT);
  
  text("Angle : " +angle, width*1/6,height*1/12,0);
  if(distance>30)
  text("Distance : " +0, width*1/3,height*1/12,0);
  else if(distance<=30)
  text("Distance : " +distance, width*1/3,height*1/12,0);
  
popMatrix();
}

void lines(){
 pushMatrix();
 translate(width/2,height/2);
 strokeWeight(4);
 stroke(10,10,300);
 
line(0,0,-width*3/12*cos(radians(angle)),-width*3/12*sin(radians(angle)));

 popMatrix();
}
void object(){
  pushMatrix();
  translate(width/2,height/2);
  strokeWeight(4);
 
  stroke(255,0,36);
  float d = (width*3/12/30.0) * (float)distance;
  
 if( d<width*3/12){
 ellipse(d*-cos(radians(angle)), -d*sin(radians(angle)), 15, 15);
 }
 popMatrix();
}


void rader(){
  pushMatrix();
  translate(width/2, height/2); // wonjeom i dong
  noFill();
  strokeWeight(2);
  stroke(98,245,100);
  
  arc(0,0,width*3/6, width*3/6, 0,TWO_PI);
  arc(0,0,width*2/6, width*2/6, 0,TWO_PI);
  arc(0,0,width*1/6, width*1/6, 0,TWO_PI);
  
  line(0,0,width*3/12*cos(radians(30)),- width*3/12*sin(radians(30)));
  line(0,0,width*3/12*cos(radians(60)),- width*3/12*sin(radians(60)));
  line(0,0,width*3/12*cos(radians(90)),- width*3/12*sin(radians(90)));
  line(0,0,width*3/12*cos(radians(120)),- width*3/12*sin(radians(120)));
  line(0,0,width*3/12*cos(radians(150)),- width*3/12*sin(radians(150)));
  line(0,0,width*3/12*cos(radians(180)),- width*3/12*sin(radians(180)));
  line(0,0,width*3/12*cos(radians(210)),- width*3/12*sin(radians(210)));
  line(0,0,width*3/12*cos(radians(240)),- width*3/12*sin(radians(240)));
  line(0,0,width*3/12*cos(radians(270)),- width*3/12*sin(radians(270)));
  line(0,0,width*3/12*cos(radians(300)),- width*3/12*sin(radians(300)));
  line(0,0,width*3/12*cos(radians(330)),- width*3/12*sin(radians(330)));
  line(0,0,width*3/12*cos(radians(360)),- width*3/12*sin(radians(360)));
  
  textSize(13);
  fill(200,100,100);
  textAlign(RIGHT);
  
  text("10cm", width*1/12,0);
  text("20cm", width*2/12,0);
  text("30cm", width*3/12,0);
  popMatrix();
}


void title(){
pushMatrix();
  


textSize(37);
fill(100,50,100);
textAlign(RIGHT);
text("Stepping Motor",width*11/12,height*2/12,0);
text("Rader Project",width*12/13,height*3/12,0);

popMatrix();
}






 