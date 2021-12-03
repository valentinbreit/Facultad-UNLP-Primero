Program Ejercicio3;

Type 
  lista = ^nodo;
  str20 = string[20];
  viaje = Record
    nViaje: integer;
    codAuto: integer;
    dirOrigen: str20;
    dirDestino: str20;
    kmRecorrido: real;
  End;
  nodo = Record
    dato: viaje;
    sig: lista;
  End;

Procedure max(cod: integer; km: real; Var codMax1, codMax2: integer; Var kmMax1,kmMax2: real);
Begin
  If (km>kmMax1) Then
    Begin
      kmMax2 := kmMax1;
      kmMax1 := km;
      codMax2 := codMax1;
      codMax1 := cod;
    End
  Else If (km>kmMax2) Then
        Begin
           kmMax2 := km;
           codMax2 := cod;
        End;
End;

Procedure insertarOrdenado(Var L: lista; R: viaje);

Var 
  ant, act, nuevo: lista;
Begin
  ant := L;
  act := L;
  new(nuevo);
  nuevo^.dato := R;
  nuevo^.sig := Nil;
  While (act<>Nil) And (act^.dato.codAuto>R.codAuto) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act= ant) Then
    L := nuevo
  Else
    ant^.sig := nuevo;
  nuevo^.sig := act;
End;

Procedure analizarLista(L: lista; Var L2: lista; Var codMax1, codMax2:integer);

Var 
  kmMax1, kmMax2, kmTotal: real;
  codigo: integer;
Begin
  kmMax1 := -1;
  kmMax2 := -1;
  While (L<>Nil) Do
    Begin
      codigo := L^.dato.codAuto;
      kmTotal := 0;
      While (L^.dato.codAuto = codigo) Do
        Begin
          kmTotal := kmTotal + L^.dato.kmRecorrido;
          If (L^.dato.kmRecorrido>5) Then
            Begin
              insertarOrdenado(L2, L^.dato);
            End;
          L := L^.sig;
        End;
      max(codigo, kmTotal, codMax1, codMax2, kmMax1, kmMax2);
    End;

End;

Var 
  pri, pri2: lista;
  codMax1, codMax2: integer;
Begin
  pri:= Nil; pri2:= Nil;
  {cargarLista(pri); Se dispone}
  analizarLista(pri, pri2, codMax1, codMax2);
  writeln('Los codigos de los autos con mayor km Recorridos son ', codMax1,' y ', codMax2);
End.