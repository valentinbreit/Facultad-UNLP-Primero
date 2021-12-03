program Ejercicio8;
type
    DocenteContacto=record
        DNI:String;
        Nombre:String;
        Apellido:String;
        email:String;
    end;
    
    Proyectos=record
        CodigoUnico:Integer;
        Titulo:String;
        DocenteCoordinador:DocenteContacto;
        CantAlumnos:Integer;
        localidad:String;
        NombreEscuela:String;
    end;


function EsPar(numB:Integer):Boolean;
begin
    if ((numB mod 2) = 0) then begin
        EsPar:=True;
    end
    else
        EsPar:=False;
end;

//analizo codigo del titulo
function AnalizoCodigo (a:Proyectos):Boolean;
var
    aux,CantPar,CantImpar:integer;
begin
    CantPar:=0;CantImpar:=0;
    while (a.CodigoUnico<>0) do begin
        aux:=a.CodigoUnico mod 10;
        if (EsPar(aux)) then begin
            CantPar:=CantPar+1;
        end
        else 
            CantImpar:=CantImpar+1;
        a.CodigoUnico:=a.CodigoUnico div 10;
    end;
    if (CantPar=CantImpar) then AnalizoCodigo:=True
    else AnalizoCodigo:=False;
end;

//Leo Datos Por proyecto
procedure LecturaXDocente (var a:Proyectos);
begin
    Write ('Ingrese Los datos del docente: ');
    ReadLn (a.DocenteCoordinador.DNI);
    ReadLn (a.DocenteCoordinador.Nombre);
    ReadLn (a.DocenteCoordinador.Apellido);
    ReadLn (a.DocenteCoordinador.email);
end;

//Leo Datos por escuela
procedure LecturaXProyecto (var a:Proyectos);
begin
    Write ('Ingrese el codigo Unico: ');
    ReadLn (a.CodigoUnico);
    if (a.CodigoUnico<>(-1)) then begin
        Write ('Ingrese el titulo del proyecto: ');
        ReadLn (a.Titulo);
        Write ('Ingrese la Cantidad de Alumnos en el proyecto: ');
        ReadLn (a.CantAlumnos);
        Write ('Ingrese la localidad del establecimiento: ');
        ReadLn (a.localidad);
        Write ('Ingrese el nombre de la escuela: ');
        ReadLn (a.NombreEscuela);
        LecturaXDocente(a);
    end;
end;

//Calculo los datos necesarios
procedure AnalizoDatos (a:Proyectos;var Participantes1,Participantes2:Integer;var NombreEscuela1,NombreEscuela2:String);
begin
    //analizo si el proyecto es de daireaux y si debo mostrarlo
    if ((a.localidad='Daireaux') and AnalizoCodigo(a)) then begin
        WriteLn ('El nombre del titulo es: ', a.Titulo);
    end;
    //renuevo los nombres de los 2 proyectos con mas alumnos
    if (Participantes1<a.CantAlumnos) then begin
        Participantes2:=Participantes1;
        NombreEscuela2:=NombreEscuela1;
        Participantes1:=a.CantAlumnos;
        NombreEscuela1:=a.NombreEscuela;
    end
    else if (Participantes2<a.CantAlumnos) then begin
        Participantes2:=a.CantAlumnos;
        NombreEscuela2:=a.NombreEscuela;
    end;
end;

//programa principal
var
    a:Proyectos;
    CantEscuelaXLocalidad,CantEscuela,Participantes1,Participantes2:integer;
    LocalidadActual,NombreEscuela1,NombreEscuela2,EscuelaActual:String;
begin
    //inicializo mis variables
    CantEscuela:=0;Participantes1:=0;NombreEscuela1:='';
    //hago mi primer lectura
    LecturaXProyecto(a);
    while (a.CodigoUnico<>(-1)) do begin
        LocalidadActual:=a.localidad;
        CantEscuelaXLocalidad:=0;
        //separo por localidades
        while ((LocalidadActual=a.localidad) and (a.CodigoUnico<>(-1))) do begin
            EscuelaActual:=a.NombreEscuela;
            //separo por escuelas
            while ((EscuelaActual=a.NombreEscuela) and (a.CodigoUnico<>(-1))) do begin
                AnalizoDatos(a,Participantes1,Participantes2,NombreEscuela1,NombreEscuela2);
                LecturaXProyecto(a);
            end;
            CantEscuela:=CantEscuela+1;
            CantEscuelaXLocalidad:=CantEscuelaXLocalidad+1;
        end;
        Write ('Cantidad de escuelas en',LocalidadActual,' son : ',CantEscuelaXLocalidad);
    end;
    WriteLn ('La cantidad de escuelas que participaron son: ', CantEscuela);
    Write ('Los 2 nombres de las escuelas con mayor almuno inscripto son: ', NombreEscuela1,' y ', NombreEscuela2);
end.