program Ejercicio3B;
type
    lista=^nodo;
    nodo=record
        num:integer;
        sig:lista;
    end;

procedure armarNodo(var pI,pU:lista;valor:Integer);
var
    nuevo:lista;
begin
    New(nuevo);
    nuevo^.num:=valor;
    nuevo^.sig:=Nil;
    if (pI<>Nil) then begin
        pU^.sig:=nuevo;
    end
    else
        pI:=nuevo;
    pU:=nuevo;
end;

procedure imprimirLista(L:lista);
begin
    while (L<>Nil) do begin
        WriteLn (L^.num);
        L:=L^.sig;
    end;
end;


var
    pri,ult:lista;
    valor:integer;
begin
    pri:=Nil;ult:=Nil;
    Write ('Ingrese un numero: ');
    ReadLn (valor);
    while (valor<>0) do begin
        armarNodo(pri,ult,valor);
        Write ('Ingrese un numero: ');
        ReadLn (valor);
    end;
    imprimirLista(pri);
end.