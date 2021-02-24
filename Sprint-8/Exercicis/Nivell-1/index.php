<!DOCTYPE html>
<html lang="en">

<?php include '../head.php'; ?>

<body>
    
    <h1>NIVELL 1</h1>

    <!-- Exercici 1 -->
    <!-- 
    Necessitarem crear una base de dades amb una taula "Compra" que tingui com a atributs:
    - Nom del producte comprat.
    - Preu unitari del producte.
    - Quantitat adquirida del producte.
    - Id de la fila en la taula.
    
    Podeu crear-al al vostre gust o fer servir l'arxiu adjunt "php_m8_n1.sql".
    El fluxe d'execució principal vindrà donat a l'arxiu index.php que en aquesta primera fase haurà de :
    
    - Connectarse a una base de dades(pots crear una classe per a aïllar aquesta lògica del fluxe principal d'execució).
    - Inserir al menys 3 productes a la taula "producte" de la base de dades.
    
    - Crear una classe Taula, que ens servirà per a invocar els mètodes que hi implementem per dibuixar una taula amb els productes registrats a la base de
      dades d'una manera semblant(que no té perquè igual) a aquesta:
      Nom producte  Preu Unitat Quantitat   Total
      Sal           0.9         2           1.8
      Xocolata      2           2           4
      -------------------------------------------
      TOTAL                                 5.8       

    - Desconnectarse de la base de dades.
    -->

    <h2>Exercici 1</h2>
    
    <?php
        // Conectarse a la BBDD
        $mysql = new mysqli("localhost","root","Puyol1972Web","productes","3306");
        if ($mysql->connect_error)
            die('Problemas con la conexión a la base de datos');
        
        // Insertar registros en la tabla compra de la BBDD

        // IMPORTANTE!! Lo comento para no estar insertando cada vez que ejecuto el ejercicio (sólo DESCOMENTARLO la primera vez / 1º prueba/ejecución)

        // $mysql->query("insert into compra(nom,preu,quantitat) values ('Sal',0.9,2)") or
        //     die($mysql->error);
        // $mysql->query("insert into compra(nom,preu,quantitat) values ('Xocolata',2,2)") or
        //     die($mysql->error);
        // $mysql->query("insert into compra(nom,preu,quantitat) values ('Iogurt',6.5,4)") or
        //     die($mysql->error);

        // Acceder a la BBDD para recuperar los registros insertados
        $registros = $mysql->query("select nom, preu, quantitat from compra") or
            die($mysql->error);
    ?>

    <table class="all-table">
        <thead>
            <tr class="columns">
                <th><b>Nom producte</b></th>
                <th><b>Preu Unitat</b></th>
                <th><b>Quantitat</b></th>
                <th><b>Total</b></th>
            </tr>
        </thead>
        <tbody>
            <?php 
            $resultatTotal = 0;
            while ($reg = $registros->fetch_array()) {
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
            <tr class="total">
                <td><b>Total</b></td>
                <td></td>
                <td></td>
                <td class="type-number"><?php echo $resultatTotal; ?></td>
            </tr>
        </tfoot>
    </table>

    <?php        
        // Decsonectarse / Cerrar
        $mysql->close();
    ?>

</body>

</html>