imRef = imread('data/HITO2/referenciaHito2.jpg');
descriptorRef=HOG(imRef);
imGrande = imread('data/HITO2/asteroideHito2.jpg');

lr=size(imRef, 2); hr=size(imRef, 1);
nl=size(imGrande, 2)/lr; %las veces que entra la imagen pequeña en la grande de forma horizontal
nh=size(imGrande, 1)/hr; %de forma vertical

subplot(nl, nh, 1);
imshow(imRef);
xlabel("Referencia");

parecida=2; %el máximo valor de la distancia
cuenta=0;
for i=1:nh
    for j=1:nl
        descriptor=HOG(imGrande(1+lr*(i-1):lr*i, 1+hr*(j-1):hr*j));
        %tomamos la subimagen de grande con los tamaños de la pequeña en
        %las coordenadas correspondientes
        dist=distanciacoseno(descriptorRef, descriptor);
        if dist<parecida
            parecida=dist;
            fila=i; %guardamos la posición de la más parecida
            columna=j;
        end
        
        figure(1)
        cuenta = cuenta + 1;
        subplot(nh, nl, cuenta);
        imshow(imGrande(1+lr*(i-1):lr*i, 1+hr*(j-1):hr*j));
        xlabel("Grande: " + i + ", " + j);
        
        figure(2)
        subplot(nh, nl, cuenta);
        if cuenta==1
            imshow(imRef);
            xlabel("Referencia");
        else
            imshow(imGrande(1+lr*(i-1):lr*i, 1+hr*(j-1):hr*j));
            xlabel("Grande: " + i + ", " + j);
        end
    end
end

figure(3)
subplot(1, 2, 1);
imshow(imRef);
xlabel("Referencia");
subplot(1, 2, 2);
imshow(imGrande(1+lr*(fila-1):lr*fila, 1+hr*(columna-1):hr*columna))
xlabel("Más parecida: "+columna+ ", "+fila);

