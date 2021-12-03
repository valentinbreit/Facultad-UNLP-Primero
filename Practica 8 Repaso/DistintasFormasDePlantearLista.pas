RecorroLista(L:lista);
begin
    while (L<>Nil) do begin
        WriteLn(L^.Dato);
        L:=L^.Sig;
    end;
end;


AgregoAdelante (var L:lista;N:integer);
var
    nuevo:lista;
begin
    New(nuevo);
    nuevo^.Dato:=N;
    nuevo^.Sig:=Nil;
    if (L=Nil) then begin
        L:=nuevo;
    end
    else begin
        nuevo^.Sig:=L;
        L:=nuevo;
    end;
end;


AgregoAtrasSinPuntero (var L:lista;valor:integer);
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


AgregoAtrasConPuntero (var pI,pU:lista;valor:Integer);
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


BorroElemento (var L:lista;N:nombre;var Exito:Boolean);
var 
    Ant,Act:lista;
begin
    Exito:=False;Act:=L;
    while ((Act<>Nil) and (act^.Dato.Nombre<>N)) do begin
        Ant:=Act;
        Act:=Act^.Sig;
    end;
    if (Act<>Nil) then begin
        Exito:=True;
        if (Act=L) then begin
            L:=Act^.Sig;
        end
        else
            Ant^.Sig:=Act^.Sig;
        Dispose(Act);
    end;
end;



InsertarElementoEnListaOrdenada (var L:lista;N:integer);
var
    Ant,Nue,Act:lista;
begin
    New(Nue);
    Nue^.Dato:=N;
    Act:=L;
    Ant:=L;
    while ((Act<>Nil) and (Act^.Dato.Num<N)) do begin
        Ant:=Act;
        Act:=Act^.sig;
    end;
    if (Ant=Act) then begin
        L:=Nue;
    end
    else
        Ant^.Sig:=Nue;
    Nue^.Sig:=Act;
end;



procedure InsertarEnLista( var nodoInicial: puntero; valor: integer);
var
    nuevoNodo: puntero;                         { Variable auxiliar }
begin
    { Si hay lista }
    if nodoInicial <> nil then
        begin
        { Si no hemos llegado a su sitio }
        while (nodoInicial^.Dato<valor) do begin
            nodoInicial:=nodoInicial^.sig;
        end;
        { Caso contrario: si hay lista pero hay que insertar ya }
        { Reservamos espacio, }
        new(nuevoNodo);
        { guardamos el dato }
        nuevoNodo^.dato := valor;
        { ponemos el resto de la lista a continuación }
        nuevoNodo^.siguiente := nodoInicial;
        { y hacemos que el nuevo dato sea el punto de partida }
        nodoInicial := nuevoNodo
        end
    { Si no hay lista, deberemos crearla }
    else
        begin
        { Reservamos espacio, }
        new(nuevoNodo);
        { guardamos el dato }
        nuevoNodo^.dato := valor;
        { no habrá nada a continuación }
        nuevoNodo^.siguiente := nil;
        { y hacemos que la lista comience en el nuevo dato }
        nodoInicial := nuevoNodo
        end
end;