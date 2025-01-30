{ 
    Programa que demuestra el uso de punteros en Pascal 
}

program PunterosEj1;

uses
    ctr;

var
   x:integer; { Declara variable entera (x) }
   p_ent:^integer; { Declara una variable de tipo puntero a entero (p_ent) }

begin

    { Da el valor 100 a x }
        x:= 100;
    { Crea un entero dinámicamente con p_ent y dale el valor que tiene actualmente x }
        p_ent^:=x;
    { Imprime por pantalla el valor contenido en el entero al que apunta p_ent }
        writeln('El valor del contenido que apunta p_ent es: ', p_ent^);
    { Crea con new un nuevo entero dinámicamente }
        new(p_ent);
    { Imprime por pantalla el valor contenido en el entero al que apunta p_ent }
        writeln('El valor del contenido que apunta p_ent es: ', p_ent^);
    { Pon el puntero p_ent a apuntar a x }
        
    { Súmale 100 al entero apuntado por el puntero p_ent }

    { Imprime por pantalla el valor de x y también del entero al que apunta p_ent }

    { Pon el puntero p_ent a NIL }

    { Libera la memoria asociada al nuevo entero }

    { Suma 100 a x pero sin usar x en la operación de suma (solo usando p_ent) }

    { Muestra por pantalla que son iguales }

    { Libera toda la memoria asociada a p_ent y termina }

end.
