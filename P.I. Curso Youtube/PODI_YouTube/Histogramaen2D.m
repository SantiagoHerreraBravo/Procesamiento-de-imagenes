clear all; clc; close all;
%% Carga de Imagen
a=imread('Lighthouse.jpg');
s = size(a);

%% Planos RGB
ar = a(:,:,1);
ag = a(:,:,2);
ab = a(:,:,3);

%% Se muestran los planos por separado
figure(1), subplot(3,3,2), imshow(a), title('Imagen Original')
figure(1), subplot(3,3,4), imshow(ar), title('Plano Rojo')
figure(1), subplot(3,3,5), imshow(ag), title('Plano Verde')
figure(1), subplot(3,3,6), imshow(ab), title('Plano Azul')

%%

hist2D = zeros(256);

for f = 1:s(1)
	
	for c = 1:s(2)

		ngF = ar(f,c);
		ngC = ag(f,c);
		hist2D(ngF+1,ngC+1) = hist2D(ngF+1,ngC+1)+1;
        
	end
end

%Visualización del histograma 
figure(2), imshow(hist2D, [])