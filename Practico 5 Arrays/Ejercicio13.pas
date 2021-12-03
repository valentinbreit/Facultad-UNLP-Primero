program Ejercicio13;
type 
    sub=1..12;
    arreglo=array[sub] of real;
    empleado = record
        apellido:string;
        nombre:string;
        cursos:arreglo; {costo de cada curso realizado}
        cantCursosRealizados:sub; {cantidad de cursos realizados}        
    end;
    empleados=array[1..200] of empleado;

function consultarMontoInvertido(e:empleado):real; 
var
    i:integer;
    total:real;
begin
    total:=0;    
    for i:=1 to 12 do  
    begin
      total:=total+ e.cursos[i];
    end;
    consultarMontoInvertido:=total;
end;


var
    v:empleados;
    i:integer;
    monto,max:real;    
begin
    for i:=1 to 200 do
    begin
        monto:=consultarMontoInvertido(v[i]);
        if (monto>max) then
           max:=i;                           {1}
    end;
    writeln(v[max.apellido], v[max.nombre]); {2}
end;