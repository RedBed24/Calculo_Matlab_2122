function [d] = distanciacoseno(vect1, vect2)
%cálculo de la distancia del coseno entre dos vectores, para este se usa el
%producto escalar entre el producto de los módulos
product=0;
sum1=0;
sum2=0;
for i=1:length(vect1)
     product=product+vect1(i)*vect2(i); %el producto escalar es la suma de la multiplicación de las coordenadas
     sum1=sum1+vect1(i)^2; %la suma de las coordenadas al cuadrado del primer vector
     sum2=sum2+vect2(i)^2; %segundo
end
cos=product/(sqrt(sum1)*sqrt(sum2)); %producto escalar entre el producto de los módulos
d = 1 - cos;
end

