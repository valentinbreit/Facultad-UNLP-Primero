program Ejercicio5;
type
    CadenaDescripcion=string[50];

    Stocks=record
        actual:integer;
        minimo:integer;
    end;

    producto=record
        codigo:integer;
        descripcion:CadenaDescripcion;
        stock:Stocks;
        precio:Real;
    end;

    lista = ^nodo;

    nodo=record
        productos:producto;
        siguiente:lista;
    end;

procedure LeerProducto(var Prod:producto);
begin
    Write ('Ingrese el codigo del producto: ');
    ReadLn (Prod.codigo);
    if (Prod.codigo<>(-1)) then begin
        Write ('Ingrese la descripcion del producto: ');
        ReadLn(Prod.descripcion);
        Write ('Ingrese el stock actual del producto: ');
        ReadLn(Prod.stock.actual);
        Write ('Ingrese el stock minimo del producto: ');
        ReadLn(Prod.stock.minimo);
        Write ('Ingrese el precio del producto: ');
        ReadLn(Prod.precio);
    end;
end;

procedure SumoALaListaAtras(var L:lista;prod:producto);
var
    aux:lista;
begin
    New(aux);
    aux^.productos:=prod;
    aux^.siguiente:=L;
    L:=aux;
end;

procedure AveriguoStocks(L:lista;var StockTotal,StockItemPorDebajoDelMinimo:integer);
var
    StockDelItem:integer;
begin
    StockDelItem:=L^.productos.stock.actual;
    if (StockDelItem<L^.productos.stock.minimo) then begin 
        StockItemPorDebajoDelMinimo:=StockItemPorDebajoDelMinimo+1;  
    end;
    StockTotal:=StockTotal+StockDelItem;
end;

function TieneAlMenos3NumerosPares(L:lista):Boolean;
var
    CantPares,digito,numero:integer;
    Es:Boolean;
begin
    Es:=False;
    CantPares:=0;numero:=(L^.productos.codigo);
    While (numero<>0) do begin
        digito:=numero mod 10;
        if ((digito mod 2)=0) then begin
            CantPares:=CantPares+1;
            if (CantPares=3) then begin
                Es:=True;
            end;
        end;
        numero:=(numero div 10);
    end;
    TieneAlMenos3NumerosPares:=Es;
end;

procedure AveriguoSiMuestroDescripcion(L:lista);
begin
    if (TieneAlMenos3NumerosPares(L)=True) then begin
        WriteLn (L^.productos.descripcion);
    end;
end;

procedure AveriguoCodigoDeLosProductosMasEconomicos(L:lista;var CodigoMasEconomico1,CodigoMasEconomico2:integer;var PrecioMasEconomico1,PrecioMasEconomico2:Real);
begin
    if (L^.productos.precio<PrecioMasEconomico1) then begin
        CodigoMasEconomico2:=CodigoMasEconomico1;
        PrecioMasEconomico2:=PrecioMasEconomico1;
        CodigoMasEconomico1:=L^.productos.codigo;
        PrecioMasEconomico1:=L^.productos.precio;
    end
    else if (L^.productos.precio<PrecioMasEconomico2) then begin
        CodigoMasEconomico2:=L^.productos.codigo;
        PrecioMasEconomico2:=L^.productos.precio;
    end;
end;

procedure AveriguoPorcentajeStocks(StockTotal,StockItemPorDebajoDelMinimo:Integer;var PorcentajeDeStock:Real);
begin
    PorcentajeDeStock:=((StockItemPorDebajoDelMinimo*100)/StockTotal);
end;

procedure ImprimoResultados(L:lista);
var
    StockTotal,StockItemPorDebajoDelMinimo,CodigoMasEconomico1,CodigoMasEconomico2:Integer;
    PrecioMasEconomico1,PrecioMasEconomico2,PorcentajeDeStock:Real;
begin
    //Inicializo mis variables
    StockTotal:=0;StockItemPorDebajoDelMinimo:=0;
    CodigoMasEconomico1:=0;PrecioMasEconomico1:=9999;
    //leo mi lista
    While (L<>Nil) do begin
        AveriguoStocks(L,StockTotal,StockItemPorDebajoDelMinimo);
        AveriguoCodigoDeLosProductosMasEconomicos(L,CodigoMasEconomico1,CodigoMasEconomico2,PrecioMasEconomico1,PrecioMasEconomico2);
        AveriguoSiMuestroDescripcion(L);
        L:=L^.siguiente;
    end;
    AveriguoPorcentajeStocks(StockTotal,StockItemPorDebajoDelMinimo,PorcentajeDeStock);
    WriteLn ('El porcentaje de los stocks por debajo del stock minimo es de: ', PorcentajeDeStock:0:2,'%');
    WriteLn ('Los codigos de los productos mas economicos son: ', CodigoMasEconomico1,' y ', CodigoMasEconomico2);
end;

var
    Primero:Lista;
    Prod:producto;
begin
    Primero:=Nil;
    LeerProducto(Prod);
    while (Prod.codigo<>(-1)) do begin
        SumoALaListaAtras(Primero,Prod);
        LeerProducto(Prod);
    end;
    ImprimoResultados(Primero);
end.