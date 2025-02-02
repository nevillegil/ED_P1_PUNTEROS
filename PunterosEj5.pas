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


{ * Implementa un procedimiento que muestre por pantalla el contenido de cada posición }


{ 4. Implementa un subprograma que libere la memoria asignada a una posición }


{ 4.' Implementa un subprograma que libere la memoria asignada a todas las posiciones }


{ 5. Implementa un procedimiento que sume todas las x de las coordenadas }



{ 5.' Implementa una función que sume las coordenadas de todas las posiciones }


{ 6. (Opcional) Implementa un subprograma que permita añadir una coordenada en la primera 
    posición libre del array}


{ 7. Implementa un subprograma que calcule la máxima coordenada y (debes comprobar  antes, 
    pues puede que alguna posición no tenga coordenada y esté a NIL)}


begin

end.
