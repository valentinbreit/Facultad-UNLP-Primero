program Ejercicio1;
var
    n1,n2:integer;
begin
  Write ('Ingrese el primer numero: ');
  ReadLn(n1);
  Write ('Ingrese el segundo numero: ');
  ReadLn(n2);
  if (n1<n2) then
     begin
         Write ('El primer numero ', n1,' es menor.');
     end
  else if (n1>n2) then
     begin
         Write ('El segundo numero ', n2,' es menor.');
     end
  else
     Write ('Los numeros ',n1,' y ',n2,' son iguales.');
end.