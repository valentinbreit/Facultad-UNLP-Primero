program Ejercicio7;
var
    Supera,PrecioActual,PrecioNuevo:Real;
    Salgo:Boolean;
    Codigo:String;
begin
    Salgo:=True;
    Supera:=0;
    while (salgo) do
        begin
            Write ('Ingrese el codigo del producto: ');
            ReadLn(Codigo);
            Write ('Ingrese el Precio Actual: ');
            ReadLn(PrecioActual);
            Write ('Ingrese el nuevo precio del producto: ');
            ReadLn(PrecioNuevo);
            Supera:=(PrecioNuevo*100)/PrecioActual;
            if (Supera>110) then
                begin
                    WriteLn('El aumento del producto ', Codigo,' supera el 10%');
                end
            else
                WriteLn('El aumento del producto ', Codigo,' no supera el 10%');
            if (Codigo='37817') then
                Salgo:=False
            else
                Salgo:=True;
        end;
end.