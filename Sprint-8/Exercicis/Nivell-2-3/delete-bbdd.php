<!-- Borrar registro en la BBDD (eliminar el registro que han escogido borrar de la tabla) -->

<?php
    // Es necesario volver a conectar a la BBDD (mirar explicación en el archivo del insert)
    include '../conect-bbdd.php';

    $mysql->query("delete from compra where id = '{$_GET['id']}'") or
        die($mysql->error);

    // Una vez hecho el insert, ir al archivo principal para que te muestre los resultados de la acción realizada en la tabla    
    include 'index.php';
?>