program Ejercicio4;
const
    dimF=100;
type
    Vector100N=Array [1 .. dimF] of integer;


procedure CargoVector(var v:Vector100N;var dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimF do begin
        v[i]:=i;
        dimL:=dimL+1;
    end;
end;

procedure IncisioAPosicion(v:Vector100N;dimL:integer);
var 
    i,NumeroBuscado,pos:Integer;
begin
    i:=0;pos:=(-1);
    WriteLn ('Ingrese un numero que quiera buscar: ');
    ReadLn(NumeroBuscado);
    repeat
        i:=i+1;
        if (v[i]=NumeroBuscado) then begin
            pos:=i;
        end;
    until ((v[i]=NumeroBuscado) or (i=dimL));
    WriteLn ('La posicion donde esta el numero es: ', pos);
end;

procedure IncisoBIntercambio(v:Vector100N;dimL:integer);
var
    i,NumeroX,NumeroY,pos1,pos2:integer;
begin
    pos1:=-1;pos2:=-1;i:=1;
    Write ('Ingrese un valor entre 1 y 100: ');
    ReadLn (NumeroX);
    Write ('Ingrese otro numero entre 1 y 100: ');
    ReadLn (NumeroY);
    if (((1<=NumeroX) and (100>=NumeroX)) and ((1<=NumeroY) and (100>=NumeroY))) then begin
        repeat
            i:=i+1;
            if (v[i]=NumeroX) then begin
                pos1:=i;
            end
            else if (v[i]=NumeroY) then begin
                pos2:=i;
            end;
        until ((i=dimL) or ((pos1<>-1) and (pos2<>-1)));
        if ((pos1<>-1) and (pos2<>-2)) then begin
            v[pos1]:=NumeroY;
            v[pos2]:=NumeroX;
        end;
    end;
    for i:=1 to dimL do begin
        WriteLn (v[i]);
    end;
end;


procedure IncisoCSumaVector(v:Vector100N;dimL:integer);
var
    i,suma:integer;
begin
    suma:=0;
    for i:=1 to dimL do begin
        suma:=suma+v[i];
    end;
    WriteLn ('La suma de todos los numeros es: ', suma);
end;

procedure IncisoDPromedio (v:Vector100N;dimL:integer);
var
    i:Integer;
    promedio:Real;
begin
    promedio:=0;
    for i:=1 to dimL do begin
        promedio:=promedio+v[i];
    end;
    WriteLn ('El promedio es de: ', (promedio/i):0:2);
end;

procedure IncisoEelementoMaximo(v:Vector100N;dimL:integer);
var
    i,NumeroMayor:integer;
begin
    NumeroMayor:=-9999;
    for i:=1 to dimL do begin
        if (v[i]>NumeroMayor) then begin
            NumeroMayor:=v[i];
        end;
    end;
    WriteLn ('El numero mayor del array es: ', NumeroMayor);
end;

procedure IncisoFelementoMinimo(v:Vector100N;dimL:integer);
var
    i,NumeroMinimo:integer;
begin
    NumeroMinimo:=9999;
    for i:=1 to dimL do begin
        if (v[i]<NumeroMinimo) then begin
            NumeroMinimo:=v[i];
        end;
    end;
    WriteLn ('El numero minimo del array es: ', NumeroMinimo);
end;

var
    Vector:Vector100N;
    DimL:integer;
begin
    CargoVector(Vector,DimL);
    IncisioAPosicion(Vector,DimL);
    IncisoBIntercambio(Vector,DimL);
    IncisoCSumaVector(Vector,DimL);
    IncisoDPromedio(Vector,DimL);
    IncisoEelementoMaximo(Vector,DimL);
    IncisoFelementoMinimo(Vector,DimL);
end.