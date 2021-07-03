clc; clear all;
%%Carga de la imagen
a = imread('100_4610.JPG');

%Vector LUT - Biblioteca de LUTs
lutbase = 0:255;

lutgamma2 =uint8(((lutbase/255).^2)*255);
lutgamma3 =uint8(((lutbase/255).^3)*255);
lutgamma05 =uint8(((lutbase/255).^0.5)*255);

lutespec1 = 0:255;
lutespec1(100:120) = 200;
lutespec1 = uint8(lutespec1);


lutespec2 = 4*(0:255);
lutespec2(128:256) = 255-lutespec2(1:129);
lutespec2 = uint8(255-lutespec2);


%Negativo de la imagen
lutinvert = uint8(255-lutgamma05);


%Aplicación de la LUT
b = lutinvert(a+1);

%Visualizar
figure(1), imshow(a)
figure(2), imshow(b)