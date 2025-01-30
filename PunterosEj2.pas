program PunterosEj2;

uses
    SysUtils;

var
    V: array[0..2] of integer;
    p: ^Integer;
    i: Integer;
begin
    { Crea un array de 3 enteros V e inicialízalo con números aleatorios. }
        randomize;
            for i:= 0 to 2 do
                V[i]:= random(100);
 
    { Muestra sus valores por pantalla }
    writeln('Valor iniciales del array:');
        for i:= 0 to 2 do
            writeln('V[', i, '] = ', V[i]);
            
    { Declara un puntero a entero p y ponlo a apuntar a la primera posición del array }
        p:= @V[0];
    
    { Pon el valor 100 en el entero apuntado por p }
        p^:=100;

    { Muestra los valores del array “V” por pantalla }
        writeln('Valores del array después de asignar 100 a la primera posición:');
        for i:= 0 to 2 do
            writeln('V[', i, '] = ', V[i]);

    { Recorre con p todas las posiciones del array para ponerlas todas a cero }
        for i:= 0 to 2 do
            begin
                p^:=0;
                Inc(p);
            end;

    { Muestra los valores del array “V” por pantalla }
           writeln('Valores del array después de poner todas las posiciones a cero:');
            for i:= 0 to 2 do
                writeln('V[', i, '] = ', V[i]);
end.
