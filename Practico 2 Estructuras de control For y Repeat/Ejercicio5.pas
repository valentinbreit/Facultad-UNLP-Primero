program Ejercicio5;
var
    NumMaximo,NumMinimo,NumeroIngresado,ResultadoFinal:Integer;
begin
    NumMaximo:=0;
    NumMinimo:=32767;
    ResultadoFinal:=0;
    repeat
      Write ('Ingrese un numero entero: ');
      ReadLn(NumeroIngresado);
      if (NumMaximo<NumeroIngresado) then
         NumMaximo:=NumeroIngresado;
      if (NumMinimo>NumeroIngresado) then
         NumMinimo:=NumeroIngresado;
      ResultadoFinal:=ResultadoFinal+NumeroIngresado;
    until (NumeroIngresado=100);
    Write ('El numero maximo es: ', NumMaximo,'. El numero minimo es ', NumMinimo,'. La suma total es ',ResultadoFinal);
end.