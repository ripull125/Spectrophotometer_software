//YWROBOT
//Compatible with the Arduino IDE 1.0
//Library version:1.1
#include <Keypad.h>
#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27,20,4);  // set the LCD address to 0x27 for a 16 chars and 2 line display
const byte ROWS = 4; 
const byte COLS = 4; 

char hexaKeys[ROWS][COLS] = {
  {'1', '2', '3', 'A'},
  {'4', '5', '6', 'B'},
  {'7', '8', '9', 'C'},
  {'*', '0', '#', 'D'}
};


byte rowPins[ROWS] = {9, 8, 7, 6}; 
byte colPins[COLS] = {5, 4, 3, 2}; 

Keypad customKeypad = Keypad(makeKeymap(hexaKeys), rowPins, colPins, ROWS, COLS); 

void setup() {
 Serial.begin(9600); 
  pinMode(2,OUTPUT); 
  pinMode(3,OUTPUT); 
  pinMode(4,OUTPUT); 
  pinMode(7,OUTPUT);

int sr[16];
int sg[16];
int sb[16];
int sw[16];

  // for(int i = 0; i < 6; i++){
  //   setColor(255, 0, 0); // LED color to RED
  //   sr[i] = anaglogRead(A0);
  //   delay(100);
  //     setColor(0, 255, 0); // LED color to GREEN
  //   sg[i] = analogRead(A0);
  //   delay(100);
  //     setColor(0, 0, 255); // LED color to BLUE
  //   sb[i] = analogRead(A0);
  //   delay(100);
  //   setColor(255, 255, 255); // LED color to WHITE
  //   sw[i] = analogRead(A0);
  //   delay(1000);

  // }
}


