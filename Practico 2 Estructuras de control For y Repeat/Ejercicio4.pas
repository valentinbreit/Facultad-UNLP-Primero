program Ejercicio4;
var
    NumeroMinimo1,NumeroMinimo2,NumeroIngresado,i:Integer;
begin
    NumeroMinimo1:=32767;
    NumeroMinimo2:=32767;
    for i:=1 to 1000 do
    begin
        Write ('Ingrese un numero entero: ');
        ReadLn(NumeroIngresado);
        if (NumeroMinimo1>NumeroIngresado) then
        begin
          NumeroMinimo2:=NumeroMinimo1;
          NumeroMinimo1:=NumeroIngresado;
        end
        else if (NumeroMinimo2>NumeroIngresado) then
        begin
            NumeroMinimo2:=NumeroIngresado;
        end;
    end;
    Write ('Los numeros minimos fueron: ',NumeroMinimo1,' y ',NumeroMinimo2);
end.