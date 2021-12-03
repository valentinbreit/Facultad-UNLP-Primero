program Ejercicio3A;
type
    lista=^nodo;
    nodo=record
        num:integer;
        sig:lista;
    end;

procedure armarNodo(var L:lista;valor:integer);
var
    nuevo,actual:lista;
begin
    New(nuevo);
    nuevo^.num:=valor;
    nuevo^.sig:=Nil;
    if (L<>Nil) then begin
        actual:=L;
        While (actual^.sig<>Nil) do begin
            actual:=actual^.sig;
        end;
        actual^.sig:=nuevo;
    end
    else 
        L:=nuevo;
end;

procedure imprimirLista(L:lista);
begin
    while (L<>Nil) do begin
        WriteLn (L^.num);
        L:=L^.sig;
    end;
end;

var
    pri:lista;
    valor:integer;
begin
    pri:=Nil;
    Write ('Ingrese un numero: ');
    ReadLn (valor);
    while (valor<>0) do begin
        armarNodo(pri,valor);
        Write ('Ingrese un numero: ');
        ReadLn (valor);
    end;
    imprimirLista(pri);
end.