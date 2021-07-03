clc; clear all; close all; 

%Carga Imagen
a = imread('Amlodipinocut.png');
a =rgb2hsv(a);
% Extracción de plano
a1 = a(:,:,1);
s = size(a); 
a1c = a1*0;

%%
a1 = (1-a1).^2;
% kernel = [1,2,1;2,4,2;1,2,1]./16;

s1 = size(a1);

for r=1 : s1(1)
    for c=1:s1(2)
        if a1(r,c)<=(100/255)
            a1(r,c)=1;
        else
            a1(r,c) = a1(r,c);
        end
    end
end

%%

%Convolución
k1 = [-1 0 1; -1 0 1; -1 0 1];
k2 = [-1 -1 0; -1 0 1; 0 1 1];
k3 = -1*[-1 -1 -1; 0 0 0; 1 1 1]./3;
for i=2:s(1)-1
    for j=2:s(2)-1
    ventana = a1(i-1:i+1,j-1:j+1);
    prod = ventana.*k3;
    pix = sum(sum(prod));
    a1c(i,j) = (pix);
    end
end

a1c = abs(a1-a1c);
figure(1), subplot(2,1,1), imshow(a1), title('Imagen Original')
figure(1), subplot(2,1,2), imshow(a1c), title('Gradiente H')
