program Ejercicio4;
type
    lineas=record
        NumeroDeTelefono:integer;
        MinutosConsumidos:Real;
        MegaBytesConsumidos:Real;
    end;

    Clientes=record
        Codigo:String;
        CantidadDeLineasANombre:integer;
        linea:lineas;
    end;

//leo y analizo
procedure LecturaDeDatosDelCliente (var a:Clientes;var Min,MB,MinutosFacturados,MegaBytesFacturados:Real);
var
    //variable para bucle
    i:integer;
begin
    Write ('Ingrese el codigo del cliente: ');
    ReadLn (a.Codigo);
    Write ('Ingrese la Cantidad de Lineas a Cargo de su Nombre: ');
    ReadLn (a.CantidadDeLineasANombre);
    //Me aseguro de leer todas las lineas del cliente
    for i:=1 to a.CantidadDeLineasANombre do begin
        Write ('Ingrese el numero de telefono del cliente: ');
        ReadLn (a.linea.NumeroDeTelefono);
        Write ('Ingrese los minutos consumidos este mes: ');
        ReadLn (a.linea.MinutosConsumidos);
        //voy sumando los minutos totales
        Min:=Min+a.linea.MinutosConsumidos;
        Write ('Ingrese los MegaBytes consumidos: ');
        ReadLn (a.linea.MegaBytesConsumidos);
        //voy sumando los mb totales
        MB:=MB+a.linea.MegaBytesConsumidos;
    end;
    MinutosFacturados:=Min*3.40; MegaBytesFacturados:=MB*1.35;
end;

//programa principal
var
    a:Clientes;
    i:integer;
    //variables para informar
    MinutosGastados,MinutosFacturados,MegaBytesGastados,MegaBytesFacturados:Real;
begin
    for i:=1 to 9300 do begin
        //inicializo para tener siempre en cada cliente 0
        MinutosGastados:=0; MegaBytesGastados:=0;
        LecturaDeDatosDelCliente(a,MinutosGastados,MegaBytesGastados,MinutosFacturados,MegaBytesFacturados);
        //informo la cuenta final del cliente
        WriteLn ('El consumo total de mensajes es de: ', MinutosFacturados:0:2);
        WriteLn ('El consumo total de MegaBytes es de: ', MegaBytesFacturados:0:2);
    end;
end.