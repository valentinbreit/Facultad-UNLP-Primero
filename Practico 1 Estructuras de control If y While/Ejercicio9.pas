program Ejercicio9;
var
    salgo:Boolean;
    signo:Char;
    Resultado,i:Integer;
    Secuencia:Array [1..5] of integer;
begin
    Resultado:=0;
    i:=0;
    salgo:=True;
    Write ('Ingrese el signo a utilizar: ');
    ReadLn(signo);
    if (signo='+') then
        begin
            while (salgo) do
                begin
                    Write ('Ingrese un numero: ');
                    ReadLn(Secuencia[i]);
                    if (Secuencia[i]=0) then
                        salgo:=False
                    else
                        Resultado:=Resultado+Secuencia[i];
                        i:=i+1;
                end;
        end
    else if (signo='-') then
        begin
            while (salgo) do
                begin
                    Write ('Ingrese un numero: ');
                    ReadLn(Secuencia[i]);
                    if (Secuencia[i]=0) then
                        salgo:=False
                    else
                        Resultado:=Resultado+Secuencia[i];
                        i:=i+1;
                end;
        end
    else
        Write ('Signo ingresado no valido.');
    Write (Resultado,' (');
    i:=0;
    while (salgo=False) do
        begin
            if (Secuencia[i]<>0) then
                begin
                    Write (Secuencia[i], signo);
                    i:=i+1;
                end
            else
                salgo:=True;
        end;
    Write ('0)');
end.