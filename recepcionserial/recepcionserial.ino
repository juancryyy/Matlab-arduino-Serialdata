#include <Arduino.h>
//
const int LED = 12; // Pin para el LED de prueba
const int LED2 = 13; // Pin para el segundo LED
const int LED3 = 14; // Pin para el 3
int datos; // Número de muestras esperadas

void setup()
{
  Serial.begin(115200); // Iniciar comunicación serial a 115200 baudios
pinMode(LED, OUTPUT); // Configurar el pin del LED como salida
pinMode(LED2, OUTPUT); // Configurar el pin del segundo LED como salida
pinMode(LED3, OUTPUT);
}

void loop()
{
 digitalWrite(LED2, HIGH);
  if(Serial.available()>0)
  {
    datos=Serial.read();
    digitalWrite(LED, HIGH);
    delay(1000);
  digitalWrite(LED, LOW);
    if(datos == 2)
    {
  digitalWrite(LED2, LOW);
    }
  }
}

 