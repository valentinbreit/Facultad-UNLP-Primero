program Ejercicio5;
const   
    AnoActual=2021;


type
    Patentes=string[30];
    Camion=record
        Patente:Patentes;
        AnoFabricacion:Integer;
        Capacidad:Real;
    end;

    VCamiones=Array [1..100] of Camion;
    
    CodigosCamiones=1..100;

    Destinos=string[30];
    
    Viaje=record
        CodViaje:integer;
        CodCamion:CodigosCamiones;
        KMRecorridos:Real;
        Destino:Destinos;
        AnoDeViaje:integer;
        DNIChofer:integer;
    end;

    lista=^nodo;
    nodo=record
        dato:Viaje;
        sig:lista;
    end;

procedure LecturaViaje (var Viajes:Viaje);
begin
    with Viajes do begin
        Write ('Ingrese el codigo de viaje: ');
        ReadLn(CodViaje);
        if (CodViaje<>-1) then begin
            Write ('Ingrese el codigo del camion: ');
            ReadLn(CodCamion);
            Write ('Ingrese la distancia en kilometros que recorrio: ');
            ReadLn(KMRecorridos);
            Write ('Ingrese el destino del juego: ');
            ReadLn(Destino);
            Write ('Ingrese el año del viaje: ');
            ReadLn(AnoDeViaje);
            Write ('Ingrese el DNI del chofer: ');
            ReadLn(DNIChofer);
        end;
    end;
end;


procedure CargoViaje(var L:lista;V:Viaje);
var
    nuevo:lista;
begin
    New(nuevo);
    nuevo^.dato:=V;
    nuevo^.sig:=L;
    L:=nuevo;
end;

procedure KMRecorridos(var PatenteMasKM,PatenteMenosKM:Patentes; KMRecorridos:Real;Pat:Patentes;var Max,Min:Real);
begin
    if (KMRecorridos>Max) then begin
        PatenteMasKM:=Pat;
        Max:=KMRecorridos;
    end;
    if (KMRecorridos<Min) then begin
        PatenteMenosKM:=Pat;
        Min:=KMRecorridos;
    end;
end;

function Cumple(AF:integer;Cap:Real):Boolean;
var
    AnosDeCamion:integer;
begin
    AnosDeCamion:=AnoActual-AF;
    if ((Cap>30.5) and (AnosDeCamion>5)) then begin
        Cumple:=True;
    end
    else
        Cumple:=False;
end;


procedure CumpleViaje (var CantViajesCumplen:integer;AnoFabricado:integer;Capacidad:Real);
begin
    if (Cumple(AnoFabricado,Capacidad)) then begin
        CantViajesCumplen:=CantViajesCumplen+1;
    end;
end;

function DescompongoDNI(DNI:integer):Boolean;
var
    digito:integer;
begin
    while (DNI<>0) do begin
        digito:=DNI mod 10;
        if ((digito mod 2)=0) then begin
            DescompongoDNI:=False;
        end; 
        DNI:=DNI div 10;
    end;
    DescompongoDNI:=True;
end;



procedure SiCumpleDNIINformo(CodigoV:integer;DNI:integer);
begin
    if (DescompongoDNI(DNI)) then begin
        WriteLn ('El codigo de viaje es: ', CodigoV);
    end;
end;


procedure Informo (L:lista;VC:VCamiones);
var
    PatenteMasKM,PatenteMenosKM:Patentes;
    KMMAximos,KMMinimos:Real;
    CantViajesCumplen:integer;{capacidad+30.5 y con antiguedad de +5}
begin
    PatenteMasKM:='';KMMAximos:=-1;
    PatenteMenosKM:='';KMMinimos:=9999;
    CantViajesCumplen:=0;
    while (L<>Nil) do begin
        KMRecorridos(PatenteMasKM,PatenteMenosKM,L^.dato.KMRecorridos,VC[L^.dato.CodCamion].Patente,KMMaximos,KMMinimos);
        CumpleViaje(CantViajesCumplen,VC[L^.dato.CodCamion].AnoFabricacion,VC[L^.dato.CodCamion].Capacidad);
        SiCumpleDNIInformo(L^.dato.CodViaje,L^.dato.DNIChofer);
        L:=L^.sig;
    end;
    WriteLn ('La patente que mas KM recorrio es: ', PatenteMasKM);
    WriteLn ('La patente que menos KM recorrio es: ', PatenteMenosKM);
    WriteLn ('LA cantidad de viajes que cumplen son: ', CantViajesCumplen);
end;



var
    L:lista;
    VectorCamiones:VCamiones;
    Viajes:Viaje;
begin   
    L:=Nil;
    {Cargo VectorDeCamiones}
    LecturaViaje(Viajes);
    while (Viajes.CodViaje<>-1) do begin
        CargoViaje(L,Viajes);
        LecturaViaje(Viajes);
    end;
    Informo(L,VectorCamiones);
end.