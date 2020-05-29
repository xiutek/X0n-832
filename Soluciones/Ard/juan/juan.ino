void setup() 
{

  Serial.begin(9600); 
}

    void loop()
{
  // Read the input on analog pin 0:
  int a0 = analogRead(A0);

  Serial.print(a0);
  
  Serial.println();
  
delay (100);
}
