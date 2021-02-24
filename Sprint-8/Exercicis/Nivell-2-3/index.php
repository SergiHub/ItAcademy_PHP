<!DOCTYPE html>
<html lang="en">

<?php include '../head.php'; ?>

<body>
    
    <h1>NIVELL 2 y 3</h1>

    <!-- Exercici 2 -->
    <!-- Afegeix a sobre de la taula un botó "Nou Producte" que condueixi a la pàgina insereix.php on haurem de crear un formulari que ens permeti crear un producte a inserir a la base de dades -->
    <!-- Exercici 3 -->
    <!-- Afegeix a cada fila de la Taula de productes comprats una columna que inclogui opcions per modificar i eliminar cadascun dels productes. 
    Podeu indicar les opcions com vulgueu(mitjançant icones, botons...) de tal forma que: 
        - La opció de modificar ens porti a una pàgina modificar.php que inclogui un formulari per editar dades d'aquell producte.
        - La opció d'eliminar ens permetrà esborrar aquell producte de la base de dades. Lògica que implementarem al nivell 3.-->
    <!-- Exercici 4 -->
    <!-- Implementar les lògiques d'inserció, esborrat i modificació dels productes -->

    <h2>Exercici 2-3-4</h2>
    <br>

    <?php
        // Conectar con la BBDD
        include '../conect-bbdd.php';

        // Evitar la recarga de datos (caché): Y es que cada vez que se refresca este archivo después de un insert, volvía a insertar el mismo registro
        // Es necesario crear o reanudar la sesión para después poder llenar la variable global de SESSION
        // Y también es necesario comprobar si la variable global SESSION está informada, pq si lo está, no es necesario volver a iniciar sesión (esta condifión hay que repetirla en todos los archivos que utilizemos la variable global SESSION)

        if(!isset($_SESSION)) { 
            session_start(); 
        }
        $_SESSION['enviar'] = false;

        // Aquí en el archivo ptincipal se inicializa a false
    ?>

    <!-- Crear nuevo botón que al clicarlo te llevará al arxivo que contiene el formulario que te permite hacer inserts a la BBDD -->
    <a class="btn-new-product" href="form-insert.php">Nou Producte</a>
    <br><br><br>


    <?php 
        // Acceder a la BBDD para recuperar todos sus registros
        $registros = $mysql->query("select id, nom, preu, quantitat from compra") or
            die($mysql->error); 
    ?>

    <!-- Crear una tabla para mostrar los valores recuperados de la BBDD (después de haber realizado el insert o bien el update o bien el delete) -->
    <table class="all-table table-striped">
        <thead>
            <tr class="columns">
                <th scope="col">Nom producte</th>
                <th scope="col">Preu Unitat</th>
                <th scope="col">Quantitat</th>
                <th scope="col">Accions</th>
                <th scope="col">Total</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $resultatTotal = 0;
                while ($reg = $registros->fetch_array()) {
                    $idSent = $reg['id'];
                    echo '<tr class="rows">';
                    echo '<td>';
                    echo $reg['nom'];
                    echo '</td>';
                    echo '<td class="type-number">';
                    echo $preu=$reg['preu'];
                    echo '</td>';
                    echo '<td class="type-number">';
                    echo $quantitat=$reg['quantitat'];
                    echo '</td>';
                    echo '<td>';
                    echo '<div class="d-flex flex-row justify-content-between">';
                    echo "<a class='icons-actions icon-pencil' href='form-update.php?id=".$idSent."'></a>";
                    echo "<a class='icons-actions icon-trash' href='delete-bbdd.php?id=".$idSent."'></a>";
                    echo '</div>';
                    echo '</td>';
                    $resultat = $preu * $quantitat;
                    echo '<td class="type-number">';
                    echo $resultat;
                    echo '</td>';
                    echo '</tr>';  
                    $resultatTotal = $resultatTotal + $resultat;
                }
            ?>
        </tbody>
        <tfoot>
            <tr class="columns rows total">
                <td><b>Total</b></td>
                <td colspan="3">
                <td class="type-number"><?php echo $resultatTotal; ?></td>
            </tr>
        </tfoot>
    </table>

    <?php 
        // Cerrar la conexión (IMPRESCINDIBLE... no se puede quedar abierta!!)
        $mysql->close();
    ?>

</body>

</html>