program PunterosEj4;

uses
    crt;

const
    MAX = 2;  { 1.a Declarar un array de MAX punteros a enteros }

type
   { 1.b Declarar un array de MAX punteros a enteros }
   tparray = array[0..MAX-1] of ^Integer;

var
    { 1.c Declarar un array de MAX punteros a enteros }
    ptrArray: tparray;
    option: Char; // Variable para la opción del menú

{ 6.a Implementa una función que calcule el máximo número del array (debes comprobar 
antes, pues puede que alguna posición no tenga un número y esté a NIL)}
function MaxArray(ptrArray: tparray): Integer;
var
    i: Integer;
    maxValue: Integer;
begin
    maxValue := -MaxInt; // Inicializamos con el menor valor posible
    for i := 0 to MAX-1 do
    begin
        if (ptrArray[i] <> NIL) and (ptrArray[i]^ > maxValue) then
            maxValue := ptrArray[i]^;
    end;
    MaxArray := maxValue;
end;

{ 7.a Implementa una función que compute la suma de todos los enteros (de nuevo 
asegúrate de no intentar sumar los que estén a NIL) }
function SumArray(ptrArray: tparray): Integer;
var
    i, sum: Integer;
begin
    sum := 0;
    for i := 0 to MAX-1 do
    begin
        if ptrArray[i] <> NIL then
            sum := sum + ptrArray[i]^;
    end;
    SumArray := sum;
end;


{ 3.a Implementa un procedimiento que muestre por pantalla el contenido de cada posición }
procedure PrintArray(ptrArray: tparray);
var
    i: Integer;
begin
    for i := 0 to MAX-1 do
    begin
        if ptrArray[i] <> NIL then
            WriteLn('Posición ', i, ': ', ptrArray[i]^)
        else
            WriteLn('Posición ', i, ': NIL');
    end;
end;

{ 4.a Implementa un procedimiento que ponga a cero todos los números }
procedure ZeroArray(var ptrArray: tparray);
var
    i: Integer;
begin
    for i := 0 to MAX-1 do
    begin
        if ptrArray[i] <> NIL then
            ptrArray[i]^ := 0;
    end;
end;

{ 5. Implementa un subprograma que ponga todos los punteros que no lo estén, a NIL }
procedure NilArray(ptrArray: tparray);
var
    i: Integer;
begin
    for i := 0 to MAX-1 do
    begin
        if ptrArray[i] <> NIL then
        begin
            Dispose(ptrArray[i]); // Liberar memoria
            ptrArray[i] := NIL;
        end;
    end;
end;

begin
    { 2. Crea un entero en cada una de las posiciones inicializado a un número aleatorio }
    // Implementar esta parte
       Randomize;
    for var i := 0 to MAX-1 do
    begin
        New(ptrArray[i]); // Reservar memoria
        ptrArray[i]^ := Random(100); // Asignar valor aleatorio
    end;

    repeat
        ClrScr;
        WriteLn('1. Mostrar array'); { 3.b }
        WriteLn('2. Poner a cero array'); { 4.b }
        WriteLn('3. Poner a NIL los punteros'); { 5.b }
        WriteLn('4. Máximo array'); { 6.b }
        WriteLn('5. Suma array'); { 7.b }
        WriteLn('0. Salir');
        Write('Opción: ');
        ReadLn(option);

        case option of
            '1': PrintArray(ptrArray);
            '2': ZeroArray(ptrArray);
            '3': NilArray(ptrArray);
            '4': WriteLn('Máximo: ', MaxArray(ptrArray));
            '5': WriteLn('Suma: ', SumArray(ptrArray));
        end;
        WriteLn('Pulsa una tecla para continuar...');
        ReadKey;
    until option = '0';
end.
