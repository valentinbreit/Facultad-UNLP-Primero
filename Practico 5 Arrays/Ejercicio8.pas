program ejercicio8;
const
    dimF=400;
type
    InfoAlumnos=record
        NroInscripcion:integer;
        DNI:integer;
        Apellido:string;
        Nombre:string;
        AnoDeNacimiento:integer;
    end;

    CantAlumnos=Array [1 .. dimF] of InfoAlumnos;

procedure CargoVector (var v:CantAlumnos);
var
    i:integer;
begin
    for i:=1 to dimF do begin
        WriteLn ('Ingrese el Numero de inscripcion del alumno: ');
        ReadLn(v[i].NroInscripcion);
        WriteLn ('Ingrese el DNI del alumno: ');
        ReadLn(v[i].DNI);
        WriteLn ('Ingrese el apellido del alumno: ');
        ReadLn(v[i].Apellido);
        WriteLn ('Ingrese el nombre del alumno: ');
        ReadLn(v[i].Nombre);
        WriteLn('Ingrese el año de nacimiento del alumno: ');
        ReadLn(v[i].AnoDeNacimiento);
    end;
end;



function DNIhechosporpares(v:CantAlumnos):Real;
var
    i,numero,digito,CantDigitos,Cantpares,HechoTodoXPares:Integer;
begin
    Cantpares:=0;CantDigitos:=0;HechoTodoXPares:=0;
    for i:=1 to dimF do begin
        numero:=v[i].DNI;
        while (numero<>0) do begin
            digito:=numero mod 10;
            if ((digito mod 2)=0) then begin
                Cantpares:=Cantpares+1;
            end;
            CantDigitos:=CantDigitos+1;
            numero:=numero div 10;
        end;
        if (Cantpares=CantDigitos) then begin
            HechoTodoXPares:=HechoTodoXPares+1;
        end;
    end;
    DNIhechosporpares:=((HechoTodoXPares*100)/dimF);
end;

procedure BuscoApeyNom(v:CantAlumnos);
var
    i,EdadMayor1,EdadMayor2:integer;
    MuestroApellido1,MuestroApellido2,MuestroNombre1,MuestroNombre2:string;
begin
    //inicializo mis variables
    EdadMayor1:=2020;
    MuestroApellido1:='';MuestroNombre1:='';
    for i:=1 to dimF do begin
        if (v[i].AnoDeNacimiento<EdadMayor1) then begin
            EdadMayor2:=EdadMayor1;
            MuestroNombre2:=MuestroNombre1;
            MuestroApellido2:=MuestroApellido1;
            EdadMayor1:=v[i].AnoDeNacimiento;
            MuestroNombre1:=v[i].Nombre;
            MuestroApellido1:=v[i].Apellido;
        end
        else if (v[i].AnoDeNacimiento<EdadMayor2) then begin
            EdadMayor2:=v[i].AnoDeNacimiento;
            MuestroNombre2:=v[i].Nombre;
            MuestroApellido2:=v[i].Apellido;
        end;
    end;
    WriteLn('Los 2 alumnos de mayor edad son: ',MuestroNombre1,' ',MuestroApellido1);
    Write ('y ',MuestroNombre2,' ',MuestroApellido2);
end;


var
    v:CantAlumnos;
begin
    CargoVector(v);
    WriteLn('El porcentaje de DNI con todos numeros pares es del ',DNIhechosporpares(v):0:2);
    BuscoApeyNom(v);
end.