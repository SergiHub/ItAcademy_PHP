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
    <h2>Exercici 1</h2>
    
    <?php
        $var_integer = 12;
        $var_double = 3.25;
        $var_string = "Sergi";
        $var_boolean = true;
    ?>
    
    <h3>Valores de los diferentes tipos de variables PHP:</h3>
    <p><?php echo "Valor integer: " .$var_integer; ?></p>
    <p><?php echo "Valor double: " .$var_double; ?></p>
    <p><?php echo "Valor string: " .$var_string; ?></p>
    <p><?php echo "Valor boolean: " .$var_boolean; ?></p>

    <!-- Exercici 2 -->
    <hr>
    <h2>Exercici 2</h2>
    
    <?php
        $var_string1 = "Sergi";
        $var_string2 = "Alumne del Cibernarium";
    ?>
    
    <h3>Longitud de los 2 strings:</h3>
    <p><?php echo "string 1: " .strlen($var_string1); ?></p>
    <p><?php echo "string 2: " .strlen($var_string2); ?></p>

    <h3>Mostrar en orden inverso de carácteres los 2 strings:</h3>
    <p><?php echo "string 1: " .strrev($var_string1); ?></p>
    <p><?php echo "string 2: " .strrev($var_string2); ?></p>
    
    <h3>Concatenación de los 2 strings:</h3>
    <p><?php echo $var_string1 . " " . $var_string2; ?></p>

    <!-- Exercici 3 -->
    <hr>
    <h2>Exercici 3</h2>
    
    <?php
        define("CONSTANTE", "Sergi Ortiz");
    ?>
    
    <p><?php echo "Valor de la constante: " . CONSTANTE; ?></p>

</body>

</html>