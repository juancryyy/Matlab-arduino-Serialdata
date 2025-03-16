Warning: serial will be removed in a future release. Use serialport instead.
If you are using serial with icdevice, continue using serial in this MATLAB release. 
Error using serial/fopen
Open failed: Port: COM3 is not available. No ports are available.
Use INSTRFIND to determine if other instrument objects are connected to the requested device.
 
muestras = 500; % Número de muestras
freq = 60; % Frecuencia de la señal en Hz
amplitud = 255; % Amplitud de la señal

close all;
clc;

% Vector para almacenar los datos
y = zeros(1, muestras);

% Generar la señal sinusoidal
for num = 1:muestras
    % Generar la señal sinusoidal
    y(num) = amplitud * sin(2 * pi * freq * num / muestras);
end

% Crear el objeto serial
esp = serial('COM3');
esp.BaudRate = 115200; % Establecer la velocidad de comunicación
% advertencia
warning('off', 'MATLAB:serial:fscanf:unsuccessfulRead');
% abrir puerto serial
fopen(esp);

% Enviar datos al ESP32 en una ráfaga
fwrite(esp, y, 'uint8');

% Imprimir valores enviados por serial
for num = 1:muestras
    fprintf(esp, '%f \n', y(num)); % Imprimir valor seguido de una nueva línea
end

% Cerrar el puerto serial
fclose(esp);
delete(esp);