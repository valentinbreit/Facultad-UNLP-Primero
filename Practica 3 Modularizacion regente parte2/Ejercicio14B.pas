program Ejercicio14B;

//defino mi constante de valor dolar
const
    ValorDolar=320;
//defino el tipo de numeros para las zonas fertiles
type
    TiposDeTierra=1..3;


//Busco los datos que debo analizar he informar
procedure EncuentroRendimientos (localidad:String;Hectareas:integer;TipoSuelo:TiposDeTierra;var RendimientoMax,RendimientoMin,SumaRendimientos:Real;var LocalidadRendimientoMax,LocalidadRendimientoMin:String;var CantCamposCumple3Febrero:integer);
var
    Rendimiento:real;
begin
    Rendimiento:=0;
    if (TipoSuelo=1) then
        Rendimiento:=(6*Hectareas)*ValorDolar
    else if (TipoSuelo=2) then
        Rendimiento:=(2.6*Hectareas)*ValorDolar
    else 
        Rendimiento:=(1.4*Hectareas)*ValorDolar;
    if (Rendimiento>RendimientoMAx) then begin
        RendimientoMax:=Rendimiento;
        LocalidadRendimientoMax:=localidad;
    end;
    if (Rendimiento<RendimientoMin) then begin
        RendimientoMin:=Rendimiento;
        LocalidadRendimientoMin:=localidad;
    end;
    if (localidad='3 De Febrero') then begin
        if (Rendimiento>10000) then begin
            CantCamposCumple3Febrero:=CantCamposCumple3Febrero+1;
        end;
    end;
    SumaRendimientos:=SumaRendimientos+Rendimiento;
end;
//programa principal
var
    localidad,LocalidadRendimientoMax,LocalidadRendimientoMin:String;
    Hectareas,CantIteraciones,CantCamposCumple3Febrero:integer;
    TipoSuelo:TiposDeTierra;
    RendimientoMax,RendimientoMin,SumaRendimientos:real;
begin
    //inicializo variables
    CantIteraciones:=0;
    SumaRendimientos:=0;
    RendimientoMax:=-1;
    RendimientoMin:=99999;
    //Lectura de datos
    repeat
        Write ('Ingrese la localidad del campo: ');
        ReadLn (localidad);
        Write ('Ingrese la cantidad de hectareas sembradas: ');
        ReadLn(Hectareas);
        Write ('Ingrese el tipo del suelo: ');
        ReadLn(TipoSuelo);
        EncuentroRendimientos(localidad,Hectareas,TipoSuelo,RendimientoMax,RendimientoMin,SumaRendimientos,LocalidadRendimientoMax,LocalidadRendimientoMin,CantCamposCumple3Febrero);
        CantIteraciones:=CantIteraciones+1;
    until ((Hectareas=900) and (localidad='Saladillo'));
    WriteLn ('Los campos de 3 de febrero con rendimiento mayor a 10.000: ',CantCamposCumple3Febrero);
    WriteLn ('La locadidad rendimiento mayor es de: ',LocalidadRendimientoMax);
    WriteLn ('La localidad del rendimiento menor es de: ',LocalidadRendimientoMin);
    Write ('El promedio de los rendimientos es de: ', (SumaRendimientos/CantIteraciones):0:2);
end.