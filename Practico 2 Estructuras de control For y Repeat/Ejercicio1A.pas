program Ejercicio1A;
var
    NumeroIngresado,SumaTotal,Mayoresa5,i:Integer;
begin
    SumaTotal:=0;
    Mayoresa5:=0;
    for i:=1 to 10 do
      begin
         Write ('Ingrese un numero: ');
         ReadLn(NumeroIngresado);
         SumaTotal:=SumaTotal+1;
         if (NumeroIngresado>5) then
            Mayoresa5:=Mayoresa5+1;
      end;
    Write ('El resultado de la suma de los numeros es: ', SumaTotal);
    Write ('. La cantidad de numeros mayores a 5 es: ', Mayoresa5);
end.