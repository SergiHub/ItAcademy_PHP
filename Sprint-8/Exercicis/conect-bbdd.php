<!-- Conectarse a la BBDD -->

<?php

    $mysql = new mysqli("localhost","root","Puyol1972Web","productes","3306");
    if ($mysql->connect_error)
        die('Problemas con la conexión a la base de datos');
?>