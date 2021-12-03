program Ejercicio4;
procedure Calculo (Radio:Real);
var
    Diametro,Perimetro:Real;
begin
    Diametro:=Radio*2;
    Perimetro:=2*Pi*Radio;
    WriteLn ('El diametro es de: ', Diametro:0:2);
    Write ('El perimetro es de: ', Perimetro:0:2);
end;

var
    Radio:Real;
begin
    Write ('Ingrese el radio: ');
    ReadLn(Radio);
    Calculo(Radio);
end.