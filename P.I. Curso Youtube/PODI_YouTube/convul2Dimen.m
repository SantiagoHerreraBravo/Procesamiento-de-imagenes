clc; clear all; close all;
% Carga de la imagen
a=imread('Amlodipinocut.png');
a=rgb2hsv(a);
%Extracción de planos
% ar = double(a(:,:,1)); %Extraemos el plano rojo y hacesmos casting para tran"transformar" de uint8 a double
ar = a(:,:,1); %Solo cuando rgb2hvs que lo deja en double directamente
s = size(a); %Guardamos el tamaño dela imagen
arc = ar*0; % 0.179779 seg - 0.066711 seg

%Convolución
%kernel = ones(3,3)./9; %Kernel 3x3 de unos función g conocida
                       %Filtro de promedio o media.
                       
 kernel = [1,2,1;2,4,2;1,2,1]./16;

for i = 2:s(1)-1
    for j = 2:s(2)-1
   
        ventana = ar(i-1:i+1, j-1:j+1); % Esta es la operación punto a punto del Kerner
        prod = ventana.*kernel;
        pix = sum(sum(prod));
        arc(i,j) = pix;
        
    end
end



%Despliegue

% figure(1),subplot(2,1,1),imshow(uint8(ar)), title('Imagen Original'), colormap gray(256)
% figure(1),subplot(2,1,2),imshow(uint8(arc)), title('Imagen Conv.')

%hvs
figure(1),subplot(2,1,1),imshow(ar), title('Imagen Original'), colormap gray(256)
figure(1),subplot(2,1,2),imshow(arc), title('Imagen Conv.')


altasf = abs(ar-arc);
%figure(2), imshow(uint8(altasf))
%hvs
figure(2), imshow(altasf)