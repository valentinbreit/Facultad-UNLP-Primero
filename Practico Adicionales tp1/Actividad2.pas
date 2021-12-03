program Actividad2;
var
    Condicion:Char;
    i,Legajo,CantDeIngresantes,ExamenesAprobados,NoSePresento,CantDe10,CantDe0,PuedenRendirIngresantes,CantAlumnosConUn0,CantAlumnosConPromMayor,Alumno1ConMas10,Alumno2ConMas10,CodigoAlumno1ConMas10,CodigoAlumno2ConMas10,Alumno1ConMas0,Alumno2ConMas0,CodigoAlumno1ConMas0,CodigoAlumno2ConMas0,CantDeRecursantes,CantAlumnosAprobaronTodo,PuedenRendirRecursantes:integer;
    Nota,TotalNotas,PromedioDeLaNota:Real;
begin
//inicializo variables
CantDeIngresantes:=0;
CantDeRecursantes:=0;
PuedenRendirIngresantes:=0;
PuedenRendirRecursantes:=0;
CantAlumnosConUn0:=0;
CantAlumnosConPromMayor:=0;
CantAlumnosAprobaronTodo:=0;
Alumno1ConMas10:=0;
CodigoAlumno1ConMas10:=0;
Alumno1ConMas0:=0;
CodigoAlumno1ConMas0:=0;
//Leo mi legajo
Write ('Ingrese el Legajo del alumno: ');
ReadLn(Legajo);
//Chequeo la condicion de mi legajo
while (Legajo<>-1) do
begin
  //inicializo variables propias del bucle
  TotalNotas:=0;
  ExamenesAprobados:=0;
  NoSePresento:=0;
  CantDe10:=0;
  CantDe0:=0;
  PromedioDeLaNota:=0;
  //Chequeo la condicion del alumno
  Write ('Ingrese la condicion del Alumno (I o R): ');
  ReadLn(Condicion);
  //divido mi programa en base a cada uno
  if (Condicion='I') then
  begin
     CantDeIngresantes:=CantDeIngresantes+1;
     for i:=1 to 5 do
     begin
         Write ('Ingrese la nota del examen: ');
         ReadLn(Nota);
         //sumo todas las notas para luego sacar su promedio
         TotalNotas:=TotalNotas+Nota;
         if (Nota>=7) then
         begin
             //si tengo 2 aprobados tiene 40% de la nota para parcial
             ExamenesAprobados:=ExamenesAprobados+1;
         end
         else if (Nota=-1) then
         begin
             //si falto a 2 examenes no tiene el 75% de asistencia
             NoSePresento:=NoSePresento+1;
         end;
         //evaluo la cantidad de 10 en sus examenes
         if (Nota=10) then
         begin
             CantDe10:=CantDe10+1;
         end;
         //evaluo la cantidad de 0 en sus examenes
         if (Nota=0) then
         begin
             CantDe0:=CantDe0+1;
         end;
         //chequeo que cantidad de alumnos ingresantes pueden rendir el parcial
     end;
     //chequeo que cantidad de alumnos ingresantes pueden rendir el parcial
     if ((ExamenesAprobados>=2) and (NoSePresento<2)) then
     begin
         PuedenRendirIngresantes:=PuedenRendirIngresantes+1;
     end;
  end
  else if (Condicion='R') then
  begin
     CantDeRecursantes:=CantDeRecursantes+1;
     for i:=1 to 5 do
     begin
         Write ('Ingrese la nota del examen: ');
         ReadLn(Nota);
         //sumo todas las notas para luego sacar su promedio
         TotalNotas:=TotalNotas+Nota;
         if (Nota>=7) then
         begin
             //si tengo 2 aprobados tiene 40% de la nota para parcial
             ExamenesAprobados:=ExamenesAprobados+1;
         end
         else if (Nota=-1) then
         begin
             //si falto a 2 examenes no tiene el 75% de asistencia
             NoSePresento:=NoSePresento+1;
         end;
         //evaluo la cantidad de 10 en sus examenes
         if (Nota=10) then
         begin
             CantDe10:=CantDe10+1;
         end;
         //evaluo la cantidad de 0 en sus examenes
         if (Nota=0) then
         begin
             CantDe0:=CantDe0+1;
         end;
         //chequeo que cantidad de alumnos ingresantes pueden rendir el parcial
     end;
     //chequeo que cantidad de alumnos ingresantes pueden rendir el parcial
     if ((ExamenesAprobados>=2) and (NoSePresento<2)) then
     begin
         PuedenRendirRecursantes:=PuedenRendirRecursantes+1;
     end;
  end
  //en caso de que no asignen la condicion correcta y no se me trunque el programa
  else 
    begin 
     Write ('La condicion insertada no es correcta. Intente denuevo.');
     WriteLn;
    end;
     //chequeo la cantidad de alumnos que aprobaron todos los examenes
     if (TotalNotas>=35) then
     begin
         CantAlumnosAprobaronTodo:=CantAlumnosAprobaronTodo+1;
     end;
     //chequeo la cantidad de alumnos con al menos 1 cero en algun examen
     if (CantDe0>=1) then
     begin
         CantAlumnosConUn0:=CantAlumnosConUn0+1;
     end;
     //con esta variable saco el promedio de los 5 examenes
     PromedioDeLaNota:=TotalNotas/5;
     //chequeo la cantidad de alumnos que tuvieron promedio mayor a 6.5
     if (PromedioDeLaNota>6.5) then
     begin
         CantAlumnosConPromMayor:=CantAlumnosConPromMayor+1;
     end;
     //chequeo que 2 alumnos tuvieron la mayor cantidad de 10
     if (Alumno1ConMas10<CantDe10) then
     begin
         Alumno2ConMas10:=Alumno1ConMas10;
         Alumno1ConMas10:=CantDe10;
         CodigoAlumno2ConMas10:=CodigoAlumno1ConMas10;
         CodigoAlumno1ConMas10:=Legajo;
     end
     else if (Alumno2ConMas10<CantDe10) then
     begin
         Alumno2ConMas10:=CantDe10;
         CodigoAlumno2ConMas10:=Legajo;
     end;
     //chequeo que 2 alumnos tuvieron la mayor cantidad de 0
     if (Alumno1ConMas0<CantDe0) then
     begin
         Alumno2ConMas0:=Alumno1ConMas0;
         Alumno1ConMas0:=CantDe0;
         CodigoAlumno2ConMas0:=CodigoAlumno1ConMas0;
         CodigoAlumno1ConMas0:=Legajo;
     end
     else if (Alumno2ConMas0<CantDe0) then
     begin
         Alumno2ConMas0:=CantDe0;
         CodigoAlumno2ConMas0:=Legajo;
     end;
  Write ('Ingrese el Legajo del alumno: ');
  ReadLn(Legajo);
