program Ejercicio7;
var
    NombrePiloto,NombrePiloto1,NombrePiloto2,NombrePiloto3,NombrePiloto4:String;
    Tiempo,Puesto1,Puesto2,Puesto3,Puesto4:Real;
    i:Integer;
begin
    //inicializo variables
    Puesto1:=Exp(38*ln(10))*3.4;
    Puesto2:=Exp(38*ln(10))*3.4;
    Puesto3:=0;
    Puesto4:=0;
    NombrePiloto1:=' ';
    NombrePiloto3:=' ';
    for i:=1 to 100 do
    begin
        Write ('Ingrese el nombre del piloto: ');
        ReadLn(NombrePiloto);
        Write ('Ingrese el tiempo en el que termino la carrera: ');
        ReadLn(Tiempo);
        if (Tiempo>0) then
        begin
            if (Puesto1>Tiempo) then
            begin
                Puesto2:=Puesto1;
                Puesto1:=Tiempo;
                NombrePiloto2:=NombrePiloto1;
                NombrePiloto1:=NombrePiloto;
            end
            else if (Puesto2>Tiempo) then
            begin
                Puesto2:=Tiempo;
                NombrePiloto2:=NombrePiloto;
            end;
            if (Puesto3<Tiempo) then
            begin
                Puesto4:=Puesto3;
                Puesto3:=Tiempo;
                NombrePiloto4:=NombrePiloto3;
                NombrePiloto3:=NombrePiloto;
            end
            else if (Puesto4<Tiempo) then
            begin
                Puesto4:=Tiempo;
                NombrePiloto4:=NombrePiloto;
            end;
        end
        else
            WriteLn('Tiempo Invalido.');
    end;
    Write ('Los 2 mejores tiempos fueron: ', NombrePiloto1,' y ',NombrePiloto2);
    Write ('. Los 2 ultimos fueron: ',NombrePiloto3,' y ', NombrePiloto4);
end.