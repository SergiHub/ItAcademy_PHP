<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nivell-2</title>
</head>

<body>
    
    <h1>NIVELL 2</h1>

    <!-- Exercici 1 -->
    <!-- Per jugar a "l'amagatall"  se'ns ha demanat un programa que compti fins a 10. Però la persona que comptarà és una mica tramposa y ho farà comptant de dos en dos. Crea una funció que compti fins a 10, de 2 en 2, mostrant cada número del compte per pantalla -->
    <hr>
    <h2>Exercici 1</h2>
    
    <?php
        function contar_hasta_10() {
            for ($i = 1; $i <= 10; $i+= 2) {
                echo $i ." ";
            }
        }
        contar_hasta_10();
    ?>


    <!-- Exercici 2 -->
    <!-- Imagina't que volem que conti fins a un número diferent de 10. Programa la funció per a que el final del compte estigui parametritzat -->
    <hr>
    <h2>Exercici 2</h2>
    
    <?php
        function contarHastaUnNumero($valorHasta) {
            for ($i = 1; $i <= $valorHasta; $i++) {
                if ($i == $valorHasta) {
                    echo "Se llega al final de la función de contar con el número: $valorHasta";
                }
            }
        }
        contarHastaUnNumero(17);
    ?>


    <!-- Exercici 3 -->
    <!-- Per a prevenir oblits al utilitzar la nostra meravellosa funció "amagatall" establirem un paràmetre per defecte a 10 en la funció que s'encarrega de fer aquest compte -->
    <hr>
    <h2>Exercici 3</h2>
    
    <?php
        function contarSoloHasta_10($valorPredeterminado = 10) {
            for ($i = 1; $i <= $valorPredeterminado; $i++) {
                echo $i ." ";
            }
        }
        contarSoloHasta_10();
    ?>
    <!-- Si le pasaramos un valor por parámetro, este vaor machacaría al valor predeterminado 10 ==> contarSoloHasta_10(31); -->

</body>

</html>