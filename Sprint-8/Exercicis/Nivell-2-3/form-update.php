<!DOCTYPE html>
<html lang="en">

<?php include '../head.php'; ?>

<body>

    <?php

        // Es necesario volver a conectar a la BBDD (mirar explicación en el archivo del insert)
        include '../conect-bbdd.php';

        // Recuperar los datos a modificar de ese id en concreto (que nos envían desde el archivo principal index.php)
        $result = $mysql->query("select id, nom, nom, preu, quantitat from compra where id =" .$_GET['id']) or
                die($mysql->error);

        // Guardar el registro recuperado en una variable -en formato array, pq devuelve un array la función-, que luego utilizaremos para rellenar el formulario
        $dataRecovered=$result->fetch_assoc();

    ?>

    <!-- Formulario que nos permite modificar un producto ya existente en la base de datos -->
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1><b>Formulari per modificar un producte ja existent</b></H1>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-12">
                <form action="update-bbdd.php" method="get">
                    <!-- Este campo del id no nos interesa mostrarlo en el formulario, pero si enviarlo -->
                    <input type="hidden" name="idProduct" value="<?php echo $dataRecovered['id']; ?>">
                    <div class="form-group">
                        <label for="nameProduct">Nom Producte</label>
                        <input type="text" class="form-control" id="nameProduct" name="nameProduct" value="<?php echo $dataRecovered['nom']; ?>">
                    </div>
                    <div class="form-group">
                        <label for="price">Preu Unitari</label>
                        <input type="number" class="form-control" id="price" name="price" value="<?php echo $dataRecovered['preu']; ?>" min="0.1" step="0.1" pattern="^[0-9]+">
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantitat</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" value="<?php echo $dataRecovered['quantitat']; ?>" required min="1" pattern="^[0-9]+">
                    </div>
                    <input type="submit" value="Actualitzar">
                </form>
            </div>
        </div>

    </div>

</body>

</html>