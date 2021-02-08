<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nivell-3</title>
</head>

<body>
    
    <h1>NIVELL 3</h1>

    <!-- Exercici 1 -->
    <!-- Ens han demanat un llistat amb tots els anys on es van produir jocs olímpics desde 1960(Roma) inclós fins al 2016(Río de Janeiro,també inclós). Programa un bucle que mostri per pantalla els anys olímpics dins de l'interval esmentat -->
    <hr>
    <h2>Exercici 1</h2>
    
    <ul>
        <?php for ($i = 1960; $i <= 2016; $i+= 4) {
            echo "<li> $i </li>";   
        }?>
    </ul>

    <!-- Añado el +4 en el bucle, partiendo de la premisa que los Juegos se celebran cada 4 años --> 
    <!-- El tag <li> lo pongo dentro del bucle, para que me liste cada uno de los años en formato listado --> 
       

    <!-- Exercici 2 -->
    <!-- Imagina que som a una botiga on es ven:
         Xocolata: 1 euro
         Xiclets: 0.50 euros
         Carmels: 1.50 euros
    Implementa un programa que permeti afegir càlculs a un total de compres d'aquest tipus. Per exemple, que si comprem: 2 xocolates, 1 de xiclets i 1 de carmels, tinguem un programa que permeti anar afegint els subtotals a un total, tal que així,
    funció(2 xocolates) + funció(1 de xiclets) + funció(1 de carmels) = 2+0.5+1.5
    Sent per tant el total, 4. -->
    <hr>
    <h2>Exercici 2</h2>
    
    <?php
        //Para poder utilizar las variables dentro de la función hay que referirse a ellas como globales o bien declararlas dentro de la función
        $precioChocolatinas = 1;
        $precioChicles = 0.5;
        $precioCaramelos = 1.5;
        
        function totalComprado($chocolatinas, $chicles, $caramelos) {
            return $total = ($chocolatinas * $GLOBALS['precioChocolatinas']) + ($chicles * $GLOBALS['precioChicles']) + ($caramelos * $GLOBALS['precioCaramelos']);  
        }
        
        echo totalComprado(2,1,1);
    ?>


    <!-- Exercici 3 -->
    <!-- La criba d'Eratóstenes és un algoritme pensat per a trobar nombres primers dins d'un interval donat. Basats en l'informació de l'enllaç adjunt, implementa la criba d'Eratóstenes dins d'una funció, de tal forma que poguem invocar la funció per a un número concret -->
    <hr>
    <h2>Exercici 3</h2>

    <?php
        function obtenerNumerosPrimos($numeroNatural) {
    
            echo "Los números primos de $numeroNatural son: ";
            $numerosPrimos = [];

            // Guardar todos los números de la criba en un array, a partir del número 2 (en principio serán todos primos) / Y hacer coincidir el índice con el valor!
            // (El array pues quedará guardado con 20 elementos, pero empezará en la posición 2)
            for ($i = 2; $i <= $numeroNatural; $i++) {
                $numerosPrimos[$i] = $i;
            }

            $i = 2; // Empezamos por el valor 2 (1º elemento del array) a mutiplicar
            
            while ($i * $i <= $numeroNatural) { // Cuando el resultado de la mutiplicación sea mayor al número que nos han pasado por parametro, salir!
                if (isset($numerosPrimos[$i])) { // Si no existe el elemento, pasamos al siguiente
                    $j = $i;
                    // Hacer un 2º bucle, para mutiplicar ese mismo valor cada vez incrementando la mutiplicación en 1 (así eliminamos sus múltiplos)
                    while ($j * $i <= $numeroNatural) { 
                        // Queremos eliminar justamente el elemento que coincide con el resultado de la mutiplicación (Recordar que antes hemos llenado el array con todos los valores que coinciden con la posición, así de esta manera nos aseguramos que borra el número que queremos)
                        unset($numerosPrimos[$j * $i]); 
                        $j++;
                    }
                }
                $i++;
            }

            // Recorrer el array, una vez finalizado todo el borrado, y listar sólo los números primos
            foreach ($numerosPrimos as $numPrimo) {
                echo "$numPrimo ";
            }
        }
        
        obtenerNumerosPrimos(20);  // El Output debería ser: 2,3,5,7,11,13,17,19 (https://es.wikipedia.org/wiki/Criba_de_Erat%C3%B3stenes)
        echo "<br \>";
        obtenerNumerosPrimos(100); // El Output debería ser: 2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97 (https://www.edufichas.com/matematicas/numeros-primos-del-1-al-100/)
    ?>

</body>

</html>




<!-- 
function cribaEratostenes($numeroNatural) {
            $salir = false;
            $mitad = $numeroNatural / 2;
            // Guardar todos los números de la criba en un array (en principio serán todos primos)
            $numerosPrimos = [];
            for ($i = 2; $i <= $numeroNatural; $i++) {
                array_push($numerosPrimos, $i);
            }
            // Con el primer número del array buscar sus múltiplos menores de 20 y eliminarlos del array
            for ($i = 0; $i < count($numerosPrimos); $i++) {

                que hago con el primer elemnto (2)
                2 % 8 == 0

                // Si el número múltiplo es mayor que el número natural pasado por parámetro, SALIMOS! (*)
                if ($salir) {
                    break;
                }
                // echo "Entra por el primer bucle";
                for ($j = 2; $j <= $mitad; $j++) {
                    $numAEliminar = $numerosPrimos[$i] * $j;
                    // (*)
                    if ($numAEliminar > $numeroNatural) {
                        $salir = true;
                        break;
                    }
                    valoresAEliminar();
                    for ($k = 0; $k < count($numerosPrimos); $k++) {
                        // echo "numero primo: $numerosPrimos[$k]";
                        // echo "numero a eliminar: $numAEliminar";
                        if ($numAEliminar == $numerosPrimos[$k]) {
                            // unset($numerosPrimos[$k]);
                            // Me guardo estos numeros a eliminar *2 ==> 4, 6, 8, 10, 12, 14, 16, 18, 20  
                            / *3 = 6, 9, 12 / *4 8 12

                            break;
                        }
                    }
                }
            }
            unset
        }
        echo cribaEratostenes(20);
    ?> -->