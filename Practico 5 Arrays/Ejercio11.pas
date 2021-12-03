program Ejercio11;
const   
    dimF=200;
type
    InfoFoto=record
        Titulo:string;
        Autor:string;
        CantMeGusta:integer;
        CantClics:integer;
        CantComentarios:integer;
    end;

    TodasLasFotos=Array [1 .. dimF] of InfoFoto;

procedure CargoVector(var fotos:TodasLasFotos);
var
    i:integer;
begin
    for i:=1 to 3 do begin
        Write ('Ingrese el titulo de la foto: ');
        ReadLn(fotos[i].Titulo);
        Write ('Ingrese el autor de la foto: ');
        ReadLn(fotos[i].Autor);
        Write ('Ingrese la cantidad de me gusta de la foto: ');
        ReadLn(fotos[i].CantMeGusta);
        Write ('Ingrese la cantidad de clics de la foto: ');
        ReadLn(fotos[i].CantClics);
        Write ('Ingrese la cantidad de comentarios de la foto: ');
        ReadLn(fotos[i].CantComentarios);
    end;
end;

procedure ProcesoDatosEnElArray(fotos:TodasLasFotos);
var
    i,TotalMegustaArt,ClicsFotoMasVista:integer;
    TituloFotoMasVista:String;
begin
    TotalMegustaArt:=0;ClicsFotoMasVista:=0;
    for i:=1 to 3 do begin
        WriteLn ('La cantidad de comentarios en la foto titulada: ', fotos[i].Titulo,' es de: ', fotos[i].CantComentarios);
        if (fotos[i].Autor='Art Vandelay') then begin
            TotalMegustaArt:=TotalMegustaArt+fotos[i].CantMeGusta;
        end;
        if (fotos[i].CantClics>ClicsFotoMasVista) then begin
            TituloFotoMasVista:=fotos[i].Titulo;
            ClicsFotoMasVista:=fotos[i].CantClics;
        end;
    end;
    WriteLn ('La foto con mas vistas es la titulada: ',TituloFotoMasVista);
    Write ('La cantidad de me gusta totales en las fotos de "Art Vandelay" es de: ', TotalMegustaArt);
end;


var
    Fotos:TodasLasFotos;
begin
    CargoVector(Fotos);
    ProcesoDatosEnElArray(Fotos);
end.