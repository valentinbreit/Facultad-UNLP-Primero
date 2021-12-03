{Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se
tiene: código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4:
suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las
críticas. Dicha estructura no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se
debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI
del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura
finaliza cuando se lee el código de película -1 y la información viene ordenada por código de
película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares
que impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe
como parámetro (el mismo puede no existir).}
program Ejercicio9;
type
    str=string[30];

    Generos=1..8;

    vContador=Array [Generos] of Real;

    Cine=record
        CodPelicula:integer;
        TituloPelicula:str;
        CodigoDeGenero:Generos;
        PromPuntaje:Real;
    end;

    listaCine=^nodoCine;
    nodoCine=record
        Dato:Cine;
        Sig:listaCine;
    end;

    NomYApe=string[30];

    Critico=record
        DNICritiro:integer;
        Apellido:NomYApe;
        Nombre:NomYApe;
        CodigoPelicula:integer; {se termina al entrar -1}
        Puntaje:Real;
    end;

    listaCriticos=^nodoCriticos;
    nodoCriticos=record
        Dato:Critico;
        Sig:listaCriticos;
    end;

procedure CargoCritico(var Criticos:Critico);
begin
    with Criticos do begin
        Write ('Ingrese el Codigo de la Pelicula: ');
        ReadLn(CodigoPelicula);
        if (CodigoPelicula<>-1) then begin
            Write ('Ingrese el DNI del critico: ');
            ReadLn(DNICritiro);
            Write ('Ingrese el nombre del critico: ');
            ReadLn(Nombre);
            Write ('Ingrese el Apellido del Critico: ');
            ReadLn(Apellido);
            Write ('Ingrese el Puntaje asignado por el critico: ');
            ReadLn(Puntaje);
        end;
    end;
end;

procedure CargoNodoCriticos(var LC:listaCriticos;C:Critico);
var
    nuevo:listaCriticos;
begin
    New(nuevo);
    nuevo^.Dato:=C;
    nuevo^.Sig:=LC;
    LC:=nuevo;
end;

function DescompongoDNI (Num:Integer):Boolean;
var
    dig,pares,impares:integer;
begin
    pares:=0;impares:=0;
    while (Num<>0) do begin
        dig:=Num mod 10;
        if ((dig mod 2)=0) then begin
            pares:=pares+1;
        end
        else
            impares:=impares+1;
        Num:=Num div 10;
    end;
    DescompongoDNI:=(pares=impares);
end;


procedure InformoCriticosQueCumplen(DNI:Integer;Nom,Ape:NomYApe);
begin
    if (DescompongoDNI(DNI)) then begin
        WriteLn('Critico: ', Nom,' ', Ape);
    end;
end;

procedure ModificoListaCine(var LCine:listaCine;var SumaPromedio:Real;var CantIteraciones,CodigoActual,CodigoAnterior:Integer;Pun:Real);
begin
    SumaPromedio:=Pun+SumaPromedio;
    CantIteraciones:=CantIteraciones+1;
    if (CodigoActual<>CodigoAnterior) then begin
        SumaPromedio:=(SumaPromedio/CantIteraciones);
        LCine^.Dato.PromPuntaje:=SumaPromedio;
        SumaPromedio:=0;
        CantIteraciones:=0;
        LCine:=LCine^.Sig;
        CodigoAnterior:=CodigoActual;
    end;
end;

procedure InicializoV(var V:vContador);
var
    i:integer;
begin 
    for i:=1 to 8 do begin
        v[i]:=0;
    end;
end;

procedure VeoQueGeneroTuvoMasPuntaje (var v:vContador;Cod:Generos;Pun:Real);
begin
    v[Cod]:=v[Cod]+Pun;
end;

procedure InformoQueGeneroTuvoMasPuntaje(V:vContador);
var
    i,g:integer;
    Max:Real;
begin
    Max:=0;
    for i:=1 to 7 do begin
        if (V[i]>V[i+1]) then begin
            Max:=V[i];
            g:=i;
        end;
    end;
    WriteLn ('El genero que mas puntaje tuvo es: ',g,' con un puntaje de: ', Max:0:2);
end;

procedure Informar (var LCine:listaCine;LCriticos:listaCriticos);
var
    SumaPromedio:Real;
    CantIteraciones,CodigoAnterior,CodigoActual:Integer;
    V:vContador;
begin
    SumaPromedio:=0;CantIteraciones:=0;
    InicializoV(V);
    CodigoAnterior:=LCriticos^.Dato.CodigoPelicula;
    while (LCriticos<>Nil) do begin
        CodigoActual:=LCriticos^.Dato.CodigoPelicula;
        InformoCriticosQueCumplen(LCriticos^.Dato.DNICritiro,LCriticos^.Dato.Nombre,LCriticos^.Dato.Apellido);
        {Que los digitos del dni sean pares=impares}
        ModificoListaCine(LCine,SumaPromedio,CantIteraciones,CodigoActual,CodigoAnterior,LCriticos^.Dato.Puntaje);
        VeoQueGeneroTuvoMasPuntaje(V,LCine^.Dato.CodigoDeGenero,LCriticos^.Dato.Puntaje);
    end;
    InformoQueGeneroTuvoMasPuntaje(V);
end;

procedure BuscoYElimino(var LCine:listaCine;Num:Integer;var Exito:Boolean);
var
    Anterior,Actual:listaCine;
begin
    Anterior:=LCine;
    Actual:=LCine;
    while ((Actual<>Nil) and (Actual^.Dato.CodPelicula<>Num)) do begin
        Anterior^.Sig:=Actual;
        Actual:=Actual^.Sig;
    end;
    if (Actual<>Nil) then begin
        if (Actual=LCine) then begin
            LCine:=LCine^.Sig;
        end
        else
            Anterior^.Sig:=Actual^.Sig;
        Dispose(Actual);
    end;
end;


procedure PidoAEliminarPelicula(var LCine:listaCine);
var
    CodAEliminar:integer;
    Exito:Boolean;
begin
    Exito:=False;
    Write ('Ingrese el codigo de la pelicula que desea eliminar: ');
    ReadLn(CodAEliminar);
    BuscoYElimino(LCine,CodAEliminar,Exito);
    if (Exito) then begin
        Write ('El codigo de la pelicula: ', CodAEliminar,' se ha eliminado con exito.');
    end
    else
        Write ('El codigo no se ha podido eliminar.');
end;


var
    LCine:listaCine;
    LCriticos:listaCriticos;
    Cines:Cine;
    Criticos:Critico;
begin
    LCine:=Nil;LCriticos:=Nil;
    {se dispone de la lista de cines dada}
    CargoCritico(Criticos);
    while (Criticos.CodigoPelicula<>-1) do begin
        CargoNodoCriticos(LCriticos,Criticos);
        CargoCritico(Criticos);
    end;
    Informar(LCine,LCriticos);
    PidoAEliminarPelicula(LCine);
end.