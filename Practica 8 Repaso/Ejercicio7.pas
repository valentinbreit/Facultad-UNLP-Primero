program Ejercicio7;
type
    str=string[40];
    
    NombreYApellido=string[30];



    TiempoFacultad=1950..2021;

    Anos=record
        Ingreso:TiempoFacultad;
        Egreso:TiempoFacultad;
    end;

    Notas=4..10;

    vNotas=Array [1..24] of Notas;
    
    Alumno=record
        NroAlumno:integer;
        Apellido:NombreYApellido;
        Nombre:NombreYApellido;
        CorreoE:str;
        Ano:Anos;
        Nota:vNotas;
    end;


    lista=^nodo;
    nodo=record
        Dato:Alumno;
        Siguiente:lista;
    end;


{Bubble Sort}
procedure OrdenoNotas(var Nota:vNotas);
var
    i,aux:integer;
    Ordenado:Boolean;
begin
    Ordenado:=False;
    while not(Ordenado) do begin
        Ordenado:=True;
        for i:=1 to 23 do begin
            if (Nota[i]<Nota[i+1]) then begin
                Ordenado:=False;
                aux:=Nota[i];
                Nota[i]:=Nota[i+1];
                Nota[i+1]:=aux
            end;
        end;
    end;
end;


procedure CargoAlumno(var Alu:Alumno);
var
    i:integer;
begin
    with Alu do begin
        Write ('Ingrese el Numero del Alumno: ');
        ReadLn(NroAlumno);
        if (NroAlumno<>-1) then begin
            Write ('Ingrese el Apellido del alumno: ');
            ReadLn(Apellido);
            Write ('Ingrese los nombres del alumno: ');
            ReadLn(Nombre);
            Write ('Ingrese el correo electronico del alumno: ');
            ReadLn(CorreoE);
            with Ano do begin
                Write ('Ingrese el Ano de Ingreso del Alumno: ');
                ReadLn(Ingreso);
                Write ('Ingrese el Ano de Egreso del Alumno: ');
                ReadLn(Egreso);
            end;
            for i:=1 to 24 do begin
                Write ('Ingrese la nota de la materia ',i,':');
                ReadLn(Nota[i]);
            end;
            OrdenoNotas(Nota);   
        end;
    end;
end;

procedure CargoNodo(var L:lista;Alu:Alumno);
var
    nuevo:lista;
begin
    New(nuevo);
    nuevo^.Dato:=Alu;
    nuevo^.Siguiente:=L;
    L:=nuevo;
end;




procedure InformoPromXAlumno(N:vNotas);
var
    i:integer;
    PromTotal:integer;
begin
    PromTotal:=0;
    for i:=1 to 24 do begin
        PromTotal:=PromTotal+N[i];
    end;
    WriteLn('El promedio total del alumno es: ',(PromTotal/24):0:2);
end;

function CumpleNum(N:integer):Boolean;
var
    digito:integer;
begin
    while (N<>0) do begin
        digito:=N mod 10;
        if ((digito mod 2)=0) then begin
            CumpleNum:=False;
        end;
        N:=N div 10;
    end;
    CumpleNum:=True;
end;



procedure CuentoCantAlumnosQueCumplen(Ingre:TiempoFacultad;NAlu:integer;var CantAluC:integer);
begin
    if ((Ingre=2012) and (CumpleNum(NAlu))) then begin
        CantAluC:=CantAluC+1;
    end;
end;

procedure Busco2AluQuetardaronMenos(Ingre,Egre:TiempoFacultad;var Nom1,Nom2,Ape1,Ape2:NombreYApellido;var Correo1,Correo2:str;var TMin1,TMin2:integer;NomAlu,ApeAlu:NombreYApellido;CorreoAlu:Str);
var
    Tiempo:integer;
begin
    Tiempo:=Egre-Ingre;
    if (Tiempo<TMin1) then begin
        TMin2:=TMin1;
        TMin1:=Tiempo;
        Nom2:=Nom1;
        Ape2:=Ape1;
        Correo2:=Correo1;
        Nom1:=NomAlu;
        Ape1:=ApeAlu;
        Correo1:=CorreoAlu;
    end
    else if (Tiempo<TMin2) then begin
        TMin2:=Tiempo;
        Nom2:=NomAlu;
        Ape2:=ApeAlu;
        Correo2:=CorreoAlu;
    end;
end;



procedure Informo(L:lista);
var
    CantAlumnosCumplen:integer;
    Nombre1,Nombre2,Ape1,Ape2:NombreYApellido;
    Correo1,Correo2:str;
    TMin1,TMin2:integer;
begin
    {inicializo variable}
    CantAlumnosCumplen:=0;
    Nombre1:='';Ape1:='';Correo1:='';TMin1:=999;
    while (L<>Nil) do begin
        InformoPromXAlumno(L^.Dato.Nota);
        CuentoCantAlumnosQueCumplen(L^.Dato.Ano.Ingreso,L^.Dato.NroAlumno,CantAlumnosCumplen);{que tuvieron ingreso en 2012 y su num de alumno esta compuesto solo por dig impares}
        Busco2AluQuetardaronMenos(L^.Dato.Ano.Ingreso,L^.Dato.Ano.Egreso,Nombre1,Nombre2,Ape1,Ape2,Correo1,Correo2,TMin1,TMin2,L^.Dato.Nombre,L^.Dato.Apellido,L^.Dato.CorreoE);
    end;
    WriteLn ('El Alumno que menos tardo en hacer su carrera es: ', Nombre1,' ', Ape1 ,' y su correo electronico es: ',Correo1);
    WriteLn ('El segundo Alumno que menos tardo en hacer su carrera es: ', Nombre2,' ',Ape2,' y su correo electronico es: ',Correo2);
end;


procedure BuscoYElimino(var L:lista;NroAEliminar:integer;var Exito:Boolean);
var
    Anterior,Actual:lista;
begin
    Exito:=False;
    Anterior:=L;
    Actual:=L;
    while ((Actual<>Nil) and (Actual^.Dato.NroAlumno=NroAEliminar)) do begin
        Anterior:=Actual;
        Actual:=Actual^.Siguiente;
    end;
    if (Actual<>Nil) then begin
        Exito:=True;
        if (Actual=L) then begin
            L:=Actual^.Siguiente;
        end
        else
            Anterior^.Siguiente:=Actual^.Siguiente;
        Dispose(Actual);
    end;
end;



procedure PidoNroAEliminar(var L:lista);
var
    NroAEliminar:integer;
    Exito:Boolean;
begin
    Write ('Ingrese el numero de alumno que desea eliminar: ');
    ReadLn(NroAEliminar);
    BuscoYELimino(L,NroAEliminar,Exito);
    if (Exito) then begin
        Write ('Exito eliminando.');
    end
    else
        Write ('No se ha podido eliminar.');
end;


var
    L:lista;
    Alumnos:Alumno;
begin
    L:=Nil;
    CargoAlumno(Alumnos);
    while (Alumnos.NroAlumno<>-1) do begin
        CargoNodo(L,Alumnos);
        CargoAlumno(Alumnos);
    end;
    Informo(L);
    PidoNroAEliminar(L);
end.