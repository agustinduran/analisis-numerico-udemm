pkg load symbolic;
values = cell(xi_length, 2);
values{1, 1} = 1;
values{2, 1} = 3;
values{3, 1} = 5;
values{4, 1} = 7;

values{1, 2} = 0;
values{2, 2} = 1.0986122;
values{3, 2} = 1.6094379;
values{4, 2} = 1.9459101;

# Cálculo de valores diferenciales
a0 = (values{2, 2} - values{1, 2}) / (values{2, 1} - values{1, 1});
a1 = (values{3, 2} - values{2, 2}) / (values{3, 1} - values{2, 1});
a2 = (values{4, 2} - values{3, 2}) / (values{4, 1} - values{3, 1});

b0 = (a1 - a0) / (values{3, 1} - values{1, 1});
b1 = (a2 - a1) / (values{4, 1} - values{2, 1});

c0 = (b1 - b0) / (values{4, 1} - values{1, 1});

printf("\n\n Valores diferenciales \n\n");
disp({{a0, a1, a2}, {b0, b1}, {c0}});
printf("\n\n\n\n");

syms x;
eq = values{1, 2};
eq += a0 * (x - values{1, 1});
eq += b0 * (x - values{1, 1}) * (x - values{2, 1});
eq += c0 * (x - values{1, 1}) * (x - values{2, 1}) * (x - values{3, 1});

# Expandir ecuación
eq = expand(eq);
printf("\n\n Función resultante de la interpolación de Newton-Gregory \n\n\n");
# Imprimir en pantalla
disp(eq);

# Grilla en gráfico
grid on;
# El comando para restringir dominio y/o rango es axis
axis([-4 4 -5 20]);
# Muestro la función gráficamente
ezplot(eq);

printf("\n\n Evaluación de la función aproximada en x = 2 \n\n");
# Reemplazar f(x) con x=a; subs reemplaza variable símbolica por valor. vpa convierte a decimal.
# El segundo parámetro son la cantidad de decimales a mostrar
vpa(subs(eq, x, 2), 5)


# https://www.studocu.com/latam/document/universidad-don-bosco/calculo-diferencial/gabriela-ortiz-primera-practica-de-matlab/23745908
