imRef = imread('data/HITO3/referenciaHito3.jpg');
imGrande = imread('data/HITO3/asteroideHito3.jpg');

saltox=100;
saltoy=120;

[x, y] = ventanadeslizante(saltox, saltoy, imRef, imGrande);

lr=size(imRef ,2);
hr=size(imRef, 1);

subplot(1, 2, 1);
imshow(imRef);
xlabel("Referencia");
subplot(1, 2, 2);
imshow(imGrande(1+y:y+hr, 1+x:x+lr));
xlabel("Más parecida: "+y+ ":"+(y+hr)+", "+x+":"+(x+lr));

