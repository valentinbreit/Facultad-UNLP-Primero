program Ejercicio9A;

procedure CantidadDeDigitos (numero:Integer;var suma,CantDigitos:Integer);
var
  aux:integer;
begin
while (numero<>0) do begin
  CantDigitos:=CantDigitos+1;
  aux:=numero mod 10;
  suma:=suma+aux;
  numero:=numero div 10;
end;
end;

var
  numero,suma,CantDigitos:integer;
begin
CantDigitos:=0;
repeat
  suma:=0;
  Write ('Ingrese un numero: ');
  ReadLn(numero);
  CantidadDeDigitos(numero,suma,CantDigitos);
until (suma=10);
Write ('La cantidad de digitos del numero son: ', CantDigitos);
end.