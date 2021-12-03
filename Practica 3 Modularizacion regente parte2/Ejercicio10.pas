program Ejercicio10;

function EsPar(NumeroIngresado:Integer):Boolean;
begin
  if ((NumeroIngresado mod 2) = 0) then begin
     EsPar:=True;
     end
  else begin
     EsPar:=False;
  end;
end;


procedure LecturaDeDigitos(NumeroIngresado:integer;var SumaPar,CantImpares:Integer);
var
    Digito:Integer;
begin
  while (NumeroIngresado<>0) do begin
     Digito:=NumeroIngresado mod 10;
     if (EsPar(NumeroIngresado)) then begin
       SumaPar:=SumaPar+Digito;
     end
     else
        CantImpares:=CantImpares+Digito;
     NumeroIngresado:=NumeroIngresado div 10;
   end;
end;


var
   NumeroIngresado,SumaPar,CantImpares:Integer;
begin
  Write ('Ingrese un numero entero: ');
  ReadLn (NumeroIngresado);
  //no puedo usar 123456 xq es mayor a los integer que se pueden ingresar, rompe el codigo
  while (NumeroIngresado<>12345) do begin
     SumaPar:=0;
     CantImpares:=0;
     LecturaDeDigitos(NumeroIngresado,SumaPar,CantImpares);
     Write ('La suma de los digitos pares es: ', SumaPar);
     WriteLn ('. La suma de los digitos impares es: ', CantImpares);
     Write ('Ingrese un numero entero: ');
     ReadLn (NumeroIngresado);
  end;
end.