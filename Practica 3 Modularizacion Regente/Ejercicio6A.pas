program Ejercicio6A;

function EsPar (NumeroIngresado:Integer):Boolean;
begin
    if ((NumeroIngresado mod 2) = 0) then
    begin
        EsPar:=True;
    end
    else
        EsPar:=False;
end;


procedure ProcesoDeNumeros (NumeroIngresado:Integer;var NumeroMax:Integer);
begin
    if (EsPar(NumeroIngresado)) then begin
        NumeroMax:=NumeroIngresado;
    end;
end;

var
    Numero,NumeroMax:Integer;
begin
    NumeroMax:=0;
    Write ('Ingrese un numero entero: ');
    ReadLn(Numero);
    while (Numero>-1) do begin
        ProcesoDeNumeros(Numero,NumeroMax);
        Write ('Ingrese un numero entero: ');
        ReadLn(Numero);
    end;
    Write ('El numero entero par mayor es: ', NumeroMax);
end.