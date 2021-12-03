program Ejercicio3;
var
    name:String;
    nota:Real;
    aprobados,Obtuvo7:Integer;
begin
    repeat
      Write ('Ingrese el nombre del alumno: ');
      ReadLn(name);
      Write ('Ingrese la nota del alumno: ');
      ReadLn(nota);
      if (nota>=8) then
      begin
         aprobados:=aprobados+1;
      end
      else if (nota=7) then
      begin
         Obtuvo7:=Obtuvo7+1;
      end;
    until (name='Zidane Zinedine');
    Write ('La cantidad de alumnos aprobados es de: ', aprobados,'. La cantidad que obtuvierons 7 es de: ', Obtuvo7);
end.