end;
Write ('La cantidad de Ingresantes que pueden Rendir el parcial son: ', PuedenRendirIngresantes);
Write ('. Son el ', ((PuedenRendirIngresantes*100)/CantDeIngresantes):0:2,'% del total de ingresantes.');
WriteLn;
Write ('La cantidad de Recursantes que pueden Rendir el parcial son: ', PuedenRendirRecursantes);
Write ('. Son el ', ((PuedenRendirRecursantes*100)/CantDeRecursantes):0:2,'% del total de Recursantes.');
WriteLn;
Write ('La cantidad de alumnos que aprobaron todas las materias son: ', CantAlumnosAprobaronTodo);
WriteLn;
Write ('La cantidad de alumnos con un promedio de nota mayor a 6.5 son: ', CantAlumnosConPromMayor);
WriteLn;
Write ('La cantidad de alumnos con al menos un (1) cero en su examen son: ', CantAlumnosConUn0);
WriteLn;
Write ('Los 2 alumnos con mayor cantidad de 10(diez) son: ', CodigoAlumno1ConMas10,' y ', CodigoAlumno2ConMas10);
WriteLn;
Write ('Los 2 alumnos con mayor cantidad de 0 son: ', CodigoAlumno1ConMas0,' y ',CodigoAlumno2ConMas0);
end.