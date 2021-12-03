program Ejercicio1A;
const
    dimF=500;
type
    VectorNumeros=Array [1 .. dimF] of Integer;
    Indice=0.. dimF;

procedure CargarVector(var V:VectorNumeros;var dimL:Indice);
var
    pos:Indice;
    NumeroIngresado:integer;
begin
    pos:=0;
    Write ('Ingrese un numero entero: ');
    ReadLn (NumeroIngresado);
    while ((NumeroIngresado<>0) and (dimL<DimF)) do begin
        pos:=pos+1;
        dimL:=dimL+1;
        V[pos]:=NumeroIngresado;
        Write ('Ingrese un numero entero: ');
        ReadLn (NumeroIngresado);
    end;
end;

function RetornoN (V:VectorNumeros;dimL:Indice;NBuscado:Integer):Boolean;
var
    pos:Indice;
    exito:Boolean;
begin
    pos:=1; exito:=False;
    while ((pos<=dimL) and not(exito)) do begin
        if (NBuscado=V[pos]) then begin
            exito:=True;
        end
        else
            pos:=pos+1;
    end;
    RetornoN:=exito;
end;

var
    Vector:VectorNumeros;
    dimL:Indice;
    NBuscado:Integer;
begin
    dimL:=0;
    CargarVector(Vector,dimL);
    Write ('Ingrese un numero para buscarlo: ');
    ReadLn(NBuscado);
    if (RetornoN(Vector,dimL,NBuscado)) then begin
        Write ('Numero encontrado');
    end
    else
        Write ('Numero no encontrado');
end.