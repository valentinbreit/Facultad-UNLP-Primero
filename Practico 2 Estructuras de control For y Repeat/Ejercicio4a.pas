program Ejercicio4a;
var
    salgo:Boolean;
    NumMin1,NumMin2,NumeroIngresado:Integer;
begin
    salgo:=True;
    NumMin1:=0;
    NumMin2:=32767;
    repeat
      Write ('Ingrese un numero entero: ');
      ReadLn(NumeroIngresado);
      if (NumeroIngresado=0) then
         salgo:=False
      else if (NumeroIngresado<>0) then
      begin
         if (NumMin2>NumeroIngresado) then
         begin
             NumMin2:=NumeroIngresado;
         end;
      end;
    until (Salgo=False);
    Write ('Los numeros minimos son: ', NumMin1,' y ', NumMin2);
end.