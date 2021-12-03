program Ejercicio4A;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'un nuevo texto';
    writeln(sizeof(pc^),' bytes');
end.