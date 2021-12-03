program Ejercicio3;
const
    dimF=10;

type
    VectorNZ=Array [1 .. dimF] of integer;

procedure CargoVector(var v:VectorNZ;var dimL:integer);
var
    i:Integer;
begin
    dimL:=0;
    for i:=1 to dimF do begin
        v[i]:=i;
        dimL:=dimL+1;
    end;
end;

procedure IncisoA (v:VectorNZ;dimL:integer);
var
    i:integer;
begin
    WriteLn ('Inciso A: ');
    for i:=1 to dimL do begin
        WriteLn(v[i]);
    end;
end;

procedure IncisoB (v:VectorNZ;dimL:integer);
var
    i:integer;
begin
    WriteLn ('Inciso B: ');
    for i:=dimL downto 1 do begin
        WriteLn(v[i]);
    end;
end;

procedure IncisoC (v:VectorNZ;dimL:integer);
var
    i:integer;
begin
    WriteLn('Inciso C(1): ');
    for i:=(dimL div 2) downto 1 do begin
        WriteLn(v[i]);
    end;
    WriteLn('Inciso C(2): ');
    for i:=((dimL div 2) + 1) to dimL do begin
        WriteLn(v[i]);
    end;
end;

procedure IncisoD (v:VectorNZ;dimL:integer);
var
    i,posX,posY:integer;
begin
    Write ('Ingrese una posicion: ');
    ReadLn (posX);
    Write ('Ingrese una segunda posicion: ');
    ReadLn (posY);
    if ((posX<=dimL) and (posY<=dimL)) then begin
        if (posX<posY) then begin
            for i:=posX to posY do begin
                WriteLn(v[i]);
            end;
        end
        else begin
            for i:=posX downto posY do begin
                WriteLn(v[i]);
            end;
        end;
    end;
end;

procedure IncisoE (v:VectorNZ;dimL:integer);
var
    i,posX,PosY:integer;
begin
    Write ('Ingrese una posicion: ');
    ReadLn (posX);
    Write ('Ingrese una segunda posicion: ');
    ReadLn (posY);
    if ((posX<=dimL) and (posY<=dimL)) then begin
        Writeln ('Inciso A: ');
        if (posX<posY) then begin 
            for i:=posX to posY do begin
                WriteLn(v[i]);
            end;
        end
        else begin
            for i:=posY to posX do begin
                WriteLn(v[i]);
            end;
        end;
        WriteLn ('Inciso B: ');
        if (PosX>posY) then begin
            for i:=posX downto posY do begin
                WriteLn(v[i]);
            end;
        end
        else begin
            for i:=posY downto posX do begin
                WriteLn(v[i]);
            end;
        end;
        WriteLn('Inciso C(1): ');
        if (posX<posY) then begin
            for i:=(dimL div 2) downto posX do begin
                WriteLn(v[i]);
            end;
        end
        else begin
            for i:=(dimL div 2) downto posY do begin
                WriteLn(v[i]);
            end;
        end;
        WriteLn('Inciso C(2): ');
        if (posX<posY) then begin
            for i:=((dimL div 2) + 1) to posY do begin
                WriteLn(v[i]);
            end;
        end
        else begin
            for i:=((dimL div 2) + 1) to posX do begin
                WriteLn(v[i]);
            end;
        end;
    end;
end;

var
    v:VectorNZ;
    dimL:integer;
begin
    CargoVector(v,dimL);
    IncisoA(v,dimL);
    IncisoB(v,dimL);
    IncisoC(v,dimL);
    IncisoD(v,dimL);
    IncisoE(v,dimL);
end.