<!-- OTRA FORMA MÁS RESUMIDA DE HACER LO DE LA SELECT A LA BBDD Y LA PARTE PHP DE MOSTRAR LA TABLA -->
<!-- Este código (readaptado) es el que puedes obtener creando la SELECT (recordar de poner los campos -todos los que se quiera recuperar o mostrar- y no en cambio poner SELECT *) y en Tools / Utilities / Copy as PHP Code...
También sirve mirar este vídeo de tutorial: https://www.youtube.com/watch?v=TsiEUD-Q5zc -->

<?php 
    // Acceder a la BBDD para recuperar todos sus registros
    $query = "SELECT id, nom, preu, quantitat FROM productes.compra";
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
        if ($stmt = $mysql->prepare($query)) {
            $stmt->execute();
            $stmt->bind_result($id, $nom, $preu, $quantitat);
            $resultatTotal = 0;
            while ($stmt->fetch()) {
                $resultat = $preu * $quantitat; 
                $resultatTotal = $resultatTotal + $resultat;
                echo "
                    <tr class='rows'>
                        <td>$nom</td>    
                        <td class='type-number'>$preu</td>
                        <td class='type-number'>$quantitat</td>
                        <td>
                            <div class='d-flex flex-row justify-content-between'>       
                                <a class='icons-actions icon-pencil' href='form-update.php?id=".$id."'></a> 
                                <a class='icons-actions icon-trash' href='delete-bbdd.php?id=".$id."'></a>  
                            </div>  
                        </td>
                        <td class='type-number'>$resultat</td>
                    </tr>  
                ";
            }
            $stmt->close(); 
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