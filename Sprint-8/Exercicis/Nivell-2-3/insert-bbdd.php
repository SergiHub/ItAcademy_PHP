<!-- Insertar registro en la BBDD (insertar el registro que nos han introducido/enviado en el formulario) -->

<?php
    // Es necesario volver a conectar a la BBDD, ya que sino el insert no funcionaría. Y es que utilizamos la función de php query() que contiene el mysqli y en la conexión es dónde $mysql coge todas las propiedades de mysqli con ($mysql = new mysqli)
    include '../conect-bbdd.php';

    // Evitar la recarga de datos (caché): Sólo inseratremos si es true (que siempre lo será). Pero al volver a inicializarla a false, una vez hecho el insert, y llamar al archivo principal (index.php), este cuando se recargue, la sesion estará en false y no recargará nada.
    if(!isset($_SESSION)) { 
        session_start(); 
    }
    if ($_SESSION['enviar'] == true) {           
        $mysql->query("insert into compra (nom, preu, quantitat) values ('$_REQUEST[nameProduct]','$_REQUEST[price]','$_REQUEST[quantity]')") or
            die($mysql->error);
        $_SESSION['enviar'] = false;
    }

    // Una vez hecho el insert, ir al archivo principal para que te muestre los resultados de la acción realizada en la tabla
    include 'index.php';
?>