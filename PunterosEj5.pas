program PunterosEj5;

uses
    SysUtils;

{ Declaración de constantes }
const
    MAX = 4; { 2. Declaración de constantes }

{ Declaración de tipos }
type
    { 1. Declara un tipo coordenada_3D para puntos con coordenadas x,y,z }
   coordenada_3D = record
        x, y, z: Integer;
    end;
    ptr_coordenada = ^coordenada_3D;

{ Declaración de variables }
var
    { 2. Declara un array de MAX punteros a coordenadas_3D }
    coordenadas: array[0..MAX-1] of ptr_coordenada;

{ 3. Crea una coordenada_3D en cada una de las posiciones inicializado todas las coordenadas con números aleatorios }
procedure InicializarCoordenadas;
var
    i: Integer;
begin
    Randomize;
    for i := 0 to MAX-1 do
    begin
        New(coordenadas[i]);
        coordenadas[i]^.x := Random(100);
        coordenadas[i]^.y := Random(100);
        coordenadas[i]^.z := Random(100);
    end;
end;

{ Procedimiento para imprimir una coordenada_3D }
procedure ImprimirCoordenada(ptr_coordenada: ptr_coordenada);
begin
    if ptr_coordenada <> nil then
        WriteLn('(', ptr_coordenada^.x, ', ', ptr_coordenada^.y, ', ', ptr_coordenada^.z, ')');
end;

{ * Implementa un procedimiento que muestre por pantalla el contenido de cada posición }
procedure ImprimirTodasLasCoordenadas;
var
    i: Integer;
begin
    for i := 0 to MAX-1 do
    begin
        if coordenadas[i] <> nil then
        begin
            Write('Coordenada ', i, ': ');
            ImprimirCoordenada(coordenadas[i]);
        end;
    end;
end;


{ 4. Implementa un subprograma que libere la memoria asignada a una posición }
procedure LiberarCoordenada(indice: Integer);
begin
    if (indice >= 0) and (indice < MAX) and (coordenadas[indice] <> nil) then
    begin
        Dispose(coordenadas[indice]);
        coordenadas[indice] := nil;
    end;
end;

{ 4.' Implementa un subprograma que libere la memoria asignada a todas las posiciones }
procedure LiberarTodasLasCoordenadas;
var
    i: Integer;
begin
    for i := 0 to MAX-1 do
        LiberarCoordenada(i);
end;

{ 5. Implementa un procedimiento que sume todas las x de las coordenadas }
procedure SumarX(var suma: Integer);
var
    i: Integer;
begin
    suma := 0;
    for i := 0 to MAX-1 do
        if coordenadas[i] <> nil then
            suma := suma + coordenadas[i]^.x;
end;

{ 5.' Implementa una función que sume las coordenadas de todas las posiciones }
function SumarTodasLasCoordenadas: coordenada_3D;
var
    i: Integer;
    resultado: coordenada_3D;
begin
    resultado.x := 0;
    resultado.y := 0;
    resultado.z := 0;

     for i := 0 to MAX-1 do
        if coordenadas[i] <> nil then
        begin
            resultado.x := resultado.x + coordenadas[i]^.x;
            resultado.y := resultado.y + coordenadas[i]^.y;
            resultado.z := resultado.z + coordenadas[i]^.z;
        end;
    SumarTodasLasCoordenadas := resultado;
end;

end;
{ 6. (Opcional) Implementa un subprograma que permita añadir una coordenada en la primera 
    posición libre del array}
procedure PrimeraPosLibre(x,y,z:integer);
var
    i:integer;
begin
    for i:= 0 to MAX-1 do
        if (coordenadas[i]=nil) then
            begin
                New(coordenadas[i]);
                coordenadas[i]^.x := x;
                coordenadas[i]^.y := y;
                coordenadas[i]^.z := z;
            end;
    end;
end;

{ 7. Implementa un subprograma que calcule la máxima coordenada y (debes comprobar  antes, 
    pues puede que alguna posición no tenga coordenada y esté a NIL)}
function MaximaY:integer;
var
    i, maxY: Integer;
begin
    maxY := -1;
    for i := 0 to MAX-1 do
        if (coordenadas[i] <> nil) and ((maxY = -1) or (coordenadas[i]^.y > maxY)) then
            maxY := coordenadas[i]^.y;
    MaximaY := maxY;
end;

begin

end.
