program Ejercicio1;
type
    lista=^nodo;
    nodo=record
        num:integer;
        sig:lista;
    end;

procedure armarNodo(var L:lista;valor:Integer);
var
    aux:lista;
begin
    New(aux);
    aux^.num:=valor;
    aux^.sig:=L;
    L:=aux;
end;


procedure imprimirLista(L:lista);
begin
    while (L<>Nil) do begin
        WriteLn (L^.num);
        L:=L^.sig;
    end;
end;

procedure modificarLista(var L:lista;valor:integer);
var
    aux:lista;
begin   
    aux:=L;
    While (aux<>Nil) do begin
        aux^.num:=aux^.num+valor;
        aux:=aux^.sig;
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
    Write ('Ingrese un valor con el que aumentar todos los elementos de la lista: ');
    ReadLn (valor);
    modificarLista(pri,valor);
    imprimirLista(pri);
end.