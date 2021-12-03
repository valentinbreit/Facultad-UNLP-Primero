program Ejercicio9E;
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

function EstaOrdenadaLaLista(L:lista):Boolean;
var
    anterior,actual:lista;
    Ordenada:Boolean;
begin
    Ordenada:=True;
    anterior:=L;
    actual:=L^.sig;
    if (actual<>Nil) then begin
        if (anterior^.num>actual^.num{1er numero es menor al segundo}) then begin
            while ((actual<>Nil{puntero que guia <> de nil}) and (Ordenada)) do begin
                anterior:=actual;
                actual:=actual^.sig;
                if (actual<>Nil) then begin
                    if (anterior<actual{numero actual menor al suiguiente}) then begin
                        Ordenada:=False;
                    end;
                end;
            end;
        end
        else if (anterior^.num<actual^.num) then{1er numero es mayor al segundo} begin
            while ((actual<>Nil{puntero que guia <> de nil}) and (Ordenada)) do begin
                anterior:=actual;
                actual:=actual^.sig;
                if (actual<>Nil) then begin
                    if (anterior^.num>actual^.num{numero actual mayor al siguiente}) then begin
                        Ordenada:=False;
                    end;
                end;
            end;
        end;
    end;
    EstaOrdenadaLaLista:=Ordenada;
end;


procedure SaberSiLaListaEstaOrdenada(L:lista);
begin
    if (EstaOrdenadaLaLista(L)) then begin
        WriteLn('Esta ordenada.');
    end
    else
        WriteLn('No Esta ordenada.');
    imprimirLista(L);
end;

function EliminoValor(var L:lista;valor:Integer):Boolean;
var
    Exito:Boolean;
    ant,act:lista;
begin
    Exito:=False;
    act:=L;
    while ((act<>Nil) and (act^.num<>valor)) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act<>Nil) then begin
        Exito:=True;
        if (act=L) then begin
            L:=act^.sig;{si es el primer digito}
        end
        else 
            ant^.sig:=act^.sig;{si es un dato cualquiera, lo acomodo a la cadena}
        Dispose(act);
    end;
    EliminoValor:=Exito;
end;



procedure PidoDatoAEliminar(L:lista);
var
    valor:integer;
begin
    write ('Ingrese un valor que quiera eliminar de la lista: ');
    ReadLn (valor);
    if (EliminoValor(L,valor)) then begin
        WriteLn('El valor existia en la lista y ha sido eliminado.');
        imprimirLista(L);
    end
    else    begin
        WriteLn('El valor no existia en la lista por ende no ha sido eliminado.');
        imprimirLista(L);
    end;
end;

procedure CreoSublista(var Sublista:lista;L:lista;A,B:integer);
begin
    {ordenada manera desscendente}
    while (L<>Nil) do begin
        if ((L^.num>A) and (L^.num<B)) then begin
            armarNodo(Sublista,L^.num);
        end;
        L:=L^.sig;
    end;
end;

procedure ArmarSublista(L:lista);
var
    Sublista:lista;
    ValorA,ValorB:integer;
begin
    Sublista:=Nil;
    Write ('Ingrese valor A: ');
    ReadLn(ValorA);
    Write ('Ingrese valor B: ');
    ReadLn(ValorB);
    CreoSublista(Sublista,L,ValorA,ValorB);
    imprimirLista(Sublista);
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
    SaberSiLaListaEstaOrdenada(pri);
    PidoDatoAEliminar(pri);
    ArmarSublista(pri);
end.