program Ejercicio6;
var
    Dolares,ValorHoy,Pesos,Comision,Total:Real;
begin
  Write ('Ingrese el monto de la transaccion: ');
  ReadLn(Dolares);
  Write ('Ingrese el valor del dolar Hoy: ');
  ReadLn(ValorHoy);
  Pesos:=Dolares*ValorHoy;
  Write ('Ingrese la cantidad de la comision del banco: ');
  ReadLn(Comision);
  Total:=((Pesos*Comision)/100)+Pesos;
  Write ('Transaccion total es de: $', Total:2:2,' Pesos argentinos.');
end.