program Ejercicio10;
type
    str=string[30];

    Cultivo=record
        Tipo:str;
        CantHectareas:Real;
        CantMeses:Integer;
    end;

    listaCultivo=^nodoCultivo;
    nodoCultivo=record
        Dato:Cultivo;
        Sig:listaCultivo;
    end;

    Empresa=record
        Codigo:Integer;
        Nombre:str;
        T:Boolean;{si es verdadero es privada, false es estatal}
        NomCiudadRadicada:str;
        Cultivos:listaCultivo;
    end;

    listaEmpresa=^nodoEmpresa;
    nodoEmpresa=record
        Dato:Empresa;
        Sig:listaEmpresa;
    end;

procedure CargoCultivos (var Cult:Cultivo);
begin
    with Cult do begin
        Write ('Ingrese la Cantidad de Hectareas que tiene el cultivo: ');
        ReadLn (CantHectareas);
        if (CantHectareas<>0) then begin
            Write ('Ingrese el tipo de cultivo: ');
            ReadLn (Tipo);
            Write ('Ingrese la cantidad de meses que tarda el ciclo del cultivo: ');
            ReadLn (CantMeses);
        end;
    end;
end;

procedure CargoNodoCultivos(var L:listaCultivo;C:Cultivo);
var
    nuevo:listaCultivo;
begin
    New(nuevo);
    nuevo^.Dato:=C;
    nuevo^.Sig:=L;
    L:=nuevo;
end;

procedure EvaluoRsp(Rta:str;var T:Boolean);
begin
    if (Rta='si') then begin
        T:=True;
    end
    else if (Rta='no') then begin
        T:=False;
    end
    else
        WriteLn('Ingreso no valido, vuelva a ingresar la respuesta.');
end;


procedure PreguntoTipo(var T:Boolean);
var
    Respuesta:str;
begin
    repeat
        Write ('¿La Empresa es de Tipo Privado?(si/no)');
        ReadLn(Respuesta);
        EvaluoRsp(Respuesta,T);
    until ((Respuesta='si') or (Respuesta='no'));
end;


procedure CargoEmpresa (var Empresas:Empresa);
var
    CultivosAux:Cultivo;
    Conteo:integer;
begin
    Conteo:=0;
    with Empresas do begin
        Write ('Ingrese el codigo de la empresa: ');
        ReadLn(Codigo);
        if (Codigo<>-1) then begin
            Write ('Ingrese el Nombre de la empresa: ');
            ReadLn(Nombre);
            PreguntoTipo(T);
            Write ('Ingrese el nombre de la ciudad donde se radica la empresa: ');
            ReadLn(NomCiudadRadicada);
            CargoCultivos(CultivosAux);
            while ((CultivosAux.CantHectareas<>0) and (Conteo<20)) do begin
                CargoNodoCultivos(Cultivos,CultivosAux);
                Conteo:=Conteo+1;
                if (Conteo<20) then begin
                    CargoCultivos(CultivosAux);
                end;
            end;   
        end;
    end;
end;

procedure CargoNodoEmpresa(var L:listaEmpresa;E:Empresa);
var
    nuevo:listaEmpresa;
begin
    New(nuevo);
    nuevo^.Dato:=E;
    nuevo^.Sig:=L;
    L:=nuevo;
end;

function CumpleCodigo(Num:Integer):Boolean;
var
    dig,CantCeros:integer;
begin
    CantCeros:=0;
    while (Num<>0) do begin
        dig:=Num mod 10;
        if (dig=0) then begin
            CantCeros:=CantCeros+1;
        end;
        if (CantCeros=2) then begin
            CumpleCodigo:=True;
        end;
        Num:=Num div 10;
    end;
    CumpleCodigo:=False;
end;


procedure InformoEmpresaQueCumple(Nom:str;Cod:Integer;L:listaCultivo;Radicada:str);
var
    EncontreTrigo:Boolean;
