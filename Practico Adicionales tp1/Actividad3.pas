program Actividad3;
var
    TipoTanque:Char;
    CantTanqueRectangular,TanquesConMayorAlturaA140,TanquesConVolumenMenorA800,CantTanqueCilindrico:integer;
    Ancho,Largo,Alto,Radio,VolumenTanque,VolumenesTotalesRectangulares,VolumenesTotalesCilindricos,MayorVolumenVendido1,MayorVolumenVendido2:Real;
begin
//inicializo varialbes
CantTanqueRectangular:=0;
CantTanqueCilindrico:=0;
TanquesConMayorAlturaA140:=0;
TanquesConVolumenMenorA800:=0;
VolumenesTotalesRectangulares:=0;
VolumenesTotalesCilindricos:=0;
MayorVolumenVendido1:=0;
//comienza la lectura de los tanques
Write ('Ingrese el tipo de tanque que se vendio: ');
ReadLn(TipoTanque);
//me aseguro que el primer valor ingresado sea procesado si o si
if ((TipoTanque='R') or (TipoTanque='C')) then
begin
    while ((TipoTanque='R') or (TipoTanque='C')) do
    begin
      //inicializo variables del bucle
      VolumenTanque:=0;
      //divido la cantidad de datos que pido dependiendo del tipo de tanque
      if (TipoTanque='R') then
      begin
         //contabilizo la cantidad de tanques para el promedio final
         CantTanqueRectangular:=CantTanqueRectangular+1;
         Write ('Ingrese el Ancho del Tanque: ');
         ReadLn(Ancho);
         Write ('Ingrese el largo del Ranque: ');
         ReadLn(Largo);
         Write ('Ingrese el Alto del Tanque: ');
         ReadLn(Alto);
         //cambio mi volumen actual
         VolumenTanque:=(Ancho*Largo*Alto);
         //contabilizo los volumenes totales para el promedio final
         VolumenesTotalesRectangulares:=VolumenesTotalesRectangulares+VolumenTanque;
      end
      //no hay otra chance de que no sea C
      else if (TipoTanque='C') then
      begin
         //contabilizo la cantidad de tanques circulares
         CantTanqueCilindrico:=CantTanqueCilindrico+1;
         Write ('Ingrese el Alto del tanque: ');
         ReadLn(Alto);
         Write ('Ingrese el Radio del tanque: ');
         ReadLn(Radio);
         VolumenTanque:=(Pi*Alto*Sqr(Radio));
         VolumenesTotalesCilindricos:=VolumenesTotalesCilindricos+VolumenTanque;
      end;
      //contabilizo la cantidad de tanques con altura mayor a 1.40
       if (Alto>1.40) then
         TanquesConMayorAlturaA140:=TanquesConMayorAlturaA140+1;
       //Contabilizo los tanques con un volumen menor a 800
       if (VolumenTanque<800) then
         TanquesConVolumenMenorA800:=TanquesConVolumenMenorA800+1;
       //Veo cuales son los tanques que mayor volumen tienen
       if (MayorVolumenVendido1<VolumenTanque) then
         begin
             MayorVolumenVendido2:=MayorVolumenVendido1;
             MayorVolumenVendido1:=VolumenTanque;
         end
         else if (MayorVolumenVendido2<VolumenTanque) then
         begin
             MayorVolumenVendido2:=VolumenTanque
         end;
      Write ('Ingrese el tipo de tanque que se vendio: ');
      ReadLn(TipoTanque);
    end;
end
//me aseguro que la lectura termine si el primero en ingresar es el Z
else if (TipoTanque='Z') then
begin
   Write ('No se ingreso ningun tipo de dato.');
end;
//me aseguro que el usuario sepa que si no ingresa R,C o Z no funciona
Write ('Los dos tanques con mayor volumen vendido son: ', MayorVolumenVendido1:0:2,' y ', MayorVolumenVendido2:0:2);
Write ('. La cantidad de tanques mayores a 1.40M de altura son: ', TanquesConMayorAlturaA140);
Write ('. La cantidad de tanques con volumen menor a 800M^3 es: ', TanquesConVolumenMenorA800);
WriteLn;
Write ('El promedio de volumen de los tanques Rectangurales es: ', (VolumenesTotalesRectangulares/CantTanqueRectangular):0:2);
WriteLn;
Write ('El promedio de volumen de los tanques Cilindricos es: ', (VolumenesTotalesCilindricos/CantTanqueCilindrico):0:2);
WriteLn;
end.