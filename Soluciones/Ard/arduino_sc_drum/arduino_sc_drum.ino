void setup() 
{
  // Start serial at 9600 baud
  Serial.begin(9600); 
}

    void loop() 
{
  // Read the input on analog pin 0:
  int sensorValue = analogRead(A0);
  int sensorValue2 = analogRead(A1);
  int sensorValue3 = analogRead(A2);
  int sensorValue4 = analogRead(A3);  
  int sensorValue5 = analogRead(A4);
  int sensorValue6 = analogRead(A5);
  int sensorValue7 = analogRead(A6);
  int sensorValue8 = analogRead(A7);
  int sensorValue9 = analogRead(A8);
  int sensorValue10 = analogRead(A9);
  int sensorValue11 = analogRead(A10);
  int sensorValue12 = analogRead(A11);
    
  // Convert the analog reading (which goes from 0 - 1023) to a voltage (0 - 5V):
  float voltage = sensorValue / 1023;
  float voltage2 = sensorValue2;
  float voltage3 = sensorValue3;
  float voltage4 = sensorValue4;
  float voltage5 = sensorValue5;
  float voltage6 = sensorValue6;
  float voltage7 = sensorValue7;
  float voltage8 = sensorValue8;
  float voltage9 = sensorValue9;
  float voltage10 = sensorValue10;
  float voltage11 = sensorValue11;
  
  // Print out the value you read:


{
  
  Serial.print(voltage,4);
    Serial.print(voltage2,1);
      Serial.print(voltage3,4);
        Serial.print(voltage4,4);
          Serial.print(voltage5,4);
            Serial.print(voltage6,4);
              Serial.print(voltage7,4);
                Serial.print(voltage8,4);
                  Serial.print(voltage9,4);
                    Serial.print(voltage10,4);
                      Serial.print(voltage11,4);

  
  Serial.println();
}

    
  // Wait 100 milliseconds
  delay(10);
}
