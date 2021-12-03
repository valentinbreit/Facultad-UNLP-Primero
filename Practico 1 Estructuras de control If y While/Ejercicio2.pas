program Ejercicio2;
var
    n:Real;
begin
  Write ('Ingrese un numero real: ');
  ReadLn(n);
  if (n<0) then
     begin
         Write ('El valor absoluto es: |', Abs(n):0:0,'|');
     end
  else
     Write ('El valor absoluto es: |', n:0:0,'|');
end.