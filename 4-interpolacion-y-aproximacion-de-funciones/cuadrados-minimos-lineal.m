# Vectores de datos
edades    = [10, 20, 30, 40, 50, 60, 70, 80];
esperanza = [66, 56, 47, 37, 29, 20, 14, 8];

### Estimar la recta de máximo ajuste

# Calculo los valores de los elementos de las matrices
sum_x2 = sum(edades .* edades);
sum_x = sum(edades);
n = length(edades);

sum_xy = sum(edades .* esperanza);
sum_y = sum(esperanza);

# Valor que utilizaremos para el coeficiente de correlación de pearson
sum_y2 = sum(esperanza.* esperanza);

# Estructuro las matrices
matrix_1 = [sum_x2, sum_x; sum_x, n];
matrix_2 = [sum_xy; sum_y];

printf('Matrices \n\n');
# Imprimo por pantalla
disp(matrix_1);
printf('\n\n');
disp(matrix_2);
printf('\n\n');

# Los resultados son los coeficientes de la función lineal
result = inv(matrix_1) * matrix_2;

printf('Coeficientes resultantes (a y b) \n\n');
disp(result);
printf('\n\n');

a = result(1);
b = result(2);

pkg load symbolic;
syms x;
y = a*x + b;
printf('Resultado: \n\n');
disp(vpa(y, 7));
printf('\n\n');

x = 0:1:80;
y = a.*x + b;

# Mostrar gráfico con elementos
axis([0 80 0 70]);
plot(edades, esperanza, 'o');
hold on;
plot(y);

# Calcular coeficiente de correlación
mean_x = mean(edades);
mean_y = mean(esperanza);

deviation_x  = sqrt((sum_x2/n) - (mean_x^2));
deviation_y  = sqrt((sum_y2/n) - (mean_y^2));
deviation_xy = (sum_xy/n) - (mean_x * mean_y);

coef_pearson = deviation_xy / (deviation_x * deviation_y);
printf('Coeficiente de correlación de Pearson \n\n');
disp(coef_pearson);
