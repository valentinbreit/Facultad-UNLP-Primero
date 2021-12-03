program Ejercicio7;
type
    Universidades=record
        NombreCentro:String;
        PertenenciaUniversidad:String;
        CantInvestigadores:Integer;
        CantBecarios:Integer;
    end;

//Leo los datos
procedure LecturaDeDatos (var a:Universidades);
begin
    Write ('Ingrese la cantidad de investigadores del centro: ');
    ReadLn (a.CantInvestigadores);
    //Me aseguro de no pedir datos inservibles si no me interesa de base
    if (a.CantInvestigadores>0) then begin
        Write ('Ingrese el nombre del centro: ');
        ReadLn (a.NombreCentro);
        Write ('Ingrese la pertenencia de la universidad: ');
        ReadLn (a.PertenenciaUniversidad);
        Write ('Ingrese la cantidad de becarios: ');
        ReadLn (a.CantBecarios);
    end;
end;

//Analizo mis datos
procedure AnalizoDatos (a:Universidades;var CantDeCentros,MasInvestigadoresXCentro,MenosBecariosxCentro1,MenosBecariosXCentro2:integer;var UniversidadConMasInvestigadores,CentroConMenosBecarios1,CentroConMenosBecarios2:String);
var
    MenosBecarios:integer;
begin
    MenosBecarios:=a.CantBecarios;
    CantDeCentros:=CantDeCentros+1;
    //saco la universidad con mayor cantidad de investigadores
    if (MasInvestigadoresXCentro<a.CantInvestigadores) then
    begin
        MasInvestigadoresXCentro:=a.CantInvestigadores;
        UniversidadConMasInvestigadores:=a.PertenenciaUniversidad;
    end;
    //saco los 2 centros con menos becarios
    if (MenosBecariosxCentro1>MenosBecarios) then  begin
        MenosBecariosXCentro2:=MenosBecariosxCentro1;
        CentroConMenosBecarios2:=CentroConMenosBecarios1;
        MenosBecariosxCentro1:=MenosBecarios;
        CentroConMenosBecarios1:=a.NombreCentro;
    end
    else if (MenosBecariosXCentro2>MenosBecarios) then
    begin
        MenosBecariosXCentro2:=MenosBecarios;
        CentroConMenosBecarios2:=a.NombreCentro;
    end;
end;

//programa principal
var
    a:Universidades;
    CantDeCentros,MasInvestigadoresXCentro,MenosBecariosxCentro1,MenosBecariosXCentro2:integer;
    UniversidadConMasInvestigadores,CentroConMenosBecarios1,CentroConMenosBecarios2,Universidad:String;
begin
    //inicializo mis variables
    MasInvestigadoresXCentro:=0;MenosBecariosxCentro1:=999;CentroConMenosBecarios1:='';
    LecturaDeDatos(a);
    while (a.CantInvestigadores<>0) do begin
        Universidad:=a.PertenenciaUniversidad;CantDeCentros:=0;
        while ((Universidad=a.PertenenciaUniversidad) and (a.CantInvestigadores<>0)) do begin
            AnalizoDatos(a,CantDeCentros,MasInvestigadoresXCentro,MenosBecariosxCentro1,MenosBecariosXCentro2,UniversidadConMasInvestigadores,CentroConMenosBecarios1,CentroConMenosBecarios2);
            LecturaDeDatos(a);
        end;
        WriteLn ('La cantidad de centros en la universidad: ', Universidad,' son: ',CantDeCentros);
    end;
    WriteLn ('Las 2 centro con menos becarios son: ', CentroConMenosBecarios1,' y ',CentroConMenosBecarios2);
end.