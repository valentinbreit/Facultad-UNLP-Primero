program Ejercicio2C;
const
    AnoRegente=2019;
type
    Dias = 1 .. 31;
    Meses = 1 .. 12;

    Fechas = Record
        Dia:Dias;
        Mes:Meses;
    end;

    Casamiento = Record
        Fecha:Fechas;
    end;

procedure LeoFecha(var a:Casamiento; var ano:Integer);
begin
    Write ('Ingrese el año de casamiento: ');
    ReadLn (ano);
    if (ano = AnoRegente) then begin
        Write ('Ingrese el dia del casamiento: ');
        ReadLn (a.Fecha.Dia);
        Write ('Ingrese el mes del casamiento: ');
        ReadLn (a.Fecha.Mes);
    end;
end;

var
    a:Casamiento;
    CasamientoEnVerano,CasamientoAntesDia10,ano:integer;
begin
    CasamientoEnVerano:=0;
    CasamientoAntesDia10:=0;
    LeoFecha(a,ano);
    while (ano = AnoRegente) do begin
        if ((a.Fecha.Mes=1) or (a.Fecha.Mes=2) or (a.Fecha.Mes=3)) then begin
            CasamientoEnVerano:=CasamientoEnVerano+1;
        end;
        if (a.Fecha.Dia<11) then begin
            CasamientoAntesDia10:=CasamientoAntesDia10+1;
        end;
        LeoFecha(a,ano);
    end;
    WriteLn ('Casamientos en verano: ',CasamientoEnVerano);
    Write ('Casamiento antes del 10: ', CasamientoAntesDia10);
end.