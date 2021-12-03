program Ejercicio6;
var
    salgo:Boolean;
    legajo,Promedio:Real;
    CantAlumnos,AlumnosB,AlumnosC,Porcentaje:Integer;
begin
    salgo:=True;
    CantAlumnos:=0;
    AlumnosB:=0;
    AlumnosC:=0;
    while (salgo) do
        begin
            Write ('Escriba el Legajo del alumno: ');
            ReadLn(legajo);
            if (legajo<>-1) then
                begin
                    Write ('Escriba el promedio del alumno: ');
                    ReadLn(Promedio);
                    CantAlumnos:=CantAlumnos+1;
                    if ((legajo<2500) and (Promedio>8.5)) then
                        begin
                          AlumnosC:=AlumnosC+1;
                        end
                    else if (Promedio>6.5) then
                        begin
                            AlumnosB:=AlumnosB+1;
                        end;
                end
            else
                salgo:=False;
        end;
    AlumnosB:=AlumnosB+AlumnosC;
    Porcentaje:=(AlumnosC*100)/CantAlumnos;
    Write ('La cantidad total de alumnos es de: ', CantAlumnos);
    Write ('. Los alumnos que superan el promedio 6.5 es de: ', AlumnosB);
    Write ('. El porcentaje de alumnos destacados es de: ', Porcentaje,'%.');
end.