# Este algoritmo está realizado para calcularse a partir de 5 valores de x y f(x)
pkg load symbolic;
xi_length = 5;
values = cell(xi_length, 2);
for i = 1 : 1 : xi_length
	values{i, 1} = input("Introduzca el valor para Xi -> ");
	values{i, 2} = input("Introduzca el valor para f(Xi) -> ");
endfor

# Cálculo de valores diferenciales
a0 = (values{2, 2} - values{1, 2}) / (values{2, 1} - values{1, 1});
a1 = (values{3, 2} - values{2, 2}) / (values{3, 1} - values{2, 1});
a2 = (values{4, 2} - values{3, 2}) / (values{4, 1} - values{3, 1});
a3 = (values{5, 2} - values{4, 2}) / (values{5, 1} - values{4, 1});

b0 = (a1 - a0) / (values{3, 1} - values{1, 1});
b1 = (a2 - a1) / (values{4, 1} - values{2, 1});
b2 = (a3 - a2) / (values{5, 1} - values{3, 1});

c0 = (b1 - b0) / (values{4, 1} - values{1, 1});
c1 = (b2 - b1) / (values{5, 1} - values{2, 1});

d0 = (c1 - c0) / (values{5, 1} - values{1, 1});

# Valores diferenciales
disp({{a0, a1, a2, a3}, {b0, b1, b2}, {c0, c1}, {d0}});

syms x;
eq = values{1, 2};
eq += a0 * (x - values{1, 1});
eq += b0 * (x - values{1, 1}) * (x - values{2, 1});
eq += c0 * (x - values{1, 1}) * (x - values{2, 1}) * (x - values{3, 1});
eq += d0 * (x - values{1, 1}) * (x - values{2, 1}) * (x - values{3, 1}) * (x - values{4, 1});

# Expandir ecuación
eq = expand(eq);

# Imprimir en pantalla
disp(eq);

# Grilla en gráfico
grid on;
# El comando para restringir dominio y/o rango es axis
axis([-4 4 -5 20]);
# Muestro la función gráficamente
ezplot(eq);

# REEMPLAZAR X POR UN VALOR
# subs reemplaza variable símbolica por valor. vpa convierte a decimal.
# El segundo parámetro son la cantidad de decimales a mostrar
# vpa(subs(eq, x, 2.5), 5)


# https://www.studocu.com/latam/document/universidad-don-bosco/calculo-diferencial/gabriela-ortiz-primera-practica-de-matlab/23745908
