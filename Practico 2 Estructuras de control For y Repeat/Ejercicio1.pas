program Ejercicio1;
var
    NumeroIngresado, SumaTotal, i:Integer;
begin
    SumaTotal:=0;
    for i:=1 to 10 do
      begin
         Write ('Ingrese un numero entero: ');
         ReadLn(NumeroIngresado);
         SumaTotal:=SumaTotal+NumeroIngresado;
      end;
    Write ('La suma total es de: ', SumaTotal);
end.