begin
    EncontreTrigo:=False;
    if ((Radicada='San Miguel Del Monte') and (CumpleCodigo(Cod))) then begin
        while ((L<>Nil) and not(EncontreTrigo)) do begin
            if (L^.Dato.Tipo='Trigo') then begin
                EncontreTrigo:=True;
            end
            else
                L:=L^.Sig;
        end;
        if (EncontreTrigo) then begin
            WriteLn (Nom)
        end;
    end;
end;

function CumpleTipo(T:str):Boolean;
begin
    if (T='Soja') then begin
        CumpleTipo:=True;
    end
    else
        CumpleTipo:=False;
end;


procedure CalculoHecTotalYSojaXEmpresa(var CTH,CHS:Real;L:listaCultivo);
var
    HectXTipo:Real;
begin
    HectXTipo:=0;
    while (L<>Nil) do begin
        HectXTipo:=HectXTipo+L^.Dato.CantHectareas;
        if (CumpleTipo(L^.Dato.Tipo)) then begin
            CHS:=CHS+L^.Dato.CantHectareas;
        end;
        L:=L^.Sig;
    end;
    CTH:=CTH+HectXTipo;
end;

procedure InvestigoCuantoTiempoTieneEnMaiz(var TM:Integer;L:listaCultivo;var NomBuscado:str;NomEmpre:str);
var
    TiempoTotalEnMaiz:Integer;
begin
    TiempoTotalEnMaiz:=0;
    while (L<>Nil) do begin
        if (L^.Dato.Tipo='Maiz') then begin
            TiempoTotalEnMaiz:=TiempoTotalEnMaiz+L^.Dato.CantMeses;
        end;
        L:=L^.Sig;
    end;
    if (TiempoTotalEnMaiz>TM) then begin
        TM:=TiempoTotalEnMaiz;
        NomBuscado:=NomEmpre;
    end;
end;

procedure AveriguoSiAumento (var L:listaCultivo;T:Boolean);
var
    NumQueDeboAumentar:integer;
begin
    NumQueDeboAumentar:=1;
    while (L<>Nil) do begin
        if ((T=False) and (L^.Dato.Tipo='Girasol') and (L^.Dato.CantHectareas<5)) then begin
            L^.Dato.CantMeses:=L^.Dato.CantMeses+NumQueDeboAumentar;
        end;
        L:=L^.Sig;
    end;
end;

procedure CalculoEInformo(L:listaEmpresa);
var
    CantTotalHectareas,CantHectareasSoja:Real;
    TiempoMax:integer;
    NEmpresaConMayorTiempo:str;
begin
    {podria ser mejor, podria recorrer solo 1 vez la lista de cult X empresa (creo) (preguntar en practica)}
    CantTotalHectareas:=0;CantHectareasSoja:=0;
    TiempoMax:=0;NEmpresaConMayorTiempo:='';
    while (L<>Nil) do begin
        {empresas que erradicadas en San MiguelDel Monte, cultivan trigo y cuyo codigo tiene al menos dos 0}
        InformoEmpresaQueCumple(L^.Dato.Nombre,L^.Dato.Codigo,L^.Dato.Cultivos,L^.Dato.NomCiudadRadicada);
        CalculoHecTotalYSojaXEmpresa(CantTotalHectareas,CantHectareasSoja,L^.Dato.Cultivos);
        InvestigoCuantoTiempoTieneEnMaiz(TiempoMax,L^.Dato.Cultivos,NEmpresaConMayorTiempo,L^.Dato.Nombre);
        AveriguoSiAumento(L^.Dato.Cultivos,L^.Dato.T);
        L:=L^.Sig;
    end;
    WriteLn ('La cantidad total de hectareas en las que se plantaron soja son: ', CantHectareasSoja:0:2,' y representa el :',((CantHectareasSoja*100)/CantTotalHectareas):0:2,'%');
    WriteLn ('La empresa que mas tiempo dedico al maiz es: ',NEmpresaConMayorTiempo);
end;



var
    ListaE:listaEmpresa;
    Empresas:Empresa;
begin
    ListaE:=Nil;
    CargoEmpresa(Empresas);
    while (Empresas.Codigo<>-1) do begin
        CargoNodoEmpresa(ListaE,Empresas);
        CargoEmpresa(Empresas);
    end;
    CalculoEInformo(ListaE);
end.