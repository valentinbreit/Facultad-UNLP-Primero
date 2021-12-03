program Ejercicio3;
var
    n1,n2,n3,p:integer;
begin
  Write ('Ingrese el primer numero: ');
  ReadLn(n1);
  Write ('Ingrese el segundo numero: ');
  ReadLn(n2);
  Write ('Ingrese el tercer numero: ');
  ReadLn(n3);
  if (n1>n2) then
    begin
      p:=n1;
      n1:=n2;
      n2:=p;
    end;
  if (n1>n3) then
    begin
      p:=n1;
      n1:=n3;
      n3:=p;
    end;
  if (n2>n3) then
    begin
      p:=n2;
      n2:=n3;
      n3:=p;
    end;
  Write (n3,' ',n2,' ',n1);
end.