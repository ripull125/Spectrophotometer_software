//YWROBOT
//Compatible with the Arduino IDE 1.0
//Library version:1.1
#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27,20,4);  // set the LCD address to 0x27 for a 16 chars and 2 line display

void setup() {
 Serial.begin(9600); 
  pinMode(2,OUTPUT); 
  pinMode(3,OUTPUT); 
  pinMode(4,OUTPUT); 
  pinMode(7,OUTPUT);
}


void loop()
{
  lcd.init();                      // initialize the lcd 
  lcd.init();
  // Print a message to the LCD.
  lcd.backlight();
  lcd.setCursor(2,0);
 
  lcd.print("a = 34.23");
  lcd.setCursor(2,1);
digitalWrite (7, HIGH);
delay (1000);
digitalWrite (7, LOW);
  lcd.print("b = 54.3");
   lcd.setCursor(2,2);
   digitalWrite (7, HIGH);
delay (1000);
digitalWrite (7, LOW);
  lcd.print("r2 = 0.956");
delay (1000);
digitalWrite (7, HIGH);
delay (2000);
digitalWrite (7, LOW);

}


  


//1. Work: declare float variables a, b, r2 and 34.23, 54.3, 0.956, respectively, desplay on LCD...

//And, make sound beep!
//2.Make the stepper moter turn 180 back and forth
//3.Pick up an obstacle sensor work: Sense something and beep!


