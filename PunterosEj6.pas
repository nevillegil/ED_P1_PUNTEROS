program PunterosEj6;

uses SysUtils;



{
    Vamos a hacer un simulador de "Isla de la Tentación" en Pascal. Para ello, sigue los siguientes pasos:
}

const
NUM_PAREJAS = 20;
NUM_PARTICIPANTES = 2 * NUM_PAREJAS + NUM_PAREJAS div 2;

type
tRol = (tentador, pareja);
    tParticipante = RECORD
        nombre: string;
        edad: integer;
        rol: tRol;
        otroParticipante: ^Participante;
    end;
var
    {
        2. Crea un array de MAX punteros a Participante
    }
array1: array[0..NUM_PARTICIPANTES] of ^tParticipante;
Participantes: tParticipante;

{
    3. Crea un procedimiento que cree un participante con nombre, edad y rol. Otro participante será nil.
}

procedure CrearParticipante(var p: ^tParticipante; nombre: string; edad: integer; rol: tRol);
begin
  new(p);
  p^.nombre := nombre;
  p^.edad := edad;
  p^.rol := rol;
  p^.otroParticipante := nil;
end;
        

{
    4. Crea un procedimiento que asigne una pareja a un participante, recibirá dos parámetros, los dos participantes
}

procedure AsignarPareja(var p1, p2: ^tParticipante);
begin
  p1^.otroParticipante := p2;
  p2^.otroParticipante := p1;
end;

{
    5. Crea un procedimiento aud inicialice la isla de las tentaciones. Por cada 2 parejas, habrá un tentador. 
}

procedure InicializarIsla;
var
  i, tentadores: integer;
  nombre: string;
begin
  tentadores := NUM_PAREJAS div 2;
  for i := 0 to NUM_PAREJAS - 1 do
      begin
            CrearParticipante(array1[2 * i], 'Pareja' + IntToStr(i * 2 + 1), 20 + Random(10), pareja);
            CrearParticipante(array1[2 * i + 1], 'Pareja' + IntToStr(i * 2 + 2), 20 + Random(10), pareja);
            AsignarPareja(array1[2 * i], array1[2 * i + 1]);
  end;
  
  for i := 0 to tentadores - 1 do
  begin
    CrearParticipante(array1[NUM_PAREJAS * 2 + i], 'Tentador' + IntToStr(i + 1), 25 + Random(10), tentador);
  end;
end;

{
    6. Crea un procedimiento que muestre por pantalla la isla de las tentaciones de la siguiente manera:
            - Nombre: XXXX
            - Edad: XX
            - Rol: Pareja/Tentador
            - Pareja: XXXX --> si tuviera pareja
            - Infiel --> si su rol fuese pareja, pero no la tiene
            - Tentó a: XXXX --> si fuese tentador y ahora tiene pareja
}

procedure MostrarIsla;
var
  i: integer;
begin
  for i := 0 to NUM_PARTICIPANTES - 1 do
  begin
    if array1[i] <> nil then
    begin
      writeln('Nombre: ', array1[i]^.nombre);
      writeln('Edad: ', array1[i]^.edad);
      writeln('Rol: ', IfThen(array1[i]^.rol = pareja, 'Pareja', 'Tentador'));
      if (array1[i]^.rol = pareja) and (array1[i]^.otroParticipante = nil) then
        writeln('Infiel')
      else if (array1[i]^.rol = tentador) and (array1[i]^.otroParticipante <> nil) then
        writeln('Tentó a: ', array1[i]^.otroParticipante^.nombre)
      else if array1[i]^.otroParticipante <> nil then
        writeln('Pareja: ', array1[i]^.otroParticipante^.nombre);
      writeln('--------------------------');
    end;
  end;
end;


{
     7. Crea un procedimiento que simule una ronda de tentación. En cada ronda, se seleccionará una pareja y un tentador: 
    - Se seleccionará al azar (50/50) quién de los dos será tentado. 
    - Se determinará si la pareja es infiel o no (25/75). 
    - Se actualizarán los datos. Si ha sido infiel, perderán su pareja. El tentador, tendrá una nueva pareja.
}

procedure RondaTentacion;
var
  parejaIndex, tentadorIndex, elegido: integer;
begin
  parejaIndex := Random(NUM_PAREJAS) * 2;
  tentadorIndex := NUM_PAREJAS * 2 + Random(NUM_PAREJAS div 2);
  elegido := parejaIndex + Random(2);

  if Random(100) < 25 then
  begin
    if array1[elegido]^.otroParticipante <> nil then
    begin
      array1[elegido]^.otroParticipante^.otroParticipante := nil;
      array1[elegido]^.otroParticipante := nil;
    end;
    array1[elegido]^.otroParticipante := array1[tentadorIndex];
    array1[tentadorIndex]^.otroParticipante := array1[elegido];
  end;
end;

{
    8. Genera un programa que le pregunte al usuario si quiere jugar una ronda más o no. 
    Si el usuario decide que sí, se realizará una ronda más. Si decide que no, se mostrará el estado final de la isla de las tentaciones.
}

var
  continuar: char;
begin
  Randomize;
  InicializarIsla;
  repeat
    writeln('Quieres jugar una ronda de tentación? (s/n)');
    readln(continuar);
    if continuar = 's' then
      RondaTentacion;
  until continuar <> 's';
  writeln('Estado final de la isla:');
  MostrarIsla;
end.

