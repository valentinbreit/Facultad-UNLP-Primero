program Ejercicio8;
var
    caracter1,caracter2,caracter3:char;
begin
    Write ('Ingresar 3 caracteres: ');
    ReadLn(caracter1);
    ReadLn(caracter2);
    ReadLn(caracter3);
    if (((caracter1='A') or (caracter1='a') or (caracter1='E') or (caracter1='e') or (caracter1='I') or (caracter1='i') or (caracter1='O') or (caracter1='o') or (caracter1='U') or (caracter1='u')) and ((caracter2='A') or (caracter2='a') or (caracter2='E') or (caracter2='e') or (caracter2='I') or (caracter2='i') or (caracter2='O') or (caracter2='o') or (caracter2='U') or (caracter2='u')) and ((caracter3='A') or (caracter3='a') or (caracter3='E') or (caracter3='e') or (caracter3='I') or (caracter3='i') or (caracter3='O') or (caracter3='o') or (caracter3='U') or (caracter3='u'))) then
        Write ('Los 3 caracteres ingresados son vocales.')
    else
        Write ('Al menos 1 de los caracteres no es vocal.');
end.