program Ejercicio4;
var
    Diametro,Radio,Area,Perimetro:Real;
begin
  Write ('Ingrese el Diametro: ');
  ReadLn(Diametro);
  Radio:=Diametro/2;
  WriteLn('Radio: ', Radio:2:2);
  Area:=(Pi*Sqr(Radio));
  WriteLn('Area: ', Area:2:2);
  Perimetro:=(Diametro*Pi);
  Write ('Perimetro: ', Perimetro:2:2);
end.