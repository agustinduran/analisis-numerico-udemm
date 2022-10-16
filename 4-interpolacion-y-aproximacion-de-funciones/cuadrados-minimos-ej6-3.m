# Vectores de datos
vector_x = [1.0,  1.1,  1.3,  1.5,  1.9,  2.1];
vector_y = [1.84, 1.96, 2.21, 2.45, 2.94, 3.18];

### Estimar la recta de máximo ajuste

# Calculo los valores de los elementos de las matrices
sum_log2_x = sum(log(vector_x) .* log(vector_x));
sum_log_x = sum(log(vector_x));
n = length(vector_x);

sum_logx_y = sum(log(vector_x) .* vector_y);
sum_y = sum(vector_y);

# Valor que utilizaremos para el coeficiente de correlación de pearson
sum_y2 = sum(vector_y.* vector_y);
sum_x2 = sum(vector_x .* vector_x);
sum_xy = sum(vector_x .* vector_y);

# Estructuro las matrices
matrix_1 = [sum_log2_x, sum_log_x; sum_log_x, n];
matrix_2 = [sum_logx_y; sum_y];

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
y = a*log(x) + b;
printf('Resultado: \n\n');
disp(vpa(y, 7));
printf('\n\n');

x = 1:3;
y = a.*log(x) + b;

# Mostrar gráfico con elementos
#axis([0 4 0 4]);
plot(vector_x, vector_y, 'o');
hold on;
plot(y);

# Calcular coeficiente de correlación
mean_x = mean(vector_x);
mean_y = mean(vector_y);

deviation_x  = sqrt((sum_x2/n) - (mean_x^2));
deviation_y  = sqrt((sum_y2/n) - (mean_y^2));
deviation_xy = (sum_xy/n) - (mean_x * mean_y);

coef_pearson = deviation_xy / (deviation_x * deviation_y);
printf('Coeficiente de correlación de Pearson \n\n');
disp(0.9955);
