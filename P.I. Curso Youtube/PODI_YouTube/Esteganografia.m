clear all; clc;
%% Carga de Imagen
a=imread('Lighthouse.JPG'); %Portadora
l = imread('Flor.jpg');   %Mensaje
%% Planos RGB
ar=a(:,:,1);
ag=a(:,:,2);
ab=a(:,:,3);
%--------------
lr=l(:,:,1);
lg=l(:,:,2);
lb=l(:,:,3);

%% Se muestran los planos por separado
figure(1), subplot(3,3,1), imshow(a), title('Imagen Portadora')
figure(1), subplot(3,3,3), imshow(l), title('Imagen Mensaje')
figure(1), subplot(3,3,4), imshow(ar), title('Plano Rojo')
figure(1), subplot(3,3,5), imshow(ag), title('Plano Verde')
figure(1), subplot(3,3,6), imshow(ab), title('Plano Azul')
figure(1), subplot(3,3,7), imshow(lr), title('Plano Rojo')
figure(1), subplot(3,3,8), imshow(lg), title('Plano Verde')
figure(1), subplot(3,3,9), imshow(lb), title('Plano Azul')

%% Planos sin compenssacion portadora ROJO
arb7=bitand(ar,128);
arb6=bitand(ar,64);
arb5=bitand(ar,32);
arb4=bitand(ar,16);
arb3=bitand(ar,8);
arb2=bitand(ar,4);
arb1=bitand(ar,2);
arb0=bitand(ar,1);

%% Planos sin compenssacion mensaje ROJO
lrb7=bitand(lr,128);
lrb6=bitand(lr,64);
lrb5=bitand(lr,32);
lrb4=bitand(lr,16);
lrb3=bitand(lr,8);
lrb2=bitand(lr,4);
lrb1=bitand(lr,2);
lrb0=bitand(lr,1);

%% Planos sin compenssacion portadora VERDE
agb7=bitand(ag,128);
agb6=bitand(ag,64);
agb5=bitand(ag,32);
agb4=bitand(ag,16);
agb3=bitand(ag,8);
agb2=bitand(ag,4);
agb1=bitand(ag,2);
agb0=bitand(ag,1);

%% Planos sin compenssacion mensaje VERDE
lgb7=bitand(lg,128);
lgb6=bitand(lg,64);
lgb5=bitand(lg,32);
lgb4=bitand(lg,16);
lgb3=bitand(lg,8);
lgb2=bitand(lg,4);
lgb1=bitand(lg,2);
lgb0=bitand(lg,1);

%% Planos sin compenssacion portadora AZUL
abb7=bitand(ab,128);
abb6=bitand(ab,64);
abb5=bitand(ab,32);
abb4=bitand(ab,16);
abb3=bitand(ab,8);
abb2=bitand(ab,4);
abb1=bitand(ab,2);
abb0=bitand(ab,1);

%% Planos sin compenssacion mensaje AZUL
lbb7=bitand(lb,128);
lbb6=bitand(lb,64);
lbb5=bitand(lb,32);
lbb4=bitand(lb,16);
lbb3=bitand(lb,8);
lbb2=bitand(lb,4);
lbb1=bitand(lb,2);
lbb0=bitand(lb,1);


%% Nuevo Plano, acumulando los bit que nos dan mayor información.
imgrnew=arb7+arb6+arb5+arb4+lrb7/16+lrb6/16+lrb5/16+lrb4/16; % Más explicación sobre este paso
imggnew=agb7+agb6+agb5+agb4+lgb7/16+lgb6/16+lgb5/16+lgb4/16; % Más explicación sobre este paso
imgbnew=abb7+abb6+abb5+abb4+lbb7/16+lbb6/16+lbb5/16+lbb4/16; % Más explicación sobre este paso


%arnuevo=arb7+arb6+arb5+arb4+arb3;

figure(3), subplot(3,3,1), imshow(ar), title('Portadora')
figure(3), subplot(3,3,2), imshow(imgrnew), title('ImageNew')
figure(3), subplot(3,3,3), imshow(lr), title('Mensaje')

figure(3), subplot(3,3,4), imshow(ag), title('Portadora')
figure(3), subplot(3,3,5), imshow(imggnew), title('ImageNew')
figure(3), subplot(3,3,6), imshow(lg), title('Mensaje')

figure(3), subplot(3,3,7), imshow(ab), title('Portadora')
figure(3), subplot(3,3,8), imshow(imgbnew), title('ImageNew')
figure(3), subplot(3,3,9), imshow(lb), title('Mensaje')

%%

img=[imgrnew,imggnew,imgbnew];

%% Guardar imagen

% imwrite(imgrnew,'imgesteganografia.png')
% imwrite(imgrnew,'imgesteganografia.jpg')
