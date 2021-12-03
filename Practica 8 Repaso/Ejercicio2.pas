program Ejercicio2;
type
    NombreYApellido=String[20];

    CodigoDePolizas=1..6;

    Codigos=Array [1..6] of Real;

    Cliente=record
        CodigoDeCliente:Integer;
        DNI:Integer;
        Apellido:NombreYApellido;
        Nombre:NombreYApellido;
        CodPoliza:CodigoDePolizas;
        MontoBasico:Real;
    end;

    lista=^nodo;
    nodo=record
        dato:Cliente;
        siguiente:lista;
    end;

procedure CargoCliente(var P:Cliente);
begin
    with P do begin
        Write ('Ingrese el Codigo Del cliente: ');
        ReadLn(CodigoDeCliente);
        Write ('Ingrese el DNI del cliente: ');
        ReadLn(DNI);
        Write ('Ingrese el Apellido del cliente: ');
        ReadLn(Apellido);
        Write ('Ingrese el Nombre del cliente: ');
        ReadLn(Nombre);
        Write ('Ingrese el Codigo De Poliza del cliente: ');
        ReadLn(CodPoliza);
        Write ('Ingrese el monto basico mensual del cliente: ');
        ReadLn(MontoBasico);
    end;
end;

procedure CargoNodo(var L:lista;P:Cliente);
var
    nuevo:lista;
begin
    New(nuevo);
    nuevo^.dato:=P;
    nuevo^.siguiente:=L;
    L:=nuevo;
end;

procedure CargarVectorDeValores(var V:Codigos);
var
    i:Integer;
begin
    for i:=1 to 6 do begin
        Write ('Ingrese el monto extra que se le agruega al tipo de poliza ', i,' :');
        ReadLn(V[i]);
    end;
end;

procedure PorPersona(DNI:Integer;Ape,Nom:NombreYApellido;MBasico:Real;PolizaCod:CodigoDePolizas;V:Codigos);
begin
    WriteLn ('El DNI del cliente es: ', DNI);
    WriteLn ('El apellido del cliente es: ', Ape);
    WriteLn ('El nombre del cliente es: ', Nom);
    WriteLn ('El monto total que debe pagar el cliente es: ', (MBasico+V[PolizaCod]):0:2);
end;

function DescompongoDNI(DNI:Integer):Boolean;
var
    digito,Cant9:integer; 
begin
    Cant9:=0;
    while ((DNI<>0) and (Cant9<2)) do begin
        digito:=DNI mod 10;
        if (digito=9) then begin
            Cant9:=Cant9+1;
        end;
        DNI:=DNI div 10;
    end;
    if (Cant9=2) then begin
        DescompongoDNI:=True;
    end
    else
        DescompongoDNI:=False;
end;


procedure DNICumple (DNI:Integer;Ape,Nom:NombreYApellido);
begin
    if (DescompongoDNI(DNI)) then begin
        WriteLn ('Apellido: ',Ape);
        WriteLn ('Nombre: ',Nom);
    end;
end;


procedure Informar (L:lista;V:Codigos);
begin
    while (L<>Nil) do begin
        PorPersona(L^.dato.DNI,L^.dato.Apellido,L^.dato.Nombre,L^.dato.MontoBasico,L^.dato.CodPoliza,V);
        {si el dni tiene al menos 2 digitos 9}
        DNICumple(L^.dato.DNI,L^.dato.Apellido,L^.dato.Nombre);
        L:=L^.siguiente;
    end;
end;

procedure BuscoYElimino(var L:lista;Persona:Integer;var Exito:Boolean);
var
    Anterior,Actual:lista;
begin
    Exito:=False;
    Actual:=L;
    while (Actual^.dato.CodigoDeCliente<>Persona) do begin
        Anterior:=Actual;
        Actual:=Actual^.siguiente;
    end;
    Exito:=True;
    if (Actual=L) then begin
        L:=Actual^.siguiente;
    end
    else
        Anterior^.siguiente:=Actual^.siguiente;
    Dispose(Actual);
end;



procedure PidoElemAEliminar(var L:lista);
var
    PidoPersonaAEliminar:Integer;
    Exito:Boolean;
begin
    Write ('Ingrese el codigo del cliente que desea eliminar: ');
    ReadLn (PidoPersonaAEliminar);
    BuscoYElimino(L,PidoPersonaAEliminar,Exito);
    if (Exito) then
        Write ('Eliminado.')
    else
        Write ('No Eliminado.');
end;


var
    L:lista;
    Persona:Cliente;
    Vector:Codigos;
begin
    L:=Nil;
    repeat
        CargoCliente(Persona);
        CargoNodo(L,Persona);
    until (Persona.CodigoDeCliente=1122);
    CargarVectorDeValores(Vector);
    Informar(L,Vector);
    PidoElemAEliminar(L);
end.