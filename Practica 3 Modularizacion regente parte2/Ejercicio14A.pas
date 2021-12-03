program Ejercicio14A;
type
    tiposdetierra=1..3;
//funcion para rendimiento
function CalculoRendimiento(Tipo:tiposdetierra;Dolares,HA:Real):Real;
var
    Rendmiento:Real;
begin
    if (Tipo=1) then
        Rendmiento:=(6*HA)*Dolares
    else if (Tipo=2) then
        Rendmiento:=(2.6*Ha)*Dolares
    else 
        Rendmiento:=(1.4*Ha)*Dolares;
    CalculoRendimiento:=Rendmiento;
end;


//programa principal
var
    tipo:tiposdetierra;
    Dolares,HA:real;
begin
    Write ('Ingrese las hectareas: ');
    ReadLn(HA);
    Write ('Ingres el tipo de tierra: ');
    ReadLn(tipo);
    Write ('Ingrese el valor del dolar: ');
    ReadLn(Dolares);
    Write('El rendimiento es de: ', CalculoRendimiento(Tipo,Ha,Dolares):0:2);
end.