program Ejercicio12;
const
    dimF=53;
type
    InfoGalaxias=record
        Nombre:String;
        Tipo:String;
        Masa:Real;
        Distancia:Real;
    end;

    TodasLasGalaxias=Array [1 .. dimF] of InfoGalaxias;

procedure CargoVector(var Galaxia:TodasLasGalaxias);
var
    i:integer;
begin
    for i:=1 to dimF do begin
        Write ('Ingrese el nombre de la galaxia: ');
        ReadLn(Galaxia[i].Nombre);
        Write ('Ingrese el tipo de galaxia: ');
        ReadLn(Galaxia[i].Tipo);
        Write ('Ingrese la masa (kg) de la galaxia: ');
        ReadLn(Galaxia[i].Masa);
        Write ('Ingrese la distancia (pc) de la galaxia a La Tierra: ');
        ReadLn(Galaxia[i].Distancia);
    end;
end;

procedure AnalizoGalaxias (Galaxia:TodasLasGalaxias);
var
    i,CantTipo1,CantTipo2,CantTipo3,CantTipo4,CantGalaxiasEspeciales:integer;
    MasaTotal,MasaDe3Galaxias,GalaxiaMasPeso1,GalaxiaMasPeso2,GalaxiaMenosPeso1,GalaxiaMenosPeso2:Real;
    NombreGalaxiaMasMasa1,NombreGalaxiaMasMasa2,NombreGalaxiaMenosMasa1,NombreGalaxiaMenosMasa2:String;
begin
    CantTipo1:=0;CantTipo2:=0;CantTipo3:=0;CantTipo4:=0;
    CantGalaxiasEspeciales:=0;
    MasaDe3Galaxias:=0;MasaTotal:=0;
    GalaxiaMasPeso1:=0;GalaxiaMenosPeso1:=9999;
    NombreGalaxiaMasMasa1:='';NombreGalaxiaMenosMasa1:='';
    for i:=1 to dimF do begin
        MasaTotal:=MasaTotal+Galaxia[i].Masa;
        case Galaxia[i].Tipo of
            'eliptica':CantTipo1:=CantTipo1+1;
            'espiral':CantTipo2:=CantTipo2+1;
            'lenticular':CantTipo3:=CantTipo3+1;
            'irregular':CantTipo4:=CantTipo4+1;
        end;
        if ((not(Galaxia[i].Tipo='irregular')) and (Galaxia[i].Distancia<1000)) then begin
            CantGalaxiasEspeciales:=CantGalaxiasEspeciales+1;
        end;
        case Galaxia[i].Nombre of
            'Via Lactea':MasaDe3Galaxias:=MasaDe3Galaxias+Galaxia[i].Masa;
            'Andromeda':MasaDe3Galaxias:=MasaDe3Galaxias+Galaxia[i].Masa;
            'Triangulo':MasaDe3Galaxias:=MasaDe3Galaxias+Galaxia[i].Masa;
        end;
        if (Galaxia[i].Masa>GalaxiaMasPeso1) then begin
            GalaxiaMasPeso2:=GalaxiaMasPeso1;
            NombreGalaxiaMasMasa2:=NombreGalaxiaMasMasa1;;
            GalaxiaMasPeso1:=Galaxia[i].Masa;
            NombreGalaxiaMasMasa1:=Galaxia[i].Nombre;  
        end
        else if (Galaxia[i].Masa>GalaxiaMasPeso2) then begin
            GalaxiaMasPeso2:=Galaxia[i].Masa;
            NombreGalaxiaMasMasa2:=Galaxia[i].Nombre;
        end;
        if (Galaxia[i].Masa<GalaxiaMenosPeso1) then begin
            GalaxiaMenosPeso2:=GalaxiaMenosPeso1;
            NombreGalaxiaMenosMasa2:=NombreGalaxiaMenosMasa1;
            GalaxiaMenosPeso1:=Galaxia[i].Masa;
            NombreGalaxiaMenosMasa1:=Galaxia[i].Nombre;
        end
        else if (Galaxia[i].Masa<GalaxiaMenosPeso2) then begin
            GalaxiaMenosPeso2:=Galaxia[i].Masa;
            NombreGalaxiaMenosMasa2:=Galaxia[i].Nombre;;
        end;
    end;
    WriteLn ('La cantidad de galaxias de cada tipo es; ');
    WriteLn (' Eliptica: ', CantTipo1);
    WriteLn (' Espiral: ', CantTipo2);
    Writeln (' Lenticular: ',CantTipo3);
    WriteLn (' Irregular: ', CantTipo4);
    Writeln;
    WriteLn ('La cantidad de galaxias no irregulares y de menos de 1000 pc son: ', CantGalaxiasEspeciales);
    WriteLn;
    WriteLn ('La masa total de Andromeda, la Via Lactea y Triangulo es de: ', MasaDe3Galaxias:0:2,' y representa el: ', (MasaDe3Galaxias/Masatotal):0:2,'%.');
    WriteLn;
    WriteLn ('El nombre de las 2 galaxias con mas masa son: ',NombreGalaxiaMasMasa1,' y ',NombreGalaxiaMasMasa2);
    WriteLn;
    WriteLn ('El nombre de las 2 galaxias con menos masa son: ',NombreGalaxiaMenosMasa1,' y ',NombreGalaxiaMenosMasa2);
end;


var
    Galaxia:TodasLasGalaxias;
begin
    CargoVector(Galaxia);
    AnalizoGalaxias(Galaxia);
end.