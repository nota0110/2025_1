void setup() {
  Serial.begin(9600);
  pinMode(1,INPUT);
}
int controlBtn = 0;
void loop() {
  // put your main code here, to run repeatedly:
  for (int inputPin = 1; inputPin<6; inputPin++){
    if (digitalRead(inputPin) == HIGH){controlBtn = inputPin;break;}else{continue;}
  }
Serial.println(controlBtn);
}
