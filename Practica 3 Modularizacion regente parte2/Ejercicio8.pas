program Ejercicio8;

const   CantdidadDeRepeticiones=100;

procedure LecturaDeDatos(var precio:real;var codigo:integer; var tipo:String);
begin
Write ('Ingrese el codigo del producto: ');
ReadLn (codigo);
Write ('Ingrese el precio del producto: $');
ReadLn (precio);
Write ('Ingrese el tipo del producto: ');
ReadLn (tipo);
end;

procedure AveriguaCodigo(var precio,PrecioMasBarato1,PrecioMasBarato2,PrecioMasCaro,PrecioPromedio:Real;var codigo,CodigoMasBarato1,CodigoMasBarato2,CodigoPantalonMasCaro:Integer; var tipo:String);
begin
if (PrecioMasBarato1>precio) then begin
  PrecioMasBarato2:=PrecioMasBarato1;
  CodigoMasBarato2:=CodigoMasBarato1;
  PrecioMasBarato1:=precio;
  CodigoMasBarato1:=codigo;
end
else if (PrecioMasBarato2>precio) then begin
  PrecioMasBarato2:=precio;
  CodigoMasBarato2:=Codigo;
end;
if (tipo='pantalon') then begin
  if (PrecioMasCaro<precio) then begin
        PrecioMasCaro:=precio;
        CodigoPantalonMasCaro:=codigo;
    end;
end;
PrecioPromedio:=PrecioPromedio+precio;
end;

procedure Informar(var CodigoMasBarato1,CodigoMasBarato2,CodigoPantalonMasCaro:integer;var PrecioPromedio:Real);
begin
Write ('El codigo del producto mas barato son: ',CodigoMasBarato1,' ',CodigoMasBarato2);
Write ('. El codigo del pantalon mas caro es: ',CodigoPantalonMasCaro);
Write ('. El precio promedio fue: ', (PrecioPromedio/CantdidadDeRepeticiones));

end;

var
  i,CodigoMasBarato1,CodigoMasBarato2,CodigoPantalonMasCaro,codigo:integer;
  precio,PrecioMasBarato1,PrecioMasBarato2,PrecioMasCaro,PrecioPromedio:Real;
  tipo:String;
begin
PrecioMasBarato1:=9999;
PrecioMasCaro:=0;
PrecioPromedio:=0;
for i:=1 to CantdidadDeRepeticiones do begin
  LecturaDeDatos(precio,codigo,tipo);
  AveriguaCodigo(precio,PrecioMasBarato1,PrecioMasBarato2,PrecioMasCaro,PrecioPromedio,codigo,CodigoMasBarato1,CodigoMasBarato2,CodigoPantalonMasCaro,tipo);
end;
Informar(CodigoMasBarato1,CodigoMasBarato2,CodigoPantalonMasCaro,PrecioPromedio);
end.