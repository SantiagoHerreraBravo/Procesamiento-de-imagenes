clc; clear all; close all; 

%Carga Imagen
a = imread('figura.png');
% Extracción de plano
a1 = double(a(:,:,1));
s = size(a); 
a1c = a1*0;

fila = 300;
p1 = a1(fila,:);
a1(fila,:) = 255; a1(fila+1,:) = 255;
p1c = p1*0;

%Convolución
kernel = [-1 1];
s = size(p1);

for i=2:s(2)-1
    ventana = p1(i:i+1);
    c = ventana.*kernel;
    p1c(i) = sum(c);
end

figure(1), subplot(3,1,1), image(uint8(a1)), title('Imagen Original'), colormap(gray(256))
figure(1), subplot(3,1,2), plot(p1), title('Perfil de Linea')
figure(1), subplot(3,1,3), plot(p1c), title('Perfil Convolucionado.')