program ProgramaPrincipal;

uses CADPDataLoader;

function cantEmpleados (dato:Tdatos; var fin:Boolean):Integer; //UTILIZAR EN OTROS MODULOS 
var
    totalEmpleados:Integer;
begin
    totalEmpleados:=0;       //INICIALIZO VARIABLES 
    CADPVolverAlInicio(DatosGrupo);//VUELVO AL INICIO Y LEO DATOS                  
    repeat       
        CADPleerDato(dato,fin);                                                      
        totalEmpleados:=totalEmpleados + 1;
    until (fin);
    cantEmpleados:=totalEmpleados;     
end;


procedure empleadosTotales (dato:Tdatos; var fin:Boolean); //INFORMAR CANTIDAD TOTAL DE EMPLEADOS 
var 
    numeroEmpleadosTotales:Integer;
begin        
    numeroEmpleadosTotales:=cantEmpleados(dato,fin); //ASIGNO EL VALOR DE LA FUNTION 
    WriteLn('La cantidad total de empleados es: ', numeroEmpleadosTotales);
end;


procedure salarioMenor300 (dato:Tdatos; var fin:Boolean);   
var
    empleadosTrecientos:Integer;                               
begin
    empleadosTrecientos:=0;
    CADPVolverAlInicio(DatosGrupo); //LEO DATOS 
    repeat
        CADPleerDato(dato,fin);  
        if (datos.salario < 300) then //SI EL SALARIO ES MENOR A 300 
        begin
            empleadosTrecientos:= empleadosTrecientos + 1; //CONTABILIZO EMPLEADOS 
        end;
    until (fin);
    WriteLn('La cantidad total de empleados con sueldo menor a 300 U$D es: ',empleadosTrecientos);  //INFORMO
end;



procedure promedioSalarios (dato:Tdatos; var fin:Boolean);
var
    salarioTotal,promedioGeneral:Integer; //VARIABLE SALARIOTOTAL SUMO TODOS LOS SALARIOS
begin
    salarioTotal:=0;              
    CADPVolverAlInicio(DatosGrupo);
    repeat  
        CADPleerDato(dato,fin);                               
        salarioTotal:= salarioTotal + salario;  //SUMO TODOS LOS SALARIOS EN LA VARIABLE                    
    until (fin);
    promedioGeneral:= (salarioTotal / cantEmpleados(dato,fin));  //DIVIDO EL SALARIO TOTAL POR LA CANTIDAD DE EMPLEADOS 
    WriteLn('El promedio de salarios es: ',promedioGeneral);  //PROMEDIO GENERAL 
end;

{function para sacar el legajo del mayor salario}
function LegajoMaxsa(dato:Tdatos;fin:boolean):integer;
var 
	salariomax:real;
	legajo:integer;
begin
	CADPVolverAlInicio('DatosGrupo');
	{inicializo variable}
	salariomax:=-999;
	{calculo el salario maximo y su legajo}
	repeat
		CADPleerDato(dato,fin);
		if(dato.salario>salariomax)then 
			salariomax:=dato.salario;
		legajo:=dato.legajo;
	until(fin);
	LegajoMaxsa:=legajo;
end;


procedure Cant1legajomax(dato:Tdatos;fin:boolean);
var
	cantde1, dig, num:integer;
begin
	cantde1:=0;
	{le asigno a la variable num el legajo que hace referencia al salario maximo}
	num:=LegajoMaxsa(dato,fin);
	{evaluo los digitos de los legajos}
	while(num<>0)do begin
		dig:=num mod 10;
		{verifico si el digito es 1}
		if(dig=1)then cantde1:=cantde1+1;
		num:=num div 10;
	end;
	writeln('La cantidad de veces que aparece el numero 1 en el legajo del empleado de mayor salario es de: ',cantde1);
end;

{DNI de los dos empleados con menor salario}
procedure DNImenorsalario(dato:Tdatos;fin:boolean);
var
	salario1, salario2:real;
	DNIm1, DNIm2:string;
begin
	CADPVolverAlInicio('DatosGrupo');
	salario1:=9999;
	repeat
		CADPleerDato(dato,fin);
		{evaluo cual es el primer salario minimo}
		if(dato.salario<salario1)then begin
			salario2:=salario1;
			salario1:=dato.salario;
			DNIm1:=dato.DNI;
			DNIm2:= DNIm1;
		end
		else begin
		{evaluo cual es el segundo salrio minimo}
			if(dato.salario<salario2)then begin
				salario2:=dato.salario;
				DNIm2:=dato.DNI;
			end;
		end;
	until(fin);
	writeln('El DNI de los dos empleados con menor salario son: ',DNIm1,' y ',DNIm2);
end;


procedure descomponer(num:integer; var ParOImpar:integer);
var
  pares, impares, dig, cantDigitos: integer;
begin
	cantDigitos:= 0; pares:= 0; impares:= 0;
	while(num<>0) do
		begin
			dig:=num MOD 10;
			cantDigitos:= cantDigitos + 1; {Cantidad de dígitos totales}
			if (dig MOD 2 = 0) then {Cuenta la cantidad de dígitos pares e impares}
				pares:= pares + 1
			else
				impares:= impares + 1;
			num:= num DIV 10;
		end;
	if((cantDigitos=pares) or (cantDigitos=impares)) then {Verifica si la cantidad de digitos totales es igual a la cantidad de pares o impares}
		ParOImpar:= ParOImpar + 1;
