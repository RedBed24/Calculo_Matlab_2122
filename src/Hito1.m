%carga imágenes y descriptores
imRef = imread('data/HITO1/referenciaHito1.jpg');
descriptorRef=HOG(imRef);
im1 = imread('data/HITO1/imagen1Hito1.jpg');
descriptor1=HOG(im1);
im2 = imread('data/HITO1/imagen2Hito1.jpg');
descriptor2=HOG(im2);
im3 = imread('data/HITO1/imagen3Hito1.jpg');
descriptor3=HOG(im3);
im4 = imread('data/HITO1/imagen4Hito1.jpg');
descriptor4=HOG(im4);
%carga imágenes y descriptores

%calculo distancia
d1 = distanciacoseno(descriptorRef, descriptor1);
d2 = distanciacoseno(descriptorRef, descriptor2);
d3 = distanciacoseno(descriptorRef, descriptor3);
d4 = distanciacoseno(descriptorRef, descriptor4);
%calculo distancia

distancias=[d1 d2 d3 d4];
parecido = min(distancias); %tomamos la menor de las distancias

x=1:length(descriptorRef);

%mostrar los descriptores
subplot(2, 3, 1);
plot(x, descriptorRef);
xlabel("Referencia");
subplot(2, 3, 2);
plot(x, descriptor1);
xlabel("1");
subplot(2, 3, 3);
plot(x, descriptor2);
xlabel("2");
subplot(2, 3, 5);
plot(x, descriptor3);
xlabel("3");
subplot(2, 3, 6);
plot(x, descriptor4);
xlabel("4");
%mostrar los descriptores

%muesta imagenes
figure(2)
subplot(2, 3, 1);
imshow(imRef);
xlabel("Referencia");
subplot(2, 3, 2);
imshow(im1);
xlabel("1");
subplot(2, 3, 3);
imshow(im2);
xlabel("2");
subplot(2, 3, 5);
imshow(im3);
xlabel("3");
subplot(2, 3, 6);
imshow(im4);
xlabel("4");
%muesta imagenes

%indica cuál es la más parecida
if parecido==d1
    disp("Primera");
elseif parecido==d2
    disp("Segunda");
elseif parecido==d3
    disp("Tercera");
elseif parecido==d4
    disp("Cuarta");
end

