
<!--ENTIENDO PUES QUE LOS EJERCICIOS 2 Y 4 NO SON FUNCIONES????????-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nivell-1</title>
</head>

<body>
    
    <h1>NIVELL 1</h1>

    <!-- Exercici 1 -->
    <!-- Programa la funció "resta" que, donats dos paràmetres ens retorni la resta dels dos números -->
    <h2>Exercici 1</h2>
    
    <?php
        function resta($a, $b) {
            return $a - $b;
        }

        $a = 5;
        $b = 3;
        $resultado = resta($a,$b);
        echo "Resultado de la función resta, el de restar " .$a ." - " .$b ." es igual a " .$resultado;
    ?>
    <!-- Declaro como variables los valores que le pasaremos por parámetro, para así poderlos imprimir con el echo -->
    <!-- Sin los puntos, el PHP tmb concatena los valores:
        echo "Resultado de la función resta, el de restar $a - $b es igual a $resultado";
    -->


    <!-- Exercici 2 -->
    <!-- Programa una lògica que, donat un número qualsevol(per exemple,la teva edat) ens digui si és parell o impar ell mitjançant un missatge per pantalla -->
    <hr>
    <h2>Exercici 2</h2>
    
    <?php
       function par_o_impar($valor) {
            if ($valor % 2 == 0) {
                echo "El número $valor es par <br />";
            }
            else {
                echo "El número " .$valor ." es impar.\n";
            }
        }
        par_o_impar(22);
        par_o_impar(47);
    ?>
    <!-- PENDIENTE de saber pq el \n no hace un salto de línea; he tenido que poner el tag de html <br>-->


    <!-- Exercici 3 -->
    <!-- Agafa la lògica de l'exercici 2 i encapsulala en una funció de nom parell_o_imparell. Invoca aquesta funció per a comprovar que funciona correctament -->
    <hr>
    <h2>Exercici 3</h2>
    
    <?php
        function parImpar($valor) {
            // if ($valor % 2 == 0) {
            //     return true;
            // }
            // else {
            //     return false;
            // }
            return $valor % 2 == 0 ? true : false;
        }
        
        $numero = 4;
        if (parImpar($numero)) {
            echo "El número " .$numero ." es par.";
        }
        else {
            echo "El número " .$numero ." es impar.";
        }
    ?>
    <!-- He utilizado un condicinal ternario para ver que también funciona -->


    <!-- Exercici 4 -->
    <!-- Programa un bucle que compti fins a 10, mostrant cada  número per pantalla -->
    <hr>
    <h2>Exercici 4</h2>
    
    <?php
        for ($i = 1; $i <= 10; $i++) {
            echo $i ." ";
        }
    ?>

</body>

</html>