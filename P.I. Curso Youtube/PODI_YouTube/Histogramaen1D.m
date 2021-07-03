clear all; clc; close all;
%% Carga de Imagen
a=imread('moo2.gif');
s = size(a);

%% Planos RGB
ar = a(:,:,1);
% ag = a(:,:,2);
% ab = a(:,:,3);

%% Se muestran los planos por separado
figure(1), subplot(3,3,2), imshow(a), title('Imagen Original')
figure(1), subplot(3,3,4), imshow(ar), title('Plano Rojo')
% figure(1), subplot(3,3,5), imshow(ag), title('Plano Verde')
% figure(1), subplot(3,3,6), imshow(ab), title('Plano Azul')

%%

histR = zeros(1,256);
% histG = zeros(1,256);
% histB = zeros(1,256);

for f = 1:s(1)
	
	for c = 1:s(2)

		ngR = ar(f,c);
		histR(ngR+1) = histR(ngR+1)+1;

% 		ngG = ag(f,c);
% 		histG(ngG+1) = histG(ngG+1)+1;
%         
%         ngB = ab(f,c);
% 		histB(ngB+1) = histB(ngB+1)+1;
        
	end
end

%Visualización del histograma 

figure(1), subplot(3,3,7), plot(histR)
% figure(1), subplot(3,3,8), plot(histG)
% figure(1), subplot(3,3,9), plot(histB)
