program Ejercicio4B;
procedure CalculoDiametroyPerimetro (Radio:Real;var Nombre:String;var Distancia:Real;var CantPlanetasMayoresAJupiter:integer);
var
    Diametro,Perimetro:Real;
begin
    Diametro:=Radio*2;
    Perimetro:=2*Pi*Radio;
    if ((Diametro<=12700) and (Diametro>=6780)) then begin
        WriteLn ('Nombre del planeta: ',Nombre,'. Distancia de: ',Distancia:0:2);
    end;
    if (Perimetro>439264) then begin
        CantPlanetasMayoresAJupiter:=CantPlanetasMayoresAJupiter+1;
    end;
end;

var
    Nombre:String;
    Radio,Distancia:Real;
    CantPlanetasMayoresAJupiter:Integer;
begin
    CantPlanetasMayoresAJupiter:=0;
    Write ('Ingrese el nombre del planeta: ');
    ReadLn(Nombre);
    Write ('Ingrese el radio del planeta: ');
    ReadLn(Radio);
    while (Radio<>0) do begin
        Write ('Ingrese la distancia en años luz del planeta: ');
        ReadLn(Distancia);
        CalculoDiametroyPerimetro(Radio,Nombre,Distancia,CantPlanetasMayoresAJupiter);
        Write ('Ingrese el nombre del planeta: ');
        ReadLn(Nombre);
        Write ('Ingrese el radio del planeta: ');
        ReadLn(Radio);
    end;
    Write ('La cantidad de planetas con el perimetro mayor a jupiter son: ', CantPlanetasMayoresAJupiter);
end.