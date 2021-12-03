program Ejercicio7;
type
    VectorNumerosLeidos=Array[1..100] of integer;

procedure CargoVector(var v:VectorNumerosLeidos;var dimL:integer);
var
    i,numIngresado:integer;
begin
    i:=0;dimL:=0;
    Write ('Ingrese un numero entero: ');
    ReadLn (numIngresado);
    while (numIngresado<>-1) do begin
        i:=i+1;
        dimL:=dimL+1;
        v[i]:=numIngresado;
        Write ('Ingrese un numero entero: ');
        ReadLn(numIngresado);
    end;
end;

procedure AnalizoVector(v:VectorNumerosLeidos;dimL:Integer);
var
    Cant1,Cant2,Cant3,Cant4,Cant5,Cant6,Cant7,Cant8,Cant9,i,digito,numero:integer;
begin
    Cant1:=0;Cant2:=0;Cant3:=0;Cant4:=0;
    Cant5:=0;Cant6:=0;Cant7:=0;Cant8:=0;
    Cant9:=0;
    //leo el numero ingresado por cada iteracion
    for i:=1 to dimL do begin
        numero:=v[i];
        while (numero<>0) do begin
            digito:=numero mod 10;
            case digito of
                1: Cant1:=Cant1+1;
                2: Cant2:=Cant2+1;
                3: Cant3:=Cant3+1;
                4: Cant4:=Cant4+1;
                5: Cant5:=Cant5+1;
                6: Cant6:=Cant6+1;
                7: Cant7:=Cant7+1;
                8: Cant8:=Cant8+1;
                9: Cant9:=Cant9+1;
            end;
            numero:=numero div 10;
        end;
    end;
    //escribo cuantas veces aparecio cada uno
    if (Cant1>0) then
        WriteLn ('El digito 1 aparece: ',Cant1);
    if (Cant2>0) then
        WriteLn ('El digito 2 aparece: ',Cant2);
    if (Cant3>0) then
        WriteLn ('El digito 3 aparece: ',Cant3);
    if (Cant4>0) then
        WriteLn ('El digito 4 aparece: ',Cant4);
    if (Cant5>0) then
        WriteLn ('El digito 5 aparece: ',Cant5);
    if (Cant6>0) then
        WriteLn ('El digito 6 aparece: ',Cant6);
    if (Cant7>0) then
        WriteLn ('El digito 7 aparece: ',Cant7);
    if (Cant8>0) then
        WriteLn ('El digito 8 aparece: ',Cant8);
    if (Cant9>0) then
        WriteLn ('El digito 9 aparece: ',Cant9);
    //el digito más leido
    if ((Cant1>Cant2) and (Cant1>Cant3) and (Cant1>Cant4) and (Cant1>Cant5) and (Cant1>Cant6) and (Cant1>Cant7) and (Cant1>Cant8) and (Cant1>Cant9)) then
        WriteLn ('El digito 1 es el que mas aparece.');
    if ((Cant2>Cant1) and (Cant2>Cant3) and (Cant2>Cant4) and (Cant2>Cant5) and (Cant2>Cant6) and (Cant2>Cant7) and (Cant2>Cant8) and (Cant2>Cant9)) then
        WriteLn ('El digito 2 es el que mas aparece.');
    if ((Cant3>Cant1) and (Cant3>Cant2) and (Cant3>Cant4) and (Cant3>Cant5) and (Cant3>Cant6) and (Cant3>Cant7) and (Cant3>Cant8) and (Cant3>Cant9)) then
        WriteLn ('El digito 3 es el que mas aparece.');
    if ((Cant4>Cant1) and (Cant4>Cant2) and (Cant4>Cant3) and (Cant4>Cant5) and (Cant4>Cant6) and (Cant4>Cant7) and (Cant4>Cant8) and (Cant4>Cant9)) then
        WriteLn ('El digito 4 es el que mas aparece.');
    if ((Cant5>Cant1) and (Cant5>Cant2) and (Cant5>Cant3) and (Cant5>Cant4) and (Cant5>Cant6) and (Cant5>Cant7) and (Cant5>Cant8) and (Cant5>Cant9)) then
        WriteLn ('El digito 5 es el que mas aparece.');  
    if ((Cant6>Cant1) and (Cant6>Cant2) and (Cant6>Cant3) and (Cant6>Cant4) and (Cant6>Cant5) and (Cant6>Cant7) and (Cant6>Cant8) and (Cant6>Cant9)) then
        WriteLn ('El digito 6 es el que mas aparece.');
    if ((Cant7>Cant1) and (Cant7>Cant2) and (Cant7>Cant3) and (Cant7>Cant4) and (Cant7>Cant5) and (Cant7>Cant6) and (Cant7>Cant8) and (Cant7>Cant9)) then
        WriteLn ('El digito 7 es el que mas aparece.');
    if ((Cant8>Cant1) and (Cant8>Cant2) and (Cant8>Cant3) and (Cant8>Cant4) and (Cant8>Cant5) and (Cant8>Cant6) and (Cant8>Cant7) and (Cant8>Cant9)) then
        WriteLn ('El digito 8 es el que mas aparece.');
    if ((Cant9>Cant1) and (Cant9>Cant2) and (Cant9>Cant3) and (Cant9>Cant4) and (Cant9>Cant5) and (Cant9>Cant6) and (Cant9>Cant7) and (Cant9>Cant8)) then
        WriteLn ('El digito 9 es el que mas aparece.');                                      
    //los digitos que no tuvieron concurrencia
    if (Cant1=0) then
        WriteLn ('El digito 1 no aparece.');
    if (Cant2=0) then
        WriteLn ('El digito 2 no aparece.');
    if (Cant3=0) then
        WriteLn ('El digito 3 no aparece.');
    if (Cant4=0) then
        WriteLn ('El digito 4 no aparece.');
    if (Cant5=0) then
        WriteLn ('El digito 5 no aparece.');
    if (Cant6=0) then
        WriteLn ('El digito 6 no aparece.');
    if (Cant7=0) then
        WriteLn ('El digito 7 no aparece.');
    if (Cant8=0) then
        WriteLn ('El digito 8 no aparece.');
    if (Cant9=0) then
        WriteLn ('El digito 9 no aparece.');
end;

var
    v:VectorNumerosLeidos;
    dimL:Integer;
begin
    CargoVector(v,dimL);
    AnalizoVector(v,dimL);
end.