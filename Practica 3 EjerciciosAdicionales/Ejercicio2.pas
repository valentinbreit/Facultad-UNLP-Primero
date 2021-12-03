program Ejercicio2;

procedure Calculo (NumeroIngresado1,NumeroIngresado2:Integer;var Suma,Producto:Integer);
var 
    i:integer;
begin
    for i:=NumeroIngresado1 to NumeroIngresado2 do begin
       Suma:=Suma+i;
       Producto:=Producto*i;
    end;
end;

var
    i,X,Y,Suma,Producto:Integer;
begin
    for i:=0 to 10 do begin
       Suma:=0;Producto:=1;
       Write ('Ingrese un par de numeros: ');
       ReadLn (X);
       ReadLn (Y);
       Calculo(X,Y,Suma,Producto);
       WriteLn ('La suma es: ',Suma);
       WriteLn ('El producto es:', Producto);
    end;
end.