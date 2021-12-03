program Ejercicio1;
type
    NombreYApellido=string[20];
    Genero=1..5;
    EdadMinyMax=5..99;

    ContadorXGenero=Array [1..5] of Genero;

    Persona=record
        DNI:Integer;
        Nombre:NombreYApellido;
        Apellido:NombreYApellido;
        Edad:EdadMinyMax;
        CodigoGenero:Genero;
    end;

    lista=^nodo;
    nodo=record
        dato:Persona;
        siguiente:lista;
    end;

procedure CargoDatos(var Actor:Persona);
begin
    Write ('Ingrese el nombre del actor/actris: ');
    ReadLn (Actor.Nombre);
    Write ('Ingrese el apellido del actor/actris: ');
    ReadLn (Actor.Apellido);
    Write ('Ingrese el DNI del actor/actris: ');
    ReadLn (Actor.DNI);
    Write ('Ingrese el edad del actor/actris: ');
    ReadLn (Actor.Edad);
    Write ('Ingrese el codigo del genero que quiere aspirar el actor/la actris: ');
    ReadLn (Actor.CodigoGenero);
end;

procedure CargarNodo (var L:lista;Actor:Persona);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=Actor;
    nuevo^.siguiente:=L;
    L:=nuevo;
end;

function EsPar(digito:Integer):Boolean;
begin
    if ((digito mod 2)=0) then begin
        EsPar:=True;
    end 
    else
        EsPar:=False;
end;


procedure CuentoPares(digito:integer;var pares,impares:Integer);
begin
    if (EsPar(digito)) then begin
        pares:=pares+1;
    end
    else begin
        impares:=impares+1;
    end;
end;

function HayMasParQueImpar(pares,impares:Integer):Boolean;
begin
    if (pares>impares) then begin
        HayMasParQueImpar:=True;
    end
    else
        HayMasParQueImpar:=False;
end;

procedure DescompongoDNI (DNI:Integer;var CantPersonasConDNI:Integer);
var
    digito,pares,impares:Integer;
begin
    pares:=0;impares:=0;
    while (DNI <> 0) do begin
        digito:=DNI mod 10;
        CuentoPares(digito,pares,impares);
        DNI:=DNI div 10;
    end;
    if (HayMasParQueImpar(pares,impares)) then begin
        CantPersonasConDNI:=CantPersonasConDNI+1;
    end;
end;

procedure CuentoLaCantidadDeGenerosIngresados(Codigo:Genero;var V:ContadorXGenero);
begin
    V[Codigo]:=V[Codigo]+1;
end;

procedure Encuentro2CodigosMasUtilizados(V:ContadorXGenero;var CodigoMasUtilizado1,CodigoMasUtilizado2:Genero);
var
    i:integer;
begin
    CodigoMasUtilizado1:=1;
    for i:=1 to 4 do begin
        if (V[i]<V[i+1]) then begin
            CodigoMasUtilizado2:=CodigoMasUtilizado1;
            CodigoMasUtilizado1:=i+1;
        end
        else begin
            CodigoMasUtilizado2:=CodigoMasUtilizado1;
            CodigoMasUtilizado1:=i;
        end;
    end;
end;


procedure Informar (L:lista);
var
    CantPersonasConDNI:Integer;{Cuando el DNI tiene mas dig pares que impares}
    Vector:ContadorXGenero;
    CodigoMasUtilizado1,CodigoMasUtilizado2:Genero;
begin
    CantPersonasConDNI:=0;
    while (L<>Nil) do begin
        DescompongoDNI(L^.dato.DNI,CantPersonasConDNI);
        {contabilizo todos los codigos}
        CuentoLaCantidadDeGenerosIngresados(L^.dato.CodigoGenero,Vector);
        L:=L^.siguiente;
    end;
    Encuentro2CodigosMasUtilizados(Vector,CodigoMasUtilizado1,CodigoMasUtilizado2);
    WriteLn ('La cantidad de personas con un DNI con mas numeros pares que impares son: ',CantPersonasConDNI);
    WriteLn ('Los 2 codigos de genero mas utilizados fueron: ', CodigoMasUtilizado1,' y ', CodigoMasUtilizado2);
end;

procedure PidoPersonaAEliminar(var DNI:Integer);
begin
    Write ('Ingrese el DNI del actor/actris que desea eliminar: ');
    ReadLn(DNI);
end;

procedure BorrarElemento(var L:lista;DNI:Integer;var Exito:Boolean);
var
    Anterior,Actual:lista;
begin
    Exito:=False;
    Actual:=L;
    while ((Actual<>Nil) and (Actual^.dato.DNI<>DNI)) do begin
        Anterior:=Actual;
        Actual:=Actual^.siguiente;
    end;
    if (Actual<>Nil) then begin
        Exito:=True;
        {si es el primer dato}
        if (Actual=L) then begin
            L:=Actual^.siguiente;
        end
        else
            {Si es uno distinto del primer elemento}
            Anterior^.siguiente:=Actual^.siguiente;
        Dispose(Actual);
    end;
end;

procedure PidoYBusco (var L:lista);
var
    DNI:Integer;
    Exito:Boolean;
begin
    PidoPersonaAEliminar(DNI);
    BorrarElemento(L,DNI,Exito);
    if (Exito) then
        Write ('Se Encontro y se elimino con exito.')
    else
        Write ('No se encontro por ende no se pudo eliminar.');
end;

var
    L:lista;
    Actor:Persona;
begin
    L:=Nil;
    repeat
        CargoDatos(Actor);
        CargarNodo(L,Actor);
    until (Actor.DNI=3554);
    Informar(L);
    PidoYBusco(L);
end.