program Ejercicio2;
const
    dimF=500;
type
    Nombres=string[20];
    Alumnos=Array [1 .. dimF] of Nombres;
    Indice=0..dimF;

procedure CargarVector(var V:Alumnos;var dimL:Indice);
var
    NombreIngresado:Nombres;
    pos:Indice;
begin
    pos:=0;
    Write ('Ingrese el Nombre del alumno: ');
    ReadLn(NombreIngresado);
    while ((NombreIngresado<>'ZZZ') and (dimL<dimF)) do begin
        pos:=pos+1;
        dimL:=dimL+1;
        V[pos]:=NombreIngresado;
        Write ('Ingrese el Nombre del alumno: ');
        ReadLn(NombreIngresado);
    end;
end;

procedure MuestroVector(V:Alumnos;dimL:Indice);
var
    pos:Indice;
begin
    for pos:=1 to dimL do begin
        WriteLn (V[pos]);
    end;
end;


function RetornoPosNombre (V:Alumnos;dimL:Indice;NBuscado:Nombres):Indice;
var
    pos:Indice;
    exito:Boolean;
begin
    pos:=1; exito:=False;
    while ((pos<=dimL) and not(exito)) do begin
        if (NBuscado=V[pos]) then begin
            exito:=True;
        end
        else
            pos:=pos+1;
    end;
    if (exito=false) then pos:=0;
    RetornoPosNombre:=pos;
end;

procedure BorrarNombreYPosicion(var V:Alumnos;var dimL:Indice;pos:Indice);
var
    i:Indice;
begin
    for i:=pos+1 to dimL do 
        v[i-1]:=v[i];
    dimL:=dimL-1;
end;


procedure LeoYElimino(var V:Alumnos;var dimL:Indice);
var
    pos:Indice;
    NombreQueElimino:Nombres;
begin
    Write ('Ingrese un nombre que quiera eliminar: ');
    ReadLn(NombreQueElimino);
    pos:=RetornoPosNombre(V,dimL,NombreQueElimino);
    if (pos<>0) then begin
        BorrarNombreYPosicion(V,dimL,pos);
    end;
    MuestroVector(V,dimL);
end;

procedure LeoEIncertoPos4(var V:Alumnos;var dimL:Indice);
var
    pos:Indice;
    NombreQueAgrego:Nombres;
begin
    Write ('Ingrese un nombre que quiera agregar: ');
    ReadLn(NombreQueAgrego);
    if (dimL<dimF) then begin
        dimL:=dimL+1;
        for pos:=dimL downto 4 do begin
            V[pos+1]:=V[pos];
        end;
        V[4]:=NombreQueAgrego;
    end;
    MuestroVector(V,dimL);
end;

procedure LeoEIncerto(var V:Alumnos;var dimL:Indice);
var
    NombreQueAgrego:Nombres;
begin
    Write ('Ingrese un nombre que quiera agregar: ');
    ReadLn(NombreQueAgrego);
    if (dimL<dimF) then begin
        dimL:=dimL+1;
        V[dimL]:=NombreQueAgrego;
    end;
    MuestroVector(V,dimL);
end;


var
    Vector:Alumnos;
    dimL:Indice;
begin
    dimL:=0;
    CargarVector(Vector,dimL);
    LeoYElimino(Vector,dimL);
    LeoEIncertoPos4(Vector,dimL);
    LeoEIncerto(Vector,dimL);
end.