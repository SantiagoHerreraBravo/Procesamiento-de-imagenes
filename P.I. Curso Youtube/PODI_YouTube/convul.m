clear all; clc; close all;
%% carga de la imagen 

a=imread('rostro1.jpg');

%% Estraccion de planos
ar= a(:,:,1);

%% perfiles de linea 
lin=315;
pl= ar(lin,:); 
ar(lin,:) = 0;

%% convolucion 
k= [1 1 1 1 1 1];      % Escalon en general es un kernel un nucleo de convolución.funcion conocida 
c= conv(pl,k); % conv existe en matlab vamos a pasar el perfil de linea que obtuvimos f=pl y g=k que la estamos colocando

%% despliegue 
figure(1),subplot(3,1,1),image(ar), title('Imagen Original'), colormap gray(256)
figure(1),subplot(3,1,2),plot(pl), title('perfil de linea')
figure(1),subplot(3,1,3),plot(c), title('perfil de linea convolucionado')