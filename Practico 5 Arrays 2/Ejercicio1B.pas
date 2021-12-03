program Ejercicio1B;
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
    pri,ult,mid:Indice;
    exito:Boolean;
begin
    pri:=1;ult:=dimL;mid:=((pri+ult) div 2);
    exito:=False;
    while ((pri<=ult) and (NBuscado<>V[mid])) do begin
        if (NBuscado<V[mid]) then begin
            ult:=mid-1;
        end
        else
            pri:=mid+1;
        mid:=((pri+ult) div 2);
    end;
    if ((pri<=ult) and (NBuscado=V[mid])) then begin
        exito:=True;
    end;
    RetornoN:=exito;
end;

var
    Vector:VectorNumeros;
    dimL:Indice;
    Nbuscado:integer;
begin
    dimL:=0;
    CargarVector(Vector,dimL);
    Write ('Ingrese un numero que quiera buscar: ');
    ReadLn (Nbuscado);
    if (RetornoN(Vector,dimL,NBuscado)) then begin
        Write ('Numero encontrado');
    end
    else
        Write ('Numero no encontrado');
end.