program Ejercicio4b;
var
    NumMin1,NumMin2,NumeroIngresado:Integer;
begin
    NumMin1:=32767;
    NumMin2:=32767;
    Write ('Ingrese un numero entero: ');
    Readln(NumeroIngresado);
    while (NumeroIngresado <> 0) do
    begin
        if (NumMin1>NumeroIngresado) then
        begin
             NumMin2:=NumMin1;
             NumMin1:=NumeroIngresado;
        end
        else if (NumMin2>NumeroIngresado) then
             NumMin2:=NumeroIngresado;
        Write ('Ingrese un numero entero: ');
        Readln(NumeroIngresado);
    end;
    Write ('Los numeros minimos son: ', NumMin1,' y ', NumMin2);
end.