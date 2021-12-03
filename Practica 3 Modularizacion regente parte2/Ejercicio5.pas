program Ejercicio5;

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
begin

Write ('Ingrese 2 numeros: ');
ReadLn (num1); ReadLn (num2);
if (EsONoPar(num1,num2)) then begin
    WriteLn (num2:0:2,' Es el doble de ',num1:0:2);
end
else
    Write (num2:0:2,' No es el doble de ', num1:0:2);
end.