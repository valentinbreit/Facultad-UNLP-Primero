program Ejercicio9;

function  CantidadDeDigitos (numero:Integer;var suma:Integer):integer;
var
  aux:integer;
begin
CantidadDeDigitos:=0;
while (numero<>0) do begin
  CantidadDeDigitos:=CantidadDeDigitos+1;
  aux:=numero mod 10;
  suma:=suma+aux;
  numero:=numero div 10;
end;
end;

var
  numero,suma:integer;
begin
suma:=0;
Write ('Ingrese un numero: ');
ReadLn(numero);
Write ('La cantidad de digitos del numero son: ', CantidadDeDigitos(numero,suma),' y su suma es: ',suma);
end.