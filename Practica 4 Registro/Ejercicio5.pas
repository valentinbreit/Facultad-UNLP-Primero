program Ejercicio5;

type
    Autos=record
        Marca:String;
        Modelo:String;
        Precio:Real;
    end;

//Lectura de datos
procedure LecturaDeDatosDeLosAutos (var a:Autos);
begin
    Write ('Ingrese la marca del auto: ');
    ReadLn (a.Marca);
    if (a.Marca<>'ZZZ') then begin
        Write ('Ingrese el modelo del auto: ');
        ReadLn (a.Modelo);
        Write ('Ingrese el precio del auto: ');
        ReadLn (a.Precio);
    end;
end;

//Analizo los datos y busco los datos a informar
procedure AnalizoDatosDeLosAutos (var a:Autos;var Precio:Real;var MarcaAMC,ModeloAMC:String);
begin
    if (Precio<a.Precio) then begin
        MarcaAMC:=a.Marca;
        ModeloAMC:=a.Modelo;
        Precio:=a.Precio;
    end;
end;

//programa principal
var
    a:Autos;
    MarcaAutoMasCaro,ModeloAutoMasCaro,Marca:String;
    i:integer;
    Precio,Promedio:Real;
begin
    //doy la primer lectura
    Precio:=(-1);
    LecturaDeDatosDeLosAutos(a);
    //analizo mi condicion excluyente
    while (a.Marca<>'ZZZ') do begin
        //inicializo mis variables
        i:=0;
        Promedio:=0;
        //igualo a una variable local para asegurarme de contabilizar bien
        Marca:=a.Marca;
        while ((Marca=a.Marca) and (a.Marca <>'ZZZ')) do begin
            //siempre analizo los datos de la anterior, para no modificarlos si cambia la marca
            AnalizoDatosDeLosAutos(a,Precio,MarcaAutoMasCaro,ModeloAutoMasCaro);
            //sumo todos los precios para luego sacar el promedio
            Promedio:=Promedio+a.Precio;
            //se cuantas veces itere
            i:=i+1;
            LecturaDeDatosDeLosAutos(a);
        end;
        WriteLn ('El promedio de la marca: ', Marca,' es de: ' ,(Promedio/i):0:2);
    end;
    //informo el ultimodato pedido
    Write ('El auto con precio mas alto es de marca: ',MarcaAutoMasCaro,' y su modelo es: ',ModeloAutoMasCaro);
end.
