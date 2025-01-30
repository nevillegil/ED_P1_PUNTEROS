program PunterosEj3;
type
    { Declara un tipo de registro llamado “nodo” con dos campos: un entero y un puntero a “nodo” }
        nodo: RECORD
            entero: integer;
            puntero: ^nodo;
        end;

var
    { Declara una variable de tipo puntero a nodo }
        varnodo: ^nodo;
begin
    { Crea un nodo en memoria dinámica (heap) }


    { Dale valor 100 al campo entero de este nodo }


    { Pon a nil el campo puntero del nodo }


    { Pon ahora el puntero del nodo a apuntar al propio nodo }


    { En este punto hay dos instrucciones alternativas para liberar la memoria dinámica creada: }
    { Alternativa 1: Liberar el nodo directamente }


    { Alternativa 2: Liberar el nodo a través del campo puntero }
    { Dispose(punteroNodo^.siguiente); }

    { Termina }
end.
