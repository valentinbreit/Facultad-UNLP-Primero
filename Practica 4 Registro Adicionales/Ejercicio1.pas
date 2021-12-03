program Ejercicio1;

type
    CantidadDeVotos=record
        Obtenidos:integer;
        TotalesEnLaLocalidad:integer;
    end;
    
    DatosCandidatos=record
        Localidad:String;
        Apellido:String;
        Votos:CantidadDeVotos;
    end;

//Modulo lectura de los votos
Procedure LecturaXVotos(var Candidato:CantidadDeVotos);
begin
    Write ('Ingrese la cantidad de votos que obtuvo el candidato: ');
    ReadLn (Candidato.Obtenidos);
    Write ('Ingrese los votos totales de la localidad: ');
    ReadLn (Candidato.TotalesEnLaLocalidad);
end;


//Modulo para lectura de datos del candidato
procedure LecturaXCandidato (var Candidato:DatosCandidatos);
begin
    Write ('Ingrese la localidad de la votacion: ');
    ReadLn (Candidato.Localidad);
    Write ('Ingrese el apellido del candidato: ');
    ReadLn (Candidato.Apellido);
    //utilizo un modulo aparte por si tengo que leer solo votos
    LecturaXVotos(Candidato.Votos);
end;


//Proceso los datos pedidos
procedure ProcesoDatosDelCandidatoXLocalidad(Candidato:DatosCandidatos;var CandidatoConMasVotos,CandidatoConMasPorcentaje:String;var MasVotos:integer;var MayorPorcentaje:Real);
var
    VotosTotalesDelCandidatoDeLaLocalidad:integer;
    PorcentajeDeLaLocalidad:Real;
begin
    //saco el porcentaje de los votos, en base a los votos obtenidos y los votos totales
    PorcentajeDeLaLocalidad:=((Candidato.Votos.Obtenidos*100)/Candidato.Votos.TotalesEnLaLocalidad);
    //compruebo que si el candidato en cuestion tuvo el mayor porcentaje de los votos
    if (MayorPorcentaje<PorcentajeDeLaLocalidad) then begin
        //me aseguro que mi variable cambie siempre
        MayorPorcentaje:=PorcentajeDeLaLocalidad;
        //me aseguro de actualizar al candidato
        CandidatoConMasPorcentaje:=Candidato.Apellido;
    end;
    //compruebo la cantidad de votos que obtuvo el candidato en cierta localidad
    VotosTotalesDelCandidatoDeLaLocalidad:=Candidato.Votos.Obtenidos;
    if (MasVotos<VotosTotalesDelCandidatoDeLaLocalidad) then begin
        //me aseguro de que mi variable cambie siempre
        MasVotos:=VotosTotalesDelCandidatoDeLaLocalidad;
        //me aseguro de siempre actualizar el candidato
        CandidatoConMasVotos:=Candidato.Apellido;
    end;
end;


var
    Candidato:DatosCandidatos;
    CandidatoConMasVotos,CandidatoConMasPorcentaje:String;
    MayorPorcentaje:Real;
    MasVotos:integer;
begin
    //inicializo mis variables
    MayorPorcentaje:=0;MasVotos:=0;
    CandidatoConMasVotos:='';CandidatoConMasPorcentaje:='';
    //se que se tiene que ejecutar hasta zarate y procesarse
    repeat
        LecturaXCandidato(Candidato);
        ProcesoDatosDelCandidatoXLocalidad(Candidato,CandidatoConMasVotos,CandidatoConMasPorcentaje,MasVotos,MayorPorcentaje);
    until (Candidato.Localidad='Zarate');
    //informo los valores que me pide el problema
    WriteLn ('El candidato con mayor cantidad de votos es: ',CandidatoConMasVotos);
    Write ('El candidato con mayor porcentaje en los votos es: ', CandidatoConMasPorcentaje);
end.