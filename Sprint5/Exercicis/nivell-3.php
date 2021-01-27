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
    <h2>Exercici 1</h2>
    
    <?php
        // Para no juntar los archivos de ejercicios de nivel 2 y 3, me declaro aquí el array resultante del último ejercicio del nivel anterior (nivell-2.php)
        $array_final = array(1, 2, 3, 4, 5, 22, 12, 72, 1972);
        $longitud_array = sizeof($array_final);
        $ultima_posicion = $longitud_array - 1;
        $penultima_posicion = $longitud_array - 2;
    ?>

    <p>Imprimir, valor por valor, el array del ejercicio anterior: 
    <?php 
        foreach($array_final as $key => $numero) {
            switch ($key) {
                case $ultima_posicion:
                    echo $numero . ".";
                    break;
                case $penultima_posicion:
                    echo $numero . " y ";
                    break;
                default:
                    echo $numero . ", ";
            }
        }
    ?>
    </p>

    <!-- Exercici 2 -->
    <hr>
    <h2>Exercici 2</h2>
    
    <?php
        $x = 10;
        $y = 5;
        $n = 5.25;
        $m = 1.5;
        // Las diferentes operaciones aritméticas que se nos piden
        $suma_xy = $x + $y;
        $suma_nm = $n + $m;
        $resta_xy = $x - $y;
        $resta_nm = $n - $m;
        $producto_xy = $x * $y;
        $producto_nm = $n * $m;
        $division_xy = $x / $y;
        $division_nm = $n / $m;
        $modulo_xy = $x % $y;
        $modulo_nm = $n % $m;
        $doble_x = $x * 2;
        $doble_y = $y * 2;
        $doble_n = $n * 2;
        $doble_m = $m * 2;
        $suma_xynm = $x + $y + $n + $m;
        $producto_xynm = $x * $y * $n * $m;
    ?>
        
    <h4>Mostrar para las variables $x e $y</h4>
    <ul>
        <li>El valor de cada variable => <?php echo "variable x: " .$x ." / variable y: " .$y;?></li>
        <li>La suma => <?php echo $suma_xy;?></li>
        <li>La resta => <?php echo $resta_xy;?></li>
        <li>El producto => <?php echo $producto_xy;?></li>
        <li>La división => <?php echo $division_xy;?></li>
        <li>El módulo => <?php echo $modulo_xy;?></li>
    </ul>

    <h4>Mostrar para las variables $n y $m</h4>
    <ul>
        <li>El valor de cada variable => <?php echo "variable n: " .$n ." / variable m: " .$m;?></li>
        <li>La suma => <?php echo $suma_nm;?></li>
        <li>La resta => <?php echo $resta_nm;?></li>
        <li>El producto => <?php echo $producto_nm;?></li>
        <li>La división => <?php echo $division_nm;?></li>
        <li>El módulo => <?php echo $modulo_nm;?></li>
    </ul>

    <h4>Mostrar para todas las variables ($x, $y, $n y $m)</h4>
    <ul>
        <li>El doble de cada variable => <?php echo "doble de x: " .$doble_x ." / doble de y: " .$doble_y ." / doble de n: " .$doble_n ." / doble de m: " .$doble_m;?></li>
        <li>La suma de todas las variables => <?php echo $suma_xynm;?></li>
        <li>El producto de todas las variables => <?php echo $producto_xynm;?></li>
    </ul>
    
</body>

</html>