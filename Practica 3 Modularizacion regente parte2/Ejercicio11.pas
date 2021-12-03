program Ejercicio11;

//Analizo si es par el nro ingresado
function EsPar (NumeroInscripcion:integer):Boolean;
begin
    if ((NumeroInscripcion mod 2) = 0) then
        EsPar:=True
    else 
        EsPar:=False;
end;

//Leo los datos
procedure leerDatos (var NumeroInscripcion:integer;var Apellido,Nombre:String);
begin
    Write ('Ingrese el Numero de Inscripcion: ');
    ReadLn(NumeroInscripcion);
    Write ('Ingrese el Apellido: ');
    ReadLn (Apellido);
    Write ('Ingrese el Nombre: ');
    ReadLn (Nombre);
end;

//Analizo todos los datos
procedure AnalizoDatos (var CantAlumnosConNroPar,NumeroInscripcionMasChico1,NumeroInscripcionMasChico2,NumeroInscripcionMasGrande1,NumeroInscripcionMasGrande2:integer; var ApellidoMasChico1,ApellidoMasChico2,NombreMasGrande1,NombreMasGrande2:String; NumeroInscripcion:integer;Apellido,Nombre:String);
begin
    //saco la suma para el porcentaje
    if (EsPar(NumeroInscripcion)) then
        CantAlumnosConNroPar:=CantAlumnosConNroPar+1;
    //veo los 2 numeros de inscripcion menores

    if (NumeroInscripcionMasChico1>NumeroInscripcion) then
    begin
        NumeroInscripcionMasChico2:=NumeroInscripcionMasChico1;
        ApellidoMasChico2:=ApellidoMasChico1;
        NumeroInscripcionMasChico1:=NumeroInscripcion;
        ApellidoMasChico1:=Apellido;
    end
    else if (NumeroInscripcionMasChico2>NumeroInscripcion) then
    begin
        NumeroInscripcionMasChico2:=NumeroInscripcion;
        ApellidoMasChico2:=Apellido;
    end;

    //veo los 2 numeros de inscripcion menores

    if (NumeroInscripcionMasGrande1<NumeroInscripcion) then
    begin
        NumeroInscripcionMasGrande2:=NumeroInscripcionMasGrande1;
        NombreMasGrande2:=NombreMasGrande1;
        NumeroInscripcionMasGrande1:=NumeroInscripcion;
        NombreMasGrande1:=Nombre;
    end
    else if (NumeroInscripcionMasGrande2<NumeroInscripcion) then
    begin
        NumeroInscripcionMasGrande2:=NumeroInscripcion;
        NombreMasGrande2:=Nombre;
    end;
end;

//informo los datos que me pide el programa
procedure informar (ApellidoMasChico1,ApellidoMasChico2,NombreMasGrande1,NombreMasGrande2:String;CantidadAlumnos,CantAlumnosConNroPar:integer);
var
    PorcentajeSobreElTotalDeAlumnos:Real;
begin
    WriteLn ('Los apellidos fueron: ', ApellidoMasChico1,' y ',ApellidoMasChico2);
    WriteLn ('Los Nombres son: ', NombreMasGrande1,' y ', NombreMasGrande2);
    Write ('El porcentaje de los alumnos con nro inscripcion par es: ', ((CantAlumnosConNroPar*100)/CantidadAlumnos):0:2);
end;


//programa principal
var
    CantidadAlumnos,CantAlumnosConNroPar,NumeroInscripcion, NumeroInscripcionMasChico1,NumeroInscripcionMasChico2,NumeroInscripcionMasGrande1,NumeroInscripcionMasGrande2:integer;
    Apellido,Nombre,ApellidoMasChico1,ApellidoMasChico2,NombreMasGrande1,NombreMasGrande2:String;
begin
    //inicializo mis variables
    NumeroInscripcionMasChico1:=9999;
    NumeroInscripcionMasGrande1:=0;
    CantidadAlumnos:=0;
    CantAlumnosConNroPar:=0;
    ApellidoMasChico1:='';
    NombreMasGrande1:='';
    repeat
        //saco la suma para el procentaje
        CantidadAlumnos:=CantidadAlumnos+1;
        leerDatos(NumeroInscripcion,Apellido,Nombre);
        AnalizoDatos(CantAlumnosConNroPar,NumeroInscripcionMasChico1,NumeroInscripcionMasChico2,NumeroInscripcionMasGrande1,NumeroInscripcionMasGrande2,ApellidoMasChico1,ApellidoMasChico2,NombreMasGrande1,NombreMasGrande2,NumeroInscripcion,Apellido,Nombre);
    until (NumeroInscripcion = 1200);
    Informar(ApellidoMasChico1,ApellidoMasChico2,NombreMasGrande1,NombreMasGrande2,CantidadAlumnos,CantAlumnosConNroPar);
end.