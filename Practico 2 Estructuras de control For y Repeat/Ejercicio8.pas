program Ejercicio8;
var
    GananciaIngresada,GananciaPorDia,GananciaPorMes,MayorGanancia:Real;
    i,pos:Integer;
begin
    //inicializo variables
    GananciaPorMes:=0;
    MayorGanancia:=0;
    //bucle x mes
    for i:=1 to 31 do
    begin
        //bucle x dia
        GananciaPorDia:=0;
        Write ('Ingrese la venta: $');
        ReadLn(GananciaIngresada);
        while (GananciaIngresada<>0) do begin
            GananciaPorDia:=GananciaPorDia+GananciaIngresada;
            Write ('Ingrese la venta: $');
            ReadLn(GananciaIngresada);
        end;
        //Imprimo ganancias por dia
        if (MayorGanancia<GananciaPorDia) then
        begin
            MayorGanancia:=GananciaPorDia;
            pos:=i;
        end;
        WriteLn ('La ganancia de este dia es de: $', GananciaPorDia:0:2);
        GananciaPorMes:=GananciaPorMes+GananciaPorDia;
    end;
    WriteLn('La ganancia del mes fue: $', GananciaPorMes:0:2);
    WriteLn('El dia que mas se vendio fue el dia: ',pos);
end.