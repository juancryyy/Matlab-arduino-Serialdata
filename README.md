# MATLAB Arduino Serial Data

Proyecto de comunicación serial entre MATLAB y una placa Arduino/ESP32 para el envío de datos desde el computador hacia un sistema embebido. El repositorio incluye un script en MATLAB que genera una señal sinusoidal y la transmite por puerto serial, junto con un programa en Arduino que recibe datos y activa salidas digitales como indicadores de prueba.

## Objetivo

Implementar una comunicación serial básica entre MATLAB y una tarjeta de desarrollo compatible con Arduino, con el fin de enviar datos generados por software hacia un microcontrolador y verificar su recepción mediante LEDs.

Este tipo de práctica permite comprender la integración entre herramientas de análisis numérico y sistemas embebidos, útil para adquisición de datos, control, monitoreo y validación de señales.

## Tecnologías utilizadas

- MATLAB
- Arduino IDE
- Lenguaje C/C++ para Arduino
- Comunicación serial UART por USB
- ESP32 o placa compatible con Arduino

## Componentes requeridos

- Placa Arduino, ESP32 o compatible
- Cable USB para programación y comunicación serial
- LEDs de prueba
- Resistencias para LEDs
- Computador con MATLAB instalado
- Arduino IDE instalado

## Estructura del proyecto

```txt
Matlab-arduino-Serialdata-main/
├── README.md
└── recepcionserial/
    ├── matlab.m
    └── recepcionserial.ino
```

## Descripción de archivos

### `recepcionserial/matlab.m`

Script de MATLAB encargado de generar y enviar datos por el puerto serial.

Funciones principales:

- Define el número de muestras de la señal.
- Genera una señal sinusoidal de prueba.
- Configura el puerto serial `COM3`.
- Establece una velocidad de comunicación de `115200` baudios.
- Envía los datos hacia la placa mediante comunicación serial.
- Cierra y libera el puerto serial al finalizar.

Fragmento conceptual del flujo:

```matlab
muestras = 500;
freq = 60;
amplitud = 255;

esp = serial('COM3');
esp.BaudRate = 115200;
fopen(esp);
fwrite(esp, y, 'uint8');
fclose(esp);
delete(esp);
```

> Nota: el script utiliza `serial`, una función que MATLAB marca como antigua en versiones recientes. Para proyectos nuevos se recomienda migrar a `serialport`.

### `recepcionserial/recepcionserial.ino`

Programa para la placa Arduino/ESP32 encargado de recibir datos por serial y activar LEDs como indicadores.

Funciones principales:

- Inicializa la comunicación serial a `115200` baudios.
- Configura los pines 12, 13 y 14 como salidas digitales.
- Verifica si hay datos disponibles por el puerto serial.
- Lee el dato recibido.
- Activa un LED para indicar recepción de información.
- Cambia el estado de un LED si el dato recibido cumple una condición específica.

Pines usados:

```cpp
const int LED = 12;
const int LED2 = 13;
const int LED3 = 14;
```

## Funcionamiento general

1. MATLAB genera una señal sinusoidal de prueba.
2. El usuario configura el puerto serial correspondiente a la placa.
3. MATLAB abre la conexión serial y envía los datos.
4. El microcontrolador recibe bytes por el puerto serial.
5. El programa embebido enciende o apaga LEDs según la información recibida.
6. La comunicación permite validar el envío de datos desde MATLAB hacia hardware físico.

## Configuración del puerto serial

En el archivo `matlab.m`, el puerto está configurado como:

```matlab
esp = serial('COM3');
```

Este valor debe modificarse según el puerto asignado por el sistema operativo.

Ejemplos:

- Windows: `COM3`, `COM4`, `COM5`
- Linux: `/dev/ttyUSB0` o `/dev/ttyACM0`
- macOS: `/dev/cu.usbserial-*`

También es importante que la velocidad de baudios sea la misma en MATLAB y en Arduino:

```matlab
esp.BaudRate = 115200;
```

```cpp
Serial.begin(115200);
```

## Instalación y uso

### 1. Cargar el código en la placa

1. Abrir Arduino IDE.
2. Abrir el archivo:

```txt
recepcionserial/recepcionserial.ino
```

3. Seleccionar la placa correspondiente.
4. Seleccionar el puerto correcto.
5. Cargar el programa al microcontrolador.

### 2. Ejecutar el script en MATLAB

1. Abrir MATLAB.
2. Entrar a la carpeta del proyecto.
3. Modificar el puerto serial si es necesario:

```matlab
esp = serial('COM3');
```

4. Ejecutar:

```matlab
matlab.m
```

5. Observar el comportamiento de los LEDs conectados a la placa.

## Resultados esperados

- MATLAB genera y transmite una secuencia de datos.
- La placa recibe información por comunicación serial.
- Los LEDs funcionan como indicadores visuales de recepción.
- Se valida la comunicación entre software de análisis y hardware embebido.

## Aplicaciones

Este proyecto puede servir como base para:

- Monitoreo de sensores desde MATLAB.
- Control de actuadores desde el computador.
- Visualización y procesamiento de datos en tiempo real.
- Pruebas de comunicación entre MATLAB y microcontroladores.
- Sistemas de adquisición y control para proyectos académicos.

## Posibles mejoras

- Migrar el código MATLAB de `serial` a `serialport`.
- Agregar lectura de datos desde Arduino hacia MATLAB.
- Implementar una interfaz gráfica en MATLAB App Designer.
- Incluir gráficas en tiempo real de los datos recibidos.
- Añadir protocolo de comunicación con encabezados, separadores o checksum.
- Validar errores de conexión y disponibilidad del puerto.
- Documentar el circuito de conexión de los LEDs.

## Aprendizajes

Durante el desarrollo de este proyecto se refuerzan conceptos como:

- Comunicación serial entre computador y microcontrolador.
- Configuración de puertos y velocidad de baudios.
- Envío de datos desde MATLAB.
- Recepción de datos en Arduino/ESP32.
- Uso de salidas digitales como indicadores de estado.
- Integración entre análisis numérico y sistemas embebidos.

## Autor

Proyecto desarrollado como práctica de comunicación serial entre MATLAB y Arduino para aplicaciones de sistemas embebidos.
