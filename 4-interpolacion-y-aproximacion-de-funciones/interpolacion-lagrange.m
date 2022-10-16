# Este algoritmo está realizado para calcularse a partir de 4 valores de x y f(x)
pkg load symbolic;
xi_length = 4;
values = cell(xi_length, 2);
for i = 1 : 1 : xi_length
	values{i, 1} = input("Introduzca el valor para Xi -> ");
	values{i, 2} = input("Introduzca el valor para f(Xi) -> ");
endfor

# Cálculo de valores
syms x;

l0 = ((x - values{2, 1}) * (x - values{3, 1}) * (x - values{4, 1}));
l0 = l0 / ((values{1, 1}-values{2, 1}) * (values{1, 1}-values{3, 1}) * (values{1, 1}-values{4, 1}));

l1 = ((x - values{1, 1}) * (x - values{3, 1}) * (x - values{4, 1}));
l1 = l1 / ((values{2, 1}-values{1, 1}) * (values{2, 1}-values{3, 1}) * (values{2, 1}-values{4, 1}));

l2 = ((x - values{1, 1}) * (x - values{2, 1}) * (x - values{4, 1}));
l2 = l2 / ((values{3, 1}-values{1, 1}) * (values{3, 1}-values{2, 1}) * (values{3, 1}-values{4, 1}));

l3 = ((x - values{1, 1}) * (x - values{2, 1}) * (x - values{3, 1}));
l3 = l3 / ((values{4, 1}-values{1, 1}) * (values{4, 1}-values{2, 1}) * (values{4, 1}-values{3, 1}));

y = values{1, 2} * l0 + values{2, 2} * l1 + values{3, 2} * l2 + values{4, 2} * l3;

# Expandir ecuación
y = expand(y);

# Imprimir en pantalla
disp(y);

# Grilla en gráfico
grid on;
# El comando para restringir dominio y/o rango es axis
axis([-4 4 -5 20]);
# Muestro la función gráficamente
ezplot(y);

x0 = input('Introduzca un valor para la variable x -> ');

# subs reemplaza variable símbolica por valor. vpa convierte a decimal.
# El segundo parámetro son la cantidad de decimales a mostrar
disp(vpa(subs(y, x, x0), 5));


# https://www.studocu.com/latam/document/universidad-don-bosco/calculo-diferencial/gabriela-ortiz-primera-practica-de-matlab/23745908
