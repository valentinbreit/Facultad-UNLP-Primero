program Ejercicio7;
type
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

function VerificoSiCumpleH2020(L:lista):Boolean;
var
    CostoTotalDeMantenimiento:Real;
begin
    CostoTotalDeMantenimiento:=(L^.sondas.Costo.MantMensual*L^.sondas.TiempoDeMision);
    if ((L^.sondas.Costo.Construccion>CostoTotalDeMantenimiento) and (L^.sondas.RangoDeEspectro<>1)) then begin
        VerificoSiCumpleH2020:=True;
    end
    else
        VerificoSiCumpleH2020:=False;
end;

procedure ArmoListadosDistintos(pri:lista;var Cumplen,NoCumplen:lista;Sondas:Sonda);
begin
    if (VerificoSiCumpleH2020(pri)) then begin
        CargarALaLista(Cumplen,Sondas);
    end
    else
        CargarALaLista(NoCumplen,Sondas);
end;

procedure InformoCantYCostoDeLosQueNoCumplen(NoCumplen:lista);
var
    CantElementos:integer;
    CostoTotalDelProyecto:Real;
begin
    CantElementos:=0;CostoTotalDelProyecto:=0;
    While (NoCumplen<>Nil) do begin
        CantElementos:=CantElementos+1;
        CostoTotalDelProyecto:=CostoTotalDelProyecto+(NoCumplen^.sondas.Costo.Construccion+(NoCumplen^.sondas.Costo.MantMensual*NoCumplen^.sondas.TiempoDeMision));
        NoCumplen:=NoCumplen^.siguiente;
    end;
    Write ('La cantidad de proyectos que no fueron aceptados es de: ', CantElementos,' su gasto en total es de: ', CostoTotalDelProyecto:0:2);

end;

var
    Cumplen,NoCumplen,pri:lista;
    Sondas:Sonda;    
begin
    Cumplen:=Nil;NoCumplen:=Nil;pri:=Nil;
    repeat
        LeerSonda(Sondas);       
        CargarALaLista(pri,Sondas);
        ArmoListadosDistintos(pri,Cumplen,NoCumplen,Sondas);
    until (Sondas.Nombre='GAIA');
    InformoCantYCostoDeLosQueNoCumplen(NoCumplen);
end.