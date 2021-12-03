program Actividad1;
var
    Codigo,CodigoMax,CantEmpresas,i,Inversiones:integer;
    MontoInversion,MontoTotal,EmpresaMax:Real;
    Tiene:Boolean;
begin
//espacio inicializo variables
EmpresaMax:=0;
CantEmpresas:=0;
repeat
    MontoTotal:=0;
    Tiene:=False;
    Write ('Ingrese el código de la empresa: ');
    ReadLn(Codigo);
    Write ('Ingrese la cantidad de inversiones de la empresa: ');
    ReadLn(Inversiones);
    for i:=1 to Inversiones do
    begin
      Write ('Ingrse el monton de la inversion: $');
      ReadLn(MontoInversion);
      if (MontoInversion>50000) then
         Tiene:=True;
      MontoTotal:=MontoTotal+MontoInversion;
    end;
    if (MontoTotal>EmpresaMax) then
    begin
      EmpresaMax:=MontoTotal;
      CodigoMax:=Codigo;
    end;
    if (Tiene=True) then
        CantEmpresas:=CantEmpresas+1;
    WriteLn ('Resultado del analisis: Empresa ',Codigo,' Monto Promedio: ', (MontoTotal/Inversiones):0:2);
until (codigo=100);
Write ('La emprese que mayor dinero invertido posee es: ', CodigoMax,' Posee invertido: $',EmpresaMax:0:2);
Write ('. Hay ', CantEmpresas,' empresas con inversiones por más de $50000.');
end.
