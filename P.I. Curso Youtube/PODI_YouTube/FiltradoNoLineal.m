clc; clear all; close all;
% Carga de la imagen
a=imread('discoduro.JPG');

%Extracción de planos
ar = double(a(:,:,1)); %Extraemos el plano rojo y hacesmos casting para tran"transformar" de uint8 a double
s = size(a); %Guardamos el tamaño dela imagen
arc = ar*0; % 0.179779 seg - 0.066711 seg
armediana = ar*0;
armin = ar*0;
armax = ar*0;

%Convolución
kernel = ones(3,3)./9; %Kernel 3x3 de unos función g conocida
                       %Filtro de promedio o media.
                       
% kernel = [0,1,0;1,0,1;0,1,0];

for i = 2:s(1)-1
    for j = 2:s(2)-1
   
        ventana = ar(i-1:i+1, j-1:j+1); % Esta es la operación punto a punto del Kerner
        prod = ventana.*kernel;
        pix = sum(sum(prod));
        arc(i,j) = pix;
    

    %Mediana
        vector = ventana(:);
        vector = sort(vector); % Ordena los elementos de forma ascendente
        armediana(i,j) = vector(5); %Toma la mediana del vector, en este caso el quinto elemento porque el Kernel es 3x3
        armin(i,j) = vector(1);
        armax(i,j) = vector(9);
    end
end

%Despliegue

figure(1),subplot(2,2,1),imshow(uint8(ar)), title('Imagen Original')
figure(1),subplot(2,2,2),imshow(uint8(armediana)), title('Mediana')
figure(1),subplot(2,2,3),imshow(uint8(armin)), title('Min')
figure(1),subplot(2,2,4),imshow(uint8(armax)), title('Max')

altasf = ar-arc;
figure(2), imshow(uint8(altasf))