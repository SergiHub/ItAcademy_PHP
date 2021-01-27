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
    <?php
        $array1 = array(1, 2, 3, 4, 5);
        $array2 = array(22, 12, 72);
    ?>

    <!-- Exercici 2 -->
    <?php
        array_push($array2, 1972);
    ?>
    
    <!-- Exercici 3 -->
    <h2>Exercicis 1-2-3</h2>
     
    <?php
        $array_final = array_merge($array1, $array2);
        $longitud_array_final = sizeof($array_final);
    ?>

    <p><?php echo "Longitud del array: " .$longitud_array_final ?></p>

</body>

</html>