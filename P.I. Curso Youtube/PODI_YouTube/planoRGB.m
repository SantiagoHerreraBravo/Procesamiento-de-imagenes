clear all; clc; close all;
%% Carga de Imagen
a=imread('imgesteganografia.png');
%% Planos RGB
ar=a(:,:,1);
% ag=a(:,:,2);
% ab=a(:,:,3);
%% Se muestran los planos por separado
figure(1), subplot(2,3,2), imshow(a), title('Imagen Original')
figure(1), subplot(2,3,4), imshow(ar), title('Plano Rojo')
% figure(1), subplot(2,3,5), imshow(ag), title('Plano Verde')
% figure(1), subplot(2,3,6), imshow(ab), title('Plano Azul')

%% Descomposición en plano de bits, 
arb7=bitand(ar,128)*2;
arb6=bitand(ar,64)*4;
arb5=bitand(ar,32)*8;
arb4=bitand(ar,16)*16;
arb3=bitand(ar,8)*32;
arb2=bitand(ar,4)*64;
arb1=bitand(ar,2)*128;
arb0=bitand(ar,1)*256;

figure(2), subplot(3,3,1), imshow(ar), title('Plano Rojo')
figure(2), subplot(3,3,2), imshow(arb7), title('Bit 7')
figure(2), subplot(3,3,3), imshow(arb6), title('Bit 6')
figure(2), subplot(3,3,4), imshow(arb5), title('Bit 5')
figure(2), subplot(3,3,5), imshow(arb4), title('Bit 4')
figure(2), subplot(3,3,6), imshow(arb3), title('Bit 3')
figure(2), subplot(3,3,7), imshow(arb2), title('Bit 2')
figure(2), subplot(3,3,8), imshow(arb1), title('Bit 1')
figure(2), subplot(3,3,9), imshow(arb0), title('Bit 0')

%% Planos sin compenssacion
arb7=bitand(ar,128);
arb6=bitand(ar,64);
arb5=bitand(ar,32);
arb4=bitand(ar,16);
arb3=bitand(ar,8);
arb2=bitand(ar,4);
arb1=bitand(ar,2);
arb0=bitand(ar,1);

%% Nuevo Plano, acumulando los bit que nos dan mayor información.
%arnuevo=arb7+arb6+arb5+arb4+arb3+arb2+arb1+arb0;
arnuevo=arb7+arb6+arb5+arb4+arb3;

figure(3), subplot(2,1,1), imshow(arnuevo), title('ArNew')
figure(3), subplot(2,1,2), imshow(ar), title('Ar')