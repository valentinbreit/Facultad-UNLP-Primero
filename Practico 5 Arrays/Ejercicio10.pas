program Ejercicio10;
const
    dimF=300;
type
    SalarioXEmpleados=Array [1 .. dimF] of Real;
procedure CargoVector(var Salario:SalarioXEmpleados;var dimL:Integer);
var
    i:integer;
    SalarioIngresado:Real;
begin
    i:=0;dimL:=0;
    Write ('Ingrese el salario del empleado: ');
    ReadLn(SalarioIngresado);
    while ((SalarioIngresado<>0) and (dimL<dimF)) do begin
        i:=i+1;
        dimL:=dimL+1;
        Salario[i]:=SalarioIngresado;
        Write ('Ingrese el salario del empleado: ');
        ReadLn(SalarioIngresado);
    end;
end;

function IncrementoSalario(Salario:Real):Real;
begin
    IncrementoSalario:=((Salario*115)/100);
end;

procedure IncrementoSalarioTodoArray(Salario:SalarioXEmpleados;dimL:Integer);
var
    i:Integer;
begin
    for i:=1 to dimL do begin
        Write ('Salario antes: ', Salario[i]:0:2);
        Salario[i]:=IncrementoSalario(Salario[i]);
        WriteLn('Salario Despues: ', Salario[i]:0:2);
    end;
end;

procedure MuestroSueldoPromedio(Salario:SalarioXEmpleados;dimL:integer);
var
    i:integer;
    Suma:Real;
begin
    Suma:=0;
    for i:=1 to dimL do begin
        Suma:=Suma+Salario[i];
    end;
    Writeln('El promedio de los salarios es: ',(Suma/dimL):0:2);
end;

var
    Salario:SalarioXEmpleados;
    dimL:integer;
begin
    dimL:=0;
    CargoVector(Salario,dimL);
    IncrementoSalarioTodoArray(Salario,dimL);
    MuestroSueldoPromedio(Salario,dimL);
end.