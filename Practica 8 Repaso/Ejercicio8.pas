{Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la
administración de transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de
Enero y Noviembre del año 2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la
transferencia (1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios).
Esta estructura no posee orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las
que las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe
estar ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares.}

program Ejercicio8;
type
    strMes=string[10];

    Motivos=1..7;

    Fechas=record
        Dia:Integer;
        Mes:strMes;
    end;

    Tiempo=record
        HS:Integer;
        Min:Integer;
        Seg:Integer;
    end;

    Transferencia=record
        NCuentaOrigen:integer;
        DNITitularCO:Integer;
        NCuentaDestino:Integer;
        DNITitularCD:Integer;
        Fecha:Fechas;
        Hora:Tiempo;
        Monto:Real;
        MotivoTrans:Motivos;
    end;

    vContador=Array [Motivos] of Motivos;

    lista=^nodo;
    nodo=record
        Dato:Transferencia;
        Sig:lista;
    end;

procedure CreoNodo(T:Transferencia;var SL:lista);
var
    ant,act,aux:lista;
begin
    if(T.NCuentaOrigen <> T.NCuentaDestino) then begin
        New(aux);
        aux^.Dato:=T;
        aux^.Sig:=SL;
        if (SL = nil) then
            SL:=aux
        else begin
            act:=SL;
            ant:=SL;
            while ((act <> nil) and (T.NCuentaOrigen < aux^.Dato.NCuentaOrigen)) do begin
                ant:=act;
                act:=act^.sig;
            end;
        end;
        if (act = SL) then begin
            aux^.sig:=SL;
            SL:= aux;
        end
        else if (act <> nil) then begin
            ant^.sig:=aux;
            aux^.sig:=act;
        end
        else begin
            ant^.sig:= aux;
            aux^.sig:=Nil;
        end;
    end;
end;





procedure CargoSublista(L:lista;var SL:lista);
begin
    while (L<>Nil) do begin
        if (L^.Dato.DNITitularCO<>L^.Dato.DNITitularCD) then begin
            CreoNodo(L^.Dato,SL);
        end;    
        L:=L^.sig;
    end;
end;

procedure InformoMontoTotalTransf(NumCO:integer;M:Real);
begin
    WriteLn ('En la cuenta num: ', NumCO,' se transfirio: ',M:0:2);
end;


procedure InformoMotivo(MasUsado:integer);
begin
    Case (MasUsado) of 
        1:WriteLn('El motivo mas usado fue: Alquiler.');
        2:WriteLn('El motivo mas usado fue: Expensas.');
        3:WriteLn('El motivo mas usado fue: Facturas.');
        4:WriteLn('El motivo mas usado fue: Prestamos.');
        5:WriteLn('El motivo mas usado fue: Seguro.');
        6:WriteLn('El motivo mas usado fue: Honorarios.');
        7:WriteLn('El motivo mas usado fue: Varios.');
        else
            WriteLn('Error del programa.');
    end;
end;



procedure AveriguoCualFueMotivoMasUsado(v:vContador);
var
    i,MasUsado:integer;
begin
    MasUsado:=0;
    for i:=1 to 6 do begin
        if (v[i]>MasUsado) then begin
            MasUsado:=v[i];
        end;
    end;
    InformoMotivo(MasUsado);
end;

function Cumple (Num:integer):Boolean;
var
    dig,pares,impares:integer;
begin
    pares:=0;impares:=0;
    while (Num<>0) do begin
        dig:=Num mod 10;
        if ((dig mod 2) = 0) then begin
            pares:=pares+1;
        end
        else
            impares:=impares+1;
        Num:=Num div 10;
    end;
    if (impares>pares) then begin
        Cumple:=True;
    end
    else
        Cumple:=false;
end;


procedure AveriguoLaCantDeTransfQueCumplen(var Cant:integer;M:strMes;NCuenta:integer);
begin
    if ((M='Junio') and (Cumple(NCuenta))) then begin
        Cant:=Cant+1;
    end;
end;


procedure InicializoVectorContador (var v:vContador);
var
    i:Integer;
begin
    for i:=1 to 7 do begin
        v[i]:=1;
    end;
end;


procedure Informo(SL:lista);
var
    V:vContador;
    CantTransfCumplen:integer;{Que se realizaron en junio y cuenta dest posee menos pares que impares}
begin
    CantTransfCumplen:=0;
    InicializoVectorContador(v);
    while (SL<>Nil) do begin
        InformoMontoTotalTransf(SL^.Dato.NCuentaOrigen,SL^.Dato.Monto);
        v[SL^.Dato.MotivoTrans]:=v[SL^.Dato.MotivoTrans]+1;
        AveriguoLaCantDeTransfQueCumplen(CantTransfCumplen,SL^.Dato.Fecha.Mes,SL^.Dato.NCuentaDestino);
    end;
    AveriguoCualFueMotivoMasUsado(v);
    WriteLn('La cantidad de transferencias en el mes de junio el cual el nombre de la cuenta Destino tiene mas dig pares que impares es: ',CantTransfCumplen);
end;

procedure Cargodato (var T:Transferencia);
begin
    with T do begin
        Write ('Ingrese el DNI del titular: ');
        ReadLn(DNITitularCO);
        if (DNITitularCO<>0) then begin
            Write ('Ingrese el numero de cuenta de Origen: ');
            ReadLn(NCuentaOrigen);
            Write ('Ingrese el DNI del titular de la cuenta Destino: ');
            ReadLn(DNITitularCD);
            Write ('Ingrese el numero de cuenta de la cuenta destino: ');
            ReadLn(NCuentaDestino);
            With Fecha do begin
                Write ('Ingrese el dia de la transaccion: ');
                ReadLn(Dia);
                Write ('Ingrese el Mes de la transaccion: ');
                ReadLn(Mes);
            end;
            With Hora do begin
                Write ('Ingrese la hora de la transaccion: ');
                ReadLn(HS);
                Write ('Ingrese el minuto de la transaccion: ');
                ReadLn(Min);
                Write ('Ingrese el segundo de la transaccion: ');
                ReadLn(Seg);
            end;
            Write ('Ingrese el monto de la transaccion: ');
            ReadLn(Monto);
            Write ('Ingrese el Motivo de la transaccion: ');
            ReadLn(MotivoTrans);
        end;
    end;
end;

procedure CargoNodo (var L:lista;T:Transferencia);
var
    nuevo:lista;
begin
    New(nuevo);
    nuevo^.Dato:=T;
    nuevo^.Sig:=L;
    L:=nuevo;
end;

var
    Lista1,Sublista:lista;
    Transferencias:Transferencia;
begin
    Lista1:=Nil;Sublista:=Nil;
    {Codigo donde se carga la lista original}
    CargoDato(Transferencias);
    while (Transferencias.DNITitularCO<>0) do begin
        CargoNodo(Lista1,Transferencias);
        CargoDato(Transferencias);
    end;
    CargoSublista(Lista1,Sublista);
    Informo(SubLista);
end.