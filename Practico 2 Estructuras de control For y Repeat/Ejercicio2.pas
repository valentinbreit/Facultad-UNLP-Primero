program Ejercicio2;
var
    i,NumeroIngresado,NumeroMayor:Integer;
begin
    NumeroMayor:=0;
    for i:=1 to 10 do
      begin
         Write ('Ingrese un numero: ');
         ReadLn(NumeroIngresado);
         if (NumeroMayor<NumeroIngresado) then
             NumeroMayor:=NumeroIngresado;
      end;
    Write ('El numero mayor ingresado fue: ', NumeroMayor);
end.