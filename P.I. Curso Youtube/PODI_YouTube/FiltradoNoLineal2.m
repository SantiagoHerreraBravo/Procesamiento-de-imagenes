clc; clear all; close all;
% Carga de la imagen
a=imread('rostro1.jpg');

%Extracción de planos
ar = double(a(:,:,1)); %Extraemos el plano rojo y hacesmos casting para tran"transformar" de uint8 a double
s = size(a); %Guardamos el tamaño dela imagen
armediana = ar*0;
arout = ar;
h = 5;
arminmax = ar*0;

%Convolución
%kernel = ones(3,3)./9; %Kernel 3x3 de unos función g conocida
                       %Filtro de promedio o media.
                       
 kernel = [1,1,1;1,0,1;1,1,1]./8;

for i = 2:s(1)-1
    for j = 2:s(2)-1
   
        ventana = ar(i-1:i+1, j-1:j+1); % Esta es la operación punto a punto del Kerner
        prod = ventana.*kernel;
        pix = sum(sum(prod));
        arc(i,j) = pix;
    
    %  Outlier
    
        if abs(ar(i,j) - pix) > h
            arout(i,j) = pix;
        end
        vector = ventana(:);
        vector = sort(vector); % Ordena los elementos de forma ascendente
           
    % Max-Min 
    
    dif_sup = vector(9) - ar(i,j);
    dif_inf = vector(1) - ar(i,j);
    
        if dif_sup > dif_inf
            arminmax(i,j) = vector(9);
        else
            arminmax(i,j) = vector(1);
        end
    end
end

%Despliegue

figure(1),subplot(1,3,1),imshow(uint8(ar)), title('Imagen Original')
figure(1),subplot(1,3,2),imshow(uint8(arout)), title('Outlier')
figure(1),subplot(1,3,3),imshow(uint8(arminmax)), title('Minmax')

% altasf = ar-arc;
% figure(2), imshow(uint8(altasf))