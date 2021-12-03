program Ejercicio12;

//Lee las secuencias
procedure Lectura (var SecuenciaA,SecuenciaB:String;var CaracterDinero,CaracterNumeral:Char);
begin
    Write ('Ingrese la primer secuencia de solo letras vocales: ');
    ReadLn(SecuenciaA);
    Write ('Ingrese el caracter $: ');
    ReadLn(CaracterDinero);
    Write ('Ingrese la secuencia de letras no vocales: ');
    ReadLn(SecuenciaB);
    Write ('Ingrese el caracter #: ');
    ReadLn (CaracterNumeral);
end;

//Analizo la cadenad de caracteres
function AnalizoSecuencias (SecuenciaA,SecuenciaB:String;CaracterDinero,CaracterNumeral:Char):Boolean;
var
    i,LongitudCadena,n:integer;
    CumpleSecuenciaA,CumpleSecuenciaB,CumpleCaracterDinero,CumpleCaracterNumeral:Boolean;
begin
    LongitudCadena:=Length(SecuenciaA);
    CumpleSecuenciaA:=True;CumpleSecuenciaB:=True;CumpleCaracterDinero:=True;CumpleCaracterNumeral:=True;
    for i:=1 to LongitudCadena do begin
        //utilizo case para que lea constantemente todos los caracteres y no anidar muchos if
        Case (SecuenciaA[i]) of
            'A','E','I','O','U','a','e','i','o','u':    Write ();
        else //se si falla en algun caracter de la cadena
            CumpleSecuenciaA:=False;
        end;
    end;
    if (CaracterDinero<>'$') then begin
        CumpleCaracterDinero:=False;
    end;
    LongitudCadena:=Length(SecuenciaB);
    for n:=1 to LongitudCadena do begin
        //utilizo case para que lea constantemente todos los caracteres y no anidar muchos if
        case (SecuenciaB[n]) of
            'b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z': Write ();
            'B','C','D','F','G','H','J','K','L','M','N','P','Q','R','S','T','V','W','X','Y','Z': Write ();
        else //se si falla en algun caracter de la cadena
            CumpleSecuenciaB:=False;
        end;    
    end;
    if (CaracterNumeral<>'#') then begin
        CumpleCaracterNumeral:=False;
    end;
    //si no fallo en ninguna parte del programa se que es correcta
    if ((CumpleSecuenciaA=True) and (CumpleSecuenciaB=True) and (CumpleCaracterDinero=True) and (CumpleCaracterNumeral=True)) then
        AnalizoSecuencias:=True
    else
        AnalizoSecuencias:=False;
end;    

//Informo
procedure Informo (var SecuenciaA,SecuenciaB:String;var CaracterDinero,CaracterNumeral:Char);
begin
    if (AnalizoSecuencias(SecuenciaA,SecuenciaB,CaracterDinero,CaracterNumeral)) then
    begin
        Write ('Se cumple la secuencia.');
    end
    else 
        Write ('No se cumple la secuencia.');
end;

//programa principal
var
    SecuenciaA,SecuenciaB:String;
    CaracterDinero,CaracterNumeral:Char;
begin
    Lectura(SecuenciaA,SecuenciaB,CaracterDinero,CaracterNumeral);
    Informo(SecuenciaA,SecuenciaB,CaracterDinero,CaracterNumeral);
end.