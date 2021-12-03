program Ejercicio13;

//Pido al usuario que ingrese las secuencias y los caracteres
procedure Lectura (var SecuenciaA,SecuenciaB:String;var CaracterPorcentaje,CaracterAsterisco:Char);
begin
    Write ('Ingrese la secuencia A donde no existe $: ');
    ReadLn(SecuenciaA);
    Write ('Ingrese el caracter %: ');
    ReadLn(CaracterPorcentaje);
    Write ('Ingrese la secuencia B donde debe haber al menos 3@: ');
    ReadLn(SecuenciaB);
    Write ('Ingrese el caracter *: ');
    ReadLn(CaracterAsterisco);
end;


//Analizo secuencia A
function AnalizoSecuenciaA(Secuencia:String;LongitudSecuencia:integer):Boolean;
var
    i:integer;
    Cumple:Boolean;
begin
    for i:=1 to LongitudSecuencia do begin
        if (Secuencia[i]='$') then
            Cumple:=False;
    end;
    Cumple:=True;
    AnalizoSecuenciaA:=Cumple;
end;


//Analizo las funciones por separado porque se tienen que considerar distintas cosas
function AnalizoSecuenciaB(Secuencia:String;LongitudSecuencia:integer):Boolean;
var
    CantArroba,i:integer;
    Cumple:Boolean;
begin
    CantArroba:=0;
    for i:=1 to LongitudSecuencia do begin
        if (Secuencia[i]='@') then
            CantArroba:=CantArroba+1;
    end;
    if (CantArroba>2) then
        Cumple:=True
    else 
        Cumple:=False;
    AnalizoSecuenciaB:=Cumple;
    
end;

//Informo los datos los datos
procedure Informo (Var SecuenciaA,SecuenciaB:String;var CaracterPorcentaje,CaracterAsterisco:Char);
var
    CumpleSecuencia,LongitudSecuencia:integer;
begin
    CumpleSecuencia:=0;
    LongitudSecuencia:=Length(SecuenciaA);
    if (AnalizoSecuenciaA(SecuenciaA,LongitudSecuencia)=False) then begin
        WriteLn ('Falla la secuencia A.');
    end
    else
        CumpleSecuencia:=CumpleSecuencia+1;
    if (CaracterPorcentaje<>'%') then begin
        WriteLn ('Falla Caracter %');
    end;
    if (AnalizoSecuenciaB(SecuenciaB,LongitudSecuencia)=False) then begin
        WriteLn ('Falla la secuencia B.');
    end
    else
        CumpleSecuencia:=CumpleSecuencia+1;
    if (CaracterAsterisco<>'*') then begin
        WriteLn ('Falla Caracter *');
    end;
    if (CumpleSecuencia=2) then
        Write ('Se cumple la secuencia.');
end;

//programa principal
var
    SecuenciaA,SecuenciaB:String;
    CaracterPorcentaje,CaracterAsterisco:Char;
begin
    Lectura(SecuenciaA,SecuenciaB,CaracterPorcentaje,CaracterAsterisco);
    Informo(SecuenciaA,SecuenciaB,CaracterPorcentaje,CaracterAsterisco);
end.