program Ejercicio4;
type
    Madre=record
        nombre:string[20];
        apellido:string[20];
        PesoXSem:Real;
    end;

    lista=^nodo;
    nodo=record
        dato:Madre;
        sig:lista;
    end;

procedure Informo(L:lista;var PesoTotal:Real;var SemMayorPeso:Integer);
var
    MayorPeso:Real;
    i,a:integer;
begin
    MayorPeso:=0;i:=0;a:=0;
    while ((L<>Nil) and (i<dimL) and (L^.dato.PesoXSem<>0)) do begin
        if (L^.dato.PesoXSem>MayorPeso) then begin
            MayorPeso:=L^.dato.PesoXSem;
            a:=i;
        end;
        i:=i+1;
        PesoTotal:=PesoTotal+L^.dato.PesoXSem;
        L:=L^.sig;
    end;
    SemMayorPeso:=a;
end;

begin
    
end.