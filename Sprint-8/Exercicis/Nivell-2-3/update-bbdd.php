<!-- Actualizar registro en la BBDD (actualizar con los nuevos datos, el registro que nos han introducido/enviado en el formulario) -->

<?php
    // Es necesario volver a conectar a la BBDD (mirar explicación en el archivo del insert)
    include '../conect-bbdd.php';

    $mysql->query("update compra set nom = '$_REQUEST[nameProduct]', preu = '$_REQUEST[price]', quantitat = '$_REQUEST[quantity]' where id ='$_REQUEST[idProduct]'") or
        die($mysql->error);

    // Una vez hecho el insert, ir al archivo principal para que te muestre los resultados de la acción realizada en la tabla
    include 'index.php';
?>