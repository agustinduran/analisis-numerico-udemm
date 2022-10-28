x = 2;
iterations = input('¿Cuántas iteraciones desea realizar para la serie? -> ');

value_taylor = 0;
for n = 1 : iterations
  value_taylor += (-1)^(n+1) * ((x^n)/n);
endfor

printf('\n');
format long g;
printf('El resultado es -> ');
disp(value_taylor);


