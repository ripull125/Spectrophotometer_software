#include <Keypad.h>
#include <Wire.h> // Library for I2C communication
#include <LiquidCrystal_I2C.h> // Library for LCD

LiquidCrystal_I2C lcd = LiquidCrystal_I2C(0x27, 20, 4); // Change to (0x27,20,4) for 20x4 LCD.
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

void setup(){
  Serial.begin(9600);
  pinMode (10, OUTPUT);
      // Initiate the LCD:
  lcd.init();
  lcd.backlight();

}
  
void loop(){

  lcd.setCursor(0, 0);
  lcd.println("Hi2Eth.Hyd Spec!");
  lcd.setCursor (0,1);
  lcd.println("Type Your DF = ");
  lcd.setCursor(0, 2);
  lcd.println("which DF? 2, 4, 5, 8, 10");

    char customKey = customKeypad.getKey();
lcd.setCursor(13, 1); 
  lcd.print(customKey);
  if (customKey){
    Serial.println(customKey);
digitalWrite (10, LOW);
delay (1000);
digitalWrite(10, HIGH);

 
  lcd.setCursor(0, 3);
  lcd.print("Press DF = ");
  lcd.print (customKey-'0');
  delay(2000);
  lcd.clear ();
  }
}