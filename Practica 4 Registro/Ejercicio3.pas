program  Ejercicio3;

type
    Datos=record
        CUE:integer;
        CantDocentes:integer;
        CantAlumnos:integer;
        NombreEscuela:String;
        Localidad:String;
    end;

//saco el cosciente entre docentes y alumnos
Function CosDocAlu (a:Datos): Real;
begin
    CosDocAlu:=(a.CantDocentes/a.CantAlumnos);
end;

//leo todos los datos necesarios
Procedure LecturaDeEscuela (var a:Datos);
begin
    Write ('Ingrese el Nombre de la Escuela: ');
    ReadLn (a.NombreEscuela);
    Write ('Ingrese el Codigo Unico de Establecimiento: ');
    ReadLn (a.CUE);
    Write ('Ingrese la cantidad de docentes que tiene el establecimiento: ');
    ReadLn (a.CantDocentes);
    Write ('Ingrese la cantidad de alumnos que tiene el establecimiento: ');
    ReadLn (a.CantAlumnos);
    Write ('Ingrese la Localidad del establecimiento: ');
    ReadLn (a.Localidad);
end;

//programa principal
var
    a:Datos;
    //Contabilizo la cantidad de escuelas de la plata
    //que superan la cantidad de alumnos superior a la UNESCO
    CantColegiosLPSupera:integer;
    //Los cue y nombres de los colegios con mejor relacion docente alumno
    CUECol1,CUECol2:integer;
    Supera1,Supera2:Real;
    NombreCol1,NombreCol2:String;
    //Variables auxiliar para no llamar muchas veces a la funcion o bucles
    aux:Real;
    i:integer;
begin
    //inicializo las variables pertinentes
    CantColegiosLPSupera:=0;
    CUECol1:=0;
    Supera1:=(-1);
    NombreCol1:='';
    //inicializo mi bucle for
    for i:=1 to 2400 do begin
        //Leo mis datos
        LecturaDeEscuela(a);
        aux:=CosDocAlu(a);
        //Cuento la cantidad de Colegios de la plata
        if ((a.Localidad='La Plata') and (aux>(1/23435))) then begin
            CantColegiosLPSupera:=CantColegiosLPSupera+1;
        end;
        //Me aseguro de guardar los 2 mejores cue y nombres
        if (Supera1<aux) then begin
            CUECol2:=CUECol1;
            NombreCol2:=NombreCol1;
            CUECol1:=a.CUE;
            NombreCol1:=a.NombreEscuela;
            Supera2:=aux;
            Supera1:=aux;
        end
        else if (Supera2<aux) then begin
            CUECol2:=a.CUE;
            NombreCol2:=a.NombreEscuela;
        end;
    end;
    //informo los datos pedidos
    WriteLn ('La cantidad de colegios de la plata con una relacion de alumnos por docente superior a la sugerida por al unesco es de: ', CantColegiosLPSupera);
    WriteLn ('Los 2 mejores CUE y nombres son: ', CUECol1,' y su nombre :',NombreCol1);
    Write ('. y: ', CUECol2,' y su nombre :', NombreCol2);
end.