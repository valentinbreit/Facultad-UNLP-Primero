program Ejercicio4;
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

function BuscoMaximo(L:lista):integer;
var
    NumMayor:Integer;
begin
    NumMayor:=-1;
    While (L<>Nil) do begin
        if (L^.num>NumMayor) then begin
            NumMayor:=L^.num;
        end;
        L:=L^.sig;
    end;
    BuscoMaximo:=NumMayor;
end;

function BuscoMinimo(L:lista):integer;
var
    NumMenor:Integer;
begin
    NumMenor:=999;
    While (L<>Nil) do begin
        if (L^.num<NumMenor) then begin
            NumMenor:=L^.num;
        end;
        L:=L^.sig;
    end;
    BuscoMinimo:=NumMenor;
end;

function BuscoCantMultiplos(L:lista;ValorA:Integer):integer;
var
    CantMultiplos:integer;
begin
    CantMultiplos:=0;
    While (L<>Nil) do begin
        if ((L^.num mod ValorA) = 0) then begin
            CantMultiplos:=CantMultiplos+1;
        end;
        L:=L^.sig;
    end;
    BuscoCantMultiplos:=CantMultiplos;
end;


procedure imprimirResultados(L:lista);
var
    ValorA:integer;
begin
    WriteLn('El elemento maximo de la lista es: ', BuscoMaximo(L));
    WriteLn('El elemento minimo de la lista es: ', BuscoMinimo(L));
    Write ('Ingrese un valor para buscar sus multiplos en la lista: ');
    ReadLn (ValorA);
    Write ('La cantidad de multiplos en del valor ', ValorA,' son: ', BuscoCantMultiplos(L,ValorA));
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
    imprimirResultados(pri);
end.