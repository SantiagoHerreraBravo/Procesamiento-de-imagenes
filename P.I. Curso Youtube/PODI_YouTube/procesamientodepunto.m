clear all; clc; close all;
%% Carga de Imagen
a=imread('IMG_20191101_204931.png');
a = rgb2ycbcr(a);
ag=a(:,:,3);
figure(1), subplot(2,2,1),imshow(ag), title('Imagen Original')


%ANTES
%Conversión V.puntoFlotante
%Valores Normalizados

ag=double(ag); %conversión uint8 to double
ag = ag/255; %Normalizamos 

%PROCESAMIENTO
bg = ag.^1;

%DESPUES
%Desnormalizacion
%Conversión a uint8
bg = bg*255;
bg = uint8(bg);

ag = ag*255;
ag = uint8(ag);

s = size(ag);
histag = zeros(1,256);
histbg = zeros(1,256);
for f = 1:s(1)
	for c = 1:s(2)
        ng = ag(f,c);
		histag(ng+1) = histag(ng+1)+1;        
        ng = bg(f,c);
		histbg(ng+1) = histbg(ng+1)+1;        
	end
end

%Visualización del histograma 

figure(1), subplot(2,2,3), plot(histag) , title('histograma img. Original')
figure(1), subplot(2,2,4), plot(histbg), title('histograma img. Procesada')

figure(1), subplot(2,2,2),imshow(bg), title('Imagen Procesada')



