program Ejercicio3;
type
    Codigos=1..200;

//Averiguo los datos que debo informar
procedure InvestigoDatos (var PrecioMasBajo1,PrecioMasBajo2:Real;var CantidadEspeciales:integer;var CodigoMasBajo1,CodigoMasBajo2:Codigos;codigo:Codigos;precio:Real);
begin
    if (PrecioMasBajo1>precio) then begin
        PrecioMasBajo2:=PrecioMasBajo1;
        CodigoMasBajo2:=CodigoMasBajo1;
        PrecioMasBajo1:=precio;
        CodigoMasBajo1:=codigo;
    end
    else if (PrecioMasBajo2>precio) then begin
        PrecioMasBajo2:=precio;
        CodigoMasBajo2:=codigo;
    end;
    if ((codigo mod 2) = 0) then begin
        if (precio>16) then begin
            CantidadEspeciales:=CantidadEspeciales+1;
        end;
    end;
end;

//programa principal
var
    codigo,CodigoMasBajo1,CodigoMasBajo2:Codigos;
    CantidadEspeciales,i:Integer;
    Precio,PrecioMasBajo1,PrecioMasBajo2:Real;
begin
    //inicializo variables
    CantidadEspeciales:=0;
    PrecioMasBajo1:=9999;
    CodigoMasBajo1:=1;
    //bucle para todos los productos
    for i:=1 to 5 do begin
        Write ('Ingrese el codigo del producto: ');
        ReadLn(Codigo);
        Write ('Ingrese el precio del producto: ');
        ReadLn(Precio);
        InvestigoDatos(PrecioMasBajo1,PrecioMasBajo2,CantidadEspeciales,CodigoMasBajo1,CodigoMasBajo2,codigo,precio);
    end;
    WriteLn ('Los productos mas baratos son: ', CodigoMasBajo1,' y ',CodigoMasBajo2);
    WriteLn ('La cantidad de productos especiales son: ',CantidadEspeciales);
end.