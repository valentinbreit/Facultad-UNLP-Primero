program Ejercicio6;
type

    Importacion = record
        Marca:String;
        Linea:String;
        CantNucleos:Integer;
        VelReloj:Real;
        TamTransistores:Integer;
    end;

//Modulo de Lectura
procedure LecturaDeDatosDelProcesador (var a:Importacion);
begin
    Write ('Ingrese los nucleos del procesador: ');
    ReadLn (a.CantNucleos);
    if (a.CantNucleos>0) then
    begin
        Write ('Ingrese la marca del procesador: ');
        ReadLn (a.Marca);
        Write ('Ingrese la linea del procesador: ');
        ReadLn (a.Linea);
        Write ('Ingrese la velocidad del reloj del procesador: ');
        ReadLn (a.VelReloj);
        Write ('Ingrese el tamaño de los transistores del procesador: ');
        ReadLn (a.TamTransistores);
    end;
end;

//Modulo analizo los datos
Procedure AnalizoLosDatosDelProcesador (a:Importacion;var ContNucleoyReloj,CantMarcas,TamTransistores:integer);
begin
    //veo si debo informar la marca y la linea si tiene mas de 22 transistores (tamaño)
    if (a.TamTransistores>14) then begin
        Write ('Marca: ', a.Marca,' Linea: ',a.Linea);
    end;
    //Contador general de nucleos y velocidad de reloj
    if ((a.CantNucleos>=1) and (a.VelReloj>=2)) then begin
        ContNucleoyReloj:=ContNucleoyReloj+1;
    end;
    if (TamTransistores<a.TamTransistores) then begin
        CantMarcas:=CantMarcas+1;
    end;
end;

//programa principal
var
    a:Importacion;
    MarcaANombrar1,MarcaANombrar2:String;
    CantMarcas,ContNucleoyReloj,Cont2Marcas1,Cont2Marcas2,TamTransistores,NucleosRegentes:integer;
begin
    ContNucleoyReloj:=0;TamTransistores:=14;CantMarcas:=0;
    MarcaANombrar1:='';
    LecturaDeDatosDelProcesador(a);
    while (a.CantNucleos<>0) do begin
        Cont2Marcas1:=0;NucleosRegentes:=a.CantNucleos;
        while ((NucleosRegentes=a.CantNucleos) and (a.CantNucleos<>0)) do begin
            AnalizoLosDatosDelProcesador(a,ContNucleoyReloj,CantMarcas,TamTransistores);
            LecturaDeDatosDelProcesador(a);
        end;
        if (Cont2Marcas1<CantMarcas) then begin
            MarcaANombrar2:=MarcaANombrar1;
            MarcaANombrar1:=a.Marca;
            Cont2Marcas2:=Cont2Marcas1;
            Cont2Marcas1:=CantMarcas;
        end
        else if (Cont2Marcas2<CantMarcas) then begin
            MarcaANombrar2:=a.Marca;
            Cont2Marcas2:=CantMarcas;
        end;
    end;
    WriteLn ('La cantidad de procesadores cuyos relojes superan el 2: ',ContNucleoyReloj);
    Write ('Las 2 marcas con transitores mas grandes son: ', MarcaANombrar1,' y ',MarcaANombrar2);
end.