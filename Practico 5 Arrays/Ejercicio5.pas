program Ejercicio5;
const
    dimF=100;
type
    VectorALoSumo100=Array [1 .. dimF] of integer;

procedure CargoVector(var v:VectorALoSumo100;var dimL:integer);
var
    i,numIngresado:Integer;
begin
    dimL:=0;i:=0;
    ReadLn(numIngresado);
    while ((numIngresado<>0) and (dimL<100)) do begin
        i:=i+1;
        dimL:=dimL+1;
        v[i]:=numIngresado;
        ReadLn(numIngresado);
    end;
end;

function DevuelvoNMAX(v:VectorALoSumo100;dimL:integer):integer;
var
    NMAX,i:integer;
begin
    NMAX:=-9999;
    for i:=1 to dimL do begin
        if (v[i]>NMAX) then begin
            NMAX:=v[i];
        end;
    end; 
    DevuelvoNMAX:=NMAX;
end;

function DevuelvoNMIN (v:VectorALoSumo100;dimL:integer):integer;
var
    NMIN,i:integer;
begin
    NMIN:=9999;
    for i:=1 to dimL do begin
        if (v[i]<NMIN) then begin
            NMIN:=v[i];
        end;
    end;
    DevuelvoNMIN:=NMIN;
end;

procedure CambioDeLugar(v:VectorALoSumo100;dimL:integer);
var
    i,NMAX,NMIN,pos1,pos2:integer;
begin
    i:=0;pos1:=-1;pos2:=-1;
    NMAX:=DevuelvoNMAX(v,dimL);
    NMIN:=DevuelvoNMIN(v,dimL);
    repeat
        i:=i+1;
        if (v[i]=NMAX) then begin
            pos1:=i;
        end;
        if (v[i]=NMIN) then begin
            pos2:=i;
        end;
        until ((i=dimL) or ((pos1<>-1) and (pos2<>-1)));
    v[pos1]:=NMIN;
    v[pos2]:=NMAX;
    WriteLn ('El elemento maximo: ',NMAX,' que se encontraba en la pos: ',pos1,' fue intercambiado con el elemento minimo: ', NMIN,' que se encontraba en la pos: ',pos2);
end;


var
    Vetor:VectorALoSumo100;
    dimL:integer;
begin
    CargoVector(Vetor,dimL);
    CambioDeLugar(Vetor,dimL);
end.