program Ejercicio5;
var
    caramelos,clientes:integer;
begin
  Write ('¿Cuantos caramelos tiene el kiosquero?: ');
  ReadLn (caramelos);
  Write ('¿Cuantos clientes tiene el kiosquero?: ');
  ReadLn (clientes);
  Write ('A cada cliente le corresponden: ', (caramelos div clientes),'. Le sobraran: ', (caramelos mod clientes));
  Write ('. Su ganancia sera de: $', ((caramelos*1.60)/(caramelos div clientes)):0:2);
end.