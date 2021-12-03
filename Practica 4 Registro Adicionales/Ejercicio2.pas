program Ejercicio2;
type
    //limito los strings a como maximo el pais con el nombre mas largo
    NombreMasLargoDeUnPais=String[50];
    //limito mi string al tipo de clima con nombre mas largo
    NombreDelClimaMasLargo=String[42];
    //limito el uso del string al nombre cienitifo de una planta mas largo
    NombreCientificoMasLargo=String[22];

    //creo el record necesario para el problema
    Plantas=record
        NombreCientifo:NombreCientificoMasLargo;
        TiempoDeVida:Integer;
        TipoDePlanta:String;
        TipoDeClima:NombreDelClimaMasLargo;
        PaisDeUbicacion:NombreMasLargoDeUnPais;
    end;

//Modulo de lectura de mis datos
procedure LecturaXPlanta (var Planta:Plantas);
begin
    Write ('Ingrese el tipo de planta: ');
    ReadLn (Planta.TipoDePlanta);
    Write ('Ingrese el pais donde se encuentra: ');
    ReadLn (Planta.PaisDeUbicacion);
    //me aseguro de no perder tiempo pidiendo datos que no voy a utilizar porque no existen
    if (Planta.PaisDeUbicacion<>'zzz') then begin
        Write ('Ingrese el clima donde se encuentra la planta: ');
        ReadLn (Planta.TipoDeClima);
        Write ('Ingrese el tiempo de vida de la planta (en meses): ');
        ReadLn (Planta.TiempoDeVida);
        Write ('Ingrese el nombre cientifo de la planta: ');
        ReadLn (Planta.NombreCientifo);
    end;
end;


//Modulo procesamiento de datos
procedure AnalizoDatos(Planta:Plantas;var NombrePlantaMasLongeva1,NombrePlantaMasLongeva2:NombreCientificoMasLargo;var TiempoDeVidaNombre1,TiempoDeVidaNombre2:Integer);
begin
    //analizo el nombre de mis plantas
    if (TiempoDeVidaNombre1<Planta.TiempoDeVida) then begin
        //me aseguro de no perder el dato anterior
        NombrePlantaMasLongeva2:=NombrePlantaMasLongeva1;
        TiempoDeVidaNombre2:=TiempoDeVidaNombre1;
        //actualizo el primer dato
        NombrePlantaMasLongeva1:=Planta.NombreCientifo;
        TiempoDeVidaNombre1:=Planta.TiempoDeVida;
    end
    //si el primer dato no se actualiza me aseguro de poder actualizar el segundo
    else if (TiempoDeVidaNombre2<Planta.TiempoDeVida) then begin
        NombrePlantaMasLongeva2:=Planta.NombreCientifo;
        TiempoDeVidaNombre2:=Planta.TiempoDeVida;
    end;
    //informo el caso especial (pais arg y clima subtropical)
    if ((Planta.PaisDeUbicacion='Argentina') and (Planta.TipoDeClima='SubTropical')) then begin
        WriteLn (Planta.NombreCientifo,' Es un caso especial.');
    end;
end;


//programa principal
var
    Planta:Plantas;
    NombrePlantaMasLongeva1,NombrePlantaMasLongeva2:NombreCientificoMasLargo;
    MayorCantidadDePLantasXPais,TipoConMenosPlantas,TiempoDeVidaNombre1,TiempoDeVidaNombre2,CantidadDeVecesQueIteraPorTipo,i,CantidadDePLantasXTipo,PromedioDeVidaGeneralXTipo,CantidadDePlantas:Integer;
    TiempoPromedioDeCadaTipo:Real;
    TipoDePlantaActual,NombreTipoConMenosPlantas,PlantaEnMasPaises:String;
    NombreDeLaPlantaActual:NombreCientificoMasLargo;
begin
    //inicializo mis variables
    NombrePlantaMasLongeva1:='';TiempoDeVidaNombre1:=0;
    TipoConMenosPlantas:=0;MayorCantidadDePLantasXPais:=0;
    //hago un bucle por la cantidad de veces que debe iterar
    for i:=1 to 320 do begin
        //hago la primer lectura para asegurar los bucles
        LecturaXPlanta(Planta);
        //me aseguro una variable para poder romper el bucle
        TipoDePlantaActual:=Planta.TipoDePlanta;
        while (TipoDePlantaActual=Planta.TipoDePlanta) do begin
            //me aseguro que el bucle x planta sea correcto
            NombreDeLaPlantaActual:=Planta.NombreCientifo;
            //reinicio la cantidad de plantas por tipo, para no acumular valores
            CantidadDePLantasXTipo:=0;
            CantidadDePlantas:=0;
            while ((NombreDeLaPlantaActual=Planta.NombreCientifo) and (Planta.PaisDeUbicacion<>'zzz')) do begin
                AnalizoDatos(Planta,NombrePlantaMasLongeva1,NombrePlantaMasLongeva2,TiempoDeVidaNombre1,TiempoDeVidaNombre2);
                LecturaXPlanta(Planta);
                //sumo la cant de plantas en el mismo tipo
                CantidadDePLantasXTipo:=CantidadDePlantasXTipo+1;
                CantidadDePLantas:=CantidadDePlantas+1;
                PromedioDeVidaGeneralXTipo:=PromedioDeVidaGeneralXTipo+Planta.TiempoDeVida;
            end;
            //saco el nombre de la planta con mayor aparicion en paises
            if (CantidadDePLantasXTipo>MayorCantidadDePLantasXPais) then begin
                MayorCantidadDePlantasXPais:=CantidadDePLantasXTipo;
                PlantaEnMasPaises:=Planta.NombreCientifo;
            end;
            //saco el nombre del tipo con menos plantas 
            if (CantidadDePlantas<TipoConMenosPlantas) then begin
                TipoConMenosPlantas:=CantidadDePlantas;
                NombreTipoConMenosPlantas:=Planta.TipoDePlanta;
            end;
        end;
        WriteLn ('El tiempo promedio del tipo ',TipoDePlantaActual,' es de: ',(PromedioDeVidaGeneralXTipo/CantidadDePLantasXTipo):0:2);
    end;
    WriteLn ('El tipo con menos cantidad de plantas es: ',NombreTipoConMenosPlantas);
    Write ('La planta que aparece en mas paises es: ', PlantaEnMasPaises);
end.