void loop()
{
    lcd.init();                      // initialize the lcd 
  // Print a message to the LCD.
  lcd.backlight();
  lcd.setCursor(0,0);
    lcd.print("RGB Spectrophotometr");
    lcd.setCursor(0, 1);
    lcd.print("Enter DF(n/1000): ");
    char customKey = customKeypad.getKey();   // Gets input from keypad
    lcd.setCursor(0, 19);
    if (customKey){
      lcd.print(customKey);
    }

//   int n = 15; // number of things to test
//   float sigxR = 0, sigxyR = 0, sigyR = 0, sigy2R= 0, sigx2R = 0;
//   for(int i = n; i >= 1; i--){
//     sigxR += i;
//     sigx2R += i*i;
//     sigxyR += sr[i-1] * i;
//     sigyR += sr[i-1];
//     sigy2R += sr[i-1]*sr[i-1];
//   }

//   float AR = (sigyR*sigx2R-sigxR*sigxyR)/(n*sigx2R-sigxR*sigxR);
// //((n*sigxy - sigx*sigy)/sqrt((n*sigx2-sigx*sigx)*(n*sigy2-sigy*sigy)))
//   float BR = (n*sigxyR-sigxR*sigyR)/(n*sigx2R-sigxR*sigxR);
//   float R2R = ((n*sigxyR - sigxR*sigyR)/sqrt((n*sigx2R-sigxR*sigxR)*(n*sigy2R-sigyR*sigyR))) * ((n*sigxyR - sigxR*sigyR)/sqrt((n*sigx2R-sigxR*sigxR)*(n*sigy2R-sigyR*sigyR)));


//   float sigxG = 0, sigx2G = 0, sigxyG = 0, sigyG = 0, sigy2G= 0;
//   for(float i = n; i >= 1; i--){
//     sigxG += i;
//     sigx2G += i*i;
//     sigxyG += sr[(int)(i-1)] * i;
//     sigyG += sr[(int)(i-1)];
//     sigy2G += sr[(int)(i-1)]*sr[(int)(i-1)];
//   }

//   float AG = (sigyR*sigx2R-sigxR*sigxyR)/(n*sigx2R-sigxR*sigxR);
// //((n*sigxy - sigx*sigy)/sqrt((n*sigx2-sigx*sigx)*(n*sigy2-sigy*sigy)))
//   float BG = (n*sigxyR-sigxR*sigyR)/(n*sigx2R-sigxR*sigxR);
//   float R2G = ((n*sigxyR - sigxR*sigyR)/sqrt((n*sigx2R-sigxR*sigxR)*(n*sigy2R-sigyR*sigyR))) * ((n*sigxyR - sigxR*sigyR)/sqrt((n*sigx2R-sigxR*sigxR)*(n*sigy2R-sigyR*sigyR)));


//   float sigxB = 0, sigx2B = 0, sigxyB = 0, sigyB = 0, sigy2B= 0;
//   for(float i = n; i >= 1; i--){
//     sigxB += i;
//     sigx2B += i*i;
//     sigxyB += sr[(int)(i-1)] * i;
//     sigyB += sr[(int)(i-1)];
//     sigy2B += sr[(int)(i-1)]*sr[(int)(i-1)];
//   }

//   float AB = (sigyR*sigx2R-sigxR*sigxyR)/(n*sigx2R-sigxR*sigxR);
// //((n*sigxy - sigx*sigy)/sqrt((n*sigx2-sigx*sigx)*(n*sigy2-sigy*sigy)))
//   float BB = (n*sigxyR-sigxR*sigyR)/(n*sigx2R-sigxR*sigxR);
//   float R2B = ((n*sigxyR - sigxR*sigyR)/sqrt((n*sigx2R-sigxR*sigxR)*(n*sigy2R-sigyR*sigyR))) * ((n*sigxyR - sigxR*sigyR)/sqrt((n*sigx2R-sigxR*sigxR)*(n*sigy2R-sigyR*sigyR)));

//   float sigxW = 0, sigx2W = 0, sigxyW = 0, sigyW = 0, sigy2W= 0;
//   for(float i = n; i >= 1; i--){
//     sigxW += i;
//     sigx2W += i*i;
//     sigxyW += sr[(int)(i-1)] * i;
//     sigW += sr[(int)(i-1)];
//     sigy2W += sr[(int)(i-1)]*sr[(int)(i-1)];
//   }

//   float AW = (sigyR*sigx2R-sigxR*sigxyR)/(n*sigx2R-sigxR*sigxR);
// //((n*sigxy - sigx*sigy)/sqrt((n*sigx2-sigx*sigx)*(n*sigy2-sigy*sigy)))
//   float BW = (n*sigxyR-sigxR*sigyR)/(n*sigx2R-sigxR*sigxR);
//   float R2W = ((n*sigxyR - sigxR*sigyR)/sqrt((n*sigx2R-sigxR*sigxR)*(n*sigy2R-sigyR*sigyR))) * ((n*sigxyR - sigxR*sigyR)/sqrt((n*sigx2R-sigxR*sigxR)*(n*sigy2R-sigyR*sigyR)));

// //1. OUR PROJECT PURPOSES; WE HAVE 3 COLORS, AND 3 COLOR R2; R.R2, G.R2, B.R2
// //2. COMPARE THE R2 --> CHOOSE ONLY HIGHEST R2

// R2 = max(max(R2R, R2G), max(R2B, R2W)); // highest R2

// //KEEP READING THE SAMPLES FROM 7 TO 16...




//    lcd.setCursor(2,0);
//   lcd.print("a = " + AR);
//   lcd.setCursor(2,1);
// digitalWrite (7, HIGH);
// delay (1000);
// digitalWrite (7, LOW);
//   lcd.print("b = " + BR);
//    lcd.setCursor(2,2);
//    digitalWrite (7, HIGH);
// delay (1000);
// digitalWrite (7, LOW);
//   lcd.print("r2 = " + R2R);
// delay (1000);
// digitalWrite (7, HIGH);
// delay (2000);
// digitalWrite (7, LOW);

}


  


//1. Work: declare float variables a, b, r2 and 34.23, 54.3, 0.956, respectively, desplay on LCD...

//And, make sound beep!
//2.Make the stepper moter turn 180 back and forth
//3.Pick up an obstacle sensor work: Sense something and beep!


