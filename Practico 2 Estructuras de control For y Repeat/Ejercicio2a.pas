program Ejercicio2;
var
    i,pos,NumeroIngresado,NumeroMayor:Integer;
begin
    NumeroMayor:=0;
    for i:=1 to 10 do
      begin
         Write ('Ingrese un numero: ');
         ReadLn(NumeroIngresado);
         if (NumeroMayor<NumeroIngresado) then
            begin
                NumeroMayor:=NumeroIngresado;
                pos:=i;
            end;
      end;
    Write ('El numero mayor ingresado fue: ', NumeroMayor,' en la posicion ', pos);
end.