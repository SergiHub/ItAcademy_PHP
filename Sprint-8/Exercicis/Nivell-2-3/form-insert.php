<!DOCTYPE html>
<html lang="en">

<?php include '../head.php'; ?>

<body>

    <?php
        // Evitar la recarga de datos (caché): Aquí inicializamos a true (antes de enviar el formulario que inserta registro)
        if(!isset($_SESSION)) { 
            session_start(); 
        }
        $_SESSION['enviar'] = true;
    ?>

    <!-- Formulario que nos permite crear un nuevo producto a insertar en la base de datos -->
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1><b>Formulari per inserir un nou producte</b></H1>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-12">
                <form action="insert-bbdd.php" method="get">
                    <div class="form-group">
                        <label for="nameProduct">Nom Producte</label>
                        <input type="text" class="form-control" id="nameProduct" name="nameProduct" placeholder="Enter new product" required>
                    </div>
                    <div class="form-group">
                        <label for="price">Preu Unitari</label>
                        <input type="number" class="form-control" id="price" name="price" placeholder="Enter a price" required min="0.1" step="0.1" pattern="^[0-9]+">
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantitat</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Enter a quantity" required min="1" pattern="^[0-9]+">
                    </div>
                    <input type="submit" value="Insertar">
                </form>
            </div>
        </div>
    </div>

</body>

</html>