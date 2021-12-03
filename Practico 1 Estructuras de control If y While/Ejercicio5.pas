program Ejercicio5;
var
    MaxIntentos:integer;
    n1,n2:Real;
begin
  MaxIntentos:=1;
  Write ('Ingrese un numero: ');
  ReadLn(n1);
  Write ('Ingrese el doble del numero: ');
  ReadLn(n2);
  while (((n1*2)<>n2) and (Maxintentos<10)) do
      begin
         Write ('Intente otra vez: ');
         ReadLn(n2);
         MaxIntentos:=MaxIntentos+1;
      end;
  if (MaxIntentos=10) then
     Write ('No se ha ingresado el doble del numero.')
  else
     Write ('Se ha ingresado el doble del numero.');
end.