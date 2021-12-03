program Ejercicio5b;

function EsONoPar(numA,numB:Real):Boolean;
begin
    if (numB = (numA*2)) then begin
        EsONoPar:=True;
    end
    else
        EsONoPar:=False;
end;

var
    num1,num2:Real;
    CantPares,CantDoble:integer;
begin
CantPares:=0;
CantDoble:=0;
Write ('Ingrese 2 numeros: ');
ReadLn (num1); ReadLn (num2);
while ((num1<>0) and (num2<>0)) do begin
    CantPares:=CantPares+1;
    if (EsONoPar(num1,num2)) then begin
        WriteLn (num2:0:2,' Es el doble de ',num1:0:2);
        CantDoble:=CantDoble+1;
    end
    else
        WriteLn (num2:0:2,' No es el doble de ', num1:0:2);
    WriteLn ('Ingrese 2 numeros: ');
    ReadLn (num1); ReadLn (num2);

end;
Write ('cantidad de pres leidos: ', CantPares);
WriteLn ('. cantidad de dobles: ', CantDoble);
end.