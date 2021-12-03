program Ejercicio6;

type
    VectorNumerico=Array[1..10] of integer;


procedure CargoVector(var v:VectorNumerico;var dimL:integer);
var
    i:Integer;
begin
    for i:=1 to 10 do begin
        dimL:=dimL+1;
        v[i]:=i;
    end;
end;

procedure encuentroMAXyMIN(v:VectorNumerico;dimL:integer);
var
    i,MAX,MIN,pos1,pos2:integer;
begin
    pos1:=-1;pos2:=-1;
    MAX:=-1;MIN:=9999;
    for i:=1 to 10 do begin
        if (v[i]>MAX) then begin
            MAX:=v[i];
            pos1:=i;
        end;
        if (v[i]<MIN) then begin
            MIN:=v[i];
            pos2:=i;
        end;
    end;
    Write('NMAX:',MAX,' en pos: ',pos1,' NMIN: ',MIN,' en pos: ',pos2);
end;


var
    Vector:VectorNumerico;
    dimL:integer;
begin
    CargoVector(Vector,dimL);
    encuentroMAXyMIN(Vector,dimL);
end.