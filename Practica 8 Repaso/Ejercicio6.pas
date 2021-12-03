program Ejercicio6;
type
    Categorias=1..7;    

    CategoriasXpraInicializarContador=0..7;
    VContador=Array [Categorias] of CategoriasXpraInicializarContador;

    Nombres=String[20];

    Anos=1..2015;

    Objeto=record
        CodDelObjeto:integer;
        Categoria:Categorias;
        NomdelObjeto:Nombres;
        Distancia:Real;
        NombreDelDescubridor:Nombres;
        AnoDeDescubrimiento:Anos;
    end;

    lista=^nodo;
    nodo=record 
        dato:Objeto;
        sig:lista;
    end;

procedure LeoObjetos(var Objetos:Objeto);
begin
    with Objetos do begin
        Write ('Ingrese el codigo del objeto: ');
        ReadLn(CodDelObjeto);
        if (CodDelObjeto<>-1) then begin
            Write ('Ingrese la categoria del objeto: ');
            ReadLn(Categoria);
            Write ('Ingrese el Nombre del Objeto: ');
            ReadLn(NomdelObjeto);
            Write ('Ingrese la distancia a La Tierra con el objeto: ');
            ReadLn(Distancia);
            Write ('Ingrese el nombre de la persona que descubrio el objeto: ');
            ReadLn(NombreDelDescubridor);
            Write ('Ingrese el año de descubrimiento del Objeto: ');
            ReadLn(AnoDeDescubrimiento);
        end;
    end;
end;


procedure CargoObjeto(var L:lista;Objetos:Objeto);
var
    nuevo:lista;
begin
    New(nuevo);
    nuevo^.dato:=Objetos;
    nuevo^.sig:=L;
    L:=nuevo;
end;

procedure CargoVector(var V:VContador);
var
    i:integer;
begin
    for i:=1 to 7 do begin
        V[i]:=0;
    end;
end;


procedure AveriguoDistancias (Codigo:Integer;Dist:Real;var ObjMasLejano1,ObjMasLejano2:integer;var DistObjMasLejano1,DistObjMasLejano2:Real);
begin
    if (Dist>DistObjMasLejano1) then begin
        DistObjMasLejano2:=DistObjMasLejano1;
        DistObjMasLejano1:=Dist;
        ObjMasLejano2:=ObjMasLejano1;
        ObjMasLejano1:=Codigo;
    end
    else if (Dist>DistObjMasLejano2) then begin
        DistObjMasLejano2:=Dist;
        ObjMasLejano2:=Codigo;
    end;
end;

function Cumple (N:Nombres):Boolean;
begin
    if (N='Galileo Galilei') then begin
        Cumple:=True;
    end
    else
        Cumple:=False;
end;


procedure AveriguoCuantosDescubrioGalileo(Nombre:Nombres;var CantCumplen:integer);
begin
    if (Cumple(Nombre)) then begin
        CantCumplen:=CantCumplen+1;
    end;
end;

procedure SumoLosDatosXCategoria(var V:VContador;Cat:Categorias);
begin
    V[Cat]:=V[Cat]+1;
end;

procedure MuestroCantXCategoria(V:VContador);
var
    i:integer;
begin
    for i:= 1 to 7 do begin
        WriteLn ('La categoria: ', i ,' tuvo una cantidad de : ', V[i]); 
    end;
end;

function CumpleCod(Codigo:Integer):Boolean;
var
    pares,impares,digito:integer;
begin
    pares:=0;impares:=0;
    while (Codigo<>0) do begin
        digito:=Codigo mod 10;
        if ((digito mod 2) =0) then begin
            pares:=pares+1;
        end
        else
            impares:=impares+1;
        Codigo:=Codigo div 10;
    end;
    if (pares>impares) then begin
        CumpleCod:=True;
    end
    else
        CumpleCod:=False;
end;


procedure AveriguoSiInformoNombre(Nombre:Nombres;Codigo:Integer);
begin
    if (CumpleCod(Codigo)) then begin
        WriteLn(Nombre);
    end;
end;



procedure Reporte (L:lista);
var
    Vector:VContador;
    ObjMasLejano1,ObjMasLejano2:Integer;
    DistObjMasLejano1,DistObjMasLejano2:Real;
    CantPlanetasCumplen:integer;{Descubiertos Por GalileoGalilei}
begin
    {Inicializo mis variables}
    CargoVector(Vector);
    ObjMasLejano1:=0;DistObjMasLejano1:=-1;
    CantPlanetasCumplen:=0;
    while (L<>Nil) do begin
        AveriguoDistancias(L^.dato.CodDelObjeto,L^.dato.Distancia,ObjMasLejano1,ObjMasLejano2,DistObjMasLejano1,DistObjMasLejano2);
        AveriguoCuantosDescubrioGalileo(L^.dato.NombreDelDescubridor,CantPlanetasCumplen);
        SumoLosDatosXCategoria(Vector,L^.dato.Categoria);
        AveriguoSiInformoNombre(L^.dato.NomdelObjeto,L^.dato.CodDelObjeto);
        L:=L^.sig;
    end;
    WriteLn('Los objetos con mayor distancia a La Tierra son: ', ObjMasLejano1, ' y ', ObjMasLejano2);
    WriteLn('La cantidad de Objetos descubiertos por Galileo Galilei son: ', CantPlanetasCumplen);
    MuestroCantXCategoria(Vector);
end;


var
    L:lista;
    Objetos:Objeto;
begin
    L:=Nil;
    LeoObjetos(Objetos);
    while (Objetos.CodDelObjeto<>-1) do begin
        CargoObjeto(L,Objetos);
        LeoObjetos(Objetos);
    end;
    Reporte(L);
end.