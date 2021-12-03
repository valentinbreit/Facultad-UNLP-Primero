program Ejercicio6;
type 
    TiposDeOndasElectromagneticas=Array [1 .. 7] of integer;
    
    Rangos= 1..7;

    Nombres=String[30];

    Costos=record
        Construccion:Real;
        MantMensual:Real;
    end;
    
    Sonda=record
        Nombre:Nombres;
        TiempoDeMision:Real;
        Costo:Costos;
        RangoDeEspectro:Rangos;
    end;

    lista=^nodo;
    nodo=record
        sondas:sonda;
        siguiente:lista;
    end;

procedure LeerSonda(var Sondas:Sonda);
begin
    Write ('Ingrese el nombre de la sonda: ');
    ReadLn(Sondas.Nombre);
    Write ('Ingrese el tiempo de mision de la sonda: ');
    ReadLn(Sondas.TiempoDeMision);
    Write ('Ingrese el costo de construccion de la sonda: ');
    ReadLn(Sondas.Costo.Construccion);
    Write ('Ingrese el costo de mantension mensual de la sonda: ');
    ReadLn(Sondas.Costo.MantMensual);
    Write ('Ingrese el Rango de Espectro en el que trabaja: ');
    ReadLn(Sondas.RangoDeEspectro);
end;

procedure CargarALaLista(var L:lista;S:Sonda);
var
    aux:lista;
begin
    New(aux);
    aux^.sondas:=S;
    aux^.siguiente:=L;
    L:=aux;
end;

procedure EncuentroNombreSondaMasCostosa(L:lista;var NombreMasCostosa:Nombres;var ValorMasCostosa:Real);
var
    CostoTotal:Real;
begin
    CostoTotal:=L^.sondas.Costo.Construccion+(L^.sondas.Costo.MantMensual*L^.sondas.TiempoDeMision);
    if (CostoTotal>ValorMasCostosa) then begin
        ValorMasCostosa:=CostoTotal;
        NombreMasCostosa:=L^.sondas.Nombre;
    end;
end;

procedure SondasConMasDuracionPromedio(L:lista;DuracionPromedio:Real;var CantSondasConMasDuracionQueElPromedio:integer);
var
    DuracionXSonda:Real;
begin
    DuracionXSonda:=L^.sondas.TiempoDeMision;
    if (DuracionXSonda>DuracionPromedio) then begin
        CantSondasConMasDuracionQueElPromedio:=CantSondasConMasDuracionQueElPromedio+1;
    end;
end;

procedure EncuentroLosNombresDeLaSondasQueSuperanElCostProm(L:lista;CostoPromedio:Real);
var
    CostoXSonda:Real;
begin
    CostoXSonda:=L^.sondas.Costo.Construccion+(L^.sondas.Costo.MantMensual*L^.sondas.TiempoDeMision);
    if (CostoXSonda>CostoPromedio) then begin
        WriteLn (L^.sondas.Nombre);
    end;
end;


procedure LeoEImprimoInformacion(L:lista;CostoPromedio,DuracionPromedio:Real);
var
    NombreMasCostosa:Nombres;
    CadaDeLosRangos:TiposDeOndasElectromagneticas;
    ValorMasCostosa:Real;
    i,CantSondasConMasDuracionQueElPromedio:Integer;
begin
    NombreMasCostosa:='';ValorMasCostosa:=0;CantSondasConMasDuracionQueElPromedio:=0;
    While (L<>Nil) do begin
        EncuentroNombreSondaMasCostosa(L,NombreMasCostosa,ValorMasCostosa);
        CadaDeLosRangos[L^.sondas.RangoDeEspectro]:=CadaDeLosRangos[L^.sondas.RangoDeEspectro]+1;
        SondasConMasDuracionPromedio(L,DuracionPromedio,CantSondasConMasDuracionQueElPromedio);
        EncuentroLosNombresDeLaSondasQueSuperanElCostProm(L,CostoPromedio);
        L:=L^.siguiente;
    end;
    WriteLn ('El nombre de la sonda mas cara es: ',NombreMasCostosa);
    for i:=1 to 7 do begin
        WriteLn (CadaDeLosRangos[i],' son los que estudian el espectro de rango: ',i);
    end;
    WriteLn ('La cantidad de sondas que superan el promedio de duracion es de: ', CantSondasConMasDuracionQueElPromedio);

end;

var
    pri:lista;
    Sondas:Sonda;
    CantIteraciones:integer;
    DuracionPromedio,CostoPromedio:Real;
begin
    CantIteraciones:=0;DuracionPromedio:=0;CostoPromedio:=0;
    pri:=Nil;
    repeat
        CantIteraciones:=CantIteraciones+1;
        LeerSonda(Sondas);
        DuracionPromedio:=DuracionPromedio+Sondas.TiempoDeMision;
        CostoPromedio:=CostoPromedio+Sondas.Costo.Construccion;        
        CargarALaLista(pri,Sondas);
    until (Sondas.Nombre='GAIA');
    DuracionPromedio:=(DuracionPromedio/CantIteraciones);
    CostoPromedio:=(CostoPromedio/CantIteraciones);
    LeoEImprimoInformacion(pri,CostoPromedio,DuracionPromedio);
end.