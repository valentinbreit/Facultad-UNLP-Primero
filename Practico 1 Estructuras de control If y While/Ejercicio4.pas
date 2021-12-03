program Ejercicio3;
var
    n1,n2:Real;
begin
  Write ('Ingrese el numero 1: ');
  ReadLn(n1);
  Write ('Ingrese el numero 2: ');
  ReadLn(n2);
  while (n1<>n2) do
     begin
         Write ('Ingrese el primer numero ingresado: ');
         ReadLn(n2);
     end;
end.