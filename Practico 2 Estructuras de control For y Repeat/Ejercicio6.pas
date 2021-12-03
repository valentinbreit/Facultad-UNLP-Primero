program Ejercicio6;
var
    Codigo,CodigoMinimo1,CodigoMinimo2,ProductosEspeciales,i:Integer;
    Precio,PrecioMinimo1,PrecioMinimo2:Real;
begin
    CodigoMinimo1:=0;
    CodigoMinimo2:=0;
    PrecioMinimo1:=Exp(38*ln(10))*3.4;
    PrecioMinimo2:=Exp(38*ln(10))*3.4;
    ProductosEspeciales:=0;
    for i:=1 to 200 do
    begin
        Write ('Ingrese el codigo del producto: ');
        ReadLn(Codigo);
        if ((Codigo>=1) and (Codigo<=200)) then
        begin
          Write ('Ingrese el precio del producto: $');
          ReadLn(Precio);
          if (PrecioMinimo1>Precio) then
          begin
             PrecioMinimo2:=PrecioMinimo1;
             PrecioMinimo1:=Precio;
             CodigoMinimo2:=CodigoMinimo1;
             CodigoMinimo1:=Codigo;
          end
          else if (PrecioMinimo2>Precio) then
          begin
             PrecioMinimo2:=Precio;
             CodigoMinimo2:=Codigo;
          end;
          if (((Codigo mod 2)=0) and (Precio>16)) then
          begin
             ProductosEspeciales:=ProductosEspeciales+1;
          end;
        end
        else if ((Codigo<1) or (Codigo>200)) then
        begin
            WriteLn ('Codigo incorrecto.');
        end;
    end;
    Write ('Los productos con precio minimo son: ', CodigoMinimo1,' y ',CodigoMinimo2);
    Write ('. La cantidad de productos especiales son: ',ProductosEspeciales);
end.