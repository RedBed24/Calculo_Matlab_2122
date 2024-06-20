function [x, y] = ventanadeslizante(sx, sy, ref, grande)
%devuelve el valor de x e y multiplos del salto en x y del salto en y
%respectivamente, de la ventana más parecida

descRef=HOG(ref);

lg=size(grande, 2);
hg=size(grande, 1);
lr=size(ref, 2);
hr=size(ref, 1);

parecida=2;
for i=0:sx:lg-lr
    for j=0:sy:hg-hr
        descriptor=HOG(grande(1+j:j+hr, 1+i:i+lr));
        dist=distanciacoseno(descRef, descriptor);
        if dist<parecida
            parecida=dist;
            x=i;
            y=j;
        end
    end
end
end

