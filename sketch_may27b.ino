#include <Stepper.h>
int TP = 12;
int EP = 13;
#define PinA 2
#define PinB 3
#define PinC 4
#define PinD 5
int x;
void setup() {
pinMode(TP,OUTPUT);
pinMode(EP,INPUT);
Serial.begin(9600);
  pinMode(PinA,OUTPUT);
  pinMode(PinB,OUTPUT);
  pinMode(PinC,OUTPUT);
  pinMode(PinD,OUTPUT);
}
void loop() {
clockwise();
}
void clockwise(){
    x = 0;
  for(int i=0; i<360; i++){
    for(int i=0; i<4; i++){
    stepMove(3-i);
     delay(10);
    }
     x= x+1;
     Serial.print(x);
    Serial.print(",");
    Serial.print(distance());
    Serial.print(".");
    if(x>=360)
    x=0;
  }
  }
 void stepMove(int i){
  switch(i){
    case 0:
    digitalWrite(PinA,LOW);
    digitalWrite(PinB,LOW);
    digitalWrite(PinC,LOW);
    digitalWrite(PinD,HIGH);
    break;
    case 1:
    digitalWrite(PinA,LOW);
    digitalWrite(PinB,LOW);
    digitalWrite(PinC,HIGH);
    digitalWrite(PinD,LOW);
    break;
    case 2:
    digitalWrite(PinA,LOW);
    digitalWrite(PinB,HIGH);
    digitalWrite(PinC,LOW);
    digitalWrite(PinD,LOW);
    break;
    case 3:
    digitalWrite(PinA,HIGH);
    digitalWrite(PinB,LOW);
    digitalWrite(PinC,LOW);
    digitalWrite(PinD,LOW);
    break;
  }
 }


unsigned long distance(){
    unsigned long d;
  
  digitalWrite(TP,LOW);
  delayMicroseconds(2);
  digitalWrite(TP,HIGH);
  delayMicroseconds(10);
  digitalWrite(TP,LOW);

 d = pulseIn(EP,HIGH)/2*0.034; // cm

 return d;
}