end;
  


{Cantidad de empleados cuyos legajos posee todos dígitos pares o todos dígitos impares}
procedure TotalPareseImpares(dato:Tdatos;var fin:boolean);
var
  ParOImpar: integer;
begin
  CADPVolverAlInicio('DatosGrupo'); 
  ParOImpar:=0 ;
  repeat
	CADPleerDato(dato,fin);		   
	descomponer(dato.legajo, ParOImpar);
  until(fin);
	writeln('Cantidad de empleados cuyos legajos poseen todos dígitos pares o todos dígitos impares: ', ParOImpar)
end;


{Porcentaje de empleados de más de 50 años y que cobran menos de 600 dólares}
procedure CalcularPorcetaje (dato:Tdatos; var fin:boolean);
var
	cantEmpCumple: integer;
	porcentaje: real;
begin
  CADPVolverAlInicio('DatosGrupo'); 
  cantEmpCumple:= 0; 
  repeat
	CADPleerDato(dato,fin);	
	if ((dato.edad>50) and (dato.salario<600)) then
		cantEmpCumple:=cantEmpCumple +1;
  until(fin);
  porcentaje:=(cantEmpCumple*100/cantEmpleados(dato,fin));	
  writeln('Porcentaje de empleados de más de 50 años y que cobran  menos de 600 dólares: ', Porcentaje:1:2, '%');
end;


{contar la cantidad de veces que aparece el digito 0 entre todos los legajos}
procedure digitosCero (dato: Tdatos; var fin: boolean);
var
	cantCeros, numero: integer;
begin
	CADPVolverAlInicio('DatosGrupo');
	cantCeros:= 0;
	repeat
		CADPleerDato(dato,fin);{leer los datos de los empleados}
		numero:= 0;
		while (dato.legajo <> 0) do begin
			numero:= dato.legajo mod 10;{descomponer los digitos del legajo}
			if(numero = 0) then
				cantCeros:= cantCeros +1;{y contar cuantos digitos cero hay}
			dato.legajo:= dato.legajo DIV 10;
		end;
	until(fin);
	writeln('La cantidad de ceros en los legajos es: ', cantCeros);
end;

{contar la cantidad de veces en las que un empleado cobra mas del doble del empleado anterior}
procedure masDelDobleQueAnterior(dato: Tdatos; var fin: boolean);
var
	salario2, cantEmpleadosDoble: integer;
begin
	CADPVolverAlInicio('DatosGrupo');
	cantEmpleadosDoble:= -1;
	salario2:= 0;
	repeat
		CADPleerDato(dato,fin);{leer los datos de los empleados}
		if (dato.salario > salario2 *2) then{evaluar si tiene el doble que el anterior}
			cantEmpleadosDoble:= cantEmpleadosDoble +1;{y contar cuanto hay}
		salario2:= dato.salario;
	until(fin);
	writeln('La cantidad de empleados con el doble de salario que el anterior son: ', cantEmpleadosDoble);
end;




function MenuDeOpciones():integer;
var
    OpcionElegida:integer;
begin
    WriteLn ('Bienvenido al menu eliga una de las opciones: ');
    WriteLn ('1: Ver los empleados totales de la empresa.');
    WriteLn ('2: Ver la cantidad de empleados que cobran menos de 300 U$D.');
    WriteLn ('3: Ver el salario promedio.');
    WriteLn ('4: Ver la cantidad de veces que aparece el digito 1 en el legajo del empleado con mayor salario.');
    WriteLn ('5: Ver los DNI de los 2 empleados que cobran menor sueldo.');
    WriteLn ('6: Ver la cantidad de empleados cuyo legajo posee todos numeros pares o todos numeros impares.');
    WriteLn ('7: Ver el porcentaje de empleados mayores a 50 años y que cobran menos de 600 U$D.');
    WriteLn ('8: Ver la cantidad de veces que se utiliza el numero 0 todos los legajos.');
    WriteLn ('9: Ver la cantidad de veces que el empleado en la lectura cobra mas del doble que el empleado anterior.');
    WriteLn ('0: Salir del menu.');
    ReadLn (OpcionElegida);
    WriteLn('************************************');
    MenuDeOpciones:=OpcionElegida;
end;



//programa principal
var
    DatoPorEmpleado:Tdatos;
    SalgoDelMenu,fin:Boolean;
begin
    //inicializo mis variables
    SalgoDelMenu:=False;
    //me aseguro que el menu siga siempre a menos que el usuario quiera lo contrario
    repeat
        case MenuDeOpciones of
            1:empleadosTotales(DatoPorEmpleado,fin);
            2:salarioMenor300(DatoPorEmpleado,fin);
            3:promedioSalarios(DatoPorEmpleado,fin);
            4:Cant1legajomax(DatoPorEmpleado,fin);
            5:DNImenorsalario(DatoPorEmpleado,fin);
            6:TotalPareseImpares(DatoPorEmpleado,fin);
            7:CalcularPorcetaje(DatoPorEmpleado,fin);
            8:digitosCero(DatoPorEmpleado,fin);
            9:masDelDobleQueAnterior(DatoPorEmpleado,fin);
            0: SalgoDelMenu:=True;
        else 
            WriteLn ('Numero ingresado no admitido en el programa. Vuelva a intentar.');
        end;
        WriteLn('************************************');
    until (SalgoDelMenu=True);
    CADPfinalizarLectura;
end.